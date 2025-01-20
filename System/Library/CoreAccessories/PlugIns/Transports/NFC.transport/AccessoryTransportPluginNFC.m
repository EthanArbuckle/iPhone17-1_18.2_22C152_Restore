@interface AccessoryTransportPluginNFC
- (BOOL)_checkLRC:(id)a3;
- (BOOL)_checkProductTypeCompatibility:(unsigned __int8)a3;
- (BOOL)_connectToTagId:(id)a3;
- (BOOL)_getpowerPauseStatus;
- (BOOL)_handleSessionOpen:(BOOL)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)_hasWalletOnClearCase2020:(id)a3;
- (BOOL)_initXPC;
- (BOOL)_requiresLegacyAuth:(id)a3;
- (BOOL)_requiresMfi40Auth:(id)a3;
- (BOOL)_tagsHavePowerBits:(unsigned __int8)a3 uuid:(id *)a4;
- (BOOL)isRunning;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (NSString)pluginName;
- (id)_decodeTagIdentifier:(id)a3;
- (int)_animationDelayMs:(unsigned __int8)a3;
- (unint64_t)_getTimeSinceLastRequestPowerPauseMs;
- (unsigned)_getAccessoryFamily:(id)a3;
- (unsigned)_getAccessoryType:(id)a3;
- (unsigned)_getNfcStateMachineState;
- (void)_closeReaderSession;
- (void)_connectPeer:(id)a3;
- (void)_createEndpointsForTags:(id)a3 skipWalletAuth:(BOOL)a4;
- (void)_didNfcTagsListChange:(id)a3;
- (void)_didScreenStateChange:(BOOL)a3;
- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3;
- (void)_handleNearFieldAccessoryEventNotification:(id)a3;
- (void)_initXPC;
- (void)_notifyAuthReadyAfterPowerPauseComplete;
- (void)_pollTags:(unsigned int)a3;
- (void)_requestPowerPause;
- (void)_setProximityMonitoringEnabled:(BOOL)a3;
- (void)_setScreenStateMonitoringEnabled:(BOOL)a3;
- (void)_updateAccessoryPower:(BOOL)a3;
- (void)initPlugin;
- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation AccessoryTransportPluginNFC

- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3
{
  queue = self->_queue;
  if (queue)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__AccessoryTransportPluginNFC__handleIOHIDEvent___block_invoke;
    v5[3] = &unk_26516D520;
    v5[4] = self;
    v5[5] = a3;
    dispatch_sync(queue, v5);
  }
}

void __49__AccessoryTransportPluginNFC__handleIOHIDEvent___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  int v3 = (IntegerValue >> 10) & 1;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 152) == v3) {
    return;
  }
  if (v3) {
    goto LABEL_10;
  }
  v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v11.uint64_t tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &v11);
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 184)) {
    goto LABEL_10;
  }
  v5 = (__darwin_time_t *)(v4 + 160);
  if (v11.tv_sec < *v5) {
    goto LABEL_10;
  }
  if (v11.tv_sec != *v5)
  {
    if (v11.tv_sec == *v5 + 1)
    {
      uint64_t tv_nsec = v11.tv_nsec + 1000000000;
      goto LABEL_9;
    }
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  uint64_t tv_nsec = v11.tv_nsec;
LABEL_9:
  BOOL v7 = tv_nsec - v5[1] < 350000000;
LABEL_11:
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11.tv_sec) = 67109632;
    HIDWORD(v11.tv_sec) = (IntegerValue >> 10) & 1;
    LOWORD(v11.tv_nsec) = 1024;
    *(_DWORD *)((char *)&v11.tv_nsec + 2) = IntegerValue;
    HIWORD(v11.tv_nsec) = 1024;
    BOOL v12 = v7;
    _os_log_impl(&dword_242793000, v10, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleIOHIDEvent: %d, %x, ignore=%d", (uint8_t *)&v11, 0x14u);
  }

  if (!v7) {
    *(_DWORD *)(*(void *)(a1 + 32) + 152) = v3;
  }
}

- (NSString)pluginName
{
  return (NSString *)@"NFC Transport PlugIn";
}

- (void)initPlugin
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_242793000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242793000, v5, OS_LOG_TYPE_DEFAULT, "Starting NFC transport plugin", buf, 2u);
  }

  if (NearFieldFrameworkAvailable_available
    || (id NFAccessoryHardwareManagerClass = getNFAccessoryHardwareManagerClass(),
        NearFieldFrameworkAvailable_available = NFAccessoryHardwareManagerClass != 0,
        NFAccessoryHardwareManagerClass))
  {
    readerSession = self->_readerSession;
    self->_readerSession = 0;

    connectedTag = self->_connectedTag;
    self->_connectedTag = 0;

    self->_screenStateToken = -1;
    v14.receiver = self;
    v14.super_class = (Class)AccessoryTransportPluginNFC;
    [(ACCTransportPlugin *)&v14 startPlugin];
    [(AccessoryTransportPluginNFC *)self _initXPC];
    uint64_t v9 = 1;
    [(AccessoryTransportPluginNFC *)self _setScreenStateMonitoringEnabled:1];
    [(AccessoryTransportPluginNFC *)self _setProximityMonitoringEnabled:1];
    v10 = [getNFAccessoryHardwareManagerClass() sharedHardwareManager];
    id v11 = (id)[v10 enableMultiTag:0];

    BOOL v12 = [getNFAccessoryHardwareManagerClass() sharedHardwareManager];
    id v13 = (id)[v12 enableMultiTag:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(AccessoryTransportPluginNFC *)self setIsRunning:v9];
}

- (void)stopPlugin
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242793000, v5, OS_LOG_TYPE_DEFAULT, "Stopping NFC transport plugin", buf, 2u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v6 = [(NSMutableDictionary *)self->_connectionUuidForEndpointUuid allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        [(ACCTransportPlugin *)self destroyEndpointWithUUID:v11];
        [(NSMutableDictionary *)self->_connectionUuidForEndpointUuid removeObjectForKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v12 = [(NSMutableDictionary *)self->_tagForConnectionUuid allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        [(ACCTransportPlugin *)self destroyConnectionWithUUID:v17];
        [(NSMutableDictionary *)self->_tagForConnectionUuid removeObjectForKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v14);
  }

  [(AccessoryTransportPluginNFC *)self _setProximityMonitoringEnabled:0];
  [(AccessoryTransportPluginNFC *)self _setScreenStateMonitoringEnabled:0];
  connectionUuidForEndpointUuid = self->_connectionUuidForEndpointUuid;
  self->_connectionUuidForEndpointUuid = 0;

  tagForConnectionUuid = self->_tagForConnectionUuid;
  self->_tagForConnectionUuid = 0;

  polledTags = self->_polledTags;
  self->_polledTags = 0;

  readerSession = self->_readerSession;
  self->_readerSession = 0;

  v22.receiver = self;
  v22.super_class = (Class)AccessoryTransportPluginNFC;
  [(ACCTransportPlugin *)&v22 stopPlugin];
  [(AccessoryTransportPluginNFC *)self setIsRunning:0];
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v54 = a3;
  uint64_t v8 = (NSData *)a4;
  id v9 = a5;
  if (acc_userDefaultsLogging_BOOLForKey(@"TransportSignpost"))
  {
    uint64_t v10 = gLogSignpostObjects;
    int v11 = gNumLogSignpostObjects;
    if (gLogSignpostObjects) {
      BOOL v12 = gNumLogSignpostObjects < 4;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC sendOutgoingData:forEndpointWithUUID:connectionUUID:].cold.8(v10, v11);
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v14 = *(id *)(gLogSignpostObjects + 24);
    }
    uint64_t v15 = [(NSData *)v8 hash];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138412546;
        v63 = v8;
        __int16 v64 = 2048;
        uint64_t v65 = [v54 length];
        _os_signpost_emit_with_name_impl(&dword_242793000, v14, OS_SIGNPOST_EVENT, v16, "Endpoint SEND", "Send outgoing data! %@, %lu bytes", buf, 0x16u);
      }
    }
  }
  v53 = v8;
  if (!self->_readerSession || !self->_connectedTag)
  {
    v35 = logObjectForModule();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242793000, v35, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData: !_readerSession || !_connectedTag", buf, 2u);
    }
    v20 = 0;
    v18 = 0;
    goto LABEL_103;
  }
  uint64_t v17 = [(NSMutableDictionary *)self->_connectionUuidForEndpointUuid valueForKey:v8];
  v18 = v17;
  if (!v17 || ([v17 isEqualToString:v9] & 1) == 0)
  {
    v35 = logObjectForModule();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "NFC transport plugin: sendOutgoingData: !uuid || !equal";
LABEL_101:
      _os_log_impl(&dword_242793000, v35, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
    }
LABEL_102:
    v20 = 0;
LABEL_103:
    v36 = 0;
LABEL_67:
    BOOL v43 = 0;
LABEL_92:

    goto LABEL_93;
  }
  uint64_t v19 = [(NSMutableDictionary *)self->_tagForConnectionUuid valueForKey:v9];
  if (!v19)
  {
    v35 = logObjectForModule();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "NFC transport plugin: sendOutgoingData: !requestedTag";
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  v20 = (void *)v19;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    connectedTagId = self->_connectedTagId;
    long long v24 = [v20 tagID];
    *(_DWORD *)buf = 138412546;
    v63 = connectedTagId;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v24;
    _os_log_impl(&dword_242793000, v21, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData: sameTagId? %@ ?= %@", buf, 0x16u);
  }
  if ([(AccessoryTransportPluginNFC *)self _tagsHavePowerBits:48 uuid:0]
    && [(AccessoryTransportPluginNFC *)self _getTimeSinceLastRequestPowerPauseMs] >= 0x5DD
    && ![(AccessoryTransportPluginNFC *)self _getpowerPauseStatus])
  {
    [(AccessoryTransportPluginNFC *)self _requestPowerPause];
    usleep(0x30D40u);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      long long v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v27 = [(AccessoryTransportPluginNFC *)self _getpowerPauseStatus];
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = v27;
      _os_log_impl(&dword_242793000, v25, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData: powerPause:0->%d", buf, 8u);
    }
  }
  long long v28 = objc_msgSend(v20, "tagID", v8);
  BOOL v29 = [(AccessoryTransportPluginNFC *)self _requiresMfi40Auth:v28];

  if (v29)
  {
    int v61 = 43520;
    v60[0] = 0;
    __int16 v57 = -256;
    long long v30 = [MEMORY[0x263EFF990] dataWithBytes:&v61 length:4];
    char v58 = [v54 length];
    char v59 = (unsigned __int16)[v54 length] >> 8;
    [(NSData *)v30 appendBytes:v60 length:1];
    [(NSData *)v30 appendBytes:&v59 length:1];
    [(NSData *)v30 appendBytes:&v58 length:1];
    [(NSData *)v30 appendData:v54];
    [(NSData *)v30 appendBytes:(char *)&v57 + 1 length:1];
    [(NSData *)v30 appendBytes:&v57 length:1];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v31 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      v31 = MEMORY[0x263EF8438];
      id v37 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v30;
      _os_log_impl(&dword_242793000, v31, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData: %@", buf, 0xCu);
    }

    readerSession = self->_readerSession;
    id v56 = 0;
    v35 = [(NFAccessoryReaderSession *)readerSession transceive:v30 error:&v56];
    v36 = (NSData *)v56;
  }
  else
  {
    v32 = [v20 tagID];
    BOOL v33 = [(AccessoryTransportPluginNFC *)self _requiresLegacyAuth:v32];

    if (!v33)
    {
      v35 = 0;
      goto LABEL_56;
    }
    uint64_t v34 = self->_readerSession;
    id v55 = 0;
    v35 = [(NFAccessoryReaderSession *)v34 sendAccessoryProtocolCommand:v54 outError:&v55];
    v36 = (NSData *)v55;
  }
  if (v36)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v39 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      v39 = MEMORY[0x263EF8438];
      id v41 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v36;
      _os_log_impl(&dword_242793000, v39, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: cmdError: %@", buf, 0xCu);
    }

    v42 = logObjectForModule();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v36;
      _os_log_impl(&dword_242793000, v42, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData failed: Error: %@", buf, 0xCu);
    }

    goto LABEL_67;
  }
