@interface CLFindMyAccessoryManager
+ (id)checkAvailabilityForPairedOwnerInformationControlPointMessages:(id)a3 messageName:()basic_string<char;
+ (id)errorFromFragmentationStatus:(unint64_t)a3;
- (CLFindMyAccessoryManager)init;
- (CLFindMyAccessoryManager)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (CLFindMyAccessoryManagerDelegate)delegate;
- (id).cxx_construct;
- (void)configureRangingOnDevice:(id)a3 macAddress:(id)a4 countryCode:(unsigned __int8)a5 uwbChannel:(unsigned __int8)a6 acqPreamble:(unsigned __int8)a7 trackingPreamble:(unsigned __int8)a8 interval:(unsigned __int16)a9;
- (void)connectDevice:(id)a3;
- (void)dealloc;
- (void)deinitRangingOnDevice:(id)a3;
- (void)disconnectDevice:(id)a3;
- (void)dumpLogDataOfType:(unint64_t)a3 fromDevice:(id)a4;
- (void)fetchAISAccessoryCapabilities:(id)a3;
- (void)fetchAISAccessoryCategory:(id)a3;
- (void)fetchAISBatteryLevel:(id)a3;
- (void)fetchAISBatteryType:(id)a3;
- (void)fetchAISFirmwareVersion:(id)a3;
- (void)fetchAISForTAUnknownBeacon:(id)a3 macAddress:(id)a4 deviceType:(id)a5;
- (void)fetchAISManufacturerName:(id)a3;
- (void)fetchAISModelName:(id)a3;
- (void)fetchAISNetworkID:(id)a3;
- (void)fetchAISProductData:(id)a3;
- (void)fetchAISProtocolImplementation:(id)a3;
- (void)fetchAISSerialNumber:(id)a3;
- (void)fetchAccelerometerOrientationModeConfigurationForDevice:(id)a3;
- (void)fetchAccelerometerSlopeModeConfigurationForDevice:(id)a3;
- (void)fetchBatteryStatusForDevice:(id)a3;
- (void)fetchConnectionStateForDevice:(id)a3;
- (void)fetchFirmwareVersionFromDevice:(id)a3;
- (void)fetchHawkeyeAISAccessoryCapabilities:(id)a3;
- (void)fetchHawkeyeAISAccessoryCategory:(id)a3;
- (void)fetchHawkeyeAISBatteryType:(id)a3;
- (void)fetchHawkeyeAISFindMyVersion:(id)a3;
- (void)fetchHawkeyeAISManufacturerName:(id)a3;
- (void)fetchHawkeyeAISModelColorCode:(id)a3;
- (void)fetchHawkeyeAISModelName:(id)a3;
- (void)fetchHawkeyeAISProductData:(id)a3;
- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3;
- (void)fetchHawkeyeSerialNumber:(id)a3;
- (void)fetchHawkeyeiCloudIdentifier:(id)a3;
- (void)fetchStatusOfUTEnablementRequirements;
- (void)fetchTxPower:(id)a3;
- (void)fetchTxPowerFromDevice:(id)a3 asOwner:(BOOL)a4;
- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromDevice:(id)a4;
- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5;
- (void)getMultiPartStatusFromDevice:(id)a3;
- (void)getMultiStatusFromDevice:(id)a3;
- (void)handleInterruption;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)induceCrashOnDevice:(id)a3;
- (void)initAccumulator;
- (void)initRangingOnDevice:(id)a3 macAddress:(id)a4;
- (void)performAggressiveScanForDurianService;
- (void)performAggressiveScanForSeparationAlerts;
- (void)performAggressiveScanForTrackingAvoidance;
- (void)performHELEScanForTrackingAvoidance;
- (void)performLongAggressiveScanForSeparationAlerts;
- (void)prepareRangingOnDevice:(id)a3;
- (void)rollWildKeyOnDevice:(id)a3;
- (void)scanForHELE;
- (void)scanForNearbyDevicesLong;
- (void)scanForNearbyOwner;
- (void)sendMessage:(const char *)a3;
- (void)sendMessage:(const char *)a3 withPayload:(id)a4;
- (void)setAccelerometerOrientationModeConfiguration:(id)a3 forDevice:(id)a4;
- (void)setAccelerometerSlopeModeConfiguration:(id)a3 forDevice:(id)a4;
- (void)setBatteryStatus:(unint64_t)a3 forDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceType:(unsigned __int8)a3 onDevice:(id)a4;
- (void)setHawkeyeTestMode:(int)a3 forDevice:(id)a4;
- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5;
- (void)setKeyRollInterval:(unsigned int)a3 onDevice:(id)a4;
- (void)setNearOwnerTimeout:(unsigned __int16)a3 onDevice:(id)a4;
- (void)setObfuscatedIdentifier:(id)a3 onDevice:(id)a4;
- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 forDevice:(id)a4;
- (void)setWildConfiguration:(id)a3 onDevice:(id)a4;
- (void)stageTADetection:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5;
- (void)startAggressiveAdvertisingOnDevice:(id)a3 withTimeout:(unsigned int)a4;
- (void)startEventCounterForDevice:(id)a3;
- (void)startMonitoringForAvengerAdvertisementsForBTFinding;
- (void)startPlayingSoundSequence:(id)a3 onDevice:(id)a4;
- (void)startPlayingUnauthorizedSoundOnDevice:(id)a3;
- (void)startPlayingUnauthorizedSoundSequence:(id)a3 onDevice:(id)a4;
- (void)startRangingOnDevice:(id)a3 targetEventCounter:(unsigned __int16)a4;
- (void)startUnauthorizedAggressiveAdvertisingOnDevice:(id)a3;
- (void)stopAggressiveAdvertisingOnDevice:(id)a3;
- (void)stopEventCounterForDevice:(id)a3;
- (void)stopLongAggressiveScanForSeparationAlerts;
- (void)stopMonitoringForAvengerAdvertisementsForBTFinding;
- (void)stopPlayingSoundOnDevice:(id)a3;
- (void)stopPlayingUnauthorizedSoundOnDevice:(id)a3;
- (void)stopRangingOnDevice:(id)a3;
- (void)stopScanForNearbyDevicesLong;
- (void)unpairFromDevice:(id)a3;
- (void)unpairFromDeviceWithAddress:(id)a3;
@end

@implementation CLFindMyAccessoryManager

- (CLFindMyAccessoryManager)init
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryManager;
  [(CLFindMyAccessoryManager *)&v3 dealloc];
}

- (void)initAccumulator
{
  if (!self->_accumulator) {
    self->_accumulator = [[CLFindMyAccessoryFragmentAccumulator alloc] initWithMaxBytesPerUUID:100000];
  }
}

- (CLFindMyAccessoryManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLFindMyAccessoryManager;
  v6 = [(CLFindMyAccessoryManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.DurianManagement.privateQueue", 0);
    }
    [(CLFindMyAccessoryManager *)v7 initAccumulator];
    operator new();
  }
  return 0;
}

