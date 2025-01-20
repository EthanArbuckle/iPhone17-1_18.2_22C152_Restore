@interface CBClassicPeer
- (BOOL)EQConfigEnabled;
- (BOOL)LRDetectionEnabled;
- (BOOL)autoAnswerCalls;
- (BOOL)browsingEnabled;
- (BOOL)inEarDetectionEnabled;
- (BOOL)isAACPCapabilityBit:(unsigned int)a3;
- (BOOL)isAppleAccessoryServer;
- (BOOL)isAppleDevice;
- (BOOL)isAppleFeatureSupported:(unsigned int)a3;
- (BOOL)isConnectedOverUSB;
- (BOOL)isDevFused;
- (BOOL)isGameController;
- (BOOL)isIncoming;
- (BOOL)isMac;
- (BOOL)isMultiBatteryDevice;
- (BOOL)isNintendoGameController;
- (BOOL)isRFCOMMServiceSupported:(id)a3;
- (BOOL)isReportingBatteryPercent;
- (BOOL)isServiceSupported:(id)a3;
- (BOOL)isSonyGameController;
- (BOOL)isXboxGameController;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (BOOL)objectPushEnabled;
- (BOOL)panEnabled;
- (BOOL)remoteTimeSyncEnabled;
- (BOOL)smartRoutingSupported;
- (BOOL)traceLogging;
- (CBClassicPeer)initWithInfo:(id)a3 manager:(id)a4;
- (NSArray)services;
- (NSArray)syncGroups;
- (NSData)aacpCapabilityBits;
- (NSData)sdpRecordData;
- (NSHashTable)L2CAPChannels;
- (NSHashTable)RFCOMMChannels;
- (NSNumber)RSSI;
- (NSString)addressString;
- (NSString)appleModelIdentifier;
- (NSString)name;
- (NSString)serialNumber;
- (NSUUID)trustedUID;
- (id)channelWithID:(unsigned __int8)a3;
- (id)channelWithPSM:(unsigned __int16)a3;
- (id)connectL2CAPCallback;
- (id)connectRFCOMMCallback;
- (id)description;
- (id)disconnectL2CAPCallback;
- (id)disconnectRFCOMMCallback;
- (id)importServices:(id)a3;
- (id)service:(id)a3;
- (id)serviceForPSM:(unsigned __int16)a3;
- (id)serviceForRFCOMMChannelID:(unsigned __int8)a3;
- (int64_t)internalState;
- (unint64_t)appleExtendedFeatureBitMask;
- (unint64_t)hash;
- (unsigned)EQConfigBass;
- (unsigned)EQConfigMid;
- (unsigned)EQConfigTreble;
- (unsigned)appleFeatureBitMask;
- (unsigned)batteryPercentCase;
- (unsigned)batteryPercentCombined;
- (unsigned)batteryPercentLeft;
- (unsigned)batteryPercentRight;
- (unsigned)batteryPercentSingle;
- (unsigned)clickHoldInterval;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)colorID;
- (unsigned)connectionHandle;
- (unsigned)crownRotationDirection;
- (unsigned)deviceType;
- (unsigned)doubleClickInterval;
- (unsigned)doubleClickMode;
- (unsigned)doubleTapAction;
- (unsigned)doubleTapActionLeft;
- (unsigned)doubleTapActionRight;
- (unsigned)doubleTapCapability;
- (unsigned)getConnectedServices;
- (unsigned)listeningMode;
- (unsigned)listeningModeConfigs;
- (unsigned)micMode;
- (unsigned)modeSupported;
- (unsigned)oneBudANCMode;
- (unsigned)primaryInEarStatus;
- (unsigned)productID;
- (unsigned)psmForService:(id)a3;
- (unsigned)rfcommChannelIDForService:(id)a3;
- (unsigned)secondaryInEarStatus;
- (unsigned)singleClickMode;
- (unsigned)smartRoutingEnabled;
- (unsigned)switchControlMode;
- (unsigned)syncSettings;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (unsigned)version;
- (void)closeL2CAPChannel:(unsigned __int16)a3;
- (void)closeRFCOMMChannel:(unsigned __int8)a3;
- (void)configureRFCOMMPortParams:(id)a3;
- (void)dealloc;
- (void)getConnectedServices;
- (void)handleDisconnection;
- (void)handleFailedConnection;
- (void)handleGetPeerState:(id)a3;
- (void)handleL2CAPChannelClosed:(id)a3;
- (void)handleL2CAPChannelOpened:(id)a3;
- (void)handleMsg:(int)a3 args:(id)a4;
- (void)handlePeerUpdated:(id)a3;
- (void)handleRFCOMMChannelClosed:(id)a3;
- (void)handleRFCOMMChannelOpened:(id)a3;
- (void)handleSuccessfulConnection:(id)a3;
- (void)openL2CAPChannel:(unsigned __int16)a3;
- (void)openRFCOMMChannel:(unsigned __int8)a3;
- (void)openRFCOMMChannel:(unsigned __int8)a3 options:(id)a4;
- (void)sendMsg:(int)a3 args:(id)a4;
- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5;
- (void)setAacpCapabilityBits:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setAppleExtendedFeatureBitMask:(unint64_t)a3;
- (void)setAppleFeatureBitMask:(unsigned int)a3;
- (void)setAppleModelIdentifier:(id)a3;
- (void)setAutoAnswerCalls:(BOOL)a3;
- (void)setBatteryPercentCase:(unsigned __int8)a3;
- (void)setBatteryPercentCombined:(unsigned __int8)a3;
- (void)setBatteryPercentLeft:(unsigned __int8)a3;
- (void)setBatteryPercentRight:(unsigned __int8)a3;
- (void)setBatteryPercentSingle:(unsigned __int8)a3;
- (void)setBrowsingEnabled:(BOOL)a3;
- (void)setClickHoldInterval:(unsigned int)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setColorID:(unsigned __int8)a3;
- (void)setConnectL2CAPCallback:(id)a3;
- (void)setConnectRFCOMMCallback:(id)a3;
- (void)setConnectionHandle:(unsigned __int16)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setDisconnectL2CAPCallback:(id)a3;
- (void)setDisconnectRFCOMMCallback:(id)a3;
- (void)setDoubleClickInterval:(unsigned int)a3;
- (void)setDoubleClickMode:(unsigned __int8)a3;
- (void)setDoubleTapAction:(unsigned __int16)a3;
- (void)setDoubleTapActionLeft:(unsigned __int16)a3;
- (void)setDoubleTapActionRight:(unsigned __int16)a3;
- (void)setDoubleTapCapability:(unsigned __int8)a3;
- (void)setEQConfigBass:(unsigned __int8)a3;
- (void)setEQConfigEnabled:(BOOL)a3;
- (void)setEQConfigMid:(unsigned __int8)a3;
- (void)setEQConfigTreble:(unsigned __int8)a3;
- (void)setInEarDetectionEnabled:(BOOL)a3;
- (void)setInternalState:(int64_t)a3;
- (void)setIsAppleAccessoryServer:(BOOL)a3;
- (void)setIsConnectedOverUSB:(BOOL)a3;
- (void)setIsDevFused:(BOOL)a3;
- (void)setIsIncoming:(BOOL)a3;
- (void)setL2CAPChannels:(id)a3;
- (void)setLRDetectionEnabled:(BOOL)a3;
- (void)setListeningMode:(unsigned __int8)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setMicMode:(unsigned __int8)a3;
- (void)setModeSupported:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setObjectPushEnabled:(BOOL)a3;
- (void)setOneBudANCMode:(unsigned __int8)a3;
- (void)setOrphan;
- (void)setPanEnabled:(BOOL)a3;
- (void)setPrimaryInEarStatus:(unsigned __int8)a3;
- (void)setProductID:(unsigned __int16)a3;
- (void)setRFCOMMChannels:(id)a3;
- (void)setRSSI:(id)a3;
- (void)setRemoteTimeSyncEnabled:(BOOL)a3;
- (void)setSdpRecordData:(id)a3;
- (void)setSecondaryInEarStatus:(unsigned __int8)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServices:(id)a3;
- (void)setSingleClickMode:(unsigned __int8)a3;
- (void)setSmartRoutingEnabled:(unsigned __int8)a3;
- (void)setSmartRoutingSupported:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSwitchControlMode:(unsigned __int8)a3;
- (void)setSyncGroups:(id)a3;
- (void)setSyncSettings:(unsigned __int16)a3;
- (void)setTraceLogging:(BOOL)a3;
- (void)setTrustedUID:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int16)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation CBClassicPeer

- (CBClassicPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBClassicPeer;
  v7 = [(CBPeer *)&v14 initWithInfo:v6 manager:a4];
  v8 = v7;
  if (v7)
  {
    v7->_state = 0;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    L2CAPChannels = v8->_L2CAPChannels;
    v8->_L2CAPChannels = (NSHashTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    RFCOMMChannels = v8->_RFCOMMChannels;
    v8->_RFCOMMChannels = (NSHashTable *)v11;

    [(CBPeer *)v8 setMtuLength:672];
    [(CBClassicPeer *)v8 handlePeerUpdated:v6];
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CBClassicPeer *)self addressString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  unint64_t v3 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CBClassicPeer dealloc]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  L2CAPChannels = self->_L2CAPChannels;
  if (L2CAPChannels) {
    [(NSHashTable *)L2CAPChannels removeAllObjects];
  }
  RFCOMMChannels = self->_RFCOMMChannels;
  if (RFCOMMChannels) {
    [(NSHashTable *)RFCOMMChannels removeAllObjects];
  }
  v6.receiver = self;
  v6.super_class = (Class)CBClassicPeer;
  [(CBClassicPeer *)&v6 dealloc];
}