LABEL_56:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v40 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    v40 = MEMORY[0x263EF8438];
    id v44 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242793000, v40, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: sendOutgoingData completed", buf, 2u);
  }

  if (v35)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v45 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      v45 = MEMORY[0x263EF8438];
      id v46 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = (NSData *)v35;
      _os_log_impl(&dword_242793000, v45, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: dataIn: %@", buf, 0xCu);
    }

    v47 = -[NSObject subdataWithRange:](v35, "subdataWithRange:", 0, [v35 length] - 2);
    -[NSObject subdataWithRange:](v35, "subdataWithRange:", [v35 length] - 2, 2);
    v48 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v49 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      v49 = MEMORY[0x263EF8438];
      id v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v48;
      _os_log_impl(&dword_242793000, v49, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: dataIn status: %@", buf, 0xCu);
    }

    BOOL v43 = [(ACCTransportPlugin *)self processIncomingData:v47 forEndpointWithUUID:v53];
    v36 = 0;
    goto LABEL_92;
  }
  v36 = 0;
  BOOL v43 = 1;
LABEL_93:

  return v43;
}

- (BOOL)_checkLRC:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  int v9 = 0;
  if (v3 && [v3 length] == 4)
  {
    [v4 getBytes:&v9 length:4];
    uint64_t v5 = 0;
    char v6 = 19;
    do
      v6 += *((unsigned char *)&v9 + v5++);
    while (v5 != 3);
    BOOL v7 = HIBYTE(v9) == -v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_requiresLegacyAuth:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  int v7 = 0;
  if (v3 && [v3 length] == 4)
  {
    [v4 getBytes:&v7 length:4];
    BOOL v5 = (v7 != 66) & (BYTE1(v7) >> 4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_requiresMfi40Auth:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  int v10 = 0;
  if (v3 && [v3 length] == 4)
  {
    [v4 getBytes:&v10 length:4];
    BOOL v5 = (v10 & 0x8000) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (acc_userDefaults_BOOLForKey(@"ForceMFi4AuthOverNFC"))
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      BOOL v12 = "-[AccessoryTransportPluginNFC _requiresMfi40Auth:]";
      __int16 v13 = 2112;
      uint64_t v14 = @"ForceMFi4AuthOverNFC";
      __int16 v15 = 1024;
      BOOL v16 = v5;
      __int16 v17 = 1024;
      int v18 = 1;
      _os_log_impl(&dword_242793000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ requiresAuth %d -> %d", buf, 0x22u);
    }

    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [v9 valueForKey:*MEMORY[0x263F341C8]];

  if (v12)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __105__AccessoryTransportPluginNFC_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke;
    v14[3] = &unk_26516D348;
    id v15 = v9;
    BOOL v16 = self;
    id v17 = v10;
    id v18 = v11;
    dispatch_async(queue, v14);
  }
}

void __105__AccessoryTransportPluginNFC_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke(uint64_t a1)
{
  *(void *)&v41[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) valueForKey:*MEMORY[0x263F341C8]];
  int v3 = [v2 BOOLValue];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v41[0] = v3;
    _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: propertiesDidChange, open = %d", buf, 8u);
  }

  if (v3)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7[15])
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:") & 1) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v8 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          uint64_t v8 = MEMORY[0x263EF8438];
          id v21 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          *(void *)id v41 = v22;
          _os_log_impl(&dword_242793000, v8, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: propertiesDidChange, queued, uuid = %@", buf, 0xCu);
        }

        long long v23 = *(void **)(*(void *)(a1 + 40) + 128);
        if (v23
          || ([MEMORY[0x263EFF980] arrayWithCapacity:1],
              uint64_t v24 = objc_claimAutoreleasedReturnValue(),
              uint64_t v25 = *(void *)(a1 + 40),
              id v26 = *(void **)(v25 + 128),
              *(void *)(v25 + 128) = v24,
              v26,
              (long long v23 = *(void **)(*(void *)(a1 + 40) + 128)) != 0))
        {
          if (([v23 containsObject:*(void *)(a1 + 48)] & 1) == 0) {
            [*(id *)(*(void *)(a1 + 40) + 128) addObject:*(void *)(a1 + 48)];
          }
        }
      }
    }
    else
    {
      int v11 = [v7 _handleSessionOpen:1 forEndpointWithUUID:*(void *)(a1 + 48) connectionUUID:*(void *)(a1 + 56)];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        BOOL v12 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v41[0] = 1;
        LOWORD(v41[1]) = 1024;
        *(_DWORD *)((char *)&v41[1] + 2) = v11;
        _os_log_impl(&dword_242793000, v12, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: propertiesDidChange, open:%d, success:%d", buf, 0xEu);
      }

      if (v11)
      {
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v38 = *MEMORY[0x263F341D0];
        uint64_t v39 = MEMORY[0x263EFFA88];
        v20 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [v19 setProperties:v20 forEndpointWithUUID:*(void *)(a1 + 48)];
      }
    }
  }
  else if ([*(id *)(a1 + 48) isEqualToString:*(void *)(*(void *)(a1 + 40) + 120)])
  {
    int v9 = [*(id *)(a1 + 40) _handleSessionOpen:0 forEndpointWithUUID:*(void *)(a1 + 48) connectionUUID:*(void *)(a1 + 56)];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v41[0] = 0;
      LOWORD(v41[1]) = 1024;
      *(_DWORD *)((char *)&v41[1] + 2) = v9;
      _os_log_impl(&dword_242793000, v10, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: propertiesDidChange, open:%d, success:%d", buf, 0xEu);
    }

    if (v9)
    {
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = *MEMORY[0x263F341D0];
      uint64_t v36 = *MEMORY[0x263F341D0];
      uint64_t v37 = MEMORY[0x263EFFA80];
      BOOL v16 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v14 setProperties:v16 forEndpointWithUUID:*(void *)(a1 + 48)];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v17 = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 128);
        *(_DWORD *)buf = 138412290;
        *(void *)id v41 = v28;
        _os_log_impl(&dword_242793000, v17, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: propertiesDidChange, queue:%@", buf, 0xCu);
      }

      BOOL v29 = *(void **)(*(void *)(a1 + 40) + 128);
      if (v29 && [v29 count])
      {
        long long v30 = [*(id *)(*(void *)(a1 + 40) + 128) firstObject];
        if (v30)
        {
          v31 = [*(id *)(*(void *)(a1 + 40) + 56) valueForKey:v30];
          if (v31
            && [*(id *)(a1 + 40) _handleSessionOpen:1 forEndpointWithUUID:v30 connectionUUID:v31])
          {
            v32 = *(void **)(a1 + 40);
            uint64_t v34 = v15;
            uint64_t v35 = MEMORY[0x263EFFA88];
            BOOL v33 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            [v32 setProperties:v33 forEndpointWithUUID:v30];
          }
          [*(id *)(*(void *)(a1 + 40) + 128) removeObject:v30];
        }
      }
    }
  }
}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AccessoryTransportPluginNFC_readerSessionDidEndUnexpectedly___block_invoke;
    block[3] = &unk_26516D370;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __63__AccessoryTransportPluginNFC_readerSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _getpowerPauseStatus];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = v2;
    _os_log_impl(&dword_242793000, v5, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: Session ended unexpectedly: powerPause:%d", buf, 8u);
  }

  [*(id *)(a1 + 32) _closeReaderSession];
  BOOL v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AccessoryTransportPluginNFC_readerSessionDidEndUnexpectedly___block_invoke_21;
  block[3] = &unk_26516D370;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v6, block);
}

uint64_t __63__AccessoryTransportPluginNFC_readerSessionDidEndUnexpectedly___block_invoke_21(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_242793000, v4, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: restart auth", v6, 2u);
  }

  return [*(id *)(a1 + 32) _notifyAuthReadyAfterPowerPauseComplete];
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (NSArray *)a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    uint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = v7;
    _os_log_impl(&dword_242793000, v10, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: didDetectTags: %@", (uint8_t *)&v13, 0xCu);
  }

  polledTags = self->_polledTags;
  self->_polledTags = v7;
  BOOL v12 = v7;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_polledSem);
}

- (BOOL)_initXPC
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.accessoryd.nf-events", v3);
  queue = self->_queue;
  self->_queue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.accessoryd.nf-events", (dispatch_queue_t)self->_queue, 1uLL);
  listenerConnection = self->_listenerConnection;
  self->_listenerConnection = mach_service;

  if (!self->_listenerConnection) {
    -[AccessoryTransportPluginNFC _initXPC]();
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v8 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242793000, v8, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _initXPC", buf, 2u);
  }

  xpc_set_event_stream_handler("com.apple.accessoryd.nf-events", (dispatch_queue_t)self->_queue, &__block_literal_global_1);
  uint64_t v10 = self->_listenerConnection;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v10)
  {
    if (v12)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      int v13 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242793000, v13, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _listenerConnection", buf, 2u);
    }

    BOOL v16 = self->_listenerConnection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__AccessoryTransportPluginNFC__initXPC__block_invoke_26;
    handler[3] = &unk_26516D3B8;
    handler[4] = self;
    xpc_connection_set_event_handler(v16, handler);
    xpc_connection_activate(self->_listenerConnection);
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242793000, v14, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: could not create listener connection.", buf, 2u);
    }
  }
  return v10 != 0;
}