+ (id)errorFromFragmentationStatus:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = +[CLFindMyAccessoryFragmentAccumulator convertDataStatusToString:](CLFindMyAccessoryFragmentAccumulator, "convertDataStatusToString:");
  return (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 26, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

+ (id)checkAvailabilityForPairedOwnerInformationControlPointMessages:(id)a3 messageName:()basic_string<char
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (!std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeSerialNumber"))
  {
    if ([a3 length] == 141 || objc_msgSend(a3, "length") == 145) {
      goto LABEL_11;
    }
LABEL_9:
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Invalid response length";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v8 = v6;
    uint64_t v9 = 21;
    return (id)[v8 errorWithDomain:@"kCLErrorDomainPrivate" code:v9 userInfo:v7];
  }
  if (!std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey"))
  {
    if ([a3 length] == 28) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeiCloudIdentifier")) {
    return 0;
  }
  if ([a3 length] != 60) {
    goto LABEL_9;
  }
LABEL_11:
  id result = (id)[a3 length];
  if (!result) {
    return result;
  }
  if (objc_msgSend(a3, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(a3, "length"))))
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13 = @"Response unavailable";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v8 = v11;
    uint64_t v9 = 22;
    return (id)[v8 errorWithDomain:@"kCLErrorDomainPrivate" code:v9 userInfo:v7];
  }
  return 0;
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = (NSSet *)objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v13);
  uint64_t v15 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00B6E0];
  id v16 = (id)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00B740];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v17 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = CLConnectionMessage::name(*var0);
    if (*(char *)(v18 + 23) >= 0) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = *(void *)v18;
    }
    *(_DWORD *)buf = 68289795;
    int v174 = 0;
    __int16 v175 = 2082;
    v176 = "";
    __int16 v177 = 2082;
    *(void *)v178 = v19;
    *(_WORD *)&v178[8] = 2113;
    *(void *)&v178[10] = v15;
    __int16 v179 = 2113;
    uint64_t v180 = (uint64_t)v16;
    _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian handling message to client\", \"message\":%{public, location:escape_only}s, \"beaconUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  v20 = (const std::string *)CLConnectionMessage::name(*var0);
  if (std::string::compare(v20, "DurianManagement/DidReceiveDataFragment"))
  {
    v21 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v21, "DurianManagement/DidConnect"))
    {
      objc_loadWeak((id *)&self->_delegate);
      char v98 = objc_opt_respondsToSelector();
      id Weak = objc_loadWeak((id *)&self->_delegate);
      if (v98)
      {
        [Weak findMyAccessoryManager:self didConnectDevice:v15 error:v16];
      }
      else if (objc_opt_respondsToSelector())
      {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didConnectDevice:v15];
      }
      goto LABEL_240;
    }
    v22 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v22, "DurianManagement/DidDisconnect"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didDisconnectDevice:v15];
      }
      goto LABEL_240;
    }
    v23 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v23, "DurianManagement/DidFetchConnectionState"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didFetchConnectionState:forDevice:", self, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKey:", 0x1EE00B720), "unsignedIntegerValue"), v15);
      }
      goto LABEL_240;
    }
    v24 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v24, "DurianManagement/DidStartPlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStartPlayingSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v25 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v25, "DurianManagement/DidCompletePlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didCompletePlayingSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v26 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v26, "DurianManagement/DidStopPlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStopPlayingSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v27 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v27, "DurianManagement/DidInitRanging"))
    {
      uint64_t v100 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB00), "unsignedIntValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didInitRangingOnDevice:v15 withStatus:v100 error:v16];
      }
      goto LABEL_240;
    }
    v28 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v28, "DurianManagement/DidDeinitRanging"))
    {
      uint64_t v101 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB00), "unsignedIntValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didDeinitRangingOnDevice:v15 withStatus:v101 error:v16];
      }
      goto LABEL_240;
    }
    v29 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v29, "DurianManagement/DidConfigureRanging"))
    {
      uint64_t v102 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB00), "unsignedIntValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didConfigureRangingOnDevice:v15 withStatus:v102 error:v16];
      }
      goto LABEL_240;
    }
    v30 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v30, "DurianManagement/DidPrepareRanging"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didPrepareRangingOnDevice:v15 error:v16];
      }
      goto LABEL_240;
    }
    v31 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v31, "DurianManagement/DidStartRanging"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStartRangingOnDevice:v15 error:v16];
      }
      goto LABEL_240;
    }
    v32 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v32, "DurianManagement/DidCompleteRanging"))
    {
      uint64_t v103 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB00), "unsignedIntValue");
      unsigned __int8 v104 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB20), "unsignedShortValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didCompleteRangingOnDevice:v15 withStatus:v103 endReason:v104 error:v16];
      }
      goto LABEL_240;
    }
    v33 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v33, "DurianManagement/DidReceiveRangingError"))
    {
      uint64_t v105 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB00), "unsignedIntValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didReceiveRangingErrorFromDevice:v15 withStatus:v105];
      }
      goto LABEL_240;
    }
    v34 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v34, "DurianManagement/DidReceiveRangingTimestamps"))
    {
      uint64_t v106 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB40), "unsignedShortValue");
      uint64_t v107 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB60), "unsignedLongLongValue");
      uint64_t v108 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BB80), "unsignedLongLongValue");
      uint64_t v109 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BBA0), "unsignedShortValue");
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didReceiveRangingTimestampFromDevice:v15 status:v106 rtt:v107 tat:v108 cycleIndex:v109];
      }
      goto LABEL_240;
    }
    v35 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v35, "DurianManagement/DidHaveRangingMovement"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didHaveRangingMovementOnDevice:v15];
      }
      goto LABEL_240;
    }
    v36 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v36, "DurianManagement/DidFailRangingEventCounterAction"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFailWithError:v16 forDevice:v15];
      }
      goto LABEL_240;
    }
    v37 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v37, "DurianManagement/DidStartPlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      char v110 = objc_opt_respondsToSelector();
      id v111 = objc_loadWeak((id *)&self->_delegate);
      if (v110)
      {
        [v111 findMyAccessoryManager:self didStartPlayingUnauthorizedSoundOnDevice:v15 withError:v16];
      }
      else if (objc_opt_respondsToSelector())
      {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didPlayUnauthorizedSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v38 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v38, "DurianManagement/DidCompletePlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didCompletePlayingUnauthorizedSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v39 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v39, "DurianManagement/DidStopPlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStopPlayingUnauthorizedSoundOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v40 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v40, "DurianManagement/DidReceiveKeyRollIndex"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didReceiveKeyRollIndex:fromDevice:withError:", self, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKey:", 0x1EE00B9E0), "unsignedIntegerValue"), v15, 0);
      }
      goto LABEL_240;
    }
    v41 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v41, "DurianManagement/DidGetMultiStatus"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didGetMultiStatus:fromDevice:withError:", self, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKey:", 0x1EE00B8C0), "unsignedIntegerValue"), v15, v16);
      }
      goto LABEL_240;
    }
    v42 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v42, "DurianManagement/DidReceiveGroupStatus"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didReceiveGroupRelationStatus:maintenanceStatus:fromDevice:withError:", self, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKey:", 0x1EE00B8E0), "unsignedIntegerValue"), objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKey:", 0x1EE00B900), "unsignedIntegerValue"), v15, 0);
      }
      goto LABEL_240;
    }
    v43 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v43, "DurianManagement/DidFetchBatteryStatus"))
    {
      uint64_t v112 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00B7C0), "unsignedLongValue");
      objc_loadWeak((id *)&self->_delegate);
      char v113 = objc_opt_respondsToSelector();
      id v114 = objc_loadWeak((id *)&self->_delegate);
      if (v113)
      {
        [v114 findMyAccessoryManager:self didFetchBatteryStatus:v112 forDevice:v15 withError:v16];
      }
      else if (objc_opt_respondsToSelector())
      {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchBatteryStatus:v112 forDevice:v15];
      }
      goto LABEL_240;
    }
    v44 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v44, "DurianManagement/DidDetectCrash"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didDetectCrashOnDevice:v15];
      }
      goto LABEL_240;
    }
    v45 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v45, "DurianManagement/DidDumpLogs"))
    {
      uint64_t v115 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00B780), "unsignedLongValue");
      id v116 = (id)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00B760];
      if (v115 == 4)
      {
        -[CLFindMyAccessoryFragmentAccumulator appendData:forUUID:](self->_accumulator, "appendData:forUUID:", [DictionaryOfClasses objectForKeyedSubscript:0x1EE00B760], v15);
        unint64_t v117 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator getDataStatusForUUID:v15];
        if (!v16) {
          id v16 = +[CLFindMyAccessoryManager errorFromFragmentationStatus:v117];
        }
        id v116 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
      }
      id v118 = v116;
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didDumpLogData:v118 ofType:v115 fromDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v46 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v46, "DurianManagement/DidUnpair"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didUnpairFromDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v47 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v47, "DurianManagement/DidSetTagType"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetDeviceTypeOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v48 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v48, "DurianManagement/DidSetObfuscatedIdentifier"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetObfuscatedIdentifierOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v49 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v49, "DurianManagement/DidSetNearOwnerTimeout"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetNearOwnerTimeoutOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v50 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v50, "DurianManagement/DidSetWildConfiguration"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetWildConfigurationOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v51 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v51, "DurianManagement/DidFetchUserStats_Deprecated"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didFetchUserStats:fromDevice:withError:", self, objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00B920), v15, v16);
      }
      goto LABEL_240;
    }
    v52 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v52, "DurianManagement/DidFetchUserStats"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didFetchUserStats:forDevice:withError:", self, objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00B920), v15, v16);
      }
      goto LABEL_240;
    }
    v53 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v53, "DurianManagement/DidRollWildKey"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didRollWildKeyOnDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v54 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v54, "DurianManagement/DidSetAccelerometerSlopeMode"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetAccelerometerSlopeModeConfigurationForDevice:v15 withError:v16];
      }
      goto LABEL_240;
    }
    v55 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v55, "DurianManagement/DidSetAccelerometerOrientationMode"))
    {
      p_delegate = &self->_delegate;
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
LABEL_179:
      }
        [objc_loadWeak((id *)p_delegate) findMyAccessoryManager:self didSetAccelerometerOrientationModeConfigurationForDevice:v15 withError:v16];
    }
    else
    {
      v56 = (const std::string *)CLConnectionMessage::name(*var0);
      if (std::string::compare(v56, "DurianManagement/DidGetAccelerometerSlopeModeConfiguration"))
      {
        v57 = (const std::string *)CLConnectionMessage::name(*var0);
        if (!std::string::compare(v57, "DurianManagement/DidGetAccelerometerMode"))
        {
          unsigned __int8 v120 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00B9A0), "unsignedIntValue");
          objc_loadWeak((id *)&self->_delegate);
          if (objc_opt_respondsToSelector()) {
            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAccelerometerMode:v120 forDevice:v15 withError:v16];
          }
        }
        else
        {
          v58 = (const std::string *)CLConnectionMessage::name(*var0);
          if (!std::string::compare(v58, "DurianManagement/DidSetUnauthorizedPlaySoundRateLimit"))
          {
            objc_loadWeak((id *)&self->_delegate);
            if (objc_opt_respondsToSelector()) {
              [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetUnauthorizedPlaySoundRateLimitFromDevice:v15 withError:v16];
            }
          }
          else
          {
            v59 = (const std::string *)CLConnectionMessage::name(*var0);
            if (!std::string::compare(v59, "DurianManagement/DidFetchFirmwareVersion"))
            {
              uint64_t v121 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00B7A0];
              objc_loadWeak((id *)&self->_delegate);
              if (objc_opt_respondsToSelector()) {
                [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchFirmwareVersion:v121 fromDevice:v15 withError:v16];
              }
            }
            else
            {
              v60 = (const std::string *)CLConnectionMessage::name(*var0);
              if (!std::string::compare(v60, "DurianManagement/DidCompleteHawkeyeTask"))
              {
                unsigned __int16 v122 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BBC0), "intValue");
                objc_loadWeak((id *)&self->_delegate);
                if (objc_opt_respondsToSelector()) {
                  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didCompleteHawkeyeTaskWithOpcode:v122 fromDevice:v15 withError:v16];
                }
              }
              else
              {
                v61 = (const std::string *)CLConnectionMessage::name(*var0);
                if (!std::string::compare(v61, "DurianManagement/DidSetHawkeyeUTMotionConfig"))
                {
                  objc_loadWeak((id *)&self->_delegate);
                  if (objc_opt_respondsToSelector()) {
                    [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didSetHawkeyeUTMotionConfigForDevice:v15 withError:v16];
                  }
                }
                else
                {
                  v62 = (const std::string *)CLConnectionMessage::name(*var0);
                  if (!std::string::compare(v62, "DurianManagement/DidFetchTxPower"))
                  {
                    objc_loadWeak((id *)&self->_delegate);
                    if (objc_opt_respondsToSelector()) {
                      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "findMyAccessoryManager:didFetchTxPower:fromDevice:withError:", self, objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BC40), v15, v16);
                    }
                  }
                  else
                  {
                    v63 = (const std::string *)CLConnectionMessage::name(*var0);
                    if (!std::string::compare(v63, "DurianManagement/DidStartAggressiveAdvertising"))
                    {
                      objc_loadWeak((id *)&self->_delegate);
                      if (objc_opt_respondsToSelector()) {
                        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStartAggressiveAdvertisingOnDevice:v15 withError:v16];
                      }
                    }
                    else
                    {
                      v64 = (const std::string *)CLConnectionMessage::name(*var0);
                      if (!std::string::compare(v64, "DurianManagement/DidStopAggressiveAdvertising"))
                      {
                        objc_loadWeak((id *)&self->_delegate);
                        if (objc_opt_respondsToSelector()) {
                          [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStopAggressiveAdvertisingOnDevice:v15 withError:v16];
                        }
                      }
                      else
                      {
                        v65 = (const std::string *)CLConnectionMessage::name(*var0);
                        if (!std::string::compare(v65, "DurianManagement/DidCompleteAggressiveAdvertising"))
                        {
                          objc_loadWeak((id *)&self->_delegate);
                          if (objc_opt_respondsToSelector()) {
                            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didCompleteAggressiveAdvertisingOnDevice:v15 withError:v16];
                          }
                        }
                        else
                        {
                          v66 = (const std::string *)CLConnectionMessage::name(*var0);
                          if (!std::string::compare(v66, "DurianManagement/DidStartUnauthorizedAggressiveAdvertising"))
                          {
                            objc_loadWeak((id *)&self->_delegate);
                            if (objc_opt_respondsToSelector()) {
                              [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didStartUnauthorizedAggressiveAdvertisingOnDevice:v15 withError:v16];
                            }
                          }
                          else
                          {
                            v67 = (const std::string *)CLConnectionMessage::name(*var0);
                            if (!std::string::compare(v67, "DurianManagement/DidFetchHawkeyeAISProductData"))
                            {
                              uint64_t v123 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BC60];
                              objc_loadWeak((id *)&self->_delegate);
                              if (objc_opt_respondsToSelector()) {
                                [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISProductData:v123 fromDevice:v15 withError:v16];
                              }
                            }
                            else
                            {
                              v68 = (const std::string *)CLConnectionMessage::name(*var0);
                              if (!std::string::compare(v68, "DurianManagement/DidFetchHawkeyeAISManufacturerName"))
                              {
                                uint64_t v124 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BC80];
                                objc_loadWeak((id *)&self->_delegate);
                                if (objc_opt_respondsToSelector()) {
                                  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISManufacturerName:v124 fromDevice:v15 withError:v16];
                                }
                              }
                              else
                              {
                                v69 = (const std::string *)CLConnectionMessage::name(*var0);
                                if (!std::string::compare(v69, "DurianManagement/DidFetchHawkeyeAISModelName"))
                                {
                                  uint64_t v125 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BCA0];
                                  objc_loadWeak((id *)&self->_delegate);
                                  if (objc_opt_respondsToSelector()) {
                                    [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISModelName:v125 fromDevice:v15 withError:v16];
                                  }
                                }
                                else
                                {
                                  v70 = (const std::string *)CLConnectionMessage::name(*var0);
                                  if (!std::string::compare(v70, "DurianManagement/DidFetchHawkeyeAISModelColorCode"))
                                  {
                                    uint64_t v126 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BCC0];
                                    objc_loadWeak((id *)&self->_delegate);
                                    if (objc_opt_respondsToSelector()) {
                                      [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISModelColorCode:v126 fromDevice:v15 withError:v16];
                                    }
                                  }
                                  else
                                  {
                                    v71 = (const std::string *)CLConnectionMessage::name(*var0);
                                    if (!std::string::compare(v71, "DurianManagement/DidFetchHawkeyeAISAccessoryCategory"))
                                    {
                                      uint64_t v127 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BCE0];
                                      objc_loadWeak((id *)&self->_delegate);
                                      if (objc_opt_respondsToSelector()) {
                                        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISAccessoryCategory:v127 fromDevice:v15 withError:v16];
                                      }
                                    }
                                    else
                                    {
                                      v72 = (const std::string *)CLConnectionMessage::name(*var0);
                                      if (!std::string::compare(v72, "DurianManagement/DidFetchHawkeyeAISAccessoryCapabilities"))
                                      {
                                        uint64_t v128 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BD00];
                                        objc_loadWeak((id *)&self->_delegate);
                                        if (objc_opt_respondsToSelector()) {
                                          [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISAccessoryCapabilities:v128 fromDevice:v15 withError:v16];
                                        }
                                      }
                                      else
                                      {
                                        v73 = (const std::string *)CLConnectionMessage::name(*var0);
                                        if (!std::string::compare(v73, "DurianManagement/DidFetchHawkeyeAISFindMyVersion"))
                                        {
                                          uint64_t v129 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BD20), "unsignedIntegerValue");
                                          objc_loadWeak((id *)&self->_delegate);
                                          if (objc_opt_respondsToSelector()) {
                                            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISFindMyVersion:v129 fromDevice:v15 withError:v16];
                                          }
                                        }
                                        else
                                        {
                                          v74 = (const std::string *)CLConnectionMessage::name(*var0);
                                          if (!std::string::compare(v74, "DurianManagement/DidFetchHawkeyeAISBatteryType"))
                                          {
                                            uint64_t v130 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BD40];
                                            objc_loadWeak((id *)&self->_delegate);
                                            if (objc_opt_respondsToSelector()) {
                                              [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeAISBatteryType:v130 fromDevice:v15 withError:v16];
                                            }
                                          }
                                          else
                                          {
                                            v75 = (const std::string *)CLConnectionMessage::name(*var0);
                                            if (!std::string::compare(v75, "DurianManagement/DidFetchHawkeyeSerialNumber"))
                                            {
                                              -[CLFindMyAccessoryFragmentAccumulator appendData:forUUID:](self->_accumulator, "appendData:forUUID:", [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BD60], v15);
                                              unint64_t v131 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator getDataStatusForUUID:v15];
                                              if (v16)
                                              {
                                                id v132 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                              }
                                              else
                                              {
                                                id v16 = +[CLFindMyAccessoryManager errorFromFragmentationStatus:v131];
                                                id v132 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                                if (!v16)
                                                {
                                                  uint64_t v135 = CLConnectionMessage::name(*var0);
                                                  if (*(char *)(v135 + 23) < 0)
                                                  {
                                                    sub_1906C00FC(__p, *(void **)v135, *(void *)(v135 + 8));
                                                  }
                                                  else
                                                  {
                                                    long long v136 = *(_OWORD *)v135;
                                                    uint64_t v172 = *(void *)(v135 + 16);
                                                    *(_OWORD *)__p = v136;
                                                  }
                                                  id v16 = +[CLFindMyAccessoryManager checkAvailabilityForPairedOwnerInformationControlPointMessages:v132 messageName:__p];
                                                  if (SHIBYTE(v172) < 0) {
                                                    operator delete(__p[0]);
                                                  }
                                                }
                                              }
                                              objc_loadWeak((id *)&self->_delegate);
                                              if (objc_opt_respondsToSelector()) {
                                                [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeSerialNumber:v132 fromDevice:v15 withError:v16];
                                              }
                                            }
                                            else
                                            {
                                              v76 = (const std::string *)CLConnectionMessage::name(*var0);
                                              if (!std::string::compare(v76, "DurianManagement/DidFetchAISProductData"))
                                              {
                                                uint64_t v133 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C000];
                                                objc_loadWeak((id *)&self->_delegate);
                                                if (objc_opt_respondsToSelector()) {
                                                  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISProductData:v133 fromDevice:v15 error:v16];
                                                }
                                              }
                                              else
                                              {
                                                v77 = (const std::string *)CLConnectionMessage::name(*var0);
                                                if (!std::string::compare(v77, "DurianManagement/DidFetchAISManufacturerName"))
                                                {
                                                  uint64_t v134 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C020];
                                                  objc_loadWeak((id *)&self->_delegate);
                                                  if (objc_opt_respondsToSelector()) {
                                                    [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISManufacturerName:v134 fromDevice:v15 error:v16];
                                                  }
                                                }
                                                else
                                                {
                                                  v78 = (const std::string *)CLConnectionMessage::name(*var0);
                                                  if (!std::string::compare(v78, "DurianManagement/DidFetchAISModelName"))
                                                  {
                                                    uint64_t v137 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C040];
                                                    objc_loadWeak((id *)&self->_delegate);
                                                    if (objc_opt_respondsToSelector()) {
                                                      [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISModelName:v137 fromDevice:v15 error:v16];
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v79 = (const std::string *)CLConnectionMessage::name(*var0);
                                                    if (!std::string::compare(v79, "DurianManagement/DidFetchAISProtocolImplementation"))
                                                    {
                                                      uint64_t v138 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00C080), "unsignedIntValue");
                                                      objc_loadWeak((id *)&self->_delegate);
                                                      if (objc_opt_respondsToSelector()) {
                                                        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISProtocolImplementation:v138 fromDevice:v15 error:v16];
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v80 = (const std::string *)CLConnectionMessage::name(*var0);
                                                      if (!std::string::compare(v80, "DurianManagement/DidFetchAISAccessoryCategory"))
                                                      {
                                                        unsigned __int8 v139 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00C060), "unsignedShortValue");
                                                        objc_loadWeak((id *)&self->_delegate);
                                                        if (objc_opt_respondsToSelector()) {
                                                          [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISAccessoryCategory:v139 fromDevice:v15 error:v16];
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v81 = (const std::string *)CLConnectionMessage::name(*var0);
                                                        if (!std::string::compare(v81, "DurianManagement/DidFetchAISAccessoryCapabilities"))
                                                        {
                                                          uint64_t v140 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C0A0];
                                                          objc_loadWeak((id *)&self->_delegate);
                                                          if (objc_opt_respondsToSelector()) {
                                                            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISAccessoryCapabilities:v140 fromDevice:v15 error:v16];
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v82 = (const std::string *)CLConnectionMessage::name(*var0);
                                                          if (!std::string::compare(v82, "DurianManagement/DidFetchAISNetworkID"))
                                                          {
                                                            unsigned __int8 v142 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00C0C0), "unsignedShortValue");
                                                            objc_loadWeak((id *)&self->_delegate);
                                                            if (objc_opt_respondsToSelector()) {
                                                              [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISNetworkID:v142 fromDevice:v15 error:v16];
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v83 = (const std::string *)CLConnectionMessage::name(*var0);
                                                            if (!std::string::compare(v83, "DurianManagement/DidFetchAISFirmwareVersion"))
                                                            {
                                                              uint64_t v143 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C0E0];
                                                              objc_loadWeak((id *)&self->_delegate);
                                                              if (objc_opt_respondsToSelector()) {
                                                                [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISFirmwareVersion:v143 fromDevice:v15 error:v16];
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v84 = (const std::string *)CLConnectionMessage::name(*var0);
                                                              if (!std::string::compare(v84, "DurianManagement/DidFetchAISBatteryType"))
                                                              {
                                                                unsigned __int8 v144 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00C100), "unsignedShortValue");
                                                                objc_loadWeak((id *)&self->_delegate);
                                                                if (objc_opt_respondsToSelector()) {
                                                                  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISBatteryType:v144 fromDevice:v15 error:v16];
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v85 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                if (!std::string::compare(v85, "DurianManagement/DidFetchAISBatteryLevel"))
                                                                {
                                                                  unsigned __int8 v145 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00C120), "unsignedShortValue");
                                                                  objc_loadWeak((id *)&self->_delegate);
                                                                  if (objc_opt_respondsToSelector()) {
                                                                    [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISBatteryLevel:v145 fromDevice:v15 error:v16];
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v86 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                  if (!std::string::compare(v86, "DurianManagement/DidFetchAISSerialNumber"))
                                                                  {
                                                                    uint64_t v146 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00C140];
                                                                    objc_loadWeak((id *)&self->_delegate);
                                                                    if (objc_opt_respondsToSelector()) {
                                                                      [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchAISSerialNumber:v146 fromDevice:v15 error:v16];
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v87 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                    if (!std::string::compare(v87, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey"))
                                                                    {
                                                                      -[CLFindMyAccessoryFragmentAccumulator appendData:forUUID:](self->_accumulator, "appendData:forUUID:", [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BD80], v15);
                                                                      unint64_t v147 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator getDataStatusForUUID:v15];
                                                                      if (v16)
                                                                      {
                                                                        id v148 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                                                      }
                                                                      else
                                                                      {
                                                                        id v16 = +[CLFindMyAccessoryManager errorFromFragmentationStatus:v147];
                                                                        id v148 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                                                        if (!v16)
                                                                        {
                                                                          uint64_t v157 = CLConnectionMessage::name(*var0);
                                                                          if (*(char *)(v157 + 23) < 0)
                                                                          {
                                                                            sub_1906C00FC(__dst, *(void **)v157, *(void *)(v157 + 8));
                                                                          }
                                                                          else
                                                                          {
                                                                            long long v158 = *(_OWORD *)v157;
                                                                            uint64_t v170 = *(void *)(v157 + 16);
                                                                            *(_OWORD *)__dst = v158;
                                                                          }
                                                                          id v16 = +[CLFindMyAccessoryManager checkAvailabilityForPairedOwnerInformationControlPointMessages:v148 messageName:__dst];
                                                                          if (SHIBYTE(v170) < 0) {
                                                                            operator delete(__dst[0]);
                                                                          }
                                                                        }
                                                                      }
                                                                      objc_loadWeak((id *)&self->_delegate);
                                                                      if (objc_opt_respondsToSelector()) {
                                                                        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeCurrentPrimaryKey:v148 fromDevice:v15 withError:v16];
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v88 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                      if (!std::string::compare(v88, "DurianManagement/DidFetchHawkeyeiCloudIdentifier"))
                                                                      {
                                                                        -[CLFindMyAccessoryFragmentAccumulator appendData:forUUID:](self->_accumulator, "appendData:forUUID:", [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BDA0], v15);
                                                                        unint64_t v149 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator getDataStatusForUUID:v15];
                                                                        if (v16)
                                                                        {
                                                                          id v150 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                                                        }
                                                                        else
                                                                        {
                                                                          id v16 = +[CLFindMyAccessoryManager errorFromFragmentationStatus:v149];
                                                                          id v150 = [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator dataForUUID:v15];
                                                                          if (!v16)
                                                                          {
                                                                            uint64_t v161 = CLConnectionMessage::name(*var0);
                                                                            if (*(char *)(v161 + 23) < 0)
                                                                            {
                                                                              sub_1906C00FC(v167, *(void **)v161, *(void *)(v161 + 8));
                                                                            }
                                                                            else
                                                                            {
                                                                              long long v162 = *(_OWORD *)v161;
                                                                              uint64_t v168 = *(void *)(v161 + 16);
                                                                              *(_OWORD *)v167 = v162;
                                                                            }
                                                                            id v16 = +[CLFindMyAccessoryManager checkAvailabilityForPairedOwnerInformationControlPointMessages:v150 messageName:v167];
                                                                            if (SHIBYTE(v168) < 0) {
                                                                              operator delete(v167[0]);
                                                                            }
                                                                          }
                                                                        }
                                                                        objc_loadWeak((id *)&self->_delegate);
                                                                        if (objc_opt_respondsToSelector()) {
                                                                          [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchHawkeyeiCloudIdentifier:v150 fromDevice:v15 withError:v16];
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v89 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                        if (!std::string::compare(v89, "DurianManagement/DidObserveAdvertisement"))
                                                                        {
                                                                          uint64_t v165 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BEC0];
                                                                          uint64_t v164 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BEE0];
                                                                          uint64_t v163 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BF00];
                                                                          uint64_t v151 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BF60];
                                                                          unsigned __int8 v152 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BF20), "unsignedIntegerValue");
                                                                          uint64_t v153 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BF40), "integerValue");
                                                                          uint64_t v154 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BFA0), "unsignedIntegerValue");
                                                                          uint64_t v155 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BF80), "unsignedIntegerValue");
                                                                          if (qword_1E929F680 != -1) {
                                                                            dispatch_once(&qword_1E929F680, &unk_1EE005820);
                                                                          }
                                                                          v156 = qword_1E929F688;
                                                                          if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEBUG))
                                                                          {
                                                                            *(_DWORD *)buf = 68290819;
                                                                            int v174 = 0;
                                                                            __int16 v175 = 2082;
                                                                            v176 = "";
                                                                            __int16 v177 = 2113;
                                                                            *(void *)v178 = v15;
                                                                            *(_WORD *)&v178[8] = 2113;
                                                                            *(void *)&v178[10] = v164;
                                                                            __int16 v179 = 2113;
                                                                            uint64_t v180 = v163;
                                                                            __int16 v181 = 2113;
                                                                            uint64_t v182 = v165;
                                                                            __int16 v183 = 1025;
                                                                            int v184 = v152;
                                                                            __int16 v185 = 2049;
                                                                            uint64_t v186 = v153;
                                                                            __int16 v187 = 2113;
                                                                            uint64_t v188 = v151;
                                                                            _os_log_impl(&dword_1906B8000, v156, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #client client received advertisement\", \"uuid\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"scanDate\":%{private, location:escape_only}@, \"status\":%{private}u, \"rssi\":%{private}ld, \"reserved\":%{private, location:escape_only}@}", buf, 0x54u);
                                                                          }
                                                                          objc_loadWeak((id *)&self->_delegate);
                                                                          if (objc_opt_respondsToSelector()) {
                                                                            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didObserveAdvertisementWithDate:v165 address:v164 advertisementData:v163 status:v152 rssi:v153 reserved:v151 uuid:v15 ownershipType:v155 channel:v154];
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v90 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                          if (!std::string::compare(v90, "DurianManagement/DidFetchStatusOfUTEnablementRequirements"))
                                                                          {
                                                                            uint64_t v159 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BFE0];
                                                                            if (qword_1E929F680 != -1) {
                                                                              dispatch_once(&qword_1E929F680, &unk_1EE005820);
                                                                            }
                                                                            v160 = qword_1E929F688;
                                                                            if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEBUG))
                                                                            {
                                                                              *(_DWORD *)buf = 68289026;
                                                                              int v174 = 0;
                                                                              __int16 v175 = 2082;
                                                                              v176 = "";
                                                                              _os_log_impl(&dword_1906B8000, v160, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didFetchStatusOfUTEnablementRequirements\"}", buf, 0x12u);
                                                                            }
                                                                            objc_loadWeak((id *)&self->_delegate);
                                                                            if (objc_opt_respondsToSelector()) {
                                                                              [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFetchStatusOfUTEnablementRequirementsWithStatus:v159 withError:v16];
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            if (qword_1E929F680 != -1) {
                                                                              dispatch_once(&qword_1E929F680, &unk_1EE005820);
                                                                            }
                                                                            v91 = qword_1E929F688;
                                                                            if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
                                                                            {
                                                                              *(_WORD *)buf = 0;
                                                                              _os_log_impl(&dword_1906B8000, v91, OS_LOG_TYPE_ERROR, "#durian Got a message we do not understand... dropping!", buf, 2u);
                                                                            }
                                                                            if (sub_1906CB57C(115, 0))
                                                                            {
                                                                              bzero(buf, 0x65CuLL);
                                                                              if (qword_1E929F680 != -1) {
                                                                                dispatch_once(&qword_1E929F680, &unk_1EE005820);
                                                                              }
                                                                              v92 = (char *)_os_log_send_and_compose_impl();
                                                                              sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryManager handleMessage:]", "CoreLocation: %s\n", v92);
                                                                              if (v92 != (char *)buf) {
                                                                                free(v92);
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        goto LABEL_240;
      }
      p_delegate = &self->_delegate;
      objc_loadWeak((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        goto LABEL_179;
      }
    }
LABEL_240:
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    v141 = qword_1E929F688;
    if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      int v174 = 0;
      __int16 v175 = 2082;
      v176 = "";
      __int16 v177 = 2113;
      *(void *)v178 = v15;
      _os_log_impl(&dword_1906B8000, v141, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #hawkeye clearing fragments from accumulator\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    [(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator clearForUUID:v15];
    return;
  }
  uint64_t v93 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00BDC0];
  unsigned __int16 v94 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BBC0), "unsignedIntValue");
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v95 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v174 = 0;
    __int16 v175 = 2082;
    v176 = "";
    __int16 v177 = 1025;
    *(_DWORD *)v178 = v94;
    *(_WORD *)&v178[4] = 2113;
    *(void *)&v178[6] = v93;
    _os_log_impl(&dword_1906B8000, v95, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye got fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  if (![(CLFindMyAccessoryFragmentAccumulator *)self->_accumulator appendData:v93 forUUID:v15])
  {
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    v96 = qword_1E929F688;
    if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v174 = 0;
      __int16 v175 = 2082;
      v176 = "";
      __int16 v177 = 1025;
      *(_DWORD *)v178 = v94;
      *(_WORD *)&v178[4] = 2113;
      *(void *)&v178[6] = v93;
      _os_log_impl(&dword_1906B8000, v96, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye error appending fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
      if (qword_1E929F680 != -1) {
        dispatch_once(&qword_1E929F680, &unk_1EE005820);
      }
    }
    v97 = qword_1E929F688;
    if (os_signpost_enabled((os_log_t)qword_1E929F688))
    {
      *(_DWORD *)buf = 68289539;
      int v174 = 0;
      __int16 v175 = 2082;
      v176 = "";
      __int16 v177 = 1025;
      *(_DWORD *)v178 = v94;
      *(_WORD *)&v178[4] = 2113;
      *(void *)&v178[6] = v93;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v97, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye error appending fragment", "{\"msg%{public}.0s\":\"#durian #hawkeye error appending fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
    }
  }
}

- (void)handleInterruption
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  objc_super v3 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryManager handleInterruption]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  uint64_t v8 = @"Connection to locationd interrupted!";
  uint64_t v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryManager:self didFailWithError:v5 forDevice:0];

  self->_accumulator = [[CLFindMyAccessoryFragmentAccumulator alloc] initWithMaxBytesPerUUID:100000];
}

