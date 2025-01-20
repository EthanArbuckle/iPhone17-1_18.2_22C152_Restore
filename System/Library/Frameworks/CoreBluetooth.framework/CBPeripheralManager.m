@interface CBPeripheralManager
+ (BOOL)supportsFeatures:(unint64_t)a3;
+ (CBPeripheralManagerAuthorizationStatus)authorizationStatus;
+ (void)authorizationStatus;
- (BOOL)isAdvertising;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)readyForUpdates;
- (BOOL)supportsMultipleAdvertising;
- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals;
- (BOOL)waitingForReady;
- (CBPeripheralManager)init;
- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options;
- (NSHashTable)l2capChannels;
- (NSLock)updateLock;
- (NSMapTable)centrals;
- (NSMutableArray)services;
- (NSMutableDictionary)characteristicIDs;
- (NSNumber)multipleAdvertisingSupported;
- (id)addXPCDelayTiming:(id)a3 args:(id)a4;
- (id)centralWithIdentifier:(id)a3;
- (id)centralWithInfo:(id)a3;
- (id)delegate;
- (id)getNonConnectableIdentity;
- (id)incomingConnectionRequestCompletion;
- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4;
- (unint64_t)attributeIDGenerator;
- (void)HandleControllerPeripheralBTClockUpdateMsg:(id)a3;
- (void)HandleOfflineAdvPayloadRequestedWithReason:(id)a3;
- (void)addService:(CBMutableService *)service;
- (void)addressRotationState:(id)a3;
- (void)dealloc;
- (void)forEachCentral:(id)a3;
- (void)handleAdvertisingStarted:(id)a3;
- (void)handleAdvertisingStopped:(id)a3;
- (void)handleCentralDidUpdateANCSAuthorization:(id)a3;
- (void)handleConnectionParametersUpdated:(id)a3;
- (void)handleGetAttributeValue:(id)a3;
- (void)handleIncomingCISConnectionRequest:(id)a3;
- (void)handleL2CAPChannelClosed:(id)a3;
- (void)handleL2CAPChannelOpened:(id)a3;
- (void)handleL2CAPChannelPublished:(id)a3;
- (void)handleL2CAPChannelUnpublished:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handleNotificationAdded:(id)a3;
- (void)handleNotificationRemoved:(id)a3;
- (void)handlePeriodicAdvertisingStarted:(id)a3;
- (void)handlePeriodicAdvertisingStopped:(id)a3;
- (void)handleReadyForUpdates:(id)a3;
- (void)handleRestoringState:(id)a3;
- (void)handleServiceAdded:(id)a3;
- (void)handleSetAttributeValues:(id)a3;
- (void)handleSolicitedServicesFound:(id)a3;
- (void)handleSupportedFeatures:(id)a3;
- (void)incomingAddress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideLocalLeAddress:(id)a3;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 options:(id)a5;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 priority:(int64_t)a5;
- (void)publishL2CAPChannelWithEncryption:(BOOL)a3 priority:(int64_t)a4;
- (void)publishL2CAPChannelWithEncryption:(BOOL)encryptionRequired;
- (void)refreshNonConnectableIdentity;
- (void)removeAllL2CAPChannels;
- (void)removeAllServices;
- (void)removeService:(CBMutableService *)service;
- (void)requestStableAddress:(id)a3;
- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result;
- (void)respondToTransaction:(id)a3 value:(id)a4 attributeID:(id)a5 result:(int64_t)a6;
- (void)retrieveBluetoothUsageStatistics:(id)a3 completion:(id)a4;
- (void)setAttributeIDGenerator:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central;
- (void)setIncomingConnectionRequestCompletion:(id)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setMultipleAdvertisingSupported:(id)a3;
- (void)setOfflineAdvertisingParamsAndData:(id)a3;
- (void)startAdvertising:(NSDictionary *)advertisementData;
- (void)startPeriodicAdvertising:(id)a3;
- (void)stopAdvertising;
- (void)stopPeriodicAdvertising:(id)a3;
- (void)supportsMultipleAdvertising;
- (void)unpublishL2CAPChannel:(CBL2CAPPSM)PSM;
@end

@implementation CBPeripheralManager

- (void)stopAdvertising
{
}

- (void)startAdvertising:(NSDictionary *)advertisementData
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v22 = advertisementData;
  v3 = [(NSDictionary *)v22 allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v46;
    v20 = @"kCBAdvDataHashedServiceUUIDs";
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"kCBAdvDataTxPowerLevel", v20))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_11:
            -[CBPeripheralManager startAdvertising:](&v43, v44);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_11;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataManufacturerData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_15:
            -[CBPeripheralManager startAdvertising:](&v41, v42);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataTDSData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
LABEL_19:
            -[CBPeripheralManager startAdvertising:](&v39, v40);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_19;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataIsContact"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
LABEL_23:
            -[CBPeripheralManager startAdvertising:].cold.4(&v37, v38);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataServiceData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_27:
            -[CBPeripheralManager startAdvertising:].cold.5(&v35, v36);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataIsConnectable"])
        {
          v9 = [(NSDictionary *)v22 objectForKeyedSubscript:@"kCBMsgArgIsPrivilegedDaemon"];
          char v10 = [v9 BOOLValue];

          if (v10) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_32:
            -[CBPeripheralManager startAdvertising:].cold.6(&v33, v34);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
        }
        else if (([v8 isEqualToString:@"kCBAdvDataIsExtended"] & 1) != 0 {
               || [v8 isEqualToString:@"kCBAdvDataIsExtendedConnectable"])
        }
        {
          v11 = [(NSDictionary *)v22 objectForKeyedSubscript:@"kCBMsgArgIsPrivilegedDaemon"];
          char v12 = [v11 BOOLValue];

          if (v12) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_38:
            -[CBPeripheralManager startAdvertising:].cold.7(&v31, v32);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
        }
        else if ([v8 isEqualToString:@"kCBAdvDataIsTDS"])
        {
          v13 = [(NSDictionary *)v22 objectForKeyedSubscript:@"kCBMsgArgIsPrivilegedDaemon"];
          char v14 = [v13 BOOLValue];

          if (v14) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_43:
            -[CBPeripheralManager startAdvertising:].cold.8(&v29, v30);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
        }
        else if (([v8 isEqualToString:@"kCBAdvDataTDSData"] & 1) != 0 {
               || [v8 isEqualToString:@"kCBAdvertisementTDSTypeKey"])
        }
        {
          v15 = [(NSDictionary *)v22 objectForKeyedSubscript:@"kCBMsgArgIsPrivilegedDaemon"];
          char v16 = [v15 BOOLValue];

          if (v16) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_49:
            -[CBPeripheralManager startAdvertising:].cold.9(&v27, v28);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
        }
        else if (([v8 isEqualToString:@"kCBAdvDataRawBytesData"] & 1) != 0 {
               || ([v8 isEqualToString:@"kCBAdvDataRawBytesDataAdvInd"] & 1) != 0
        }
               || [v8 isEqualToString:@"kCBAdvDataRawBytesDataScanRsp"])
        {
          v17 = [(NSDictionary *)v22 objectForKeyedSubscript:@"kCBMsgArgIsPrivilegedDaemon"];
          char v18 = [v17 BOOLValue];

          if (v18) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_56:
            -[CBPeripheralManager startAdvertising:]0(&v25, v26);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_56;
          }
        }
        else
        {
          if (![v8 isEqualToString:v20]) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_66:
            -[CBPeripheralManager startAdvertising:]1(&v23, v24);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_66;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v5);
  }

  if (v22) {
    v19 = v22;
  }
  else {
    v19 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [(CBManager *)self sendMsg:32 args:v19];
}