void __39__AccessoryTransportPluginNFC__initXPC__block_invoke(int a1, xpc_object_t xdict)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]);
  if (string)
  {
    id v3 = string;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      id v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = v3;
      _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: Received %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __39__AccessoryTransportPluginNFC__initXPC__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x24566E200]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    [*(id *)(a1 + 32) _connectPeer:v3];
    goto LABEL_42;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (xpc_equal(v3, MEMORY[0x263EF86A0]))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        int v7 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      LOWORD(v14) = 0;
      uint64_t v10 = "NFC transport plugin: Service interrupted: com.apple.accessoryd.nf-events";
    }
    else
    {
      if (!xpc_equal(v3, MEMORY[0x263EF86A8]))
      {
        int v7 = xpc_dictionary_get_value(v3, (const char *)*MEMORY[0x263EF86B0]);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          BOOL v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          BOOL v11 = MEMORY[0x263EF8438];
          id v13 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315138;
          string_ptr = xpc_string_get_string_ptr(v7);
          _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: listener connection error %s", (uint8_t *)&v14, 0xCu);
        }

        goto LABEL_41;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        int v7 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        goto LABEL_42;
      }
      LOWORD(v14) = 0;
      uint64_t v10 = "NFC transport plugin: Service not available: com.apple.accessoryd.nf-events";
    }
    _os_log_impl(&dword_242793000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 2u);
    goto LABEL_41;
  }
  id v5 = (char *)MEMORY[0x24566E1C0](v3);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446210;
    string_ptr = v5;
    _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: received error or other non-connection type in handler for listener: %{public}s.", (uint8_t *)&v14, 0xCu);
  }

  free(v5);
LABEL_42:
}

- (void)_connectPeer:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (_xpc_connection_s *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242793000, v7, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: connecting peer", buf, 2u);
  }

  peers = self->_peers;
  if (!peers)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = self->_peers;
    self->_peers = v9;

    peers = self->_peers;
  }
  [(NSMutableArray *)peers addObject:v4];
  unint64_t v11 = [(NSMutableArray *)self->_peers count];
  if (v11 >= 2)
  {
    unint64_t v12 = v11;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      id v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v19 = v12;
      _os_log_impl(&dword_242793000, v13, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: unexpected number of peer connections %lu.", buf, 0xCu);
    }
  }
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_queue);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__AccessoryTransportPluginNFC__connectPeer___block_invoke;
  v16[3] = &unk_26516D3E0;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  xpc_connection_set_event_handler(v15, v16);
  xpc_connection_activate(v15);
}

void __44__AccessoryTransportPluginNFC__connectPeer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x24566E200]();
  if (v4 == MEMORY[0x263EF8708])
  {
    int v7 = xpc_dictionary_get_value(v3, "xpcEventName");
    string_ptr = xpc_string_get_string_ptr(v7);

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v19 = 136315138;
      *(void *)&v19[4] = string_ptr;
      _os_log_impl(&dword_242793000, v9, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: event name:%s", v19, 0xCu);
    }

    [*(id *)(a1 + 32) _handleNearFieldAccessoryEventNotification:0];
  }
  else
  {
    if (v4 != MEMORY[0x263EF8720])
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v13 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v13 = *(id *)gLogObjects;
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)unint64_t v19 = 0;
      id v14 = "NFC transport plugin: Unexpected data, invalidating the connection.";
      goto LABEL_29;
    }
    if (v3 != (id)MEMORY[0x263EF86A0] && v3 != (id)MEMORY[0x263EF86C0])
    {
      if (gLogObjects) {
        BOOL v11 = gNumLogObjects <= 0;
      }
      else {
        BOOL v11 = 1;
      }
      int v12 = !v11;
      if (v3 == (id)MEMORY[0x263EF86A8])
      {
        if (v12)
        {
          uint64_t v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          uint64_t v16 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unint64_t v19 = 0;
          _os_log_impl(&dword_242793000, v16, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: disconnecting peer", v19, 2u);
        }

        goto LABEL_31;
      }
      if (v12)
      {
        id v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v13 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
LABEL_31:
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "removeObjectIdenticalTo:", *(void *)(a1 + 40), *(void *)v19);
        goto LABEL_38;
      }
      *(_WORD *)unint64_t v19 = 0;
      id v14 = "NFC transport plugin: Unexpected error dictionary, invalidating the connection.";
LABEL_29:
      _os_log_impl(&dword_242793000, v13, OS_LOG_TYPE_DEFAULT, v14, v19, 2u);
      goto LABEL_30;
    }
  }
LABEL_38:
}

- (void)_notifyAuthReadyAfterPowerPauseComplete
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.uint64_t tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  id v15 = 0;
  BOOL v3 = [(AccessoryTransportPluginNFC *)self _tagsHavePowerBits:48 uuid:&v15];
  id v4 = v15;
  if (v3)
  {
    unsigned int v5 = [(AccessoryTransportPluginNFC *)self _getNfcStateMachineState];
    if ((v5 & 0x100) != 0 || __tp.tv_sec > self->_tagsArrivalTime.tv_sec + 3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v4;
        _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _notifyAuthReadyAfterPowerPauseComplete: notify: %@", buf, 0xCu);
      }

      id v8 = [NSDictionary dictionaryWithObject:v4 forKey:@"endpointUUID"];
      id v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 postNotificationName:@"NfcAuthReady" object:0 userInfo:v8];
    }
    else
    {
      unsigned int v10 = v5;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        BOOL v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v10;
        _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _notifyAuthReadyAfterPowerPauseComplete: delay due to nfcState:0x%x", buf, 8u);
      }

      dispatch_time_t v13 = dispatch_time(0, 200000000);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __70__AccessoryTransportPluginNFC__notifyAuthReadyAfterPowerPauseComplete__block_invoke;
      v14[3] = &unk_26516D370;
      void v14[4] = self;
      dispatch_after(v13, MEMORY[0x263EF83A0], v14);
    }
  }
}

uint64_t __70__AccessoryTransportPluginNFC__notifyAuthReadyAfterPowerPauseComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAuthReadyAfterPowerPauseComplete];
}

- (id)_decodeTagIdentifier:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = v4;
  int v52 = 0;
  if (!v4 || [v4 length] != 4)
  {
    id v7 = 0;
    goto LABEL_99;
  }
  id v6 = objc_opt_new();
  id v7 = v6;
  if (v6)
  {
    [v6 setObject:v5 forKey:*MEMORY[0x263F341D8]];
    [v5 getBytes:&v52 length:4];
    uint64_t v8 = [(AccessoryTransportPluginNFC *)self _getAccessoryType:v5];
    if (v8)
    {
      uint64_t v9 = v8;
      unsigned int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AccessoryTransportPluginNFC _checkProductTypeCompatibility:](self, "_checkProductTypeCompatibility:", v8));
      [v7 setValue:v10 forKey:*MEMORY[0x263F341B0]];

      BOOL v11 = objc_msgSend(NSNumber, "numberWithInt:", -[AccessoryTransportPluginNFC _animationDelayMs:](self, "_animationDelayMs:", v9));
      [v7 setValue:v11 forKey:*MEMORY[0x263F341F0]];

      id v12 = [NSNumber numberWithChar:(char)v9];
      [v7 setValue:v12 forKey:*MEMORY[0x263F341E8]];

      dispatch_time_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[AccessoryTransportPluginNFC _getAccessoryFamily:](self, "_getAccessoryFamily:", v5));
      [v7 setValue:v13 forKey:*MEMORY[0x263F341B8]];

      char v14 = BYTE1(v52);
      if (v52 <= 0x71u)
      {
        int v15 = 0;
        uint64_t v16 = 0;
        unint64_t v17 = 16;
        id v18 = (char *)&colorWashTable0x53;
        switch((char)v52)
        {
          case 'A':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 2;
            id v18 = (char *)&colorWashTable0x41;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'C':
            int v15 = 0;
            uint64_t v16 = 0;
            if ((v52 & 0x100) != 0) {
              id v18 = (char *)&colorWashTable0x43;
            }
            else {
              id v18 = 0;
            }
            unint64_t v17 = 2 * (BYTE1(v52) & 1);
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'L':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 7;
            id v18 = (char *)&colorWashTable0x4c;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'M':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 11;
            id v18 = (char *)&colorWashTable0x4d;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'N':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 6;
            id v18 = (char *)&colorWashTable0x4e;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'S':
            goto LABEL_40;
          case 'T':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 32;
            id v18 = (char *)&colorWashTable0x54;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'U':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 13;
            id v18 = (char *)&colorWashTable0x55;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'V':
            uint64_t v16 = (char *)&colorWashTableSecondary0x56;
            int v15 = 1;
            unint64_t v17 = 6;
            id v18 = (char *)&colorWashTable0x56;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'W':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 19;
            id v18 = (char *)&colorWashTable0x57;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          case 'X':
            int v15 = 0;
            uint64_t v16 = 0;
            unint64_t v17 = 6;
            id v18 = (char *)&colorWashTable0x58;
            if ((v52 & 0x100) != 0) {
              goto LABEL_41;
            }
            break;
          default:
            break;
        }
LABEL_90:
        if ((v14 & 2) != 0)
        {
          v45 = [NSNumber numberWithBool:1];
          [v7 setValue:v45 forKey:*MEMORY[0x263F341C0]];

          if ((v14 & 4) == 0)
          {
LABEL_92:
            if ((v14 & 0x10) == 0) {
              goto LABEL_93;
            }
            goto LABEL_97;
          }
        }
        else if ((v14 & 4) == 0)
        {
          goto LABEL_92;
        }
        id v46 = [NSNumber numberWithBool:1];
        [v7 setValue:v46 forKey:*MEMORY[0x263F341E0]];

        if ((v14 & 0x10) == 0)
        {
LABEL_93:
          if ((v14 & 0x20) == 0) {
            goto LABEL_99;
          }
LABEL_98:
          v48 = [NSNumber numberWithBool:1];
          [v7 setValue:v48 forKey:*MEMORY[0x263F34190]];

          goto LABEL_99;
        }
LABEL_97:
        v47 = [NSNumber numberWithBool:1];
        [v7 setValue:v47 forKey:*MEMORY[0x263F34198]];

        if ((v14 & 0x20) == 0) {
          goto LABEL_99;
        }
        goto LABEL_98;
      }
      if (v52 > 0x80u)
      {
        if (v52 == 129)
        {
          int v15 = 0;
          uint64_t v16 = 0;
          unint64_t v17 = 13;
          id v18 = (char *)&colorWashTable0x81;
          if ((v52 & 0x100) == 0) {
            goto LABEL_90;
          }
        }
        else
        {
          if (v52 != 145) {
            goto LABEL_90;
          }
          int v15 = 0;
          uint64_t v16 = 0;
          unint64_t v17 = 9;
          id v18 = (char *)&colorWashTable0x91;
          if ((v52 & 0x100) == 0) {
            goto LABEL_90;
          }
        }
      }
      else if (v52 == 114)
      {
        int v15 = 0;
        uint64_t v16 = 0;
        unint64_t v17 = 2;
        id v18 = (char *)&colorWashTable0x72;
LABEL_40:
        if ((v52 & 0x100) == 0) {
          goto LABEL_90;
        }
      }
      else
      {
        if (v52 != 128) {
          goto LABEL_90;
        }
        int v15 = 0;
        uint64_t v16 = 0;
        unint64_t v17 = 6;
        id v18 = (char *)&colorWashTable0x80;
        if ((v52 & 0x100) == 0) {
          goto LABEL_90;
        }
      }