- (void)sendMessage:(const char *)a3 withPayload:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = (char *)a3;
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 776, @"Invalid parameter not satisfying: %@", @"messageName");
  }
  uint64_t v6 = (void *)[a4 objectForKey:0x1EE00B6E0];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v7 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)uint64_t v12 = 2082;
    *(void *)&v12[2] = "";
    __int16 v13 = 2082;
    uint64_t v14 = a3;
    __int16 v15 = 2082;
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v6, "UUIDString"), "UTF8String");
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian client sending message\", \"messageName\":%{public, location:escape_only}s, \"beaconUUID\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  sub_1906DDCC0(&v10, &v9, buf);
  uint64_t v8 = *(std::__shared_weak_count **)v12;
  if (*(void *)v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)v12 + 8), 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1906BFE48(v8);
  }
  if (*(void *)v12) {
    sub_1906BFE48(*(std::__shared_weak_count **)v12);
  }
}

- (void)sendMessage:(const char *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 789, @"Invalid parameter not satisfying: %@", @"messageName");
  }
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  id v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2082;
    uint64_t v10 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian client sending message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
  sub_1906D5C70(buf, (char *)a3);
  MEMORY[0x192FCE830](&v5[1], buf);
  if (SBYTE3(v10) < 0) {
    operator delete(*(void **)buf);
  }
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessage();
  if (v5) {
    sub_1906BFE48(v5);
  }
  sub_1906BFE48(v5);
}