- (id)description
{
  v16 = NSString;
  uint64_t v15 = objc_opt_class();
  unint64_t v3 = [(CBPeer *)self identifier];
  v4 = [v3 UUIDString];
  v5 = [(CBClassicPeer *)self name];
  objc_super v6 = [(CBPeer *)self peerStateToString:[(CBClassicPeer *)self internalState]];
  if ([(CBPeer *)self pairingState]) {
    v7 = @"Paired";
  }
  else {
    v7 = @"Unpaired";
  }
  v8 = [(CBClassicPeer *)self addressString];
  unsigned int v9 = [(CBClassicPeer *)self deviceType];
  unsigned int v10 = [(CBClassicPeer *)self productID];
  unsigned int v11 = [(CBClassicPeer *)self vendorID];
  if ([(CBClassicPeer *)self isAppleDevice]) {
    v12 = @", Apple";
  }
  else {
    v12 = &stru_1F02E5F20;
  }
  v13 = [v16 stringWithFormat:@"<%@: %p %@, %@, %@, %@, %@, devType: %d, PID: 0x%04X, VID: 0x%04X%@>", v15, self, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (id)importServices:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v9 = [v8 objectForKeyedSubscript:@"kCBMsgArgPSM"];
        uint64_t v10 = [v8 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
        unsigned int v11 = (void *)v10;
        if (v9)
        {
          v28[0] = @"kCBMsgArgServiceUUID";
          v12 = objc_msgSend(v8, "objectForKeyedSubscript:");
          v13 = +[CBUUID UUIDWithData:v12];
          v28[1] = @"kCBMsgArgPSM";
          v29[0] = v13;
          objc_super v14 = [v8 objectForKeyedSubscript:@"kCBMsgArgPSM"];
          v29[1] = v14;
          uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          v16 = v29;
          v17 = v28;
LABEL_7:
          v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:2];
          [v21 addObject:v18];

          goto LABEL_8;
        }
        if (v10)
        {
          v26[0] = @"kCBMsgArgServiceUUID";
          v12 = objc_msgSend(v8, "objectForKeyedSubscript:");
          v13 = +[CBUUID UUIDWithData:v12];
          v26[1] = @"kCBMsgArgRFCOMMChannelID";
          v27[0] = v13;
          objc_super v14 = objc_msgSend(v8, "objectForKeyedSubscript:");
          v27[1] = v14;
          uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          v16 = v27;
          v17 = v26;
          goto LABEL_7;
        }
LABEL_8:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v5);
  }

  return v21;
}

- (void)sendMsg:(int)a3 args:(id)a4
{
}

- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5
{
  BOOL v5 = a4;
  unsigned __int16 v6 = a3;
  id v8 = a5;
  unsigned int v9 = [(CBPeer *)self manager];

  if (v9)
  {
    if ([(CBClassicPeer *)self state] != 2 && v5)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBClassicPeer sendMsg:requiresConnected:args:]();
      }
    }
    if (!v8) {
      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
    uint64_t v10 = (void *)[v8 mutableCopy];
    unsigned int v11 = [(CBPeer *)self identifier];
    [v10 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

    v12 = [(CBPeer *)self manager];
    [v12 sendMsg:v6 args:v10];

LABEL_11:
    return;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
  -[CBClassicPeer sendMsg:requiresConnected:args:]();
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = 1;
  id v8 = &selRef_handleGetPeerState_;
  switch((int)v4)
  {
    case 23:
      unsigned int v9 = sel_handleL2CAPChannelOpened_;
      int64_t v10 = [(CBClassicPeer *)self internalState];
      goto LABEL_8;
    case 24:
      unsigned int v9 = sel_handleL2CAPChannelClosed_;
      int64_t v10 = [(CBClassicPeer *)self internalState];
      goto LABEL_8;
    case 41:
      goto LABEL_7;
    case 45:
      [(CBClassicPeer *)self internalState];
      [(CBClassicPeer *)self handlePeerUpdated:v6];
      break;
    case 56:
      char v7 = 0;
      id v8 = &selRef_handleRFCOMMChannelOpened_;
LABEL_7:
      unsigned int v9 = *v8;
      int64_t v10 = [(CBClassicPeer *)self internalState];
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    case 57:
      unsigned int v9 = sel_handleRFCOMMChannelClosed_;
      int64_t v10 = [(CBClassicPeer *)self internalState];
LABEL_8:
      if (v10 == 2)
      {
LABEL_14:
        objc_msgSend(self, v9, v6);
      }
      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
          -[CBClassicPeer handleMsg:args:]();
        }
      }
      break;
    default:
      v11.receiver = self;
      v11.super_class = (Class)CBClassicPeer;
      [(CBPeer *)&v11 handleMsg:v4 args:v6];
      break;
  }
}

- (void)handleGetPeerState:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgState"];
  [(CBClassicPeer *)self handlePeerUpdated:v4];
}