LABEL_41:
      unint64_t v19 = BYTE2(v52) & 0x3F;
      uint64_t v20 = [NSNumber numberWithChar:v19];
      [v7 setValue:v20 forKey:*MEMORY[0x263F341F8]];

      if (v19 && v17 > v19)
      {
        *(void *)&long long v21 = -1;
        *((void *)&v21 + 1) = -1;
        long long v50 = v21;
        long long v51 = v21;
        uint64_t v22 = +[ACCUserDefaults sharedDefaults];
        int v23 = objc_msgSend(v22, "BOOLForKey:");

        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v24 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          uint64_t v24 = MEMORY[0x263EF8438];
          id v25 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v23;
          _os_log_impl(&dword_242793000, v24, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: allow override: %d", buf, 8u);
        }

        if (v23
          && (+[ACCUserDefaults sharedDefaults],
              id v26 = objc_claimAutoreleasedReturnValue(),
              [v26 stringForKey:@"NFCColorOverride"],
              id v27 = objc_claimAutoreleasedReturnValue(),
              v26,
              v27)
          && (BOOL v28 = parseColorString(v27, (uint64_t)&v50), v27, v28))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            BOOL v29 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[AccessoryTransportPluginNFC initPlugin]();
            }
            BOOL v29 = MEMORY[0x263EF8438];
            id v31 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)&uint8_t buf[4] = v50;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = *((void *)&v50 + 1);
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v51;
            _os_log_impl(&dword_242793000, v29, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: override %f %f %f", buf, 0x20u);
          }

          long long v30 = (char *)&v50;
        }
        else
        {
          long long v30 = &v18[32 * v19];
        }
        v32 = [MEMORY[0x263EFF8F8] dataWithBytes:v30 length:32];
        [v7 setValue:v32 forKey:*MEMORY[0x263F341A0]];
        if (v15)
        {
          *(void *)&long long v33 = -1;
          *((void *)&v33 + 1) = -1;
          *(_OWORD *)buf = v33;
          *(_OWORD *)&uint8_t buf[16] = v33;
          uint64_t v34 = +[ACCUserDefaults sharedDefaults];
          int v35 = [v34 BOOLForKey:@"AllowNFCColorOverride"];

          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v36 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[AccessoryTransportPluginNFC initPlugin]();
            }
            uint64_t v36 = MEMORY[0x263EF8438];
            id v37 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v53 = 67109120;
            LODWORD(v54) = v35;
            _os_log_impl(&dword_242793000, v36, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: allow override: %d", v53, 8u);
          }

          if (v35
            && (+[ACCUserDefaults sharedDefaults],
                uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                [v38 stringForKey:@"NFCSecondaryColorOverride"],
                uint64_t v39 = objc_claimAutoreleasedReturnValue(),
                v38,
                v39)
            && (BOOL v40 = parseColorString(v39, (uint64_t)buf), v39, v40))
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              id v41 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[AccessoryTransportPluginNFC initPlugin]();
              }
              id v41 = MEMORY[0x263EF8438];
              id v43 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 134218496;
              uint64_t v54 = *(void *)buf;
              __int16 v55 = 2048;
              uint64_t v56 = *(void *)&buf[8];
              __int16 v57 = 2048;
              uint64_t v58 = *(void *)&buf[16];
              _os_log_impl(&dword_242793000, v41, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: secondary override %f %f %f", v53, 0x20u);
            }

            v42 = buf;
          }
          else
          {
            v42 = &v16[32 * v19];
          }
          id v44 = [MEMORY[0x263EFF8F8] dataWithBytes:v42 length:32];
          [v7 setValue:v44 forKey:*MEMORY[0x263F341A8]];
        }
      }
      goto LABEL_90;
    }
  }
LABEL_99:

  return v7;
}

- (void)_handleNearFieldAccessoryEventNotification:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v43 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleNearFieldAccessoryEventNotification", (uint8_t *)&buf, 2u);
  }

  id v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = [getNFAccessoryHardwareManagerClass() sharedHardwareManager];
  id v55 = 0;
  uint64_t v9 = [v8 getMultiTagState:&v55];
  id v41 = v55;
  unsigned int v10 = [v7 arrayWithArray:v9];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: newTags=%@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v42 = [(AccessoryTransportPluginNFC *)self _tagsHavePowerBits:32 uuid:0];
  polledTags = self->_polledTags;
  self->_polledTags = 0;

  [(AccessoryTransportPluginNFC *)self _didNfcTagsListChange:v10];
  BOOL v14 = [(AccessoryTransportPluginNFC *)self _hasWalletOnClearCase2020:v10];
  tagForConnectionUuid = self->_tagForConnectionUuid;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke;
  v52[3] = &unk_26516D430;
  id v16 = v10;
  id v53 = v16;
  uint64_t v54 = self;
  [(NSMutableDictionary *)tagForConnectionUuid enumerateKeysAndObjectsUsingBlock:v52];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v49;
LABEL_21:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(v17);
      }
      long long v21 = [*(id *)(*((void *)&v48 + 1) + 8 * v20) tagID];
      int v22 = [(AccessoryTransportPluginNFC *)self _getAccessoryType:v21];

      if (v22 == 86) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v18) {
          goto LABEL_21;
        }
        goto LABEL_27;
      }
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      int v23 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int screenState = self->_screenState;
      LODWORD(buf) = 67109120;
      DWORD1(buf) = screenState;
      _os_log_impl(&dword_242793000, v23, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: hasSleeve: _screenState=%d", (uint8_t *)&buf, 8u);
    }

    int v26 = self->_screenState;
    if (v26 == 1)
    {
      if (self->_proximityOcclusionState) {
        goto LABEL_45;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        uint64_t v34 = MEMORY[0x263EF8438];
        id v35 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_242793000, v34, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: wait for delayed prox events", (uint8_t *)&buf, 2u);
      }

      clock_gettime(_CLOCK_REALTIME, &self->_proxRequestTime);
    }
    else
    {
      if (!v26)
      {
        uint64_t v56 = 0;
        __int16 v57 = &v56;
        uint64_t v58 = 0x2020000000;
        id v27 = (void (*)(__CFString *))getBKSHIDServicesRequestProximityStatusEventSymbolLoc_ptr;
        char v59 = getBKSHIDServicesRequestProximityStatusEventSymbolLoc_ptr;
        if (!getBKSHIDServicesRequestProximityStatusEventSymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          v62 = __getBKSHIDServicesRequestProximityStatusEventSymbolLoc_block_invoke;
          v63 = &unk_26516D570;
          __int16 v64 = &v56;
          __getBKSHIDServicesRequestProximityStatusEventSymbolLoc_block_invoke((uint64_t)&buf);
          id v27 = (void (*)(__CFString *))v57[3];
        }
        _Block_object_dispose(&v56, 8);
        if (!v27)
        {
          -[AccessoryTransportPluginNFC _handleNearFieldAccessoryEventNotification:]();
          __break(1u);
        }
        v27(@"proxSleeveCheck");
        if (gLogObjects && gNumLogObjects >= 1)
        {
          BOOL v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          BOOL v28 = MEMORY[0x263EF8438];
          id v33 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_242793000, v28, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: request prox state", (uint8_t *)&buf, 2u);
        }

        clock_gettime(_CLOCK_REALTIME, &self->_proxRequestTime);
        BOOL v29 = 1;
        int64_t v30 = 100000000;
        goto LABEL_71;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v31 = MEMORY[0x263EF8438];
        id v32 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_242793000, v31, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: invalid _screenState value", (uint8_t *)&buf, 2u);
      }
    }
    int64_t v30 = 360000000;
    BOOL v29 = 1;
    goto LABEL_71;
  }
LABEL_27:

LABEL_45:
  BOOL v29 = 0;
  int64_t v30 = -1431655756000000;
LABEL_71:
  p_waitProxState = &self->_waitProxState;
  self->_waitProxState = v29;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke_42;
  v44[3] = &unk_26516D458;
  v44[4] = self;
  id v45 = v17;
  BOOL v46 = v14;
  BOOL v47 = v42;
  id v37 = v17;
  uint64_t v38 = MEMORY[0x24566E020](v44);
  uint64_t v39 = (void *)v38;
  if (*p_waitProxState)
  {
    dispatch_time_t v40 = dispatch_time(0, v30);
    dispatch_after(v40, MEMORY[0x263EF83A0], v39);
  }
  else
  {
    (*(void (**)(uint64_t))(v38 + 16))(v38);
  }
}

void __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v19 = a2;
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [v11 tagID];
        dispatch_time_t v13 = [v5 tagID];
        int v14 = [v12 isEqualToData:v13];

        if (v14)
        {
          [*(id *)(a1 + 32) removeObject:v11];
          int v15 = v19;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  int v15 = v19;
  id v16 = v19;
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void **)(v17 + 56);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke_2;
  v20[3] = &unk_26516D408;
  id v21 = v16;
  uint64_t v22 = v17;
  [v18 enumerateKeysAndObjectsUsingBlock:v20];
  [*(id *)(a1 + 40) destroyConnectionWithUUID:v16];
  [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v16];
  id v6 = v21;
LABEL_11:
}