- (void)handleAdvertisingStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (!v5) {
    [(CBPeripheralManager *)self setIsAdvertising:1];
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
  v7 = [NSNumber numberWithInt:341];
  int v8 = [v6 isEqualToNumber:v7];

  if (v8)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
    {
      -[CBPeripheralManager handleAdvertisingStarted:]();
      if ((*(unsigned char *)&self->_delegateFlags & 0x40) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v9 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
    char v10 = [NSNumber numberWithInt:348];
    int v11 = [v9 isEqualToNumber:v10];

    if (v11)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
      {
        -[CBPeripheralManager handleAdvertisingStarted:]();
        if ((*(unsigned char *)&self->_delegateFlags & 0x40) == 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
  }
  if ((*(unsigned char *)&self->_delegateFlags & 0x40) != 0)
  {
LABEL_14:
    char v12 = [(CBPeripheralManager *)self delegate];
    [v12 peripheralManagerDidStartAdvertising:self error:v5];
  }
LABEL_15:
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = v6;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      int v8 = [(CBManager *)self sharedPairingAgent];
      [v8 handlePairingMessage:v4 args:v7];

      goto LABEL_3;
    case 21:
      [(CBPeripheralManager *)self handleL2CAPChannelPublished:v6];

      break;
    case 22:
      [(CBPeripheralManager *)self handleL2CAPChannelUnpublished:v6];

      break;
    case 23:
      [(CBPeripheralManager *)self handleL2CAPChannelOpened:v6];

      break;
    case 24:
      [(CBPeripheralManager *)self handleL2CAPChannelClosed:v6];

      break;
    case 29:
      [(CBPeripheralManager *)self handleSupportedFeatures:v6];

      break;
    case 47:
      [(CBPeripheralManager *)self handleAdvertisingStarted:v6];

      break;
    case 48:
      [(CBPeripheralManager *)self handleAdvertisingStopped:v6];

      break;
    case 49:
      [(CBPeripheralManager *)self handlePeriodicAdvertisingStarted:v6];

      break;
    case 50:
      [(CBPeripheralManager *)self handlePeriodicAdvertisingStopped:v6];

      break;
    case 51:
      [(CBPeripheralManager *)self handleServiceAdded:v6];

      break;
    case 52:
      [(CBPeripheralManager *)self handleGetAttributeValue:v6];

      break;
    case 53:
      [(CBPeripheralManager *)self handleSetAttributeValues:v6];

      break;
    case 54:
      [(CBPeripheralManager *)self handleNotificationAdded:v6];

      break;
    case 55:
      [(CBPeripheralManager *)self handleNotificationRemoved:v6];

      break;
    case 56:
      [(CBPeripheralManager *)self handleReadyForUpdates:v6];

      break;
    case 57:
      [(CBPeripheralManager *)self handleRestoringState:v6];

      break;
    case 58:
      [(CBPeripheralManager *)self handleSolicitedServicesFound:v6];

      break;
    case 59:
      [(CBPeripheralManager *)self handleAdvertisingAddressChanged:v6];

      break;
    case 61:
      [(CBPeripheralManager *)self handleCentralDidUpdateANCSAuthorization:v6];

      break;
    case 62:
      [(CBPeripheralManager *)self HandleOfflineAdvPayloadRequestedWithReason:v6];

      break;
    case 157:
      [(CBPeripheralManager *)self handleIncomingCISConnectionRequest:v6];

      break;
    case 164:
    case 165:
    case 166:
      centrals = self->_centrals;
      char v10 = [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      int v11 = [(NSMapTable *)centrals objectForKey:v10];

      [v11 handleMsg:v4 args:v7];
      break;
    case 167:
      [(CBPeripheralManager *)self handleConnectionParametersUpdated:v6];

      break;
    case 210:
      [(CBPeripheralManager *)self HandleControllerPeripheralBTClockUpdateMsg:v6];

      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      char v12 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager handleMsg:args:](v4, v12);
      }
      else
      {
LABEL_3:
      }
      break;
  }
}

- (void)handleAdvertisingStopped:(id)a3
{
  id v5 = [MEMORY[0x1E4F28C58] errorWithInfo:a3];
  [(CBPeripheralManager *)self setIsAdvertising:0];
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    uint64_t v4 = [(CBPeripheralManager *)self delegate];
    [v4 peripheralManager:self didStopAdvertisingWithError:v5];
  }
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)centralWithInfo:(id)a3
{
  id v4 = a3;
  centrals = self->_centrals;
  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  v7 = [(NSMapTable *)centrals objectForKey:v6];

  if (!v7)
  {
    v7 = [(CBPeer *)[CBCentral alloc] initWithInfo:v4 manager:self];
    int v8 = self->_centrals;
    v9 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    [(NSMapTable *)v8 setObject:v7 forKey:v9];
  }
  char v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
  int v11 = v10;
  if (v10) {
    -[CBPeer setMtuLength:](v7, "setMtuLength:", [v10 unsignedIntegerValue]);
  }

  return v7;
}

- (void)forEachCentral:(id)a3
{
  int v8 = (void (**)(id, void *))a3;
  id v4 = [(NSMapTable *)self->_centrals objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      v8[2](v8, v6);
      uint64_t v7 = [v4 nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }
}

- (void)dealloc
{
  l2capChannels = self->_l2capChannels;
  if (l2capChannels) {
    [(NSHashTable *)l2capChannels removeAllObjects];
  }
  if (self->_observingKeyPaths)
  {
    [(CBPeripheralManager *)self removeObserver:self forKeyPath:@"delegate" context:objc_opt_class()];
    [(CBPeripheralManager *)self removeObserver:self forKeyPath:@"state" context:objc_opt_class()];
    [(CBPeripheralManager *)self removeObserver:self forKeyPath:@"localName" context:objc_opt_class()];
    self->_observingKeyPaths = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBPeripheralManager;
  [(CBManager *)&v4 dealloc];
}

- (id)centralWithIdentifier:(id)a3
{
  return [(NSMapTable *)self->_centrals objectForKey:a3];
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 priority:(int64_t)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  char v10 = @"kCBL2CAPChannelPriority";
  int v8 = [NSNumber numberWithInteger:a5];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(CBPeripheralManager *)self publishL2CAPChannel:v6 requiresEncryption:v5 options:v9];
}

- (void)publishL2CAPChannelWithEncryption:(BOOL)a3 priority:(int64_t)a4
{
  BOOL v4 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  int v8 = @"kCBL2CAPChannelPriority";
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [(CBPeripheralManager *)self publishL2CAPChannel:0 requiresEncryption:v4 options:v7];
}

- (void)publishL2CAPChannelWithEncryption:(BOOL)encryptionRequired
{
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4
{
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 options:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  v16[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:](v6, v5, v9);
  }
  v15[0] = @"kCBMsgArgPSM";
  char v10 = [NSNumber numberWithUnsignedShort:v6];
  v16[0] = v10;
  v15[1] = @"kCBMsgArgRequiresEncryption";
  uint64_t v11 = [NSNumber numberWithBool:v5];
  char v12 = (void *)v11;
  v15[2] = @"kCBMsgArgOptions";
  id v13 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v13 = v8;
  }
  v16[1] = v11;
  v16[2] = v13;
  char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [(CBManager *)self sendMsg:19 args:v14];
}

- (void)unpublishL2CAPChannel:(CBL2CAPPSM)PSM
{
  uint64_t v3 = PSM;
  v11[1] = *MEMORY[0x1E4F143B8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager unpublishL2CAPChannel:](v3, v6);
    if (v3) {
      goto LABEL_5;
    }
LABEL_7:
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 165, @"Invalid parameter not satisfying: %@", @"psm > 0" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v3) {
    goto LABEL_7;
  }
LABEL_5:
  char v10 = @"kCBMsgArgPSM";
  uint64_t v7 = [NSNumber numberWithUnsignedShort:v3];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(CBManager *)self sendMsg:20 args:v8];
}

- (void)overrideLocalLeAddress:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  BOOL v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager overrideLocalLeAddress:]((uint64_t)v4, v5);
  }
  v9 = @"kCBMsgArgAddressString";
  uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v7 = [v4 stringByTrimmingCharactersInSet:v6];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CBManager *)self sendMsg:60 args:v8];
}

- (void)addressRotationState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CBPeripheralManager_addressRotationState___block_invoke;
  v6[3] = &unk_1E5E310E0;
  id v7 = v4;
  id v5 = v4;
  [(CBManager *)self sendMsg:46 args:MEMORY[0x1E4F1CC08] withReply:v6];
}

void __44__CBPeripheralManager_addressRotationState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (a3)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a3, 0);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v5];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v8);
  }
}

- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_l2capChannels;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      char v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      id v13 = objc_msgSend(v12, "peer", (void)v17);
      if ([v13 isEqual:v6])
      {
        int v14 = [v12 PSM];

        if (v14 == v4)
        {
          id v15 = v12;

          goto LABEL_17;
        }
      }
      else
      {
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (!v9) {
          break;
        }
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBPeripheralManager l2capChannelForPeer:withPsm:]();
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (void)removeAllL2CAPChannels
{
}

- (void)refreshNonConnectableIdentity
{
}

- (void)requestStableAddress:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CBPeripheralManager_requestStableAddress___block_invoke;
  v6[3] = &unk_1E5E310E0;
  id v7 = v4;
  id v5 = v4;
  [(CBManager *)self sendMsg:45 args:MEMORY[0x1E4F1CC08] withReply:v6];
}

void __44__CBPeripheralManager_requestStableAddress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:a2];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
}

- (id)getNonConnectableIdentity
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  v2 = [(CBManager *)self sendSyncMsg:162 args:0];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"kCBMsgArgIdentityIRK"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"kCBMsgArgIdentityAddress"];
  uint64_t v5 = (void *)v4;
  id v6 = 0;
  if (v4 && v3)
  {
    v8[0] = @"kCBMsgArgIdentityAddress";
    v8[1] = @"kCBMsgArgIdentityIRK";
    v9[0] = v4;
    v9[1] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  }

  return v6;
}

+ (CBPeripheralManagerAuthorizationStatus)authorizationStatus
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    +[CBPeripheralManager authorizationStatus]();
  }
  return 3;
}

- (CBPeripheralManager)init
{
  return [(CBPeripheralManager *)self initWithDelegate:0 queue:0];
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  v13[1] = *MEMORY[0x1E4F143B8];
  char v12 = @"kCBInitOptionShowPowerAlert";
  v13[0] = MEMORY[0x1E4F1CC38];
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = queue;
  id v8 = delegate;
  uint64_t v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = [(CBPeripheralManager *)self initWithDelegate:v8 queue:v7 options:v9];

  return v10;
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  uint64_t v9 = delegate;
  uint64_t v10 = queue;
  uint64_t v11 = options;
  char v12 = [MEMORY[0x1E4F28F80] processInfo];
  id v13 = [v12 environment];
  int v14 = [v13 objectForKeyedSubscript:@"XCTestConfigurationFilePath"];
  if (v14)
  {

LABEL_3:
    goto LABEL_14;
  }
  int v15 = _os_feature_enabled_impl();

  if (v15
    && +[CBManager tccAvailable]
    && +[CBManager preflightCheckForTCC] == 2)
  {
    char v16 = [MEMORY[0x1E4F28B50] mainBundle];
    char v12 = [v16 objectForInfoDictionaryKey:@"NSAccessorySetupKitSupports"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v12 containsObject:@"Bluetooth"]) {
      goto LABEL_3;
    }
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheralManager initWithDelegate:queue:options:](v9);
    }
    abort_with_payload();
  }
LABEL_14:
  v42.receiver = self;
  v42.super_class = (Class)CBPeripheralManager;
  long long v17 = [(CBManager *)&v42 initInternal];
  if (v17)
  {
    SEL v41 = a2;
    [(CBPeripheralManager *)v17 addObserver:v17 forKeyPath:@"state" options:0 context:objc_opt_class()];
    [(CBPeripheralManager *)v17 addObserver:v17 forKeyPath:@"delegate" options:0 context:objc_opt_class()];
    [(CBPeripheralManager *)v17 addObserver:v17 forKeyPath:@"localName" options:0 context:objc_opt_class()];
    int v18 = 1;
    v17->_observingKeyPaths = 1;
    [(CBPeripheralManager *)v17 setDelegate:v9];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    centrals = v17->_centrals;
    v17->_centrals = (NSMapTable *)v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    services = v17->_services;
    v17->_services = v21;

    char v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    characteristicIDs = v17->_characteristicIDs;
    v17->_characteristicIDs = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    l2capChannels = v17->_l2capChannels;
    v17->_l2capChannels = (NSHashTable *)v25;

    char v27 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    updateLock = v17->_updateLock;
    v17->_updateLock = v27;

    *(_WORD *)&v17->_readyForUpdates = 1;
    v17->_attributeIDGenerator = 1;
    [(CBManager *)v17 setTccComplete:0];
    char v29 = [MEMORY[0x1E4F28B50] mainBundle];
    v30 = [v29 objectForInfoDictionaryKey:@"UIBackgroundModes"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v30 containsObject:@"bluetooth-peripheral"]) {
        int v18 = 0;
      }
      else {
        int v18 = [v30 containsObject:@"bluetooth"] ^ 1;
      }
    }
    char v31 = [(NSDictionary *)v11 objectForKeyedSubscript:@"kCBInitOptionRestoreIdentifier"];

    $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = v17->_delegateFlags;
    char v33 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
    uint64_t v34 = [(CBManager *)v17 getCBPrivacySupported];
    char v35 = [NSNumber numberWithBool:v34];
    [v33 setObject:v35 forKey:@"kCBManagerPrivacySupported"];

    if (!v31)
    {
      if (*(unsigned char *)&delegateFlags)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        char v37 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          -[CBPeripheralManager initWithDelegate:queue:options:]((uint64_t)v17, v37);
        }
      }
      goto LABEL_28;
    }
    if (*(unsigned char *)&delegateFlags)
    {
      if (!v18)
      {
LABEL_28:
        v38 = (void *)[v33 copy];
        [(CBManager *)v17 startWithQueue:v10 options:v38 sessionType:1];

        goto LABEL_29;
      }
    }
    else
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:v41, v17, @"CBPeripheralManager.m", 329, @"%@ has provided a restore identifier but the delegate doesn't implement the peripheralManager:willRestoreState: method", v17 object file lineNumber description];

      if (!v18) {
        goto LABEL_28;
      }
    }
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v41, v17, @"CBPeripheralManager.m", 331, @"State restoration of CBPeripheralManager is only allowed for applications that have specified the \"bluetooth-peripheral\" background mode", v17);

    goto LABEL_28;
  }
LABEL_29:

  return v17;
}

- (void)incomingAddress:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"kCBMsgArgAddressBytes";
  v8[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(CBManager *)self sendMsg:44 args:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if ([(CBManager *)self state] == CBManagerStatePoweredOn || [(CBManager *)self state] == 10)
      {
        [(NSLock *)self->_updateLock lock];
        self->_readyForUpdates = 1;
        self->_waitingForReady = 0;
        [(NSLock *)self->_updateLock unlock];
      }
      else
      {
        v54 = self->_services;
        objc_sync_enter(v54);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v55 = self->_services;
        uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v62 != v57) {
                objc_enumerationMutation(v55);
              }
              [*(id *)(*((void *)&v61 + 1) + 8 * i) handlePowerNotOn];
            }
            uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v56);
        }

        objc_sync_exit(v54);
        [(CBPeripheralManager *)self forEachCentral:&__block_literal_global_6];
        [(NSMapTable *)self->_centrals removeAllObjects];
        [(CBPeripheralManager *)self setIsAdvertising:0];
        if ([(CBManager *)self state] == CBManagerStateResetting)
        {
          v59 = self->_services;
          objc_sync_enter(v59);
          [(NSMutableArray *)self->_services removeAllObjects];
          [(NSMutableDictionary *)self->_characteristicIDs removeAllObjects];
          objc_sync_exit(v59);
        }
      }
      id v13 = [(CBPeripheralManager *)self delegate];
      [v13 peripheralManagerDidUpdateState:self];
    }
    else if ([v10 isEqualToString:@"delegate"])
    {
      int v14 = [(CBPeripheralManager *)self delegate];
      p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = &self->_delegateFlags;
      self->_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

      char v16 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v17 = 2;
      }
      else {
        int v17 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v17);

      int v18 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v19 = 4;
      }
      else {
        int v19 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFFB | v19);

      long long v20 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v21 = 8;
      }
      else {
        int v21 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFF7 | v21);

      uint64_t v22 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v23 = 16;
      }
      else {
        int v23 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFEF | v23);

      v24 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v25 = 32;
      }
      else {
        int v25 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFDF | v25);

      v26 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v27 = 64;
      }
      else {
        int v27 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFBF | v27);

      v28 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v29 = 128;
      }
      else {
        int v29 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFF7F | v29);

      v30 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v31 = 256;
      }
      else {
        int v31 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFEFF | v31);

      v32 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v33 = 512;
      }
      else {
        int v33 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFDFF | v33);

      uint64_t v34 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v35 = 1024;
      }
      else {
        int v35 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFBFF | v35);

      v36 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v37 = 2048;
      }
      else {
        int v37 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFF7FF | v37);

      v38 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v39 = 4096;
      }
      else {
        int v39 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFEFFF | v39);

      v40 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v41 = 0x2000;
      }
      else {
        int v41 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFDFFF | v41);

      objc_super v42 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v43 = 0x4000;
      }
      else {
        int v43 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFBFFF | v43);

      v44 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v45 = 0x8000;
      }
      else {
        int v45 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFF7FFF | v45);

      long long v46 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v47 = 0x10000;
      }
      else {
        int v47 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFEFFFF | v47);

      long long v48 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v49 = 0x20000;
      }
      else {
        int v49 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFDFFFF | v49);

      uint64_t v50 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v51 = 0x40000;
      }
      else {
        int v51 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFBFFFF | v51);

      v52 = [(CBPeripheralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v53 = 0x80000;
      }
      else {
        int v53 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFF7FFFF | v53);
    }
  }
  else
  {
    v60.receiver = self;
    v60.super_class = (Class)CBPeripheralManager;
    [(CBPeripheralManager *)&v60 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __70__CBPeripheralManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMtuLength:23];
}

- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v7 = central;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 411, @"Invalid parameter not satisfying: %@", @"central != nil" object file lineNumber description];
  }
  v12[0] = @"kCBMsgArgDeviceUUID";
  id v8 = [(CBPeer *)v7 identifier];
  v12[1] = @"kCBMsgArgConnectionLatency";
  v13[0] = v8;
  uint64_t v9 = [NSNumber numberWithInteger:latency];
  v13[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [(CBManager *)self sendMsg:163 args:v10];
}

- (void)startPeriodicAdvertising:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }
  [(CBManager *)self sendMsg:34 args:v3];
}

- (void)stopPeriodicAdvertising:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }
  [(CBManager *)self sendMsg:35 args:v3];
}

- (void)addService:(CBMutableService *)service
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = service;
  long long v61 = v3;
  if (!v3)
  {
    uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 509, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];

    id v3 = 0;
  }
  uint64_t v4 = [(CBAttribute *)v3 UUID];
  id v5 = [v4 data];
  if ([v5 length] == 2)
  {
  }
  else
  {
    id v6 = [(CBAttribute *)v61 UUID];
    id v7 = [v6 data];
    uint64_t v8 = [v7 length];

    if (v8 == 16) {
      goto LABEL_8;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 510, @"Invalid parameter not satisfying: %@", @"service.UUID.data.length == 2 || service.UUID.data.length == 16" object file lineNumber description];
  }

LABEL_8:
  v59 = self->_services;
  objc_sync_enter(v59);
  if ([(NSMutableArray *)self->_services indexOfObject:v61] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:514 description:@"Services cannot be added more than once"];
  }
  uint64_t v9 = NSNumber;
  ++self->_attributeIDGenerator;
  id v10 = objc_msgSend(v9, "numberWithUnsignedInteger:");
  [(CBMutableService *)v61 setID:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v12 = [(CBMutableService *)v61 ID];
  id v13 = [(CBAttribute *)v61 UUID];
  int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CBService isPrimary](v61, "isPrimary"));
  objc_super v60 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, @"kCBMsgArgAttributeID", v13, @"kCBMsgArgUUID", v14, @"kCBMsgArgType", 0);

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v60 setObject:v15 forKeyedSubscript:@"kCBMsgArgAttributeIDs"];
  v70 = v15;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  char v16 = [(CBService *)v61 includedServices];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if ([(NSMutableArray *)self->_services indexOfObject:v20] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 529, @"Included services must be published before the service(s) that reference them (%@)", v20 object file lineNumber description];
        }
        int v21 = [v20 ID];
        [v70 addObject:v21];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v17);
  }

  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v60 setObject:v65 forKeyedSubscript:@"kCBMsgArgCharacteristics"];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  int v23 = [(CBService *)v61 characteristics];
  uint64_t v66 = [v23 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v81;
    id obj = v23;
    do
    {
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v81 != v64) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v80 + 1) + 8 * j);
        int v25 = [v24 value];
        if (v25)
        {
          if ([v24 properties] != 2 || (objc_msgSend(v24, "permissions") & 2) != 0)
          {

LABEL_30:
            int v27 = [MEMORY[0x1E4F28B00] currentHandler];
            [v27 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:539 description:@"Characteristics with cached values must be read-only"];

            goto LABEL_31;
          }
          BOOL v26 = ([v24 permissions] & 8) == 0;

          if (!v26) {
            goto LABEL_30;
          }
        }
LABEL_31:
        v28 = [(NSMutableDictionary *)self->_characteristicIDs allKeysForObject:v24];
        BOOL v29 = [v28 count] == 0;

        if (!v29)
        {
          int v49 = [MEMORY[0x1E4F28B00] currentHandler];
          [v49 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:543 description:@"Characteristics cannot be added more than once"];
        }
        v30 = NSNumber;
        ++self->_attributeIDGenerator;
        int v31 = objc_msgSend(v30, "numberWithUnsignedInteger:");
        [v24 setID:v31];

        id v32 = objc_alloc(MEMORY[0x1E4F1CA60]);
        int v33 = [v24 ID];
        uint64_t v34 = [v24 UUID];
        int v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "properties"));
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "permissions"));
        int v37 = [v24 value];
        v38 = v37;
        if (!v37)
        {
          v67 = [MEMORY[0x1E4F1CA98] null];
          v38 = v67;
        }
        v69 = objc_msgSend(v32, "initWithObjectsAndKeys:", v33, @"kCBMsgArgAttributeID", v34, @"kCBMsgArgUUID", v35, @"kCBMsgArgCharacteristicProperties", v36, @"kCBMsgArgAttributePermissions", v38, @"kCBMsgArgData", 0);
        if (!v37) {

        }
        id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v69 setObject:v39 forKeyedSubscript:@"kCBMsgArgDescriptors"];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v40 = [v24 descriptors];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v77 != v42) {
                objc_enumerationMutation(v40);
              }
              v44 = *(void **)(*((void *)&v76 + 1) + 8 * k);
              id v45 = objc_alloc(MEMORY[0x1E4F1CA60]);
              long long v46 = [v44 UUID];
              int v47 = [v44 value];
              long long v48 = objc_msgSend(v45, "initWithObjectsAndKeys:", v46, @"kCBMsgArgUUID", v47, @"kCBMsgArgData", 0);

              [v39 addObject:v48];
            }
            uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }
          while (v41);
        }

        [v65 addObject:v69];
      }
      int v23 = obj;
      uint64_t v66 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v66);
  }

  if ([(CBManager *)self sendMsg:36 args:v60])
  {
    [(NSMutableArray *)self->_services addObject:v61];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v50 = [(CBService *)v61 characteristics];
    uint64_t v51 = [v50 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v73;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v73 != v52) {
            objc_enumerationMutation(v50);
          }
          v54 = *(void **)(*((void *)&v72 + 1) + 8 * m);
          characteristicIDs = self->_characteristicIDs;
          uint64_t v56 = [v54 ID];
          [(NSMutableDictionary *)characteristicIDs setObject:v54 forKeyedSubscript:v56];
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v51);
    }
  }
  objc_sync_exit(v59);
}

- (void)removeService:(CBMutableService *)service
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = service;
  if (!v4)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 579, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];
  }
  v36 = self->_services;
  objc_sync_enter(v36);
  services = self->_services;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __37__CBPeripheralManager_removeService___block_invoke;
  v49[3] = &unk_1E5E34100;
  id v6 = v4;
  uint64_t v50 = v6;
  uint64_t v7 = [(NSMutableArray *)services indexOfObjectPassingTest:v49];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v9 = v7;
    uint64_t v8 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:v7];
    uint64_t v32 = v9;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = self->_services;
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v10)
    {
      uint64_t v33 = *(void *)v46;
      do
      {
        uint64_t v31 = v10;
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v13 = [v12 includedServices];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v42 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = [*(id *)(*((void *)&v41 + 1) + 8 * j) ID];
                uint64_t v18 = [v8 ID];
                int v19 = [v17 isEqualToNumber:v18];

                if (v19)
                {

                  long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v20 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:607 description:@"Cannot remove a service that is still included by one or more published services"];
                  goto LABEL_22;
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v10);
    }
    long long v20 = obj;