- (void)handlePeerUpdated:(id)a3
{
  uint64_t v283 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceType"];
  unsigned __int8 v6 = [v5 unsignedIntValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceType"];
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = [(CBClassicPeer *)self deviceType];

    if (v9 != v6) {
      [(CBClassicPeer *)self setDeviceType:v6];
    }
  }
  int64_t v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgPID"];
  unsigned __int16 v11 = [v10 unsignedIntValue];

  uint64_t v12 = [v4 objectForKeyedSubscript:@"kCBMsgArgPID"];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(CBClassicPeer *)self productID];

    if (v14 != v11) {
      [(CBClassicPeer *)self setProductID:v11];
    }
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"kCBMsgArgVID"];
  unsigned __int16 v16 = [v15 unsignedIntValue];

  uint64_t v17 = [v4 objectForKeyedSubscript:@"kCBMsgArgVID"];
  if (v17)
  {
    v18 = (void *)v17;
    int v19 = [(CBClassicPeer *)self vendorID];

    if (v19 != v16) {
      [(CBClassicPeer *)self setVendorID:v16];
    }
  }
  v20 = [v4 objectForKeyedSubscript:@"kCBMsgArgVIDSource"];
  unsigned __int16 v21 = [v20 unsignedIntValue];

  uint64_t v22 = [v4 objectForKeyedSubscript:@"kCBMsgArgVIDSource"];
  if (v22)
  {
    long long v23 = (void *)v22;
    int v24 = [(CBClassicPeer *)self vendorIDSource];

    if (v24 != v21) {
      [(CBClassicPeer *)self setVendorIDSource:v21];
    }
  }
  long long v25 = [v4 objectForKeyedSubscript:@"kCBMsgArgVersion"];
  unsigned __int16 v26 = [v25 unsignedIntValue];

  uint64_t v27 = [v4 objectForKeyedSubscript:@"kCBMsgArgVersion"];
  if (v27)
  {
    v28 = (void *)v27;
    int v29 = [(CBClassicPeer *)self version];

    if (v29 != v26) {
      [(CBClassicPeer *)self setVersion:v26];
    }
  }
  v30 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsDevFused"];
  uint64_t v31 = [v30 BOOLValue];

  uint64_t v32 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsDevFused"];
  if (v32)
  {
    v33 = (void *)v32;
    int v34 = [(CBClassicPeer *)self isDevFused];

    if (v31 != v34) {
      [(CBClassicPeer *)self setIsDevFused:v31];
    }
  }
  v35 = [v4 objectForKeyedSubscript:@"kCBMsgArgColorID"];
  uint64_t v36 = [v35 unsignedCharValue];

  uint64_t v37 = [v4 objectForKeyedSubscript:@"kCBMsgArgColorID"];
  if (v37)
  {
    v38 = (void *)v37;
    int v39 = [(CBClassicPeer *)self colorID];

    if (v39 != v36) {
      [(CBClassicPeer *)self setColorID:v36];
    }
  }
  v40 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
  int v41 = [v40 unsignedCharValue];

  uint64_t v42 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
  if (v42)
  {
    v43 = (void *)v42;
    int v44 = [(CBClassicPeer *)self batteryPercentSingle];

    if (v44 != v41)
    {
      v45 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
      -[CBClassicPeer setBatteryPercentSingle:](self, "setBatteryPercentSingle:", [v45 unsignedCharValue]);
    }
  }
  v46 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentLeft"];
  uint64_t v47 = [v46 unsignedCharValue];

  uint64_t v48 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentLeft"];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(CBClassicPeer *)self batteryPercentLeft];

    if (v50 != v47) {
      [(CBClassicPeer *)self setBatteryPercentLeft:v47];
    }
  }
  v51 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentRight"];
  uint64_t v52 = [v51 unsignedCharValue];

  uint64_t v53 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentRight"];
  if (v53)
  {
    v54 = (void *)v53;
    int v55 = [(CBClassicPeer *)self batteryPercentRight];

    if (v55 != v52) {
      [(CBClassicPeer *)self setBatteryPercentRight:v52];
    }
  }
  v56 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCase"];
  uint64_t v57 = [v56 unsignedCharValue];

  uint64_t v58 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCase"];
  if (v58)
  {
    v59 = (void *)v58;
    int v60 = [(CBClassicPeer *)self batteryPercentCase];

    if (v60 != v57) {
      [(CBClassicPeer *)self setBatteryPercentCase:v57];
    }
  }
  v61 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCombined"];
  uint64_t v62 = [v61 unsignedCharValue];

  uint64_t v63 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCombined"];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = [(CBClassicPeer *)self batteryPercentCombined];

    if (v65 != v62) {
      [(CBClassicPeer *)self setBatteryPercentCombined:v62];
    }
  }
  v66 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningMode"];
  int v67 = [v66 unsignedCharValue];

  uint64_t v68 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningMode"];
  if (v68)
  {
    v69 = (void *)v68;
    int v70 = [(CBClassicPeer *)self listeningMode];

    if (v70 != v67)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"listeningMode"];
      self->_listeningMode = v67;
      [(CBClassicPeer *)self didChangeValueForKey:@"listeningMode"];
    }
  }
  v71 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningConfigs"];
  unsigned int v72 = [v71 unsignedIntValue];

  uint64_t v73 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningConfigs"];
  if (v73)
  {
    v74 = (void *)v73;
    unsigned int v75 = [(CBClassicPeer *)self listeningModeConfigs];

    if (v75 != v72)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"listeningModeConfigs"];
      self->_listeningModeConfigs = v72;
      [(CBClassicPeer *)self didChangeValueForKey:@"listeningModeConfigs"];
    }
  }
  v76 = [v4 objectForKeyedSubscript:@"kCBMsgArgLRDetectionModeEnabled"];
  int v77 = [v76 BOOLValue];

  uint64_t v78 = [v4 objectForKeyedSubscript:@"kCBMsgArgLRDetectionModeEnabled"];
  if (v78)
  {
    v79 = (void *)v78;
    int v80 = [(CBClassicPeer *)self LRDetectionEnabled];

    if (v77 != v80)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"LRDetectionEnabled"];
      self->_LRDetectionEnabled = v77;
      [(CBClassicPeer *)self didChangeValueForKey:@"LRDetectionEnabled"];
    }
  }
  v81 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQModeEnabled"];
  int v82 = [v81 BOOLValue];

  uint64_t v83 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQModeEnabled"];
  if (v83)
  {
    v84 = (void *)v83;
    int v85 = [(CBClassicPeer *)self EQConfigEnabled];

    if (v82 != v85)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigEnabled"];
      self->_EQConfigEnabled = v82;
      [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigEnabled"];
    }
  }
  v86 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQTreble"];
  int v87 = [v86 unsignedCharValue];

  uint64_t v88 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQTreble"];
  if (v88)
  {
    v89 = (void *)v88;
    int v90 = [(CBClassicPeer *)self EQConfigTreble];

    if (v90 != v87)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigTreble"];
      self->_EQConfigTreble = v87;
      [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigTreble"];
    }
  }
  v91 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQMid"];
  int v92 = [v91 unsignedCharValue];

  uint64_t v93 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQMid"];
  if (v93)
  {
    v94 = (void *)v93;
    int v95 = [(CBClassicPeer *)self EQConfigMid];

    if (v95 != v92)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigMid"];
      self->_EQConfigMid = v92;
      [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigMid"];
    }
  }
  v96 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQBass"];
  int v97 = [v96 unsignedCharValue];

  uint64_t v98 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQBass"];
  if (v98)
  {
    v99 = (void *)v98;
    int v100 = [(CBClassicPeer *)self EQConfigBass];

    if (v100 != v97)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigBass"];
      self->_EQConfigBass = v97;
      [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigBass"];
    }
  }
  v101 = [v4 objectForKeyedSubscript:@"kCBMsgArgAutoAnswerCalls"];
  int v102 = [v101 BOOLValue];

  uint64_t v103 = [v4 objectForKeyedSubscript:@"kCBMsgArgAutoAnswerCalls"];
  if (v103)
  {
    v104 = (void *)v103;
    int v105 = [(CBClassicPeer *)self autoAnswerCalls];

    if (v102 != v105)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"autoAnswerCalls"];
      self->_autoAnswerCalls = v102;
      [(CBClassicPeer *)self didChangeValueForKey:@"autoAnswerCalls"];
    }
  }
  v106 = [v4 objectForKeyedSubscript:@"kCBMsgArgCrownRotationDirection"];
  int v107 = [v106 unsignedCharValue];

  uint64_t v108 = [v4 objectForKeyedSubscript:@"kCBMsgArgCrownRotationDirection"];
  if (v108)
  {
    v109 = (void *)v108;
    int v110 = [(CBClassicPeer *)self crownRotationDirection];

    if (v110 != v107)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"crownRotationDirection"];
      self->_crownRotationDirection = v107;
      [(CBClassicPeer *)self didChangeValueForKey:@"crownRotationDirection"];
    }
  }
  v111 = [v4 objectForKeyedSubscript:@"kCBMsgArgSingleClickMode"];
  int v112 = [v111 unsignedCharValue];

  uint64_t v113 = [v4 objectForKeyedSubscript:@"kCBMsgArgSingleClickMode"];
  if (v113)
  {
    v114 = (void *)v113;
    int v115 = [(CBClassicPeer *)self singleClickMode];

    if (v115 != v112)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"singleClickMode"];
      self->_singleClickMode = v112;
      [(CBClassicPeer *)self didChangeValueForKey:@"singleClickMode"];
    }
  }
  v116 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickMode"];
  int v117 = [v116 unsignedCharValue];

  uint64_t v118 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickMode"];
  if (v118)
  {
    v119 = (void *)v118;
    int v120 = [(CBClassicPeer *)self doubleClickMode];

    if (v120 != v117)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"doubleClickMode"];
      self->_doubleClickMode = v117;
      [(CBClassicPeer *)self didChangeValueForKey:@"doubleClickMode"];
    }
  }
  v121 = [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldMode"];

  if (v121)
  {
    v122 = [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldMode"];
    __int16 v123 = [v122 unsignedIntValue];

    if ([(CBClassicPeer *)self clickHoldModeLeft] != HIBYTE(v123))
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldModeLeft"];
      self->_clickHoldModeLeft = HIBYTE(v123);
      [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldModeLeft"];
    }
    if ([(CBClassicPeer *)self clickHoldModeRight] != v123)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldModeRight"];
      self->_clickHoldModeRight = v123;
      [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldModeRight"];
    }
  }
  v124 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickInterval"];
  unsigned int v125 = [v124 unsignedIntValue];

  uint64_t v126 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickInterval"];
  if (v126)
  {
    v127 = (void *)v126;
    unsigned int v128 = [(CBClassicPeer *)self doubleClickInterval];

    if (v128 != v125)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"doubleClickInterval"];
      self->_doubleClickInterval = v125;
      [(CBClassicPeer *)self didChangeValueForKey:@"doubleClickInterval"];
    }
  }
  v129 = [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldInterval"];
  unsigned int v130 = [v129 unsignedIntValue];

  uint64_t v131 = [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldInterval"];
  if (v131)
  {
    v132 = (void *)v131;
    unsigned int v133 = [(CBClassicPeer *)self clickHoldInterval];

    if (v133 != v130)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldInterval"];
      self->_clickHoldInterval = v130;
      [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldInterval"];
    }
  }
  v134 = [v4 objectForKeyedSubscript:@"kCBMsgArgOneBudANCMode"];
  int v135 = [v134 unsignedCharValue];

  uint64_t v136 = [v4 objectForKeyedSubscript:@"kCBMsgArgOneBudANCMode"];
  if (v136)
  {
    v137 = (void *)v136;
    int v138 = [(CBClassicPeer *)self oneBudANCMode];

    if (v138 != v135)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"oneBudANCMode"];
      self->_oneBudANCMode = v135;
      [(CBClassicPeer *)self didChangeValueForKey:@"oneBudANCMode"];
    }
  }
  v139 = [v4 objectForKeyedSubscript:@"kCBMsgArgSwitchControlMode"];
  int v140 = [v139 unsignedCharValue];

  uint64_t v141 = [v4 objectForKeyedSubscript:@"kCBMsgArgSwitchControlMode"];
  if (v141)
  {
    v142 = (void *)v141;
    int v143 = [(CBClassicPeer *)self switchControlMode];

    if (v143 != v140)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"switchControlMode"];
      self->_switchControlMode = v140;
      [(CBClassicPeer *)self didChangeValueForKey:@"switchControlMode"];
    }
  }
  v144 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapAction"];

  if (v144)
  {
    v145 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapAction"];
    int v146 = [v145 unsignedIntValue];

    if (v146 != [(CBClassicPeer *)self doubleTapAction])
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapAction"];
      self->_doubleTapAction = v146;
      [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapAction"];
    }
  }
  v147 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapActionEx"];

  if (v147)
  {
    v148 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapActionEx"];
    unsigned int v149 = [v148 unsignedIntValue];

    if ([(CBClassicPeer *)self doubleTapActionLeft] != (unsigned __int16)(v149 >> 8))
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapActionLeft"];
      self->_doubleTapActionLeft = v149 >> 8;
      [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapActionLeft"];
    }
    if ([(CBClassicPeer *)self doubleTapActionRight] != v149)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapActionRight"];
      self->_doubleTapActionRight = v149;
      [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapActionRight"];
    }
  }
  v150 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapCapability"];
  uint64_t v151 = [v150 unsignedCharValue];

  uint64_t v152 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapCapability"];
  if (v152)
  {
    v153 = (void *)v152;
    int v154 = [(CBClassicPeer *)self doubleTapCapability];

    if (v154 != v151) {
      [(CBClassicPeer *)self setDoubleTapCapability:v151];
    }
  }
  v155 = [v4 objectForKeyedSubscript:@"kCBMsgArgMicMode"];
  int v156 = [v155 unsignedCharValue];

  uint64_t v157 = [v4 objectForKeyedSubscript:@"kCBMsgArgMicMode"];
  if (v157)
  {
    v158 = (void *)v157;
    int v159 = [(CBClassicPeer *)self micMode];

    if (v159 != v156)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"micMode"];
      self->_micMode = v156;
      [(CBClassicPeer *)self didChangeValueForKey:@"micMode"];
    }
  }
  v160 = [v4 objectForKeyedSubscript:@"kCBMsgArgInEarDetectionEnabled"];
  int v161 = [v160 BOOLValue];

  uint64_t v162 = [v4 objectForKeyedSubscript:@"kCBMsgArgInEarDetectionEnabled"];
  if (v162)
  {
    v163 = (void *)v162;
    int v164 = [(CBClassicPeer *)self inEarDetectionEnabled];

    if (v161 != v164)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"inEarDetectionEnabled"];
      self->_inEarDetectionEnabled = v161;
      [(CBClassicPeer *)self didChangeValueForKey:@"inEarDetectionEnabled"];
    }
  }
  v165 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingSupported"];
  int v166 = [v165 BOOLValue];

  uint64_t v167 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingSupported"];
  if (v167)
  {
    v168 = (void *)v167;
    int v169 = [(CBClassicPeer *)self smartRoutingSupported];

    if (v166 != v169)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"smartRoutingSupported"];
      self->_smartRoutingSupported = v166;
      [(CBClassicPeer *)self didChangeValueForKey:@"smartRoutingSupported"];
    }
  }
  v170 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingEnabled"];
  int v171 = [v170 unsignedCharValue];

  uint64_t v172 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingEnabled"];
  if (v172)
  {
    v173 = (void *)v172;
    int v174 = [(CBClassicPeer *)self smartRoutingEnabled];

    if (v174 != v171)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"smartRoutingEnabled"];
      self->_smartRoutingEnabled = v171;
      [(CBClassicPeer *)self didChangeValueForKey:@"smartRoutingEnabled"];
    }
  }
  v175 = [v4 objectForKeyedSubscript:@"kCBMsgArgRemoteTimeSyncEnabled"];
  int v176 = [v175 BOOLValue];

  uint64_t v177 = [v4 objectForKeyedSubscript:@"kCBMsgArgRemoteTimeSyncEnabled"];
  if (v177)
  {
    v178 = (void *)v177;
    int v179 = [(CBClassicPeer *)self remoteTimeSyncEnabled];

    if (v176 != v179)
    {
      [(CBClassicPeer *)self willChangeValueForKey:@"remoteTimeSyncEnabled"];
      self->_remoteTimeSyncEnabled = v176;
      [(CBClassicPeer *)self didChangeValueForKey:@"remoteTimeSyncEnabled"];
    }
  }
  v180 = [v4 objectForKeyedSubscript:@"kCBMsgArgPrimaryInEarStatus"];
  uint64_t v181 = [v180 unsignedCharValue];

  uint64_t v182 = [v4 objectForKeyedSubscript:@"kCBMsgArgPrimaryInEarStatus"];
  if (v182)
  {
    v183 = (void *)v182;
    int v184 = [(CBClassicPeer *)self primaryInEarStatus];

    if (v184 != v181) {
      [(CBClassicPeer *)self setPrimaryInEarStatus:v181];
    }
  }
  v185 = [v4 objectForKeyedSubscript:@"kCBMsgArgSecondaryInEarStatus"];
  uint64_t v186 = [v185 unsignedCharValue];

  uint64_t v187 = [v4 objectForKeyedSubscript:@"kCBMsgArgSecondaryInEarStatus"];
  if (v187)
  {
    v188 = (void *)v187;
    int v189 = [(CBClassicPeer *)self secondaryInEarStatus];

    if (v189 != v186) {
      [(CBClassicPeer *)self setSecondaryInEarStatus:v186];
    }
  }
  uint64_t v190 = [v4 objectForKeyedSubscript:@"kCBMsgArgServices"];
  if (v190)
  {
    v191 = [(CBClassicPeer *)self importServices:v190];
    [(CBClassicPeer *)self setServices:v191];
  }
  uint64_t v192 = [v4 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];
  if (v192) {
    [(CBClassicPeer *)self setSdpRecordData:v192];
  }
  v276 = (void *)v192;
  uint64_t v193 = [v4 objectForKeyedSubscript:@"kCBMsgArgAACPCapabilityBits"];
  if (v193)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    v194 = (id)CBLogComponent;
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG)) {
      [(CBClassicPeer *)self handlePeerUpdated:v194];
    }

    [(CBClassicPeer *)self setAacpCapabilityBits:v193];
  }
  v275 = (void *)v193;
  v195 = [v4 objectForKeyedSubscript:@"kCBMsgArgAppleFeatureBitMask"];
  uint64_t v196 = [v195 unsignedLongValue];

  uint64_t v197 = [v4 objectForKeyedSubscript:@"kCBMsgArgAppleFeatureBitMask"];
  if (v197)
  {
    v198 = (void *)v197;
    unsigned int v199 = [(CBClassicPeer *)self appleFeatureBitMask];

    if (v199 != v196) {
      [(CBClassicPeer *)self setAppleFeatureBitMask:v196];
    }
  }
  v200 = [v4 objectForKeyedSubscript:@"kCBMsgArgExtendedAppleFeatureBitMask"];
  uint64_t v201 = [v200 unsignedLongLongValue];

  uint64_t v202 = [v4 objectForKeyedSubscript:@"kCBMsgArgExtendedAppleFeatureBitMask"];
  if (v202)
  {
    v203 = (void *)v202;
    unint64_t v204 = [(CBClassicPeer *)self appleExtendedFeatureBitMask];

    if (v204 != v201) {
      [(CBClassicPeer *)self setAppleExtendedFeatureBitMask:v201];
    }
  }
  uint64_t v205 = [v4 objectForKeyedSubscript:@"kCBMsgArgRssi"];
  if (v205)
  {
    v206 = [(CBClassicPeer *)self RSSI];
    char v207 = [v206 isEqualToNumber:v205];

    if ((v207 & 1) == 0) {
      [(CBClassicPeer *)self setRSSI:v205];
    }
  }
  v274 = (void *)v205;
  v208 = [v4 objectForKeyedSubscript:@"kCBMsgArgSerialNumber"];
  if (v208)
  {
    v209 = [(CBClassicPeer *)self serialNumber];
    char v210 = [v208 isEqualToString:v209];

    if ((v210 & 1) == 0) {
      [(CBClassicPeer *)self setSerialNumber:v208];
    }
  }
  v273 = v208;
  v211 = [v4 objectForKeyedSubscript:@"kCBMsgArgTrustedUID"];
  v212 = v211;
  if (v211)
  {
    v213 = [v211 UUIDString];
    v214 = [(CBClassicPeer *)self trustedUID];
    v215 = [v214 UUIDString];
    char v216 = [v213 isEqualToString:v215];

    if ((v216 & 1) == 0) {
      [(CBClassicPeer *)self setTrustedUID:v212];
    }
  }
  v217 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  uint64_t v218 = [v217 BOOLValue];

  uint64_t v219 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  if (v219)
  {
    v220 = (void *)v219;
    int v221 = [(CBClassicPeer *)self isIncoming];

    if (v218 != v221) {
      [(CBClassicPeer *)self setIsIncoming:v218];
    }
  }
  v222 = [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
  uint64_t v223 = [v222 integerValue];

  uint64_t v224 = [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
  if (v224)
  {
    v225 = (void *)v224;
    int64_t v226 = [(CBClassicPeer *)self internalState];

    if (v226 != v223) {
      [(CBClassicPeer *)self setInternalState:v223];
    }
  }
  v227 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
  uint64_t v228 = [v227 unsignedShortValue];

  uint64_t v229 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
  if (v229)
  {
    v230 = (void *)v229;
    int v231 = [(CBClassicPeer *)self connectionHandle];

    if (v231 != v228) {
      [(CBClassicPeer *)self setConnectionHandle:v228];
    }
  }
  uint64_t v232 = [v4 objectForKeyedSubscript:@"kCBMsgArgAddressString"];
  if (v232)
  {
    v233 = [(CBClassicPeer *)self addressString];
    char v234 = [v233 isEqualToString:v232];

    if ((v234 & 1) == 0) {
      [(CBClassicPeer *)self setAddressString:v232];
    }
  }
  v271 = (void *)v232;
  v235 = [v4 objectForKeyedSubscript:@"kCBMsgArgModesSupported"];
  uint64_t v236 = [v235 unsignedCharValue];

  uint64_t v237 = [v4 objectForKeyedSubscript:@"kCBMsgArgModesSupported"];
  if (v237)
  {
    v238 = (void *)v237;
    int v239 = [(CBClassicPeer *)self modeSupported];

    if (v239 != v236) {
      [(CBClassicPeer *)self setModeSupported:v236];
    }
  }
  v240 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  uint64_t v241 = (uint64_t)v240;
  v277 = (void *)v190;
  if (v240 && ![v240 length])
  {

    uint64_t v241 = 0;
    v245 = [(CBClassicPeer *)self name];

    if (v245)
    {
LABEL_165:
      if (!v241) {
        goto LABEL_174;
      }
      goto LABEL_172;
    }
  }
  else
  {
    uint64_t v242 = [(CBClassicPeer *)self name];
    uint64_t v243 = v241 | v242;

    if (v243) {
      goto LABEL_165;
    }
  }
  v244 = [(CBClassicPeer *)self addressString];

  if (v244)
  {
    uint64_t v241 = [(CBClassicPeer *)self addressString];
    goto LABEL_165;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v246 = (id)CBLogComponent;
  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer handlePeerUpdated:](v246);
  }

  uint64_t v241 = (uint64_t)&stru_1F02E5F20;
LABEL_172:
  v247 = [(CBClassicPeer *)self name];
  char v248 = [(id)v241 isEqual:v247];

  if ((v248 & 1) == 0)
  {
    [(CBClassicPeer *)self willChangeValueForKey:@"name"];
    objc_storeStrong((id *)&self->_name, (id)v241);
    [(CBClassicPeer *)self didChangeValueForKey:@"name"];
  }
LABEL_174:
  v270 = (void *)v241;
  v249 = [v4 objectForKey:@"kCBMsgArgModelIdentifier"];
  if (v249)
  {
    [(CBClassicPeer *)self willChangeValueForKey:@"appleModelIdentifier"];
    objc_storeStrong((id *)&self->_appleModelIdentifier, v249);
    [(CBClassicPeer *)self didChangeValueForKey:@"appleModelIdentifier"];
  }
  v250 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsConnectedOverUSB"];
  uint64_t v251 = [v250 BOOLValue];

  uint64_t v252 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsConnectedOverUSB"];
  if (v252)
  {
    v253 = (void *)v252;
    int v254 = [(CBClassicPeer *)self isConnectedOverUSB];

    if (v251 != v254) {
      [(CBClassicPeer *)self setIsConnectedOverUSB:v251];
    }
  }
  v272 = v212;
  long long v280 = 0u;
  long long v281 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  v255 = [(CBClassicPeer *)self services];
  uint64_t v256 = [v255 countByEnumeratingWithState:&v278 objects:v282 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    int v258 = 0;
    uint64_t v259 = *(void *)v279;
    do
    {
      for (uint64_t i = 0; i != v257; ++i)
      {
        if (*(void *)v279 != v259) {
          objc_enumerationMutation(v255);
        }
        v261 = [*(id *)(*((void *)&v278 + 1) + 8 * i) objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
        v262 = [v261 UUIDString];

        v258 |= [@"7221EC74-0BAD-4D01-8F77-997B2BE0722A" isEqualToString:v262];
      }
      uint64_t v257 = [v255 countByEnumeratingWithState:&v278 objects:v282 count:16];
    }
    while (v257);
  }
  else
  {
    LOBYTE(v258) = 0;
  }

  [(CBClassicPeer *)self setIsAppleAccessoryServer:v258 & 1];
  v263 = [v4 objectForKeyedSubscript:@"kCBMsgArgRemotePANStatus"];

  if (v263)
  {
    v264 = [v4 objectForKeyedSubscript:@"kCBMsgArgRemotePANStatus"];
    -[CBClassicPeer setPanEnabled:](self, "setPanEnabled:", [v264 BOOLValue]);
  }
  v265 = [v4 objectForKeyedSubscript:@"kCBMsgArgFileBrowsingStatus"];

  if (v265)
  {
    v266 = [v4 objectForKeyedSubscript:@"kCBMsgArgFileBrowsingStatus"];
    -[CBClassicPeer setBrowsingEnabled:](self, "setBrowsingEnabled:", [v266 BOOLValue]);
  }
  v267 = [v4 objectForKeyedSubscript:@"kCBMsgArgObjectPushStatus"];

  if (v267)
  {
    v268 = [v4 objectForKeyedSubscript:@"kCBMsgArgObjectPushStatus"];
    -[CBClassicPeer setObjectPushEnabled:](self, "setObjectPushEnabled:", [v268 BOOLValue]);
  }
}

- (void)handleSuccessfulConnection:(id)a3
{
  id v4 = a3;
  id v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsLinkEncrypted"];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionTransport"];
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgServices"];
  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];

  if (v8) {
    [(CBClassicPeer *)self setSdpRecordData:v8];
  }
  if (v7)
  {
    int v9 = [(CBClassicPeer *)self importServices:v7];
    [(CBClassicPeer *)self setServices:v9];
  }
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", [v10 BOOLValue]);
  -[CBPeer setConnectedTransport:](self, "setConnectedTransport:", [v5 unsignedIntegerValue]);
  -[CBClassicPeer setIsIncoming:](self, "setIsIncoming:", [v6 BOOLValue]);
  [(CBClassicPeer *)self setState:2];
}