void __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)]) {
    [*(id *)(*(void *)(a1 + 40) + 56) removeObjectForKey:v5];
  }
}

uint64_t __74__AccessoryTransportPluginNFC__handleNearFieldAccessoryEventNotification___block_invoke_42(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_242793000, v4, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _createEndpointsForTags", v7, 2u);
  }

  [*(id *)(a1 + 32) _createEndpointsForTags:*(void *)(a1 + 40) skipWalletAuth:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v5 = [*(id *)(a1 + 32) _tagsHavePowerBits:32 uuid:0];
  if (*(unsigned __int8 *)(a1 + 49) != v5) {
    [*(id *)(a1 + 32) _updateAccessoryPower:v5];
  }
  uint64_t result = [*(id *)(a1 + 32) _tagsHavePowerBits:48 uuid:0];
  if (result)
  {
    clock_gettime(_CLOCK_REALTIME, (timespec *)(*(void *)(a1 + 32) + 64));
    return [*(id *)(a1 + 32) _notifyAuthReadyAfterPowerPauseComplete];
  }
  return result;
}

- (void)_pollTags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (!self->_polledSem)
  {
    uint64_t v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    polledSem = self->_polledSem;
    self->_polledSem = v5;
  }
  if (self->_readerSession)
  {
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    readerSession = self->_readerSession;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __41__AccessoryTransportPluginNFC__pollTags___block_invoke;
    v55[3] = &unk_26516D480;
    objc_copyWeak(&v56, (id *)location);
    [(NFAccessoryReaderSession *)readerSession endSessionWithCompletion:v55];
    uint64_t v8 = self->_readerSession;
    self->_readerSession = 0;

    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)location);
  }
  int v9 = 3;
  unsigned int v10 = MEMORY[0x263EF8438];
  while (1)
  {
    if (!self->_readerSession)
    {
      *(void *)location = 0;
      *(void *)&location[8] = location;
      *(void *)&location[16] = 0x3032000000;
      uint64_t v58 = __Block_byref_object_copy_;
      char v59 = __Block_byref_object_dispose_;
      dispatch_semaphore_t v60 = (dispatch_semaphore_t)0xAAAAAAAAAAAAAAAALL;
      dispatch_semaphore_t v60 = dispatch_semaphore_create(0);
      BOOL v11 = [getNFAccessoryHardwareManagerClass() sharedHardwareManager];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __41__AccessoryTransportPluginNFC__pollTags___block_invoke_43;
      v54[3] = &unk_26516D4A8;
      v54[4] = self;
      v54[5] = location;
      id v12 = [v11 startReaderSession:v54];

      if (v12)
      {
        dispatch_time_t v13 = *(NSObject **)(*(void *)&location[8] + 40);
        dispatch_time_t v14 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v13, v14))
        {
          uint64_t v15 = gLogObjects;
          int v16 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v17 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              uint64_t v62 = v15;
              __int16 v63 = 1024;
              int v64 = v16;
              _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v18 = v10;
            uint64_t v17 = v10;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_242793000, v17, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: timed out waiting for session creation", buf, 2u);
          }

          [v12 endSessionWithCompletion:0];
        }
      }

      _Block_object_dispose(location, 8);
      if (!self->_readerSession)
      {
        uint64_t v37 = gLogObjects;
        int v38 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          long long v25 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)location = 134218240;
            *(void *)&location[4] = v37;
            *(_WORD *)&location[12] = 1024;
            *(_DWORD *)&location[14] = v38;
            _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", location, 0x12u);
          }
          BOOL v46 = v10;
          long long v25 = v10;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)location = 0;
          _os_log_impl(&dword_242793000, v25, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: !_readerSession", location, 2u);
        }
        goto LABEL_67;
      }
    }
    uint64_t v19 = gLogObjects;
    int v20 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v21 = gNumLogObjects < 1;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 134218240;
        *(void *)&location[4] = v19;
        *(_WORD *)&location[12] = 1024;
        *(_DWORD *)&location[14] = v20;
        _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", location, 0x12u);
      }
      uint64_t v22 = v10;
      long long v23 = v10;
    }
    else
    {
      long long v23 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_242793000, v23, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: startPollingForTechnology", location, 2u);
    }

    long long v24 = self->_readerSession;
    id v53 = 0;
    [(NFAccessoryReaderSession *)v24 startPollingForTechnology:v3 error:&v53];
    long long v25 = v53;
    if (v25)
    {
      uint64_t v26 = gLogObjects;
      int v27 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v28 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 134218240;
          *(void *)&location[4] = v26;
          *(_WORD *)&location[12] = 1024;
          *(_DWORD *)&location[14] = v27;
          _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", location, 0x12u);
        }
        id v33 = v10;
        uint64_t v28 = v10;
      }
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v25;
      uint64_t v34 = v28;
      id v35 = "NFC transport plugin: startPollingForTechnology failed: %@";
      uint32_t v36 = 12;
      goto LABEL_50;
    }
    BOOL v29 = self->_polledSem;
    dispatch_time_t v30 = dispatch_time(0, 4000000000);
    if (!dispatch_semaphore_wait(v29, v30)) {
      goto LABEL_52;
    }
    uint64_t v31 = gLogObjects;
    int v32 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v28 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 134218240;
        *(void *)&location[4] = v31;
        *(_WORD *)&location[12] = 1024;
        *(_DWORD *)&location[14] = v32;
        _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", location, 0x12u);
      }
      uint64_t v39 = v10;
      uint64_t v28 = v10;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      uint64_t v34 = v28;
      id v35 = "NFC transport plugin: timed out waiting for polling";
      uint32_t v36 = 2;
LABEL_50:
      _os_log_impl(&dword_242793000, v34, OS_LOG_TYPE_DEFAULT, v35, location, v36);
    }
LABEL_51:

LABEL_52:
    uint64_t v40 = gLogObjects;
    int v41 = gNumLogObjects;
    BOOL v42 = !gLogObjects || gNumLogObjects <= 0;
    BOOL v43 = !v42;
    if (self->_polledTags) {
      break;
    }
    if (v43)
    {
      id v44 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 134218240;
        *(void *)&location[4] = v40;
        *(_WORD *)&location[12] = 1024;
        *(_DWORD *)&location[14] = v41;
        _os_log_error_impl(&dword_242793000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", location, 0x12u);
      }
      id v45 = v10;
      id v44 = v10;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_242793000, v44, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags: !_polledTags", location, 2u);
    }

    usleep(0x186A0u);
LABEL_67:

    if (!--v9) {
      goto LABEL_82;
    }
  }
  if (v43)
  {
    BOOL v47 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v47 = MEMORY[0x263EF8438];
    id v48 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)location = 0;
    _os_log_impl(&dword_242793000, v47, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags: found tags", location, 2u);
  }

LABEL_82:
  if (!self->_polledTags && self->_readerSession)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v49 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      long long v49 = MEMORY[0x263EF8438];
      id v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_242793000, v49, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags: giving up", location, 2u);
    }

    p_readerSession = &self->_readerSession;
    [(NFAccessoryReaderSession *)*p_readerSession endSessionWithCompletion:0];
    int v52 = *p_readerSession;
    *p_readerSession = 0;
  }
}

void __41__AccessoryTransportPluginNFC__pollTags___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_242793000, v4, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _connectedTag = nil", v8, 2u);
  }

  uint64_t v5 = (void *)WeakRetained[13];
  WeakRetained[13] = 0;

  id v6 = (void *)WeakRetained[14];
  WeakRetained[14] = 0;

  uint64_t v7 = (void *)WeakRetained[15];
  WeakRetained[15] = 0;
}

void __41__AccessoryTransportPluginNFC__pollTags___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      unsigned int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      unsigned int v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_242793000, v10, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: Could not create session", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      BOOL v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      BOOL v11 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: created _readerSession", v16, 2u);
    }

    [v5 setDelegate:*(void *)(a1 + 32)];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v5;
    unsigned int v10 = *(NSObject **)(v14 + 80);
    *(void *)(v14 + 80) = v15;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_requestPowerPause
{
  kern_return_t v11;
  kern_return_t v12;
  NSDate *v13;
  NSObject *p_super;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  unsigned char v18[32];
  long long v19;
  long long v20;
  long long v21;
  unint64_t v22;
  io_connect_t connect;
  uint8_t buf[4];
  kern_return_t v25;
  uint64_t v26;

  uint64_t v26 = *MEMORY[0x263EF8340];
  connect = -1431655766;
  uint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v20 = v3;
  BOOL v21 = v3;
  *(_OWORD *)&v18[16] = v3;
  uint64_t v19 = v3;
  *(_OWORD *)uint64_t v18 = v3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _requestPowerPause", buf, 2u);
  }

  mach_port_t v7 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v8 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    p_super = logObjectForModule();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)long long buf = 0;
    id v15 = "NFC transport plugin: _requestPowerPause: !service";
    int v16 = p_super;
    uint64_t v17 = 2;
LABEL_23:
    _os_log_impl(&dword_242793000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_15;
  }
  io_object_t v10 = MatchingService;
  BOOL v11 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  IOObjectRelease(v10);
  if (v11)
  {
    p_super = logObjectForModule();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)long long buf = 67109120;
    long long v25 = v11;
    id v15 = "NFC transport plugin: _requestPowerPause: IOServiceOpen: 0x%x";
    goto LABEL_22;
  }
  *(_OWORD *)&v18[8] = xmmword_2427A0000;
  v18[0] = 1;
  id v12 = IOConnectCallStructMethod(connect, 3u, v18, 0x58uLL, 0, 0);
  IOServiceClose(connect);
  if (v12)
  {
    p_super = logObjectForModule();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)long long buf = 67109120;
    long long v25 = v12;
    id v15 = "NFC transport plugin: _requestPowerPause: 0x%x";
LABEL_22:
    int v16 = p_super;
    uint64_t v17 = 8;
    goto LABEL_23;
  }
  id v13 = [MEMORY[0x263EFF910] date];
  p_super = &self->_lastRequestPowerPauseTime->super;
  self->_lastRequestPowerPauseTime = v13;
LABEL_15:
}

- (unint64_t)_getTimeSinceLastRequestPowerPauseMs
{
  if (!self->_lastRequestPowerPauseTime) {
    return -1;
  }
  long long v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_lastRequestPowerPauseTime];
  unint64_t v5 = (unint64_t)(v4 * 1000.0);

  return v5;
}