LABEL_22:

    uint64_t v52 = @"kCBMsgArgAttributeID";
    int v21 = [v8 ID];
    int v53 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    BOOL v23 = [(CBManager *)self sendMsg:37 args:v22];

    if (v23)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v24 = [v8 characteristics];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v24);
            }
            characteristicIDs = self->_characteristicIDs;
            BOOL v29 = [*(id *)(*((void *)&v37 + 1) + 8 * k) ID];
            [(NSMutableDictionary *)characteristicIDs removeObjectForKey:v29];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v51 count:16];
        }
        while (v25);
      }

      [(NSMutableArray *)self->_services removeObjectAtIndex:v32];
    }
  }

  objc_sync_exit(v36);
}

uint64_t __37__CBPeripheralManager_removeService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 ID];
  uint64_t v4 = [*(id *)(a1 + 32) ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

- (void)removeAllServices
{
  id obj = self->_services;
  objc_sync_enter(obj);
  if ([(CBManager *)self sendMsg:38 args:0])
  {
    [(NSMutableDictionary *)self->_characteristicIDs removeAllObjects];
    [(NSMutableArray *)self->_services removeAllObjects];
  }
  objc_sync_exit(obj);
}

- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result
{
  uint64_t v7 = request;
  id v13 = v7;
  if (v7)
  {
    if ([(CBATTRequest *)v7 ignoreResponse]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 630, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

  if (([0 ignoreResponse] & 1) == 0)
  {
LABEL_3:
    uint64_t v8 = [(CBATTRequest *)v13 transactionID];
    uint64_t v9 = [(CBATTRequest *)v13 value];
    uint64_t v10 = [(CBATTRequest *)v13 characteristic];
    id v11 = [v10 ID];
    [(CBPeripheralManager *)self respondToTransaction:v8 value:v9 attributeID:v11 result:result];
  }
LABEL_4:
}

- (void)respondToTransaction:(id)a3 value:(id)a4 attributeID:(id)a5 result:(int64_t)a6
{
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  uint64_t v15 = v12;
  if (!v12)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  char v16 = [NSNumber numberWithInteger:a6];
  id v17 = (id)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, @"kCBMsgArgTransactionID", v15, @"kCBMsgArgData", v11, @"kCBMsgArgAttributeID", v16, @"kCBMsgArgResult", 0);

  if (!v12) {
  [(CBManager *)self sendMsg:39 args:v17];
  }
}

- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = value;
  uint64_t v10 = characteristic;
  id v11 = centrals;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 652, @"Invalid parameter not satisfying: %@", @"value != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 653, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];

LABEL_3:
  [(NSLock *)self->_updateLock lock];
  BOOL readyForUpdates = self->_readyForUpdates;
  if (self->_readyForUpdates)
  {
    self->_BOOL readyForUpdates = 0;
    [(NSLock *)self->_updateLock unlock];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v26 = v11;
    id v14 = v11;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = [*(id *)(*((void *)&v27 + 1) + 8 * i) identifier];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
    int v21 = [(CBMutableCharacteristic *)v10 ID];
    uint64_t v22 = objc_msgSend(v20, "initWithObjectsAndKeys:", v13, @"kCBMsgArgUUIDs", v9, @"kCBMsgArgData", v21, @"kCBMsgArgAttributeID", 0);

    [(CBManager *)self sendMsg:40 args:v22];
    id v11 = v26;
  }
  else
  {
    self->_waitingForReady = 1;
    [(NSLock *)self->_updateLock unlock];
  }

  return readyForUpdates;
}

- (BOOL)supportsMultipleAdvertising
{
  id v3 = [(CBPeripheralManager *)self multipleAdvertisingSupported];

  if (!v3)
  {
    uint64_t v4 = [(CBManager *)self sendSyncMsg:41 args:0];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgData"];
    uint64_t v6 = [v5 BOOLValue];

    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      [(CBPeripheralManager *)v6 supportsMultipleAdvertising];
    }
    uint64_t v8 = [NSNumber numberWithBool:v6];
    [(CBPeripheralManager *)self setMultipleAdvertisingSupported:v8];
  }
  uint64_t v9 = [(CBPeripheralManager *)self multipleAdvertisingSupported];
  char v10 = [v9 BOOLValue];

  return v10;
}

+ (BOOL)supportsFeatures:(unint64_t)a3
{
  return (a3 & ~(unint64_t)gSupportedFeatures_0) == 0;
}

- (void)setOfflineAdvertisingParamsAndData:(id)a3
{
}

- (void)retrieveBluetoothUsageStatistics:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke;
  v7[3] = &unk_1E5E310E0;
  id v8 = v5;
  id v6 = v5;
  [(CBManager *)self sendMsg:218 args:&unk_1F0302200 withReply:v7];
}

void __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v12 = objc_alloc_init(v5);
  id v8 = [v7 objectForKeyedSubscript:@"kCBUsageStatsLePercent"];
  [v12 setObject:v8 forKeyedSubscript:@"kCBUsageStatsLePercent"];

  uint64_t v9 = [v7 objectForKeyedSubscript:@"kCBUsageStatsClPercent"];
  [v12 setObject:v9 forKeyedSubscript:@"kCBUsageStatsClPercent"];

  char v10 = [v7 objectForKeyedSubscript:@"kCBUsageStatsIsAudioStreaming"];
  [v12 setObject:v10 forKeyedSubscript:@"kCBUsageStatsIsAudioStreaming"];

  id v11 = [v7 objectForKeyedSubscript:@"kCBUsageStatsTimeStampNsMonotonic"];

  [v12 setObject:v11 forKeyedSubscript:@"kCBUsageStatsTimeStampNsMonotonic"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleRestoringState:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((*(unsigned char *)&self->_delegateFlags & 1) == 0)
  {
    int v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:724 description:@"Registered delegate no longer supports restoring"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v64 = [v5 objectForKeyedSubscript:@"kCBMsgArgSubscribedHandles"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v5 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];
  if (v8)
  {
    [v6 setObject:v8 forKeyedSubscript:@"kCBRestoredAdvertisement"];
    [(CBPeripheralManager *)self setIsAdvertising:1];
  }
  v54 = (void *)v8;
  v55 = v6;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v56 = v5;
  id obj = [v5 objectForKeyedSubscript:@"kCBMsgArgServices"];
  id v65 = self;
  long long v61 = v7;
  uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v91;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v91 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v9;
        char v10 = *(void **)(*((void *)&v90 + 1) + 8 * v9);
        id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = [[CBMutableService alloc] initWithDictionary:v10];
        [(NSMutableArray *)self->_services addObject:v11];
        id v12 = [(CBMutableService *)v11 ID];
        unint64_t v13 = [v12 unsignedIntegerValue];
        unint64_t attributeIDGenerator = self->_attributeIDGenerator;

        if (v13 > attributeIDGenerator)
        {
          uint64_t v15 = [(CBMutableService *)v11 ID];
          self->_unint64_t attributeIDGenerator = [v15 unsignedIntegerValue];
        }
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        uint64_t v16 = [v10 objectForKeyedSubscript:@"kCBMsgArgIncludedServices"];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v87 != v19) {
                objc_enumerationMutation(v16);
              }
              int v21 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              v98[0] = v11;
              v97[0] = @"service";
              v97[1] = @"incID";
              uint64_t v22 = [v21 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
              v98[1] = v22;
              BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
              [v63 addObject:v23];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v99 count:16];
          }
          while (v18);
        }

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v62 = [v10 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
        v24 = v67;
        uint64_t v68 = [v62 countByEnumeratingWithState:&v82 objects:v96 count:16];
        if (v68)
        {
          uint64_t v66 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v83 != v66) {
                objc_enumerationMutation(v62);
              }
              uint64_t v26 = *(void **)(*((void *)&v82 + 1) + 8 * j);
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v28 = [[CBMutableCharacteristic alloc] initWithService:v11 dictionary:v26];
              characteristicIDs = self->_characteristicIDs;
              long long v30 = [(CBMutableCharacteristic *)v28 ID];
              [(NSMutableDictionary *)characteristicIDs setObject:v28 forKeyedSubscript:v30];

              uint64_t v31 = [(CBMutableCharacteristic *)v28 ID];
              unint64_t v32 = [v31 unsignedIntegerValue];
              unint64_t v33 = self->_attributeIDGenerator;

              if (v32 > v33)
              {
                uint64_t v34 = [(CBMutableCharacteristic *)v28 ID];
                self->_unint64_t attributeIDGenerator = [v34 unsignedIntegerValue];
              }
              v80[0] = MEMORY[0x1E4F143A8];
              v80[1] = 3221225472;
              v80[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke;
              v80[3] = &unk_1E5E34128;
              v80[4] = self;
              int v35 = v28;
              long long v81 = v35;
              [v64 enumerateObjectsUsingBlock:v80];
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              v36 = [v26 objectForKeyedSubscript:@"kCBMsgArgDescriptors"];
              uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v95 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v77;
                do
                {
                  for (uint64_t k = 0; k != v38; ++k)
                  {
                    if (*(void *)v77 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    long long v41 = [[CBMutableDescriptor alloc] initWithCharacteristic:v35 dictionary:*(void *)(*((void *)&v76 + 1) + 8 * k)];
                    [v27 addObject:v41];
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v76 objects:v95 count:16];
                }
                while (v38);
              }

              if ([v27 count]) {
                [(CBCharacteristic *)v35 setDescriptors:v27];
              }
              v24 = v67;
              [v67 addObject:v35];

              self = v65;
            }
            uint64_t v68 = [v62 countByEnumeratingWithState:&v82 objects:v96 count:16];
          }
          while (v68);
        }

        if ([v24 count]) {
          [(CBService *)v11 setCharacteristics:v24];
        }
        [v61 addObject:v11];

        uint64_t v9 = v60 + 1;
      }
      while (v60 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v59);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v42 = v63;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v73;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v73 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = *(void **)(*((void *)&v72 + 1) + 8 * m);
        long long v48 = [v47 objectForKeyedSubscript:@"service"];
        int v49 = [v47 objectForKeyedSubscript:@"incID"];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke_2;
        v69[3] = &unk_1E5E34128;
        id v70 = v49;
        id v71 = v48;
        id v50 = v48;
        id v51 = v49;
        [v61 enumerateObjectsUsingBlock:v69];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v94 count:16];
    }
    while (v44);
  }

  if ([v61 count])
  {
    [v55 setObject:v61 forKeyedSubscript:@"kCBRestoredServices"];
    v65->_attributeIDGenerator += 16;
  }
  uint64_t v52 = [(CBPeripheralManager *)v65 delegate];
  [v52 peripheralManager:v65 willRestoreState:v55];
}