- (void)connectDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 802, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/Connect", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)disconnectDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 810, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/Disconnect", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchConnectionStateForDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 818, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchConnectionState", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)startPlayingSoundSequence:(id)a3 onDevice:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 827, @"Invalid parameter not satisfying: %@", @"sequence");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 828, @"Invalid parameter not satisfying: %@", @"device");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = 0x1EE00B6E0;
  v8[1] = 0x1EE00B840;
  v9[0] = a4;
  v9[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StartSoundSequence", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

- (void)startPlayingUnauthorizedSoundOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 837, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StartUnauthorizedSound", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)startPlayingUnauthorizedSoundSequence:(id)a3 onDevice:(id)a4
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 845, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B840;
  v8[0] = a4;
  v8[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StartUnauthorizedSound", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)stopPlayingSoundOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 854, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StopSound", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)stopPlayingUnauthorizedSoundOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 862, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StopUnauthorizedSound", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)getMultiStatusFromDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 870, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/GetMultiStatus", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)getMultiPartStatusFromDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 878, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/GetMultiPartStatus", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)dumpLogDataOfType:(unint64_t)a3 fromDevice:(id)a4
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 886, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B780;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithUnsignedInteger:a3];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/DumpLogs", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)induceCrashOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 895, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/InduceCrash", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)unpairFromDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 903, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/Unpair", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)unpairFromDeviceWithAddress:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 911, @"Invalid parameter not satisfying: %@", @"address");
  }
  uint64_t v5 = 0x1EE00B700;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/Unpair", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3 onDevice:(id)a4
{
  uint64_t v5 = a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 919, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B820;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithUnsignedShort:v5];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetNearOwnerTimeout", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)setDeviceType:(unsigned __int8)a3 onDevice:(id)a4
{
  uint64_t v5 = a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 928, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B7E0;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithUnsignedChar:v5];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetTagType", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)setObfuscatedIdentifier:(id)a3 onDevice:(id)a4
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 937, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B800;
  v8[0] = a4;
  v8[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetObfuscatedIdentifier", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)setWildConfiguration:(id)a3 onDevice:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 946, @"Invalid parameter not satisfying: %@", @"configuration");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 947, @"Invalid parameter not satisfying: %@", @"device");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = 0x1EE00B6E0;
  v8[1] = 0x1EE00B8A0;
  v9[0] = a4;
  v9[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetWildConfiguration", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

- (void)rollWildKeyOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 956, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/RollWildKey", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setKeyRollInterval:(unsigned int)a3 onDevice:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 964, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00BA00;
  v7[1] = 0x1EE00B6E0;
  v8[0] = [NSNumber numberWithUnsignedInt:v5];
  v8[1] = a4;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetKeyRollInterval", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)setBatteryStatus:(unint64_t)a3 forDevice:(id)a4
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 973, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B7C0;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithUnsignedInteger:a3];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetBatteryStatus", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)fetchBatteryStatusForDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 982, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchBatteryStatus", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromDevice:(id)a4
{
  BOOL v5 = a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 990, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B940;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithBool:v5];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchUserStats", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)scanForNearbyOwner
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)buf = MEMORY[0x1E4F1CC08];
  sub_1906D5B24(off_1E56976B0, buf, &v4);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v2 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for nearby owner\"}", buf, 0x12u);
  }
  objc_super v3 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v3) {
    sub_1906BFE48(v3);
  }
  if (v5) {
    sub_1906BFE48(v5);
  }
}