- (void)handleFailedConnection
{
}

- (void)handleDisconnection
{
  [(CBClassicPeer *)self setRSSI:0];
  [(CBClassicPeer *)self setState:0];

  [(CBPeer *)self setIsLinkEncrypted:0];
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v5)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleL2CAPChannelOpened:]();
      unsigned __int8 v6 = 0;
      unsigned __int16 v16 = [(CBClassicPeer *)self connectL2CAPCallback];

      if (!v16) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
      uint64_t v7 = [(CBClassicPeer *)self connectL2CAPCallback];

      if (!v7) {
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  unsigned __int8 v6 = [[CBL2CAPChannel alloc] initWithPeer:self info:v4];
  id v8 = [v4 objectForKey:@"kCBMsgArgPSM"];
  uint64_t v9 = [v8 unsignedCharValue];

  id v10 = [(CBClassicPeer *)self serviceForPSM:v9];
  unsigned __int16 v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
  [(CBL2CAPChannel *)v6 setServiceUUID:v11];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[CBClassicPeer handleL2CAPChannelOpened:]";
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1AB9F0000, v12, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v17, 0x16u);
  }
  v13 = [(CBClassicPeer *)self L2CAPChannels];
  [v13 addObject:v6];

  int v14 = [(CBClassicPeer *)self connectL2CAPCallback];

  if (v14)
  {
LABEL_12:
    uint64_t v15 = [(CBClassicPeer *)self connectL2CAPCallback];
    ((void (**)(void, CBL2CAPChannel *, uint64_t))v15)[2](v15, v6, [v5 code]);
  }