void __44__CBPeripheralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  uint64_t v4 = [*(id *)(a1 + 32) centralWithInfo:v3];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) ID];
    int v6 = [v7 isEqualToNumber:v5];

    if (v6) {
      [*(id *)(a1 + 40) handleCentralSubscribed:v4];
    }
  }
}

void __44__CBPeripheralManager_handleRestoringState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v6 = [v11 ID];
  int v7 = [v6 isEqualToNumber:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) includedServices];
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) includedServices];
      id v10 = (id)[v9 mutableCopy];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }

    [v10 addObject:v11];
    [*(id *)(a1 + 40) setIncludedServices:v10];
    *a4 = 1;
  }
}

- (void)handleServiceAdded:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  int v6 = self->_services;
  objc_sync_enter(v6);
  services = self->_services;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__CBPeripheralManager_handleServiceAdded___block_invoke;
  v23[3] = &unk_1E5E34100;
  id v17 = v5;
  id v24 = v17;
  uint64_t v8 = [(NSMutableArray *)services indexOfObjectPassingTest:v23];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:v8];
    if (v18)
    {
      [(NSMutableArray *)self->_services removeObjectAtIndex:v8];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v9 = [v16 characteristics];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v9);
            }
            characteristicIDs = self->_characteristicIDs;
            id v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) ID];
            [(NSMutableDictionary *)characteristicIDs removeObjectForKey:v14];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v10);
      }
    }
    if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
    {
      uint64_t v15 = [(CBPeripheralManager *)self delegate];
      [v15 peripheralManager:self didAddService:v16 error:v18];
    }
  }

  objc_sync_exit(v6);
}

uint64_t __42__CBPeripheralManager_handleServiceAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 ID];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (void)handleGetAttributeValue:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 objectForKeyedSubscript:@"kCBMsgArgTransactionID"];
  id v5 = [v14 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  int v6 = [v14 objectForKeyedSubscript:@"kCBMsgArgOffset"];
  int v7 = self->_services;
  objc_sync_enter(v7);
  uint64_t v8 = [CBATTRequest alloc];
  uint64_t v9 = [(CBPeripheralManager *)self centralWithInfo:v14];
  uint64_t v10 = [(NSMutableDictionary *)self->_characteristicIDs objectForKeyedSubscript:v5];
  uint64_t v11 = -[CBATTRequest initWithCentral:characteristic:offset:transactionID:](v8, "initWithCentral:characteristic:offset:transactionID:", v9, v10, [v6 unsignedIntegerValue], v4);

  id v12 = [(CBATTRequest *)v11 characteristic];

  if (v12)
  {
    if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
    {
      unint64_t v13 = [(CBPeripheralManager *)self delegate];
      [v13 peripheralManager:self didReceiveReadRequest:v11];
    }
    else
    {
      [(CBPeripheralManager *)self respondToRequest:v11 withResult:6];
    }
  }
  else
  {
    [(CBPeripheralManager *)self respondToTransaction:v4 value:0 attributeID:v5 result:10];
  }

  objc_sync_exit(v7);
}

- (void)handleSetAttributeValues:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v24 = -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:");
  uint64_t v25 = [v22 objectForKeyedSubscript:@"kCBMsgArgTransactionID"];
  uint64_t v4 = [v22 objectForKeyedSubscript:@"kCBMsgArgATTWrites"];
  long long v21 = self->_services;
  objc_sync_enter(v21);
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"kCBMsgArgAttributeID", v21);
      uint64_t v11 = [(NSMutableDictionary *)self->_characteristicIDs objectForKeyedSubscript:v10];
      id v12 = [v9 objectForKeyedSubscript:@"kCBMsgArgOffset"];
      uint64_t v13 = [v12 unsignedIntegerValue];

      id v14 = [(CBATTRequest *)v5 characteristic];
      if (v11 == v14)
      {
        BOOL v15 = v13 == [(CBATTRequest *)v5 endOffset];

        if (v15) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      uint64_t v16 = [[CBATTRequest alloc] initWithCentral:v24 characteristic:v11 offset:v13 transactionID:v25];

      [v26 addObject:v16];
      id v5 = v16;
LABEL_10:
      id v17 = [v9 objectForKeyedSubscript:@"kCBMsgArgData"];
      [(CBATTRequest *)v5 appendValueData:v17];

      uint64_t v18 = [v9 objectForKeyedSubscript:@"kCBMsgArgIgnoreResponse"];
      -[CBATTRequest setIgnoreResponse:](v5, "setIgnoreResponse:", [v18 BOOLValue]);

      long long v19 = [(CBATTRequest *)v5 characteristic];
      LODWORD(v18) = v19 == 0;

      if (v18)
      {
        if (![(CBATTRequest *)v5 ignoreResponse]) {
          [(CBPeripheralManager *)self respondToTransaction:v25 value:0 attributeID:v10 result:10];
        }
        goto LABEL_18;
      }
      if ((*(unsigned char *)&self->_delegateFlags & 8) == 0)
      {
        [(CBPeripheralManager *)self respondToRequest:v5 withResult:6];
LABEL_18:

        long long v20 = obj;
        goto LABEL_19;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v20 = [(CBPeripheralManager *)self delegate];
  [v20 peripheralManager:self didReceiveWriteRequests:v26];
LABEL_19:

  objc_sync_exit(v21);
}

- (void)handleNotificationAdded:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CBPeripheralManager *)self centralWithInfo:v9];
  id v5 = [v9 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  uint64_t v6 = self->_services;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)self->_characteristicIDs objectForKeyedSubscript:v5];
  if ([v7 handleCentralSubscribed:v4] && (*(unsigned char *)&self->_delegateFlags & 0x10) != 0)
  {
    uint64_t v8 = [(CBPeripheralManager *)self delegate];
    [v8 peripheralManager:self central:v4 didSubscribeToCharacteristic:v7];
  }
  objc_sync_exit(v6);
}