- (void)scanForHELE
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)buf = MEMORY[0x1E4F1CC08];
  sub_1906D5B24(off_1E56976B8, buf, &v4);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v2 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for HELE\"}", buf, 0x12u);
  }
  objc_super v3 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v3) {
    sub_1906BFE48(v3);
  }
  if (v5) {
    sub_1906BFE48(v5);
  }
}

- (void)scanForNearbyDevicesLong
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)buf = MEMORY[0x1E4F1CC08];
  sub_1906D5B24(off_1E56976C0, buf, &v4);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v2 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for nearby devices long\"}", buf, 0x12u);
  }
  objc_super v3 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v3) {
    sub_1906BFE48(v3);
  }
  if (v5) {
    sub_1906BFE48(v5);
  }
}

- (void)stopScanForNearbyDevicesLong
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)buf = MEMORY[0x1E4F1CC08];
  sub_1906D5B24(off_1E56976C8, buf, &v4);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  v2 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested stop to scan for nearby devices long\"}", buf, 0x12u);
  }
  objc_super v3 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v3) {
    sub_1906BFE48(v3);
  }
  if (v5) {
    sub_1906BFE48(v5);
  }
}

- (void)setAccelerometerSlopeModeConfiguration:(id)a3 forDevice:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1038, @"Invalid parameter not satisfying: %@", @"configuration");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1039, @"Invalid parameter not satisfying: %@", @"device");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = 0x1EE00B6E0;
  v8[1] = 0x1EE00B960;
  v9[0] = a4;
  v9[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetAccelerometerSlopeMode", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

- (void)fetchAccelerometerSlopeModeConfigurationForDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1048, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/GetAccelerometerSlopeModeConfiguration", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setAccelerometerOrientationModeConfiguration:(id)a3 forDevice:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1056, @"Invalid parameter not satisfying: %@", @"configuration");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1057, @"Invalid parameter not satisfying: %@", @"device");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = 0x1EE00B6E0;
  v8[1] = 0x1EE00B980;
  v9[0] = a4;
  v9[1] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetAccelerometerOrientationMode", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

- (void)fetchAccelerometerOrientationModeConfigurationForDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1066, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/GetAccelerometerOrientationModeConfiguration", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 forDevice:(id)a4
{
  BOOL v5 = a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1074, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00B9C0;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithBool:v5];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetUnauthorizedPlaySoundRateLimit", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)fetchFirmwareVersionFromDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1083, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchFirmwareVersion", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchTxPower:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1092, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchTxPower", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchTxPowerFromDevice:(id)a3 asOwner:(BOOL)a4
{
  BOOL v4 = a4;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1099, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00BEA0;
  v8[0] = a3;
  v8[1] = [NSNumber numberWithBool:v4];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchTxPower", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)startAggressiveAdvertisingOnDevice:(id)a3 withTimeout:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1108, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00BE80;
  v8[0] = a3;
  v8[1] = [NSNumber numberWithUnsignedInt:v4];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StartAggressiveAdvertising", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)stopAggressiveAdvertisingOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1117, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StopAggressiveAdvertising", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)startUnauthorizedAggressiveAdvertisingOnDevice:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1125, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StartUnauthorizedAggressiveAdvertising", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setHawkeyeTestMode:(int)a3 forDevice:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1133, @"Invalid parameter not satisfying: %@", @"device");
  }
  v7[0] = 0x1EE00B6E0;
  v7[1] = 0x1EE00BBE0;
  v8[0] = a4;
  v8[1] = [NSNumber numberWithInt:v5];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetHawkeyeTestMode", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v10[3] = *MEMORY[0x1E4F143B8];
  if (!a5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1144, @"Invalid parameter not satisfying: %@", @"device");
  }
  v10[0] = a5;
  v9[0] = 0x1EE00B6E0;
  v9[1] = 0x1EE00BC00;
  v10[1] = [NSNumber numberWithUnsignedInt:v7];
  v9[2] = 0x1EE00BC20;
  v10[2] = [NSNumber numberWithUnsignedInt:v6];
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/SetHawkeyeUTMotionConfig", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3]);
}