- (BOOL)_getpowerPauseStatus
{
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  kern_return_t v17;
  uint64_t v18;

  uint64_t v18 = *MEMORY[0x263EF8340];
  connect = -1431655766;
  output = 0;
  outputCnt = 1;
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v3 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      io_object_t v10 = "NFC transport plugin: _getpowerPauseStatus: !service";
      BOOL v11 = v9;
      id v12 = 2;
LABEL_12:
      _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  io_object_t v5 = MatchingService;
  id v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  IOObjectRelease(v5);
  if (v6)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v17 = v6;
      io_object_t v10 = "NFC transport plugin: _getpowerPauseStatus: IOServiceOpen: 0x%x";
LABEL_11:
      BOOL v11 = v9;
      id v12 = 8;
      goto LABEL_12;
    }
LABEL_13:

    return output != 0;
  }
  mach_port_t v7 = IOConnectCallScalarMethod(connect, 5u, 0, 0, &output, &outputCnt);
  IOServiceClose(connect);
  if (v7)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v17 = v7;
      io_object_t v10 = "NFC transport plugin: _getpowerPauseStatus: 0x%x";
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  return output != 0;
}

- (unsigned)_getNfcStateMachineState
{
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  kern_return_t v17;
  uint64_t v18;

  uint64_t v18 = *MEMORY[0x263EF8340];
  connect = -1431655766;
  output = 0;
  outputCnt = 1;
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v3 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      io_object_t v10 = "NFC transport plugin: _getNfcStateMachineState: !service";
      BOOL v11 = v9;
      id v12 = 2;
LABEL_13:
      _os_log_impl(&dword_242793000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  io_object_t v5 = MatchingService;
  id v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  IOObjectRelease(v5);
  if (v6)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v17 = v6;
      io_object_t v10 = "NFC transport plugin: _getNfcStateMachineState: IOServiceOpen: 0x%x";
LABEL_12:
      BOOL v11 = v9;
      id v12 = 8;
      goto LABEL_13;
    }
LABEL_14:

    return 0;
  }
  mach_port_t v7 = IOConnectCallScalarMethod(connect, 6u, 0, 0, &output, &outputCnt);
  IOServiceClose(connect);
  if (v7)
  {
    int v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v17 = v7;
      io_object_t v10 = "NFC transport plugin: _getNfcStateMachineState: 0x%x";
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  return output;
}

- (BOOL)_connectToTagId:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v34 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  connectedTagId = self->_polledTags;
  uint64_t v5 = [(NSArray *)connectedTagId countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v5)
  {
    BOOL v27 = 0;
    BOOL v11 = 0;
    id v8 = 0;
LABEL_30:

    id v14 = v8;
    goto LABEL_31;
  }
  uint64_t v7 = v5;
  id v8 = 0;
  uint64_t v9 = *(void *)v40;
  *(void *)&long long v6 = 134218240;
  long long v32 = v6;
  id v33 = self;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v40 != v9) {
      objc_enumerationMutation(connectedTagId);
    }
    BOOL v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
    readerSession = self->_readerSession;
    id v38 = v8;
    char v13 = -[NFAccessoryReaderSession connectTag:error:](readerSession, "connectTag:error:", v11, &v38, v32);
    id v14 = v38;

    if ((v13 & 1) == 0)
    {
      uint64_t v23 = gLogObjects;
      int v24 = gNumLogObjects;
      long long v25 = MEMORY[0x263EF8438];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = v32;
          uint64_t v45 = v23;
          __int16 v46 = 1024;
          int v47 = v24;
          _os_log_error_impl(&dword_242793000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        uint64_t v26 = v25;
        uint64_t v18 = v25;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v45 = (uint64_t)v14;
        _os_log_impl(&dword_242793000, v18, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: connectTag failed: %@", buf, 0xCu);
      }
      id v8 = v14;
      goto LABEL_22;
    }
    if (!v34)
    {
      id v28 = v11;
      goto LABEL_28;
    }
    id v15 = self;
    int v16 = connectedTagId;
    uint64_t v17 = v15->_readerSession;
    id v37 = v14;
    uint64_t v18 = [(NFAccessoryReaderSession *)v17 readTypeIdentifier:&v37];
    id v19 = v37;

    if (!v18)
    {
      int v20 = v15->_readerSession;
      id v36 = v19;
      BOOL v21 = &v36;
      uint64_t v22 = &v36;
      goto LABEL_21;
    }
    if ([v18 isEqualToData:v34]) {
      break;
    }
    int v20 = v33->_readerSession;
    id v35 = v19;
    BOOL v21 = &v35;
    uint64_t v22 = &v35;
LABEL_21:
    [(NFAccessoryReaderSession *)v20 disconnectTag:v22];
    id v8 = *v21;

    connectedTagId = v16;
    self = v33;
LABEL_22:

    if (v7 == ++v10)
    {
      uint64_t v7 = [(NSArray *)connectedTagId countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v7) {
        goto LABEL_3;
      }
      BOOL v27 = 0;
      BOOL v11 = 0;
      goto LABEL_30;
    }
  }
  id v29 = v11;

  id v14 = v19;
  connectedTagId = v16;
  self = v33;
LABEL_28:

  if (v11)
  {
    objc_storeStrong((id *)&self->_connectedTag, v11);
    dispatch_time_t v30 = (NSData *)v34;
    connectedTagId = (NSArray *)self->_connectedTagId;
    self->_connectedTagId = v30;
    BOOL v27 = 1;
    id v8 = v14;
    goto LABEL_30;
  }
  BOOL v27 = 0;
LABEL_31:

  return v27;
}

- (BOOL)_tagsHavePowerBits:(unsigned __int8)a3 uuid:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  connectionUuidForEndpointUuid = self->_connectionUuidForEndpointUuid;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AccessoryTransportPluginNFC__tagsHavePowerBits_uuid___block_invoke;
  v9[3] = &unk_26516D4D0;
  char v10 = a3 & 0x30;
  v9[4] = self;
  v9[5] = &v17;
  v9[6] = &v11;
  [(NSMutableDictionary *)connectionUuidForEndpointUuid enumerateKeysAndObjectsUsingBlock:v9];
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a4 && *((unsigned char *)v18 + 24))
  {
    *a4 = (id) v12[5];
    int v6 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __55__AccessoryTransportPluginNFC__tagsHavePowerBits_uuid___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 48) valueForKey:a3];
  char v10 = [v9 tagID];
  int v11 = 0;
  [v10 getBytes:&v11 length:4];
  if ((*(unsigned char *)(a1 + 56) & BYTE1(v11)) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (unsigned)_getAccessoryType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  int v9 = 0;
  if (!v4
    || [v4 length] != 4
    || ![(AccessoryTransportPluginNFC *)self _checkLRC:v5]
    || (([v5 getBytes:&v9 length:4], v6 = v9, unsigned int v7 = v9 - 57, v7 > 0x39)
     || ((1 << v7) & 0x2000000FC381F01) == 0)
    && (v9 - 128 > 0x15 || ((1 << (v9 + 0x80)) & 0x2B0123) == 0)
    && v9 != 22)
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unsigned)_getAccessoryFamily:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  int v8 = 0;
  if (v4 && [v4 length] == 4 && -[AccessoryTransportPluginNFC _checkLRC:](self, "_checkLRC:", v5))
  {
    [v5 getBytes:&v8 length:4];
    unsigned __int8 v6 = 5;
    if (v8 > 0x71u)
    {
      switch((char)v8)
      {
        case -112:
          unsigned __int8 v6 = 7;
          break;
        case -111:
          break;
        case -110:
        case -108:
          goto LABEL_16;
        case -109:
LABEL_8:
          unsigned __int8 v6 = 10;
          break;
        case -107:
LABEL_6:
          unsigned __int8 v6 = 2;
          break;
        default:
          if (v8 != 114) {
            goto LABEL_16;
          }
          unsigned __int8 v6 = 4;
          break;
      }
    }
    else
    {
      switch((char)v8)
      {
        case '9':
          goto LABEL_8;
        case ':':
        case ';':
        case '<':
        case '=':
        case '>':
        case '?':
        case '@':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
          goto LABEL_16;
        case 'A':
        case 'C':
        case 'D':
        case 'E':
          goto LABEL_6;
        case 'B':
          unsigned __int8 v6 = 1;
          break;
        case 'L':
        case 'M':
        case 'N':
          unsigned __int8 v6 = 3;
          break;
        case 'S':
        case 'T':
        case 'U':
          break;
        case 'V':
          unsigned __int8 v6 = 6;
          break;
        case 'W':
        case 'X':
          unsigned __int8 v6 = 8;
          break;
        default:
          if (v8 != 22) {
            goto LABEL_16;
          }
          unsigned __int8 v6 = 11;
          break;
      }
    }
  }
  else
  {
LABEL_16:
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_createEndpointsForTags:(id)a3 skipWalletAuth:(BOOL)a4
{
  BOOL v40 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0x26B0B5000uLL;
    uint64_t v8 = *(void *)v46;
    uint64_t v42 = *MEMORY[0x263F34158];
    uint64_t v43 = *(void *)v46;
    do
    {
      uint64_t v9 = 0;
      uint64_t v41 = v6;
      do
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        char v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
        int v11 = [v10 tagID];
        if ([(AccessoryTransportPluginNFC *)self _checkLRC:v11])
        {
          id v12 = [v10 tagID];
          int v13 = [(AccessoryTransportPluginNFC *)self _getAccessoryType:v12];

          if (v13 != 86 || self->_proximityOcclusionState)
          {
            id v14 = [NSString stringWithFormat:@"%@", v11];
            id v15 = [(ACCTransportPlugin *)self createConnectionWithType:9 andIdentifier:v14];
            uint64_t v49 = v42;
            id v16 = [MEMORY[0x263EFF9D0] null];
            id v50 = v16;
            uint64_t v17 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            [(ACCTransportPlugin *)self setProperties:v17 forConnectionWithUUID:v15];

            uint64_t v18 = *(id **)(v7 + 3408);
            int v19 = gNumLogObjects;
            if (v18 && gNumLogObjects >= 1)
            {
              char v20 = *v18;
            }
            else
            {
              BOOL v21 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134218240;
                uint64_t v53 = (uint64_t)v18;
                __int16 v54 = 1024;
                int v55 = v19;
                _os_log_error_impl(&dword_242793000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v22 = v21;
              char v20 = v21;
              uint64_t v6 = v41;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v53 = (uint64_t)v14;
              _os_log_impl(&dword_242793000, v20, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: tagID=%@", buf, 0xCu);
            }

            if (v15)
            {
              if (![(AccessoryTransportPluginNFC *)self _requiresMfi40Auth:v11] || v40)
              {
                if ([(AccessoryTransportPluginNFC *)self _requiresLegacyAuth:v11]) {
                  uint64_t v23 = 10;
                }
                else {
                  uint64_t v23 = 1;
                }
              }
              else
              {
                uint64_t v23 = 14;
              }
              int v24 = *(id **)(v7 + 3408);
              int v25 = gNumLogObjects;
              if (v24 && gNumLogObjects >= 1)
              {
                uint64_t v26 = *v24;
              }
              else
              {
                BOOL v27 = MEMORY[0x263EF8438];
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  uint64_t v53 = (uint64_t)v24;
                  __int16 v54 = 1024;
                  int v55 = v25;
                  _os_log_error_impl(&dword_242793000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v28 = v27;
                uint64_t v26 = v27;
                uint64_t v6 = v41;
              }
              unint64_t v7 = 0x26B0B5000;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109120;
                LODWORD(v53) = v23;
                _os_log_impl(&dword_242793000, v26, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: protocol=%d", buf, 8u);
              }

              id v29 = [(ACCTransportPlugin *)self createEndpointWithTransportType:13 andProtocol:v23 andIdentifier:v14 forConnectionWithUUID:v15 publishConnection:0];
              dispatch_time_t v30 = [(AccessoryTransportPluginNFC *)self _decodeTagIdentifier:v11];
              if (v30) {
                [(ACCTransportPlugin *)self setProperties:v30 forEndpointWithUUID:v29];
              }
              [(NSMutableDictionary *)self->_connectionUuidForEndpointUuid setObject:v15 forKey:v29];
              [(NSMutableDictionary *)self->_tagForConnectionUuid setObject:v10 forKey:v15];
            }
            [(ACCTransportPlugin *)self publishConnectionWithUUID:v15];
            goto LABEL_36;
          }
          uint64_t v31 = *(id **)(v7 + 3408);
          int v32 = gNumLogObjects;
          if (v31 && gNumLogObjects >= 1)
          {
            id v33 = *v31;
          }
          else
          {
            id v33 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              uint64_t v53 = (uint64_t)v31;
              __int16 v54 = 1024;
              int v55 = v32;
              _os_log_error_impl(&dword_242793000, v33, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v34 = v33;
          }
          unint64_t v7 = 0x26B0B5000uLL;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_242793000, v33, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: ignore sleeve", buf, 2u);
          }

          if ([obj count] == 1)
          {
            id v35 = [getNFAccessoryHardwareManagerClass() sharedHardwareManager];
            id v14 = [v35 clearMultiTagState];

            if (v14)
            {
              uint64_t v36 = gLogObjects;
              int v37 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                id v15 = *(id *)gLogObjects;
              }
              else
              {
                id v15 = MEMORY[0x263EF8438];
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  uint64_t v53 = v36;
                  __int16 v54 = 1024;
                  int v55 = v37;
                  _os_log_error_impl(&dword_242793000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v38 = v15;
                uint64_t v6 = v41;
              }
              unint64_t v7 = 0x26B0B5000;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v53 = (uint64_t)v14;
                _os_log_impl(&dword_242793000, v15, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: clearMultiTagState error: %@", buf, 0xCu);
              }
LABEL_36:

              uint64_t v8 = v43;
            }
          }
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      uint64_t v6 = v39;
    }
    while (v39);
  }
  self->_waitProxState = 0;
}

- (void)_setScreenStateMonitoringEnabled:(BOOL)a3
{
  if (a3)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__AccessoryTransportPluginNFC__setScreenStateMonitoringEnabled___block_invoke;
    v10[3] = &unk_26516D4F8;
    v10[4] = self;
    id v4 = (void *)MEMORY[0x24566E020](v10, a2);
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    uint32_t v6 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_screenStateToken, v5, v4);

    if (v6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unint64_t v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        unint64_t v7 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_242793000, v7, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: Fail to register for screen state change", v9, 2u);
      }
    }
  }
  else
  {
    if (notify_is_valid_token(self->_screenStateToken)) {
      notify_cancel(self->_screenStateToken);
    }
    self->_screenStateToken = -1;
  }
}

void __64__AccessoryTransportPluginNFC__setScreenStateMonitoringEnabled___block_invoke(uint64_t a1, int token)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0xAAAAAAAAAAAAAAAALL;
  if (!notify_get_state(token, &state64))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 148) = state64 == 0;
    [*(id *)(a1 + 32) _didScreenStateChange:*(_DWORD *)(*(void *)(a1 + 32) + 148) != 0];
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      uint64_t v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 148);
      *(_DWORD *)long long buf = 67109120;
      int v9 = v6;
      _os_log_impl(&dword_242793000, v5, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: screen handler: _screenState=%d", buf, 8u);
    }
  }
}