LABEL_13:
}

- (void)handleL2CAPChannelClosed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  unsigned __int8 v6 = [v4 errorWithInfo:v5];
  uint64_t v7 = [v5 objectForKey:@"kCBMsgArgPSM"];

  uint64_t v8 = [v7 unsignedShortValue];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    [(CBClassicPeer *)v8 handleL2CAPChannelClosed:v9];
  }
  id v10 = [(CBClassicPeer *)self channelWithPSM:v8];
  unsigned __int16 v11 = [(CBClassicPeer *)self disconnectL2CAPCallback];

  if (v11)
  {
    uint64_t v12 = [(CBClassicPeer *)self disconnectL2CAPCallback];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v10, [v6 code]);
  }
  v13 = [(CBClassicPeer *)self L2CAPChannels];
  [v13 removeObject:v10];
}

- (id)channelWithPSM:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CBClassicPeer *)self L2CAPChannels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 PSM] == v3)
        {
          id v10 = v9;

          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer channelWithPSM:]();
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (void)handleRFCOMMChannelOpened:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v5)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v6 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleRFCOMMChannelOpened:](v6);
      uint64_t v7 = 0;
      long long v13 = [(CBClassicPeer *)self connectRFCOMMCallback];

      if (!v13) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = [(CBClassicPeer *)self connectRFCOMMCallback];

      if (!v8) {
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  uint64_t v7 = [[CBRFCOMMChannel alloc] initWithPeer:self info:v4];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    long long v15 = "-[CBClassicPeer handleRFCOMMChannelOpened:]";
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v14, 0x16u);
  }
  id v10 = [(CBClassicPeer *)self RFCOMMChannels];
  [v10 addObject:v7];

  unsigned __int16 v11 = [(CBClassicPeer *)self connectRFCOMMCallback];

  if (v11)
  {
LABEL_12:
    long long v12 = [(CBClassicPeer *)self connectRFCOMMCallback];
    ((void (**)(void, CBRFCOMMChannel *, uint64_t))v12)[2](v12, v7, [v5 code]);
  }
LABEL_13:
}

- (void)handleRFCOMMChannelClosed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  uint64_t v6 = [v4 errorWithInfo:v5];
  uint64_t v7 = [v5 objectForKey:@"kCBMsgArgRFCOMMChannelID"];

  uint64_t v8 = [v7 unsignedCharValue];
  uint64_t v9 = [(CBClassicPeer *)self channelWithID:v8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v10 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    long long v15 = "-[CBClassicPeer handleRFCOMMChannelClosed:]";
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v6;
    _os_log_impl(&dword_1AB9F0000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ and result: %@", (uint8_t *)&v14, 0x20u);
  }
  unsigned __int16 v11 = [(CBClassicPeer *)self disconnectRFCOMMCallback];

  if (v11)
  {
    long long v12 = [(CBClassicPeer *)self disconnectRFCOMMCallback];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v9, [v6 code]);
  }
  long long v13 = [(CBClassicPeer *)self RFCOMMChannels];
  [v13 removeObject:v9];
}

- (id)channelWithID:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CBClassicPeer *)self RFCOMMChannels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 channelID] == v3)
        {
          id v10 = v9;

          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer channelWithID:]();
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (void)setOrphan
{
}

- (id)service:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CBClassicPeer *)self services];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int16 v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)serviceForPSM:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CBClassicPeer *)self services];
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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"kCBMsgArgPSM"];
        int v11 = [v10 unsignedShortValue];

        if (v11 == v3)
        {
          id v12 = v9;
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
  id v12 = 0;
LABEL_11:

  return v12;
}