- (void)fetchHawkeyeAISProductData:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1154, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISProductData", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISManufacturerName:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1162, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISManufacturerName", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISModelName:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1170, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISModelName", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISModelColorCode:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1178, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISModelColorCode", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISAccessoryCategory:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1187, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISAccessoryCategory", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISAccessoryCapabilities:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1195, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISAccessoryCapabilities", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISFindMyVersion:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1203, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISFindMyVersion", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeAISBatteryType:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1211, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeAISBatteryType", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeSerialNumber:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1219, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeSerialNumber", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1227, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeCurrentPrimaryKey", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)fetchHawkeyeiCloudIdentifier:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1235, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v5 = 0x1EE00B6E0;
  v6[0] = a3;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchHawkeyeiCloudIdentifier", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)startMonitoringForAvengerAdvertisementsForBTFinding
{
}

- (void)stopMonitoringForAvengerAdvertisementsForBTFinding
{
}

- (void)performAggressiveScanForSeparationAlerts
{
}

- (void)performLongAggressiveScanForSeparationAlerts
{
}

- (void)stopLongAggressiveScanForSeparationAlerts
{
}

- (void)performAggressiveScanForTrackingAvoidance
{
}

- (void)performHELEScanForTrackingAvoidance
{
}