- (void)_setProximityMonitoringEnabled:(BOOL)a3
{
  if (a3)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      int v6 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_242793000, v6, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _setProximityMonitoringEnabled", v7, 2u);
    }

    if (!self->_hidEventClient)
    {
      self->_hidEventClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
      IOHIDEventSystemClientSetMatching();
      CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop();
      IOHIDEventSystemClientRegisterEventCallback();
    }
  }
  else
  {
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    IOHIDEventSystemClientUnregisterEventCallback();
    self->_hidEventClient = 0;
  }
}

- (void)_didScreenStateChange:(BOOL)a3
{
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  unint64_t v23;
  io_connect_t connect;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  BOOL v3 = a3;
  BOOL v27 = *MEMORY[0x263EF8340];
  connect = -1431655766;
  uint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  BOOL v21 = v4;
  uint64_t v22 = v4;
  int v19 = v4;
  char v20 = v4;
  uint64_t v18 = v4;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    unint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    uint64_t v26 = v3;
    _os_log_impl(&dword_242793000, v7, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _didScreenStateChange: %d", buf, 8u);
  }

  mach_port_t v8 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v9 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  if (!MatchingService)
  {
    id v14 = logObjectForModule();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v15 = "NFC transport plugin: _didScreenStateChange: !service";
      id v16 = v14;
      uint64_t v17 = 2;
LABEL_22:
      _os_log_impl(&dword_242793000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  io_object_t v11 = MatchingService;
  id v12 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  IOObjectRelease(v11);
  if (v12)
  {
    id v14 = logObjectForModule();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v26 = v12;
      id v15 = "NFC transport plugin: _didScreenStateChange: IOServiceOpen: 0x%x";
LABEL_21:
      id v16 = v14;
      uint64_t v17 = 8;
      goto LABEL_22;
    }
LABEL_23:

    return;
  }
  *((void *)&v18 + 1) = 1313227588;
  *(void *)&int v19 = v3;
  LOBYTE(v18) = 1;
  int v13 = IOConnectCallStructMethod(connect, 3u, &v18, 0x58uLL, 0, 0);
  IOServiceClose(connect);
  if (v13)
  {
    id v14 = logObjectForModule();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v26 = v13;
      id v15 = "NFC transport plugin: _didScreenStateChange: 0x%x";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
}

- (void)_didNfcTagsListChange:(id)a3
{
  kern_return_t v24;
  kern_return_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long inputStruct;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  unint64_t v39;
  io_connect_t connect;
  uint8_t buf[4];
  kern_return_t v42;
  unsigned char v43[128];
  uint64_t v44;

  id v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connect = -1431655766;
  uint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v37 = v5;
  id v38 = v5;
  id v35 = v5;
  uint64_t v36 = v5;
  inputStruct = v5;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    mach_port_t v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    mach_port_t v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_242793000, v8, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _didNfcTagsListChange", buf, 2u);
  }

  unsigned int v9 = [v4 count] << 24;
  dispatch_time_t v30 = 0u;
  uint64_t v31 = 0u;
  int v32 = 0u;
  id v33 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "tagID", (void)v30);
        if ([(AccessoryTransportPluginNFC *)self _checkLRC:v17])
        {
          uint64_t v18 = [v16 tagID];
          int v19 = [(AccessoryTransportPluginNFC *)self _getAccessoryType:v18];

          *(_DWORD *)long long buf = 0;
          [v17 getBytes:buf length:4];
          v9 |= (v19 << (8 * v13++)) | ((buf[1] & 0x30) << 16);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v12);
  }

  mach_port_t v20 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v21 = IOServiceMatching("AppleSMCSensorDispatcher");
  io_service_t MatchingService = IOServiceGetMatchingService(v20, v21);
  if (!MatchingService)
  {
    uint64_t v26 = logObjectForModule();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      BOOL v27 = "NFC transport plugin: _didNfcTagsListChange: !service";
      id v28 = v26;
      id v29 = 2;
LABEL_31:
      _os_log_impl(&dword_242793000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  io_object_t v23 = MatchingService;
  int v24 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  IOObjectRelease(v23);
  if (v24)
  {
    uint64_t v26 = logObjectForModule();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v42 = v24;
      BOOL v27 = "NFC transport plugin: _didNfcTagsListChange: IOServiceOpen: 0x%x";
LABEL_30:
      id v28 = v26;
      id v29 = 8;
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_23;
  }
  *((void *)&inputStruct + 1) = 1313227604;
  *(void *)&id v35 = v9;
  LOBYTE(inputStruct) = 1;
  int v25 = IOConnectCallStructMethod(connect, 3u, &inputStruct, 0x58uLL, 0, 0);
  IOServiceClose(connect);
  if (v25)
  {
    uint64_t v26 = logObjectForModule();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uint64_t v42 = v25;
      BOOL v27 = "NFC transport plugin: _didNfcTagsListChange: 0x%x";
      goto LABEL_30;
    }
    goto LABEL_32;
  }
LABEL_23:
}

- (void)_updateAccessoryPower:(BOOL)a3
{
  BOOL v3 = a3;
  io_connect_t connect = 0;
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  if (IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x263EF8960], 0, &connect)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = connect == 0;
  }
  if (!v5)
  {
    if (v3) {
      int v6 = IOAccessoryManagerAllowFeatures();
    }
    else {
      int v6 = IOAccessoryManagerRevokeFeatures();
    }
    int v7 = v6;
    if (v6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        mach_port_t v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        mach_port_t v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(AccessoryTransportPluginNFC *)v3 _updateAccessoryPower:v8];
      }
    }
    IOServiceClose(connect);
  }
}