- (unsigned)psmForService:(id)a3
{
  int v3 = [(CBClassicPeer *)self service:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"kCBMsgArgPSM"];
    unsigned __int16 v6 = [v5 unsignedShortValue];

    return v6;
  }
  else
  {

    return 0;
  }
}

- (id)serviceForRFCOMMChannelID:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CBClassicPeer *)self services];
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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
        int v11 = [v10 unsignedCharValue];

        if (v11 == v3)
        {
          id v12 = v9;
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
  id v12 = 0;
LABEL_11:

  return v12;
}

- (unsigned)rfcommChannelIDForService:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(CBClassicPeer *)self service:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
    unsigned __int8 v8 = [v7 unsignedShortValue];

    return v8;
  }
  else
  {

    return 0;
  }
}

- (void)setListeningMode:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self listeningMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgListeningMode";
    uint64_t v5 = [NSNumber numberWithChar:(char)a3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"listeningMode"];
    self->_listeningMode = a3;
    [(CBClassicPeer *)self didChangeValueForKey:@"listeningMode"];
  }
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self listeningModeConfigs] != a3)
  {
    uint64_t v7 = @"kCBMsgArgListeningConfigs";
    uint64_t v5 = [NSNumber numberWithChar:(char)a3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"listeningModeConfigs"];
    self->_listeningModeConfigs = a3;
    [(CBClassicPeer *)self didChangeValueForKey:@"listeningModeConfigs"];
  }
}

- (void)setLRDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self LRDetectionEnabled] != a3)
  {
    uint64_t v7 = @"kCBMsgArgLRDetectionModeEnabled";
    uint64_t v5 = [NSNumber numberWithBool:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"LRDetectionEnabled"];
    self->_LRDetectionEnabled = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"LRDetectionEnabled"];
  }
}

- (void)setEQConfigEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self EQConfigEnabled] != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    uint64_t v5 = [NSNumber numberWithBool:v3];
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    unsigned __int8 v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v11[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
    [(CBClassicPeer *)self sendMsg:42 args:v9];

    [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigEnabled"];
    self->_EQConfigEnabled = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigEnabled"];
  }
}

- (void)setEQConfigTreble:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self EQConfigTreble] != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    uint64_t v6 = [NSNumber numberWithUnsignedChar:v3];
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    unsigned __int8 v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v11[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
    [(CBClassicPeer *)self sendMsg:42 args:v9];

    [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigTreble"];
    self->_EQConfigTreble = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigTreble"];
  }
}

- (void)setEQConfigMid:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self EQConfigMid] != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    uint64_t v7 = [NSNumber numberWithUnsignedChar:v3];
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    unsigned __int8 v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    v11[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
    [(CBClassicPeer *)self sendMsg:42 args:v9];

    [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigMid"];
    self->_EQConfigMid = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigMid"];
  }
}

- (void)setEQConfigBass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self EQConfigBass] != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    unsigned __int8 v8 = [NSNumber numberWithUnsignedChar:v3];
    v11[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
    [(CBClassicPeer *)self sendMsg:42 args:v9];

    [(CBClassicPeer *)self willChangeValueForKey:@"EQConfigBass"];
    self->_EQConfigBass = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"EQConfigBass"];
  }
}

- (void)setAutoAnswerCalls:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self autoAnswerCalls] != a3)
  {
    uint64_t v7 = @"kCBMsgArgAutoAnswerCalls";
    uint64_t v5 = [NSNumber numberWithBool:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"autoAnswerCalls"];
    self->_autoAnswerCalls = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"autoAnswerCalls"];
  }
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self crownRotationDirection] != a3)
  {
    uint64_t v7 = @"kCBMsgArgCrownRotationDirection";
    uint64_t v5 = [NSNumber numberWithUnsignedChar:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"crownRotationDirection"];
    self->_crownRotationDirection = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"crownRotationDirection"];
  }
}

- (void)setSingleClickMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self singleClickMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgSingleClickMode";
    uint64_t v5 = [NSNumber numberWithUnsignedChar:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"singleClickMode"];
    self->_singleClickMode = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"singleClickMode"];
  }
}

- (void)setDoubleClickMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self doubleClickMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleClickMode";
    uint64_t v5 = [NSNumber numberWithUnsignedChar:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"doubleClickMode"];
    self->_doubleClickMode = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"doubleClickMode"];
  }
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self clickHoldModeLeft] != a3)
  {
    int v5 = [(CBClassicPeer *)self clickHoldModeRight];
    unsigned __int8 v8 = @"kCBMsgArgClickHoldMode";
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v5 | (v3 << 8)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v7];

    [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldModeLeft"];
    self->_clickHoldModeLeft = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldModeLeft"];
  }
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self clickHoldModeRight] != a3)
  {
    int v5 = [(CBClassicPeer *)self clickHoldModeLeft];
    unsigned __int8 v8 = @"kCBMsgArgClickHoldMode";
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3 | (v5 << 8)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v7];

    [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldModeRight"];
    self->_clickHoldModeRight = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldModeRight"];
  }
}

- (void)setDoubleClickInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self doubleClickInterval] != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleClickInterval";
    int v5 = [NSNumber numberWithUnsignedInt:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"doubleClickInterval"];
    self->_doubleClickInterval = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"doubleClickInterval"];
  }
}

- (void)setClickHoldInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self clickHoldInterval] != a3)
  {
    uint64_t v7 = @"kCBMsgArgClickHoldInterval";
    int v5 = [NSNumber numberWithUnsignedInt:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"clickHoldInterval"];
    self->_clickHoldInterval = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"clickHoldInterval"];
  }
}

- (void)setOneBudANCMode:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self oneBudANCMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgOneBudANCMode";
    int v5 = [NSNumber numberWithChar:(char)a3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"oneBudANCMode"];
    self->_oneBudANCMode = a3;
    [(CBClassicPeer *)self didChangeValueForKey:@"oneBudANCMode"];
  }
}

- (void)setSwitchControlMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self switchControlMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgSwitchControlMode";
    int v5 = [NSNumber numberWithUnsignedChar:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"switchControlMode"];
    self->_switchControlMode = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"switchControlMode"];
  }
}

- (void)setDoubleTapAction:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self doubleTapAction] != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleTapAction";
    int v5 = [NSNumber numberWithUnsignedInt:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapAction"];
    self->_doubleTapAction = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapAction"];
  }
}

- (void)setDoubleTapActionLeft:(unsigned __int16)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self doubleTapActionLeft] != a3)
  {
    int v5 = [(CBClassicPeer *)self doubleTapActionRight];
    unsigned __int8 v8 = @"kCBMsgArgDoubleTapActionEx";
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v5 | (v3 << 8)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v7];

    [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapActionLeft"];
    self->_doubleTapActionLeft = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapActionLeft"];
  }
}

- (void)setDoubleTapActionRight:(unsigned __int16)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self doubleTapActionRight] != a3)
  {
    int v5 = [(CBClassicPeer *)self doubleTapActionLeft];
    unsigned __int8 v8 = @"kCBMsgArgDoubleTapActionEx";
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3 | (v5 << 8)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v7];

    [(CBClassicPeer *)self willChangeValueForKey:@"doubleTapActionRight"];
    self->_doubleTapActionRight = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"doubleTapActionRight"];
  }
}

- (void)setMicMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self micMode] != a3)
  {
    uint64_t v7 = @"kCBMsgArgMicMode";
    int v5 = [NSNumber numberWithUnsignedChar:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"micMode"];
    self->_micMode = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"micMode"];
  }
}

- (void)setInEarDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self inEarDetectionEnabled] != a3)
  {
    uint64_t v7 = @"kCBMsgArgInEarDetectionEnabled";
    int v5 = [NSNumber numberWithBool:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"inEarDetectionEnabled"];
    self->_inEarDetectionEnabled = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"inEarDetectionEnabled"];
  }
}

- (void)setSmartRoutingEnabled:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self smartRoutingEnabled] != a3)
  {
    uint64_t v7 = @"kCBMsgArgSmartRoutingEnabled";
    int v5 = [NSNumber numberWithChar:(char)a3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"smartRoutingEnabled"];
    self->_smartRoutingEnabled = a3;
    [(CBClassicPeer *)self didChangeValueForKey:@"smartRoutingEnabled"];
  }
}

- (void)setSmartRoutingSupported:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self smartRoutingSupported] != a3)
  {
    uint64_t v7 = @"kCBMsgArgSmartRoutingSupported";
    int v5 = [NSNumber numberWithBool:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"smartRoutingSupported"];
    self->_smartRoutingSupported = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"smartRoutingSupported"];
  }
}

- (void)setRemoteTimeSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self remoteTimeSyncEnabled] != a3)
  {
    uint64_t v7 = @"kCBMsgArgRemoteTimeSyncEnabled";
    int v5 = [NSNumber numberWithBool:v3];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CBClassicPeer *)self sendMsg:42 args:v6];

    [(CBClassicPeer *)self willChangeValueForKey:@"remoteTimeSyncEnabled"];
    self->_remoteTimeSyncEnabled = v3;
    [(CBClassicPeer *)self didChangeValueForKey:@"remoteTimeSyncEnabled"];
  }
}