- (void)performAggressiveScanForDurianService
{
}

- (void)fetchStatusOfUTEnablementRequirements
{
}

- (void)fetchAISForTAUnknownBeacon:(id)a3 macAddress:(id)a4 deviceType:(id)a5
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1288, @"Invalid parameter not satisfying: %@", @"device");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1289, @"Invalid parameter not satisfying: %@", @"macAddress");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v10[0] = 0x1EE00B6E0;
  v10[1] = 0x1EE00B700;
  v11[0] = a3;
  v11[1] = a4;
  v10[2] = 0x1EE00B7E0;
  v11[2] = a5;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/FetchAISForTAUnknownBeacon", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
}

- (void)stageTADetection:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1302, @"Invalid parameter not satisfying: %@", @"type");
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1303, @"Invalid parameter not satisfying: %@", @"detailsBitmask");
    goto LABEL_4;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1301, @"Invalid parameter not satisfying: %@", @"macAddress");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  v10[0] = 0x1EE00B700;
  v10[1] = 0x1EE00B7E0;
  v11[0] = a3;
  v11[1] = a4;
  v10[2] = 0x1EE00BFC0;
  v11[2] = a5;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/StageTADetection", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
}

- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1316, @"Invalid parameter not satisfying: %@", @"type");
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1317, @"Invalid parameter not satisfying: %@", @"detailsBitmask");
    goto LABEL_4;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1315, @"Invalid parameter not satisfying: %@", @"macAddress");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  v10[0] = 0x1EE00B700;
  v10[1] = 0x1EE00B7E0;
  v11[0] = a3;
  v11[1] = a4;
  v10[2] = 0x1EE00BFC0;
  v11[2] = a5;
  -[CLFindMyAccessoryManager sendMessage:withPayload:](self, "sendMessage:withPayload:", "DurianManagement/ForceSurfaceStagedDetections", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
}