- (void)handleNotificationRemoved:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v26 = self;
  uint64_t v4 = [(CBPeripheralManager *)self centralWithInfo:v25];
  id v24 = [v25 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  BOOL v23 = self->_services;
  objc_sync_enter(v23);
  id v5 = [(NSMutableDictionary *)self->_characteristicIDs objectForKeyedSubscript:v24];
  uint64_t v6 = v5;
  if (v5) {
    int v7 = [v5 handleCentralUnsubscribed:v4] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  char v21 = v7;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = self->_services;
  uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  id v22 = v6;
  if (!v8)
  {

LABEL_31:
    [v4 setMtuLength:23];
    goto LABEL_32;
  }
  uint64_t v28 = *(void *)v40;
  uint64_t v29 = v8;
  char v9 = 1;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v40 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v11 = [v10 characteristics];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v11);
            }
            BOOL v15 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            uint64_t v16 = [v15 subscribedCentrals];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v32;
              while (2)
              {
                for (uint64_t k = 0; k != v17; ++k)
                {
                  if (*(void *)v32 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  if ([*(id *)(*((void *)&v31 + 1) + 8 * k) isEqual:v4])
                  {
                    char v9 = 0;
                    goto LABEL_24;
                  }
                }
                uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_24:
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v12);
      }
    }
    uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v29);

  if (v9) {
    goto LABEL_31;
  }
LABEL_32:
  if ((v21 & 1) == 0 && (*(unsigned char *)&v26->_delegateFlags & 0x20) != 0)
  {
    long long v20 = [(CBPeripheralManager *)v26 delegate];
    [v20 peripheralManager:v26 central:v4 didUnsubscribeFromCharacteristic:v22];
  }
  objc_sync_exit(v23);
}

- (void)handlePeriodicAdvertisingStarted:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithInfo:a3];
  if ((*(unsigned char *)&self->_delegateFlags & 0x80) != 0)
  {
    id v6 = v4;
    id v5 = [(CBPeripheralManager *)self delegate];
    [v5 peripheralManager:self didStartPeriodicAdvertising:v6];

    uint64_t v4 = v6;
  }
}

- (void)handlePeriodicAdvertisingStopped:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithInfo:a3];
  if (*((unsigned char *)&self->_delegateFlags + 1))
  {
    id v6 = v4;
    id v5 = [(CBPeripheralManager *)self delegate];
    [v5 peripheralManager:self didStopPeriodicAdvertising:v6];

    uint64_t v4 = v6;
  }
}

- (void)handleReadyForUpdates:(id)a3
{
  [(NSLock *)self->_updateLock lock];
  self->_BOOL readyForUpdates = 1;
  BOOL waitingForReady = self->_waitingForReady;
  self->_BOOL waitingForReady = 0;
  [(NSLock *)self->_updateLock unlock];
  if (waitingForReady && (*((unsigned char *)&self->_delegateFlags + 1) & 2) != 0)
  {
    id v5 = [(CBPeripheralManager *)self delegate];
    [v5 peripheralManagerIsReadyToUpdateSubscribers:self];
  }
}

- (void)handleSolicitedServicesFound:(id)a3
{
  id v4 = a3;
  id v7 = [(CBPeripheralManager *)self centralWithInfo:v4];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgUUIDs"];

  if ((*((unsigned char *)&self->_delegateFlags + 1) & 4) != 0)
  {
    id v6 = [(CBPeripheralManager *)self delegate];
    [v6 peripheralManager:self central:v7 didConnectWithServiceUUIDs:v5];
  }
}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4 = a3;
  id v9 = [(CBPeripheralManager *)self centralWithInfo:v4];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionInterval"];
  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionLatency"];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgSupervisionTimeout"];

  if (v9 && (*((unsigned char *)&self->_delegateFlags + 1) & 8) != 0)
  {
    uint64_t v8 = [(CBPeripheralManager *)self delegate];
    [v8 peripheralManager:self didUpdateConnectionParameters:v9 interval:v5 latency:v6 supervisionTimeout:v7];
  }
}

- (void)handleSupportedFeatures:(id)a3
{
  gSupportedFeatures_0 = 0;
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgSupportedFeatures"];
  id v3 = [v4 objectForKey:@"kCBMsgArgSupportsExtendedAdvertising"];

  if (v3) {
    gSupportedFeatures_0 = 1;
  }
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelOpened:]();
  }
  id v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v5)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        id v6 = 0;
        if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x40) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    -[CBPeripheralManager handleL2CAPChannelOpened:]();
    id v6 = 0;
    if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v12 = [(CBPeripheralManager *)self delegate];
    [v12 peripheralManager:self didOpenL2CAPChannel:v6 error:v5];

    goto LABEL_16;
  }
  centrals = self->_centrals;
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v9 = [(NSMapTable *)centrals objectForKey:v8];

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        id v9 = [(CBPeer *)[CBCentral alloc] initWithInfo:v4 manager:self];
        uint64_t v10 = self->_centrals;
        uint64_t v11 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
        [(NSMapTable *)v10 setObject:v9 forKey:v11];

        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }
    -[CBPeripheralManager handleL2CAPChannelOpened:]();
    goto LABEL_13;
  }
LABEL_14:
  id v6 = [[CBL2CAPChannel alloc] initWithPeer:v9 info:v4];
  [(NSHashTable *)self->_l2capChannels addObject:v6];

  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_16:
}

- (void)handleL2CAPChannelClosed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  id v6 = [v4 errorWithInfo:v5];
  id v7 = [v5 objectForKey:@"kCBMsgArgPSM"];
  unsigned __int16 v8 = [v7 intValue];

  centrals = self->_centrals;
  uint64_t v10 = [v5 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  uint64_t v11 = [(NSMapTable *)centrals objectForKey:v10];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    [(CBPeripheralManager *)v8 handleL2CAPChannelClosed:v12];
  }
  uint64_t v13 = [(CBPeripheralManager *)self l2capChannelForPeer:v11 withPsm:v8];
  [(NSHashTable *)self->_l2capChannels removeObject:v13];
}

- (void)handleL2CAPChannelPublished:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"kCBMsgArgPSM"];
  unsigned __int16 v6 = [v5 intValue];

  id v7 = [v4 objectForKey:@"kCBMsgArgResult"];
  [v7 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelPublished:]();
  }
  unsigned __int16 v8 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    id v9 = [(CBPeripheralManager *)self delegate];
    [v9 peripheralManager:self didPublishL2CAPChannel:v6 error:v8];
  }
}

- (void)handleL2CAPChannelUnpublished:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"kCBMsgArgPSM"];
  unsigned __int16 v6 = [v5 intValue];

  id v7 = [v4 objectForKey:@"kCBMsgArgResult"];
  [v7 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelUnpublished:]();
  }
  unsigned __int16 v8 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    id v9 = [(CBPeripheralManager *)self delegate];
    [v9 peripheralManager:self didUnpublishL2CAPChannel:v6 error:v8];
  }
}

- (void)handleCentralDidUpdateANCSAuthorization:(id)a3
{
  id v4 = a3;
  centrals = self->_centrals;
  unsigned __int16 v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v7 = [(NSMapTable *)centrals objectForKey:v6];

  if (!v7)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheralManager handleCentralDidUpdateANCSAuthorization:]();
    }
    id v7 = [(CBPeripheralManager *)self centralWithInfo:v4];
  }
  unsigned __int16 v8 = [v4 objectForKey:@"kCBMsgArgAncsAuthorization"];
  uint64_t v9 = [v8 BOOLValue];

  if (*((unsigned char *)&self->_delegateFlags + 2))
  {
    uint64_t v10 = [(CBPeripheralManager *)self delegate];
    [v10 peripheralManager:self central:v7 didUpdateANCSAuthorization:v9];
  }
}