- (unsigned)getConnectedServices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(CBClassicPeer *)self internalState] == 2)
  {
    BOOL v3 = [(CBPeer *)self manager];
    int v11 = @"kCBMsgArgDeviceUUID";
    id v4 = [(CBPeer *)self identifier];
    v12[0] = v4;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v6 = [v3 sendSyncMsg:58 args:v5];

    uint64_t v7 = [v6 objectForKeyedSubscript:@"kCBMsgArgConnectedServices"];
    unsigned int v8 = [v7 unsignedIntValue];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v9 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      [(CBClassicPeer *)v9 getConnectedServices];
    }
    return 0;
  }
  return v8;
}

- (BOOL)isAppleDevice
{
  if ([(CBClassicPeer *)self vendorIDSource] == 2
    && [(CBClassicPeer *)self vendorID] == 1452)
  {
    return 1;
  }
  if ([(CBClassicPeer *)self vendorID] == 76) {
    return 1;
  }
  if ([(CBPeer *)self pairingState] == 2) {
    return 1;
  }
  return [(CBPeer *)self pairingState] == 3;
}

- (BOOL)isiPhone
{
  int v3 = [(CBClassicPeer *)self deviceType];
  if (v3 != 12 && v3 != 2) {
    return 0;
  }

  return [(CBClassicPeer *)self isAppleDevice];
}

- (BOOL)isiPad
{
  BOOL v3 = [(CBClassicPeer *)self isAppleDevice];
  if (v3) {
    LOBYTE(v3) = [(CBClassicPeer *)self deviceType] == 29;
  }
  return v3;
}

- (BOOL)isMac
{
  int v3 = [(CBClassicPeer *)self deviceType];
  if ((v3 - 7) >= 4 && v3 != 1) {
    return 0;
  }

  return [(CBClassicPeer *)self isAppleDevice];
}

- (BOOL)isMultiBatteryDevice
{
  BOOL result = 0;
  if ([(CBClassicPeer *)self isAppleDevice])
  {
    unsigned int v3 = [(CBClassicPeer *)self productID] - 8194;
    if (v3 < 0x15 && ((0x11B201u >> v3) & 1) != 0) {
      return 1;
    }
    if (![(CBClassicPeer *)self batteryPercentSingle]
      && ([(CBClassicPeer *)self batteryPercentCase]
       || [(CBClassicPeer *)self batteryPercentLeft]
       || [(CBClassicPeer *)self batteryPercentRight]))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isReportingBatteryPercent
{
  if (![(CBClassicPeer *)self isMultiBatteryDevice]) {
    return [(CBClassicPeer *)self batteryPercentSingle] != 0;
  }
  if ([(CBClassicPeer *)self batteryPercentLeft]) {
    return 1;
  }
  if ([(CBClassicPeer *)self batteryPercentRight]) {
    return 1;
  }
  return [(CBClassicPeer *)self batteryPercentCase] != 0;
}

- (BOOL)isGameController
{
  if ([(CBClassicPeer *)self deviceType] == 26
    || [(CBClassicPeer *)self isSonyGameController])
  {
    return 1;
  }

  return [(CBClassicPeer *)self isXboxGameController];
}

- (BOOL)isSonyGameController
{
  if ([(CBClassicPeer *)self vendorIDSource] != 2
    || [(CBClassicPeer *)self vendorID] != 1356)
  {
    return 0;
  }
  if ([(CBClassicPeer *)self productID] == 1476
    || [(CBClassicPeer *)self productID] == 2508
    || [(CBClassicPeer *)self productID] == 3302
    || [(CBClassicPeer *)self productID] == 3570
    || [(CBClassicPeer *)self productID] == 3653)
  {
    return 1;
  }
  return [(CBClassicPeer *)self productID] == 3654;
}

- (BOOL)isXboxGameController
{
  if ([(CBClassicPeer *)self vendorIDSource] != 2
    || [(CBClassicPeer *)self vendorID] != 1118)
  {
    return 0;
  }
  if ([(CBClassicPeer *)self productID] == 765
    || [(CBClassicPeer *)self productID] == 2828
    || [(CBClassicPeer *)self productID] == 2818)
  {
    return 1;
  }
  return [(CBClassicPeer *)self productID] == 2821;
}

- (BOOL)isNintendoGameController
{
  if ([(CBClassicPeer *)self vendorIDSource] != 2
    || [(CBClassicPeer *)self vendorID] != 1406)
  {
    return 0;
  }
  if ([(CBClassicPeer *)self productID] == 8198) {
    return 1;
  }
  if ([(CBClassicPeer *)self productID] == 8199) {
    return 1;
  }
  return [(CBClassicPeer *)self productID] == 8201;
}

- (BOOL)isAppleFeatureSupported:(unsigned int)a3
{
  return (a3 & ~[(CBClassicPeer *)self appleFeatureBitMask]) == 0;
}

- (BOOL)isAACPCapabilityBit:(unsigned int)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v5 = [(CBClassicPeer *)self aacpCapabilityBits];
  if (v5)
  {
    uint64_t v6 = [(CBClassicPeer *)self aacpCapabilityBits];
    unint64_t v7 = [v6 length];

    if (v7 <= a3 >> 3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      unsigned __int8 v15 = 0;
      int v5 = [(CBClassicPeer *)self aacpCapabilityBits];
      objc_msgSend(v5, "getBytes:range:", &v15, a3 >> 3, 1);

      int v8 = (1 << (a3 & 7)) & v15;
      LOBYTE(v5) = v8 != 0;
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      uint64_t v9 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        BOOL v10 = v8 != 0;
        int v11 = v9;
        id v12 = [(CBClassicPeer *)self name];
        id v13 = [(CBClassicPeer *)self aacpCapabilityBits];
        *(_DWORD *)buf = 136316930;
        long long v17 = "-[CBClassicPeer isAACPCapabilityBit:]";
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        __int16 v22 = 1024;
        unsigned int v23 = a3;
        __int16 v24 = 1024;
        unsigned int v25 = a3 & 7;
        __int16 v26 = 1024;
        unsigned int v27 = a3 >> 3;
        __int16 v28 = 1024;
        int v29 = v15;
        __int16 v30 = 1024;
        BOOL v31 = v10;
        _os_log_debug_impl(&dword_1AB9F0000, v11, OS_LOG_TYPE_DEBUG, "%s - “%@” - aacpCapabilityBits=%@ bit #%d is bit %d of byte %d (%2X) bitIsOn:%d", buf, 0x3Eu);
      }
    }
  }
  return (char)v5;
}

- (void)openRFCOMMChannel:(unsigned __int8)a3 options:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
    int v8 = [NSNumber numberWithUnsignedChar:v4];
    id v9 = (id)MEMORY[0x1E4F1CC08];
    if (v6) {
      id v9 = v6;
    }
    BOOL v10 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgRFCOMMChannelID", v9, @"kCBMsgArgOptions", 0);
    [(CBClassicPeer *)self sendMsg:53 args:v10];

LABEL_5:
    return;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_5;
  }
  -[CBClassicPeer openRFCOMMChannel:options:]();
}

- (void)configureRFCOMMPortParams:(id)a3
{
}

- (BOOL)isServiceSupported:(id)a3
{
  unsigned int v3 = [(CBClassicPeer *)self service:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:@"kCBMsgArgPSM"];
    BOOL v6 = v5 != 0;

    return v6;
  }
  else
  {

    return 0;
  }
}

- (void)openL2CAPChannel:(unsigned __int16)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  BOOL v6 = [NSNumber numberWithUnsignedShort:a3];
  int v5 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgPSM", MEMORY[0x1E4F1CC08], @"kCBMsgArgOptions", 0);
  [(CBClassicPeer *)self sendMsg:25 args:v5];
}

- (void)closeL2CAPChannel:(unsigned __int16)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
    objc_msgSend(NSNumber, "numberWithUnsignedShort:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    int v5 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgPSM", 0);
    [(CBClassicPeer *)self sendMsg:26 args:v5];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicPeer closeL2CAPChannel:]();
    }
  }
}

- (void)openRFCOMMChannel:(unsigned __int8)a3
{
}

- (void)closeRFCOMMChannel:(unsigned __int8)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
    objc_msgSend(NSNumber, "numberWithUnsignedChar:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    int v5 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgRFCOMMChannelID", 0);
    [(CBClassicPeer *)self sendMsg:54 args:v5];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicPeer openRFCOMMChannel:options:]();
    }
  }
}

- (void)setName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CBClassicPeer.m", 1210, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  unint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  int v8 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  id v13 = [v7 stringByTrimmingCharactersInSet:v8];

  id v9 = (void *)MEMORY[0x1E4F1CA60];
  BOOL v10 = [(CBPeer *)self identifier];
  int v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgDeviceUUID", v13, @"kCBMsgArgName", 0);
  [(CBClassicPeer *)self sendMsg:42 args:v11];
}