- (void)_closeReaderSession
{
  readerSession = self->_readerSession;
  if (readerSession)
  {
    id v26 = 0;
    [(NFAccessoryReaderSession *)readerSession disconnectTag:&v26];
    id v4 = v26;
    [(NFAccessoryReaderSession *)self->_readerSession stopPolling:0];
    *(void *)long long buf = 0;
    CFDictionaryRef v21 = buf;
    uint64_t v22 = 0x3032000000;
    io_object_t v23 = __Block_byref_object_copy_;
    int v24 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)0xAAAAAAAAAAAAAAAALL;
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    BOOL v5 = self->_readerSession;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__AccessoryTransportPluginNFC__closeReaderSession__block_invoke;
    v17[3] = &unk_26516D548;
    objc_copyWeak(&v18, &location);
    v17[4] = buf;
    [(NFAccessoryReaderSession *)v5 endSessionWithCompletion:v17];
    int v6 = *((void *)v21 + 5);
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v6, v7);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      mach_port_t v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      mach_port_t v8 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_242793000, v8, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _closeReaderSession: set _readerSession = nil", v16, 2u);
    }

    id v10 = self->_readerSession;
    self->_readerSession = 0;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v4 = 0;
  }
  if (self->_connectedTag)
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 1;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryTransportPluginNFC initPlugin]();
      }
      int v13 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      int v13 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_242793000, v13, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _closeReaderSession: forcing _connectedTag = nil", buf, 2u);
    }

    connectedTag = self->_connectedTag;
    self->_connectedTag = 0;
  }
  polledTags = self->_polledTags;
  self->_polledTags = 0;
}

void __50__AccessoryTransportPluginNFC__closeReaderSession__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_242793000, v5, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _closeReaderSession: set _connectedTag = nil", v9, 2u);
  }

  int v6 = (void *)WeakRetained[13];
  WeakRetained[13] = 0;

  dispatch_time_t v7 = (void *)WeakRetained[14];
  WeakRetained[14] = 0;

  mach_port_t v8 = (void *)WeakRetained[15];
  WeakRetained[15] = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (BOOL)_handleSessionOpen:(BOOL)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (!a3)
  {
    [(AccessoryTransportPluginNFC *)self _closeReaderSession];
LABEL_79:
    BOOL v35 = 1;
    goto LABEL_80;
  }
  if (self->_connectedTag)
  {
    int v37 = logObjectForModule();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_242793000, v37, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleSessionOpen: _connectedTag", buf, 2u);
    }
    id v12 = 0;
    goto LABEL_89;
  }
  BOOL v11 = [(NSMutableDictionary *)self->_connectionUuidForEndpointUuid valueForKey:v9];
  id v12 = v11;
  if (!v11 || ([v11 isEqualToString:v10] & 1) == 0)
  {
    int v37 = logObjectForModule();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v38 = "NFC transport plugin: _handleSessionOpen: !uuid || !equal";
LABEL_88:
      _os_log_impl(&dword_242793000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
    }
LABEL_89:
    uint64_t v14 = 0;
LABEL_90:

    goto LABEL_91;
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_tagForConnectionUuid valueForKey:v10];
  if (!v13)
  {
    int v37 = logObjectForModule();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v38 = "NFC transport plugin: _handleSessionOpen: !knownTag";
      goto LABEL_88;
    }
    goto LABEL_89;
  }
  uint64_t v14 = (void *)v13;
  if (!self->_polledTags)
  {
    if ([(AccessoryTransportPluginNFC *)self _tagsHavePowerBits:48 uuid:0]
      && ![(AccessoryTransportPluginNFC *)self _getpowerPauseStatus])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        id v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_242793000, v15, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleSessionOpen: powerPause:0", buf, 2u);
      }

      [(AccessoryTransportPluginNFC *)self _requestPowerPause];
      usleep(0x30D40u);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryTransportPluginNFC initPlugin]();
        }
        uint64_t v17 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = [(AccessoryTransportPluginNFC *)self _getpowerPauseStatus];
        *(_DWORD *)long long buf = 67109120;
        BOOL v44 = v19;
        _os_log_impl(&dword_242793000, v17, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleSessionOpen: powerPause:0->%d", buf, 8u);
      }
    }
    mach_port_t v20 = [(NSMutableDictionary *)self->_tagForConnectionUuid valueForKey:v10];
    switch([v20 silentType])
    {
      case 0u:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          CFDictionaryRef v21 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          CFDictionaryRef v21 = MEMORY[0x263EF8438];
          id v26 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_242793000, v21, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags", buf, 2u);
        }

        uint64_t v27 = [v20 technology];
        id v28 = self;
        goto LABEL_73;
      case 1u:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          io_object_t v23 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          io_object_t v23 = MEMORY[0x263EF8438];
          id v30 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_242793000, v23, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags:NFACTagTechnologyS1", buf, 2u);
        }

        id v28 = self;
        uint64_t v27 = 32;
        goto LABEL_73;
      case 2u:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          int v24 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          int v24 = MEMORY[0x263EF8438];
          id v31 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_242793000, v24, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags:NFACTagTechnologyS2", buf, 2u);
        }

        id v28 = self;
        uint64_t v27 = 64;
        goto LABEL_73;
      case 3u:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          dispatch_semaphore_t v25 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          dispatch_semaphore_t v25 = MEMORY[0x263EF8438];
          id v32 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_242793000, v25, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _pollTags:NFACTagTechnologyS3", buf, 2u);
        }

        id v28 = self;
        uint64_t v27 = 128;
LABEL_73:
        [(AccessoryTransportPluginNFC *)v28 _pollTags:v27];
        break;
      default:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v22 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginNFC initPlugin]();
          }
          uint64_t v22 = MEMORY[0x263EF8438];
          id v29 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_242793000, v22, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: skip _pollTags", buf, 2u);
        }

        break;
    }

    if (!self->_polledTags)
    {
      int v37 = logObjectForModule();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_242793000, v37, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _handleSessionOpen: !_polledTags", buf, 2u);
      }
      goto LABEL_90;
    }
  }
  id v33 = [v14 tagID];
  BOOL v34 = [(AccessoryTransportPluginNFC *)self _connectToTagId:v33];

  if (v34 && self->_connectedTag && self->_connectedTagId)
  {
    objc_storeStrong((id *)&self->_connectedTagEndpointUuid, a4);

    goto LABEL_79;
  }
LABEL_91:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v39 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryTransportPluginNFC initPlugin]();
    }
    uint64_t v39 = MEMORY[0x263EF8438];
    id v40 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v41 = self->_connectedTag != 0;
    BOOL v42 = self->_connectedTagId != 0;
    *(_DWORD *)long long buf = 67109632;
    BOOL v44 = 0;
    __int16 v45 = 1024;
    BOOL v46 = v41;
    __int16 v47 = 1024;
    BOOL v48 = v42;
    _os_log_impl(&dword_242793000, v39, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: _connectToTagId failed: success:%d, _connectedTag:%d, _connectedTagId:%d", buf, 0x14u);
  }

  BOOL v35 = 0;
LABEL_80:

  return v35;
}

- (BOOL)_hasWalletOnClearCase2020:(id)a3
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
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        BOOL v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) tagID];
        int v12 = [(AccessoryTransportPluginNFC *)self _getAccessoryType:v11];

        v7 |= v12 == 67;
        v8 |= (v12 - 87) < 2;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
    char v13 = v8 & v7;
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)_checkProductTypeCompatibility:(unsigned __int8)a3
{
  int v3 = a3;
  CFStringRef v4 = (const __CFString *)systemInfo_copyProductType();
  if (!v4)
  {
    uint64_t v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_242793000, v9, OS_LOG_TYPE_DEFAULT, "NFC transport plugin: failed to retrieve product type", v10, 2u);
    }

    return 1;
  }
  CFStringRef v5 = v4;
  BOOL result = 0;
  char v7 = v3 - 22;
  if ((v3 - 22) > 0x3F) {
    goto LABEL_8;
  }
  if (((1 << v7) & 0x4080480000000000) != 0)
  {
    if (CFEqual(v5, @"iPhone14,2")
      || CFEqual(v5, @"iPhone14,3")
      || CFEqual(v5, @"iPhone14,4"))
    {
      return 1;
    }
    CFStringRef v8 = @"iPhone14,5";
    return CFEqual(v5, v8);
  }
  if (((1 << v7) & 0x8100800000000001) != 0) {
    return result;
  }
  if (((1 << v7) & 0x2040200000000000) == 0)
  {
LABEL_8:
    if ((v3 - 86) > 0x3F) {
      return 1;
    }
    if (((1 << (v3 - 86)) & 0x8C008C0010000000) != 0) {
      return result;
    }
    if (v3 != 86) {
      return 1;
    }
  }
  if (CFEqual(v5, @"iPhone13,1")
    || CFEqual(v5, @"iPhone13,2")
    || CFEqual(v5, @"iPhone13,3"))
  {
    return 1;
  }
  CFStringRef v8 = @"iPhone13,4";
  return CFEqual(v5, v8);
}

- (int)_animationDelayMs:(unsigned __int8)a3
{
  char v3 = a3 - 22;
  if ((a3 - 22) <= 0x3F)
  {
    if (((1 << v3) & 0x60C0680000000000) != 0) {
      return 600;
    }
    if (((1 << v3) & 0x8100800000000000) != 0 || a3 == 22) {
      return 170;
    }
  }
  int result = 0;
  char v5 = a3 - 87;
  if ((a3 - 87) > 0x3E) {
    return result;
  }
  if (((1 << v5) & 0x460008000000) != 0 || ((1 << v5) & 0x4600000000000000) != 0) {
    return 170;
  }
  if (((1 << v5) & 3) != 0) {
    return 600;
  }
  return result;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastRequestPowerPauseTime, 0);
  objc_storeStrong((id *)&self->_requestedOpenEndpointUUID, 0);
  objc_storeStrong((id *)&self->_connectedTagEndpointUuid, 0);
  objc_storeStrong((id *)&self->_connectedTagId, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_polledSem, 0);
  objc_storeStrong((id *)&self->_polledTags, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_connectionUuidForEndpointUuid, 0);
  objc_storeStrong((id *)&self->_tagForConnectionUuid, 0);
}

- (void)sendOutgoingData:(uint64_t)a1 forEndpointWithUUID:(int)a2 connectionUUID:.cold.8(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109632;
  v2[1] = 3;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_242793000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", (uint8_t *)v2, 0x18u);
}

- (void)_initXPC
{
}

- (uint64_t)_handleNearFieldAccessoryEventNotification:.cold.2()
{
  dlerror();
  int v0 = abort_report_np();
  return [(AccessoryTransportPluginNFC *)v0 _updateAccessoryPower:v2];
}

- (void)_updateAccessoryPower:(os_log_t)log .cold.1(char a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_242793000, log, OS_LOG_TYPE_ERROR, "NFC transport plugin: Set Feature Mask %d fail kernStatus:%02X", (uint8_t *)v3, 0xEu);
}

@end