- (void)HandleControllerPeripheralBTClockUpdateMsg:(id)a3
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockSeconds"];
  id v5 = [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockMicroSeconds"];
  unsigned __int16 v6 = [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockEventType"];
  id v7 = [v12 objectForKeyedSubscript:@"kCBGetControllerBTLocalClock"];
  unsigned __int16 v8 = [v12 objectForKeyedSubscript:@"kCBGetControllerBTRemoteClock"];
  $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = self->_delegateFlags;
  if ((*(_DWORD *)&delegateFlags & 0x20000) != 0)
  {
    uint64_t v10 = [(CBPeripheralManager *)self delegate];
    [v10 peripheralManager:self didUpdateControllerBTClock:v6 seconds:v4 microseconds:v5 localClock:v7 remoteClock:v8];

    $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = self->_delegateFlags;
  }
  if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
  {
    uint64_t v11 = [(CBPeripheralManager *)self delegate];
    [v11 peripheralManager:self didUpdateControllerBTClockDict:v12];
  }
}

- (void)HandleOfflineAdvPayloadRequestedWithReason:(id)a3
{
  id v4 = [a3 objectForKey:@"kCBMsgArgReason"];
  int v5 = [v4 intValue];

  if ((*((unsigned char *)&self->_delegateFlags + 2) & 8) != 0)
  {
    id v6 = [(CBPeripheralManager *)self delegate];
    [v6 peripheralManager:self offlineAdvPayloadRequestedWithReason:v5];
  }
}

- (void)handleIncomingCISConnectionRequest:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager handleIncomingCISConnectionRequest:]();
    if (!self->_incomingConnectionRequestCompletion) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (self->_incomingConnectionRequestCompletion)
  {
LABEL_5:
    int v5 = [v4 objectForKeyedSubscript:@"kCBLEAudioArgCigId"];
    id v6 = [v4 objectForKeyedSubscript:@"kCBLEAudioArgCisId"];
    (*((void (**)(void))self->_incomingConnectionRequestCompletion + 2))();
  }
LABEL_6:
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  if (a3 - 14) < 0x19 && ((0x1CC0001u >> (a3 - 14))) {
    return 1;
  }
  return a3 == 10 || a3 == 43;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  if (a3 <= 0x29u && ((1 << a3) & 0x20000000300) != 0) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CBPeripheralManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (id)addXPCDelayTiming:(id)a3 args:(id)a4
{
  id v5 = a3;
  objc_super v6 = (__CFString *)a4;
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kCBOptionUseCase"];
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [v5 objectForKeyedSubscript:@"kCBOptionUseCase"];
  if ([v9 unsignedLongValue] != 22)
  {

    goto LABEL_9;
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];

  if (!v10)
  {
LABEL_9:
    id v11 = v5;
    goto LABEL_10;
  }
  if (!v6) {
    objc_super v6 = @"Unknown Timestamp";
  }
  id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  id v12 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v13 = [v11 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
  id v14 = [v12 dictionaryWithDictionary:v13];

  BOOL v15 = (void *)[objc_alloc(NSNumber) initWithLongLong:clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240];
  [v14 setObject:v15 forKeyedSubscript:v6];

  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v14];
  [v11 setObject:v16 forKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];

LABEL_10:

  return v11;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (NSMapTable)centrals
{
  return self->_centrals;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (NSMutableDictionary)characteristicIDs
{
  return self->_characteristicIDs;
}

- (NSLock)updateLock
{
  return self->_updateLock;
}

- (BOOL)readyForUpdates
{
  return self->_readyForUpdates;
}

- (BOOL)waitingForReady
{
  return self->_waitingForReady;
}

- (NSNumber)multipleAdvertisingSupported
{
  return self->_multipleAdvertisingSupported;
}

- (void)setMultipleAdvertisingSupported:(id)a3
{
}

- (NSHashTable)l2capChannels
{
  return self->_l2capChannels;
}

- (id)incomingConnectionRequestCompletion
{
  return self->_incomingConnectionRequestCompletion;
}

- (void)setIncomingConnectionRequestCompletion:(id)a3
{
}

- (unint64_t)attributeIDGenerator
{
  return self->_attributeIDGenerator;
}

- (void)setAttributeIDGenerator:(unint64_t)a3
{
  self->_unint64_t attributeIDGenerator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingConnectionRequestCompletion, 0);
  objc_storeStrong((id *)&self->_l2capChannels, 0);
  objc_storeStrong((id *)&self->_multipleAdvertisingSupported, 0);
  objc_storeStrong((id *)&self->_updateLock, 0);
  objc_storeStrong((id *)&self->_characteristicIDs, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_centrals, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)publishL2CAPChannel:(uint64_t)a1 requiresEncryption:(uint64_t)a2 options:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2 & 1;
  OUTLINED_FUNCTION_2_1(&dword_1AB9F0000, a2, a3, "Publish L2CAP channel with psm : %u and encryptionRequirement:%d", 67109376, v3);
}

- (void)unpublishL2CAPChannel:(unsigned __int16)a1 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_DEBUG, "Unpublish L2CAP channel with psm : %u ", (uint8_t *)v2, 8u);
}

- (void)overrideLocalLeAddress:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_DEBUG, "Overriding local address with %@ ", (uint8_t *)&v2, 0xCu);
}

- (void)l2capChannelForPeer:withPsm:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AB9F0000, v0, v1, "No known channel matching peer %@ with psm %u");
}

+ (void)authorizationStatus
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "WARNING: Use of deprecated method. Please use CBManagerAuthorization instead.", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(os_log_t)log queue:options:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "Cannot create a CBPeripheralManager while using AccessorySetupKit framework";
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDelegate:(uint64_t)a1 queue:(NSObject *)a2 options:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_ERROR, "WARNING: %@ has no restore identifier but the delegate implements the peripheralManager:willRestoreState: method. Restoring will not be supported", (uint8_t *)&v2, 0xCu);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Tx Power Level' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Manufacturer Data' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_8(&dword_1AB9F0000, v2, (uint64_t)v2, "The advertisement key 'TDS Data' is a new option", v3);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_8(&dword_1AB9F0000, v2, (uint64_t)v2, "The advertisement key 'Contact Data' is a new option", v3);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Service Data' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Is Connectable' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.7(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Is Extended' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.8(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Is TDS' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.9(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'TDS' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.10(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Raw Bytes' is not allowed", v4);
}

- (void)startAdvertising:(unsigned char *)a1 .cold.11(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1AB9F0000, v2, v3, "WARNING: The advertisement key 'Overflow Service UUIDs' is not allowed", v4);
}

- (void)supportsMultipleAdvertising
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = @"does not support";
  if (a1) {
    int v2 = @"supports";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_DEBUG, "Current device %@ multiple advertising", (uint8_t *)&v3, 0xCu);
}

- (void)handleAdvertisingStarted:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_FAULT, "BundleID is NOT in the allowed CBPeripheralSession list for advertising. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v1, 2u);
}

- (void)handleAdvertisingStarted:.cold.2()
{
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_FAULT, "CBUseCase is not provided in startAdvertising while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v1, 2u);
}

- (void)handleL2CAPChannelOpened:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "No central present! Creating a new object. This shouldn't happen.", v2, v3, v4, v5, v6);
}

- (void)handleL2CAPChannelOpened:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Failed to open L2CAP channel", v2, v3, v4, v5, v6);
}

- (void)handleL2CAPChannelOpened:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1AB9F0000, v0, v1, "l2CAP channel opened", v2);
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "l2CAP channel closed with psm : %u and result : %@", (uint8_t *)v3, 0x12u);
}

- (void)handleL2CAPChannelPublished:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_1AB9F0000, v0, v1, "l2CAP channel published : psm : %u, result : %d", v2, v3);
}

- (void)handleL2CAPChannelUnpublished:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_1AB9F0000, v0, v1, "l2CAP channel unpublished : psm : %u, result : %d", v2, v3);
}

- (void)handleCentralDidUpdateANCSAuthorization:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AB9F0000, v0, v1, "Unexpectedly could not find a central given args %{public}@ delegateImplemented %d");
}

- (void)handleIncomingCISConnectionRequest:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1AB9F0000, v0, v1, "Incoming CIS Connection Request Received", v2);
}

@end