- (BOOL)isRFCOMMServiceSupported:(id)a3
{
  unsigned int v3 = [(CBClassicPeer *)self service:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
    BOOL v6 = v5 != 0;

    return v6;
  }
  else
  {

    return 0;
  }
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (id)connectL2CAPCallback
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setConnectL2CAPCallback:(id)a3
{
}

- (id)disconnectL2CAPCallback
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setDisconnectL2CAPCallback:(id)a3
{
}

- (id)connectRFCOMMCallback
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setConnectRFCOMMCallback:(id)a3
{
}

- (id)disconnectRFCOMMCallback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setDisconnectRFCOMMCallback:(id)a3
{
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int16)a3
{
  self->_vendorIDSource = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)isDevFused
{
  return self->_isDevFused;
}

- (void)setIsDevFused:(BOOL)a3
{
  self->_isDevFused = a3;
}

- (unsigned)colorID
{
  return self->_colorID;
}

- (void)setColorID:(unsigned __int8)a3
{
  self->_colorID = a3;
}

- (NSString)appleModelIdentifier
{
  return self->_appleModelIdentifier;
}

- (void)setAppleModelIdentifier:(id)a3
{
}

- (BOOL)isConnectedOverUSB
{
  return self->_isConnectedOverUSB;
}

- (void)setIsConnectedOverUSB:(BOOL)a3
{
  self->_isConnectedOverUSB = a3;
}

- (BOOL)isAppleAccessoryServer
{
  return self->_isAppleAccessoryServer;
}

- (void)setIsAppleAccessoryServer:(BOOL)a3
{
  self->_isAppleAccessoryServer = a3;
}

- (NSArray)syncGroups
{
  return self->_syncGroups;
}

- (void)setSyncGroups:(id)a3
{
}

- (unsigned)syncSettings
{
  return self->_syncSettings;
}

- (void)setSyncSettings:(unsigned __int16)a3
{
  self->_syncSettings = a3;
}

- (unsigned)batteryPercentSingle
{
  return self->_batteryPercentSingle;
}

- (void)setBatteryPercentSingle:(unsigned __int8)a3
{
  self->_batteryPercentSingle = a3;
}

- (unsigned)batteryPercentLeft
{
  return self->_batteryPercentLeft;
}

- (void)setBatteryPercentLeft:(unsigned __int8)a3
{
  self->_batteryPercentLeft = a3;
}

- (unsigned)batteryPercentRight
{
  return self->_batteryPercentRight;
}

- (void)setBatteryPercentRight:(unsigned __int8)a3
{
  self->_batteryPercentRight = a3;
}

- (unsigned)batteryPercentCase
{
  return self->_batteryPercentCase;
}

- (void)setBatteryPercentCase:(unsigned __int8)a3
{
  self->_batteryPercentCase = a3;
}

- (unsigned)batteryPercentCombined
{
  return self->_batteryPercentCombined;
}

- (void)setBatteryPercentCombined:(unsigned __int8)a3
{
  self->_batteryPercentCombined = a3;
}

- (BOOL)panEnabled
{
  return self->_panEnabled;
}

- (void)setPanEnabled:(BOOL)a3
{
  self->_panEnabled = a3;
}

- (BOOL)browsingEnabled
{
  return self->_browsingEnabled;
}

- (void)setBrowsingEnabled:(BOOL)a3
{
  self->_browsingEnabled = a3;
}

- (BOOL)objectPushEnabled
{
  return self->_objectPushEnabled;
}

- (void)setObjectPushEnabled:(BOOL)a3
{
  self->_objectPushEnabled = a3;
}

- (unsigned)listeningMode
{
  return self->_listeningMode;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (BOOL)LRDetectionEnabled
{
  return self->_LRDetectionEnabled;
}

- (BOOL)EQConfigEnabled
{
  return self->_EQConfigEnabled;
}

- (unsigned)EQConfigTreble
{
  return self->_EQConfigTreble;
}

- (unsigned)EQConfigMid
{
  return self->_EQConfigMid;
}

- (unsigned)EQConfigBass
{
  return self->_EQConfigBass;
}

- (BOOL)autoAnswerCalls
{
  return self->_autoAnswerCalls;
}

- (unsigned)crownRotationDirection
{
  return self->_crownRotationDirection;
}

- (unsigned)singleClickMode
{
  return self->_singleClickMode;
}

- (unsigned)doubleClickMode
{
  return self->_doubleClickMode;
}

- (unsigned)clickHoldModeLeft
{
  return self->_clickHoldModeLeft;
}

- (unsigned)clickHoldModeRight
{
  return self->_clickHoldModeRight;
}

- (unsigned)doubleClickInterval
{
  return self->_doubleClickInterval;
}

- (unsigned)clickHoldInterval
{
  return self->_clickHoldInterval;
}

- (unsigned)oneBudANCMode
{
  return self->_oneBudANCMode;
}

- (unsigned)switchControlMode
{
  return self->_switchControlMode;
}

- (unsigned)doubleTapAction
{
  return self->_doubleTapAction;
}

- (unsigned)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (unsigned)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (unsigned)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (void)setDoubleTapCapability:(unsigned __int8)a3
{
  self->_doubleTapCapability = a3;
}

- (unsigned)micMode
{
  return self->_micMode;
}

- (BOOL)inEarDetectionEnabled
{
  return self->_inEarDetectionEnabled;
}

- (BOOL)smartRoutingSupported
{
  return self->_smartRoutingSupported;
}

- (unsigned)smartRoutingEnabled
{
  return self->_smartRoutingEnabled;
}

- (BOOL)remoteTimeSyncEnabled
{
  return self->_remoteTimeSyncEnabled;
}

- (unsigned)primaryInEarStatus
{
  return self->_primaryInEarStatus;
}

- (void)setPrimaryInEarStatus:(unsigned __int8)a3
{
  self->_primaryInEarStatus = a3;
}

- (unsigned)secondaryInEarStatus
{
  return self->_secondaryInEarStatus;
}

- (void)setSecondaryInEarStatus:(unsigned __int8)a3
{
  self->_secondaryInEarStatus = a3;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSData)sdpRecordData
{
  return self->_sdpRecordData;
}

- (void)setSdpRecordData:(id)a3
{
}

- (NSData)aacpCapabilityBits
{
  return self->_aacpCapabilityBits;
}

- (void)setAacpCapabilityBits:(id)a3
{
}

- (unsigned)appleFeatureBitMask
{
  return self->_appleFeatureBitMask;
}

- (void)setAppleFeatureBitMask:(unsigned int)a3
{
  self->_appleFeatureBitMask = a3;
}

- (unint64_t)appleExtendedFeatureBitMask
{
  return self->_appleExtendedFeatureBitMask;
}

- (void)setAppleExtendedFeatureBitMask:(unint64_t)a3
{
  self->_appleExtendedFeatureBitMask = a3;
}

- (NSUUID)trustedUID
{
  return self->_trustedUID;
}

- (void)setTrustedUID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(id)a3
{
}

- (NSHashTable)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
}

- (NSHashTable)RFCOMMChannels
{
  return self->_RFCOMMChannels;
}

- (void)setRFCOMMChannels:(id)a3
{
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int64_t)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int64_t)a3
{
  self->_internalState = a3;
}

- (unsigned)connectionHandle
{
  return self->_connectionHandle;
}

- (void)setConnectionHandle:(unsigned __int16)a3
{
  self->_connectionHandle = a3;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void)setAddressString:(id)a3
{
}

- (unsigned)modeSupported
{
  return self->_modeSupported;
}

- (void)setModeSupported:(unsigned __int8)a3
{
  self->_modeSupported = a3;
}

- (BOOL)traceLogging
{
  return self->_traceLogging;
}

- (void)setTraceLogging:(BOOL)a3
{
  self->_traceLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_RFCOMMChannels, 0);
  objc_storeStrong((id *)&self->_L2CAPChannels, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_trustedUID, 0);
  objc_storeStrong((id *)&self->_aacpCapabilityBits, 0);
  objc_storeStrong((id *)&self->_sdpRecordData, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_syncGroups, 0);
  objc_storeStrong((id *)&self->_appleModelIdentifier, 0);
  objc_storeStrong(&self->_disconnectRFCOMMCallback, 0);
  objc_storeStrong(&self->_connectRFCOMMCallback, 0);
  objc_storeStrong(&self->_disconnectL2CAPCallback, 0);
  objc_storeStrong(&self->_connectL2CAPCallback, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)sendMsg:requiresConnected:args:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "WARNING: %@ is not a valid peer", v2, v3, v4, v5, v6);
}

- (void)sendMsg:requiresConnected:args:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: %@ can only accept commands while in the connected state", v2, v3, v4, v5, v6);
}

- (void)handleMsg:args:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_DEBUG, "%@ is not connected, ignoring message: %u", v2, 0x12u);
}

- (void)handlePeerUpdated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "No name or address", v1, 2u);
}

- (void)handlePeerUpdated:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 name];
  int v6 = 136315650;
  unint64_t v7 = "-[CBClassicPeer handlePeerUpdated:]";
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_1AB9F0000, a3, OS_LOG_TYPE_DEBUG, "%s - Received capability bits for “%@”: %@", (uint8_t *)&v6, 0x20u);
}

- (void)handleL2CAPChannelOpened:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "Failed to open L2CAP channel: %@", v2, v3, v4, v5, v6);
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[CBClassicPeer handleL2CAPChannelClosed:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "%s PSM: %u and result: %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)channelWithPSM:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AB9F0000, v0, v1, "No known channel on %@ with psm %u");
}

- (void)handleRFCOMMChannelOpened:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "Failed to open RFCOMM channel", v1, 2u);
}

- (void)channelWithID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AB9F0000, v0, v1, "No known channel on %@ with cid %u");
}

- (void)getConnectedServices
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  uint64_t v4 = [a2 identifier];
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 internalState];
  _os_log_error_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_ERROR, "Peer: %@ is not connected %ld", (uint8_t *)&v5, 0x16u);
}

- (void)openRFCOMMChannel:options:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: %@ Invalid RFCOMM CID", v2, v3, v4, v5, v6);
}

- (void)closeL2CAPChannel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: %@ Invalid L2CAP PSM", v2, v3, v4, v5, v6);
}

@end