- (void)initRangingOnDevice:(id)a3 macAddress:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1328, @"Invalid parameter not satisfying: %@", @"device");
  }
  v16[0] = 0x1EE00B6E0;
  v16[1] = 0x1EE00BA20;
  v17[0] = a3;
  v17[1] = a4;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  sub_1906F4748(off_1E56976D0, &v11, &v9);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v6 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = a3;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_INFO, "Init Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v12 = 138412290;
    id v13 = a3;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager initRangingOnDevice:macAddress:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v8 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1906BFE48(v8);
  }
  if (v10) {
    sub_1906BFE48(v10);
  }
}

- (void)deinitRangingOnDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1342, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E56976D8, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "Deinit Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager deinitRangingOnDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)configureRangingOnDevice:(id)a3 macAddress:(id)a4 countryCode:(unsigned __int8)a5 uwbChannel:(unsigned __int8)a6 acqPreamble:(unsigned __int8)a7 trackingPreamble:(unsigned __int8)a8 interval:(unsigned __int16)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = a7;
  uint64_t v11 = a6;
  uint64_t v12 = a5;
  v26[7] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1355, @"Invalid parameter not satisfying: %@", @"device");
  }
  v25[0] = 0x1EE00B6E0;
  v25[1] = 0x1EE00BA20;
  v26[0] = a3;
  v26[1] = a4;
  v25[2] = 0x1EE00BA40;
  v26[2] = [NSNumber numberWithUnsignedChar:v12];
  v25[3] = 0x1EE00BA60;
  v26[3] = [NSNumber numberWithUnsignedChar:v11];
  v25[4] = 0x1EE00BA80;
  v26[4] = [NSNumber numberWithUnsignedChar:v10];
  v25[5] = 0x1EE00BAA0;
  v26[5] = [NSNumber numberWithUnsignedChar:v9];
  v25[6] = 0x1EE00BAC0;
  v26[6] = [NSNumber numberWithUnsignedShort:a9];
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  sub_1906F4748(off_1E56976E0, &v20, &v18);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  id v15 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = a3;
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_INFO, "Configure Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v21 = 138412290;
    id v22 = a3;
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  uint64_t v17 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v17) {
    sub_1906BFE48(v17);
  }
  if (v19) {
    sub_1906BFE48(v19);
  }
}

- (void)prepareRangingOnDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1374, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E56976E8, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "Prepare Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager prepareRangingOnDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)startRangingOnDevice:(id)a3 targetEventCounter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1387, @"Invalid parameter not satisfying: %@", @"device");
  }
  v16[0] = 0x1EE00B6E0;
  v16[1] = 0x1EE00BAE0;
  v17[0] = a3;
  v17[1] = [NSNumber numberWithUnsignedShort:v4];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  sub_1906F4748(off_1E56976F0, &v11, &v9);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v6 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = a3;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_INFO, "Start Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v12 = 138412290;
    id v13 = a3;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager startRangingOnDevice:targetEventCounter:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v8 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1906BFE48(v8);
  }
  if (v10) {
    sub_1906BFE48(v10);
  }
}

- (void)stopRangingOnDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1401, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E56976F8, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "Stop Ranging on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager stopRangingOnDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)startEventCounterForDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1414, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697700, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "Start EventCounter on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager startEventCounterForDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)stopEventCounterForDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1427, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697708, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "Stop EventCounter on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager stopEventCounterForDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISProductData:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1441, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697710, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISProductData on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISProductData:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISManufacturerName:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1455, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697718, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISManufacturerName on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISManufacturerName:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISModelName:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1469, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697720, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISModelName on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISModelName:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISProtocolImplementation:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1483, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697728, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISProtocolImplementation on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISProtocolImplementation:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISAccessoryCategory:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1497, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697730, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISAccessoryCategory on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISAccessoryCategory:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISAccessoryCapabilities:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1511, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697738, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISAccessoryCapabilities on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISAccessoryCapabilities:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISNetworkID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1525, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697740, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISNetworkID on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISNetworkID:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISFirmwareVersion:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1539, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697748, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISFirmwareVersion on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISFirmwareVersion:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISBatteryType:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1553, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697750, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISBatteryType on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISBatteryType:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISBatteryLevel:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1567, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E5697758, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISBatteryLevel on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISBatteryLevel:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)fetchAISSerialNumber:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryManager.mm", 1581, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(&off_1E5697760, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005820);
  }
  uint64_t v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISSerialNumber on device: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005820);
    }
    int v10 = 138412290;
    id v11 = a3;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISSerialNumber:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (CLFindMyAccessoryManagerDelegate)delegate
{
  return (CLFindMyAccessoryManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  sub_19073DD74((uint64_t *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end