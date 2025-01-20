@interface EAAccessory
- (BOOL)_internalNotPresentInIAPAccessoriesArray;
- (BOOL)accessoryHasNMEASentencesAvailable;
- (BOOL)containsSameProtocolsAsiAPAccessoryProtocols:(id)a3;
- (BOOL)createdByCoreAccessories;
- (BOOL)getEphemerisExpirationInterval:(double *)a3;
- (BOOL)getEphemerisRecommendRefreshInterval:(double *)a3;
- (BOOL)getEphemerisURL:(id *)a3;
- (BOOL)getNMEASentence:(id *)a3;
- (BOOL)hasIPConnection;
- (BOOL)isAvailableOverBonjour;
- (BOOL)isConnected;
- (BOOL)pointOfInterestHandoffEnabled;
- (BOOL)sendDestinationInformation:(id)a3 identifier:(id)a4;
- (BOOL)sendEphemeris:(id)a3;
- (BOOL)sendEphemerisPointDataGpsWeek:(unint64_t)a3 gpsTOW:(double)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(unsigned __int16)a7;
- (BOOL)sendGPRMCDataStatusValueA:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5;
- (BOOL)sendGpsWeek:(unint64_t)a3 gpsTOW:(double)a4;
- (BOOL)sendPointOfInterestInformation:(id)a3 identifier:(unsigned __int16)a4;
- (BOOL)setNMEASentencesToFilter:(id)a3;
- (BOOL)shouldBeHiddenFromUI;
- (BOOL)supportsAccessibility;
- (BOOL)supportsCamera;
- (BOOL)supportsCarPlay;
- (BOOL)supportsCarPlayAppLinks;
- (BOOL)supportsCarPlayConnectionRequest;
- (BOOL)supportsDestinationSharing;
- (BOOL)supportsLocation;
- (BOOL)supportsOOBBTPairing;
- (BOOL)supportsOOBBTPairing2;
- (BOOL)supportsPointOfInterest;
- (BOOL)supportsPublicIap;
- (BOOL)supportsUSBCarPlay;
- (BOOL)supportsWirelessCarPlay;
- (EAAccessory)init;
- (NSArray)protocolStrings;
- (NSString)dockType;
- (NSString)hardwareRevision;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSString)serialNumber;
- (NSUInteger)connectionID;
- (double)getNMEATimestampAverageSamples;
- (id)_createWakeToken;
- (id)_initWithAccessory:(id)a3;
- (id)_protocolIDForProtocolString:(id)a3;
- (id)_shortDescription;
- (id)allPublicProtocolStrings;
- (id)audioPorts;
- (id)bonjourName;
- (id)cameraComponents;
- (id)certData;
- (id)certSerial;
- (id)coreAccessoriesPrimaryUUID;
- (id)delegate;
- (id)description;
- (id)dictionaryWithLowercaseKeys:(id)a3;
- (id)eqNames;
- (id)firmwareRevisionActive;
- (id)firmwareRevisionPending;
- (id)getVehicleInfoData;
- (id)macAddress;
- (id)ppid;
- (id)preferredApp;
- (id)protocolDetails;
- (id)regionCode;
- (id)vehicleInfoInitialData;
- (id)vehicleInfoSupportedTypes;
- (int)captureStillImage:(unsigned int)a3 forCameraIds:(id)a4;
- (int)classType;
- (int)locationSentenceTypesMask;
- (int)setCameraProperties:(unsigned int)a3 forCameraId:(unsigned __int16)a4 withProperties:(id)a5;
- (int)startCameraInfo:(unsigned int)a3 forCameraIds:(id)a4;
- (int)startCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4 withProperties:(id)a5 withCapabilities:(id)a6;
- (int)startLivePreview:(unsigned int)a3 forCameraIds:(id)a4;
- (int)stopCameraInfo:(unsigned int)a3 forCameraIds:(id)a4;
- (int)stopCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4;
- (int)stopLivePreview:(unsigned int)a3 forCameraIds:(id)a4;
- (int64_t)transportType;
- (unint64_t)destinationSharingOptions;
- (unsigned)_internalConnectionID;
- (unsigned)accessoryCapabilities;
- (unsigned)eqIndex;
- (void)_OOBBTPairingCompletedWithStatus:(unsigned __int8)a3 forAccessoryWithMACAddress:(id)a4;
- (void)_addSession:(id)a3;
- (void)_endSession:(unsigned int)a3;
- (void)_openCompleteForSession:(unsigned int)a3;
- (void)_removeSession:(id)a3;
- (void)_setConnected:(BOOL)a3;
- (void)_setNotPresentInIAPAccessoriesArray:(BOOL)a3;
- (void)_updateAccessoryInfo:(id)a3;
- (void)addNMEASentence:(id)a3 withTimestamps:(id)a4;
- (void)beginOOBBTPairingWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)getIAPTimeSyncInfo:(id)a3 completionHandler:(id)a4;
- (void)logNMEATimestampDelays:(id)a3 timestamps:(id)a4;
- (void)requestIAPAccessoryWiFiCredentials;
- (void)resetIAPTimeSyncKalmanFilter;
- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6;
- (void)setCameraComponents:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDestinationSharingOptions:(unint64_t)a3;
- (void)setEqIndex:(unsigned int)a3;
- (void)setEqNames:(id)a3;
- (void)setIAPTimeSyncParams:(id)a3;
- (void)setLocationSentenceTypesMask:(int)a3;
- (void)setPointOfInterestHandoffEnabled:(BOOL)a3;
- (void)setVehicleInfoSupportedTypes:(id)a3;
- (void)setVehicleInfovehicleInfoInitialData:(id)a3;
- (void)updateItemProperty:(int)a3 withValue:(id)a4;
- (void)updateSystemProperty:(int)a3 withValue:(id)a4;
@end

@implementation EAAccessory

- (EAAccessory)init
{
  return 0;
}

- (void)dealloc
{
  [(id)__gLocationLock lock];
  NSLog(&cfstr_LocationEaDeta.isa);
  while ([(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] count])
  {
    [(EAAccessory *)self logNMEATimestampDelays:[(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] objectAtIndex:0] timestamps:[(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEATimestamps] objectAtIndex:0]];
    [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] removeObjectAtIndex:0];
    [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEATimestamps] removeObjectAtIndex:0];
  }
  [(id)__gLocationLock unlock];
  NSLog(&cfstr_LocationEaDeta_0.isa);

  v3.receiver = self;
  v3.super_class = (Class)EAAccessory;
  [(EAAccessory *)&v3 dealloc];
}

- (id)description
{
  v7 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EAAccessory;
  id v6 = [(EAAccessory *)&v8 description];
  BOOL v3 = [(EAAccessory *)self isConnected];
  v4 = @"NO";
  if (v3) {
    v4 = @"YES";
  }
  return (id)objc_msgSend(v7, "stringWithFormat:", @"%@ { \n  connected:%@ \n  connectionID:%lu \n  name: %@ \n  manufacturer: %@ \n  modelNumber: %@ \n  serialNumber: %@ \n  ppid: %@ \n  regioncode: %@ \n  firmwareRevisionActive: %@ \n  firmwareRevisionPending: %@ \n  hardwareRevision: %@ \n  dockType: %@ \n  certSerial: %lu bytes \n  certData: %lu bytes \n  protocols: %@ \n  delegate: %@ \n}", v6, v4, -[EAAccessory connectionID](self, "connectionID"), -[EAAccessory name](self, "name"), -[EAAccessory manufacturer](self, "manufacturer"), -[EAAccessory modelNumber](self, "modelNumber"), -[EAAccessory serialNumber](self, "serialNumber"), -[EAAccessory ppid](self, "ppid"), -[EAAccessory regionCode](self, "regionCode"), -[EAAccessory firmwareRevisionActive](self, "firmwareRevisionActive"), -[EAAccessory firmwareRevisionPending](self, "firmwareRevisionPending"), -[EAAccessory hardwareRevision](self, "hardwareRevision"), -[EAAccessory dockType](self, "dockType"), objc_msgSend(-[EAAccessory certSerial](self, "certSerial"), "length"), objc_msgSend(-[EAAccessory certData](self, "certData"), "length"), -[EAAccessory protocolStrings](self, "protocolStrings"),
               [(EAAccessory *)self delegate]);
}

- (BOOL)isConnected
{
  return [(EAAccessoryInternal *)self->_internal connected];
}

- (NSUInteger)connectionID
{
  return [(EAAccessoryInternal *)self->_internal connectionID];
}

- (NSString)manufacturer
{
  return [(EAAccessoryInternal *)self->_internal manufacturer];
}

- (NSString)name
{
  return [(EAAccessoryInternal *)self->_internal name];
}

- (NSString)modelNumber
{
  return [(EAAccessoryInternal *)self->_internal modelNumber];
}

- (NSString)serialNumber
{
  return [(EAAccessoryInternal *)self->_internal serialNumber];
}

- (id)firmwareRevisionActive
{
  return [(EAAccessoryInternal *)self->_internal firmwareRevisionActive];
}

- (id)firmwareRevisionPending
{
  return [(EAAccessoryInternal *)self->_internal firmwareRevisionPending];
}

- (NSString)hardwareRevision
{
  return [(EAAccessoryInternal *)self->_internal hardwareRevision];
}

- (int64_t)transportType
{
  return [(EAAccessoryInternal *)self->_internal transportType];
}

- (NSString)dockType
{
  return [(EAAccessoryInternal *)self->_internal dockType];
}

- (void)setDelegate:(id)delegate
{
}

- (NSArray)protocolStrings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)[(EAAccessoryInternal *)self->_internal protocols] allKeys];
  if (![+[EAAccessoryManager sharedAccessoryManager] shouldAllowInternalProtocols])
  {
    BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v2);
          }
          objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 caseInsensitiveCompare:@"com.apple.update"]) {
            [(NSArray *)v3 addObject:v8];
          }
        }
        uint64_t v5 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    return v3;
  }
  return v2;
}

- (id)delegate
{
  return [(EAAccessoryInternal *)self->_internal delegate];
}

- (id)bonjourName
{
  return 0;
}

- (BOOL)hasIPConnection
{
  return 0;
}

- (BOOL)isAvailableOverBonjour
{
  return 0;
}

- (BOOL)supportsCarPlay
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 10) & 1;
}

- (BOOL)supportsOOBBTPairing
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 13) & 1;
}

- (BOOL)supportsOOBBTPairing2
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 19) & 1;
}

- (BOOL)supportsUSBCarPlay
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 14) & 1;
}

- (BOOL)supportsWirelessCarPlay
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 12) & 1;
}

- (BOOL)supportsCarPlayAppLinks
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 18) & 1;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 20) & 1;
}

- (BOOL)createdByCoreAccessories
{
  return [(EAAccessoryInternal *)self->_internal createdByCoreAccessories];
}

- (id)coreAccessoriesPrimaryUUID
{
  v2 = (void *)[(NSString *)[(EAAccessoryInternal *)self->_internal coreAccessoryPrimaryUUID] copy];

  return v2;
}

- (unsigned)accessoryCapabilities
{
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_105.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory accessoryCapabilities]", [(EAAccessoryInternal *)self->_internal capabilities]);
  }
  internal = self->_internal;

  return [(EAAccessoryInternal *)internal capabilities];
}

- (id)_initWithAccessory:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EAAccessory;
  uint64_t v4 = [(EAAccessory *)&v6 init];
  if (v4) {
    v4->_internal = (EAAccessoryInternal *)a3;
  }
  return v4;
}

- (void)_updateAccessoryInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKey:*MEMORY[0x1E4F6A580]];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    [(EAAccessoryInternal *)self->_internal setName:v7];
  }
  uint64_t v8 = [a3 objectForKey:*MEMORY[0x1E4F6A570]];
  if (v8)
  {
    uint64_t v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    [(EAAccessoryInternal *)self->_internal setManufacturer:v10];
  }
  uint64_t v11 = [a3 objectForKey:*MEMORY[0x1E4F6A578]];
  if (v11)
  {
    uint64_t v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [(EAAccessoryInternal *)self->_internal setModelNumber:v13];
  }
  uint64_t v14 = [a3 objectForKey:*MEMORY[0x1E4F6A5E8]];
  if (v14)
  {
    uint64_t v15 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
    [(EAAccessoryInternal *)self->_internal setSerialNumber:v16];
  }
  uint64_t v17 = [a3 objectForKey:*MEMORY[0x1E4F6A548]];
  if (v17)
  {
    uint64_t v18 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v18;
    }
    [(EAAccessoryInternal *)self->_internal setFirmwareRevisionActive:v19];
  }
  uint64_t v20 = [a3 objectForKey:*MEMORY[0x1E4F6A550]];
  if (v20)
  {
    uint64_t v21 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v21;
    }
    [(EAAccessoryInternal *)self->_internal setFirmwareRevisionPending:v22];
  }
  uint64_t v23 = [a3 objectForKey:*MEMORY[0x1E4F6A558]];
  if (v23)
  {
    uint64_t v24 = v23;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v24;
    }
    [(EAAccessoryInternal *)self->_internal setHardwareRevision:v25];
  }
  uint64_t v26 = [a3 objectForKey:*MEMORY[0x1E4F6A540]];
  if (v26)
  {
    uint64_t v27 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v27;
    }
    [(EAAccessoryInternal *)self->_internal setDockType:v28];
  }
  uint64_t v29 = [a3 objectForKey:*MEMORY[0x1E4F6A568]];
  if (v29)
  {
    uint64_t v30 = v29;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = v30;
    }
    [(EAAccessoryInternal *)self->_internal setMacAddress:v31];
  }
  uint64_t v32 = *MEMORY[0x1E4F6A5A8];
  if ([a3 objectForKey:*MEMORY[0x1E4F6A5A8]])
  {
    internal = self->_internal;
    uint64_t v34 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v32), "BOOLValue");
    [(EAAccessoryInternal *)internal setPointOfInterestHandoffEnabled:v34];
  }
}

- (id)_shortDescription
{
  v3.receiver = self;
  v3.super_class = (Class)EAAccessory;
  return [(EAAccessory *)&v3 description];
}

- (void)_setConnected:(BOOL)a3
{
}

- (void)_setNotPresentInIAPAccessoriesArray:(BOOL)a3
{
}

- (id)_protocolIDForProtocolString:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  uint64_t v4 = [(EAAccessoryInternal *)self->_internal protocols];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__EAAccessory__protocolIDForProtocolString___block_invoke;
  v7[3] = &unk_1E6294430;
  v7[4] = a3;
  v7[5] = &v8;
  [(NSDictionary *)v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __44__EAAccessory__protocolIDForProtocolString___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 caseInsensitiveCompare:*(void *)(a1 + 32)];
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_addSession:(id)a3
{
}

- (void)_removeSession:(id)a3
{
}

- (void)_openCompleteForSession:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EAAccessoryInternal *)self->_internal sessionsList];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      if ([v9 _sessionID] == a3) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = 0;
  }
  [v9 setOpenCompleted:1];
}

- (void)_endSession:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EAAccessoryInternal *)self->_internal sessionsList];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      int v10 = v7 + v6;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v9) _sessionID] == a3)
        {
          objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", (v7 + v9)), "_endStreams");
          return;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      int v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (id)_createWakeToken
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", -[EAAccessory macAddress](self, "macAddress"), @"EAAccessoryMacAddress");
  objc_super v3 = (void *)MEMORY[0x1E4F28F98];

  return (id)[v3 dataWithPropertyList:v2 format:200 options:0 error:0];
}

- (unsigned)_internalConnectionID
{
  return [(EAAccessoryInternal *)self->_internal connectionID];
}

- (BOOL)_internalNotPresentInIAPAccessoriesArray
{
  return [(EAAccessoryInternal *)self->_internal notPresentInIAPAccessoriesArray];
}

- (void)logNMEATimestampDelays:(id)a3 timestamps:(id)a4
{
  [(EAAccessory *)self getNMEATimestampAverageSamples];
  if (a4)
  {
    double v8 = v7;
    objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "doubleValue");
    double v10 = v9;
    objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "doubleValue");
    double v12 = v11;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
    double v13 = v12 - v10;
    double v15 = v14 - v12;
    [(NSNumber *)[(EAAccessoryInternal *)self->_internal highestXPCDelay] doubleValue];
    if (v13 > v16) {
      -[EAAccessoryInternal setHighestXPCDelay:](self->_internal, "setHighestXPCDelay:", [NSNumber numberWithDouble:v13]);
    }
    [(NSNumber *)[(EAAccessoryInternal *)self->_internal highestFrameworkDelay] doubleValue];
    if (v15 > v17) {
      -[EAAccessoryInternal setHighestFrameworkDelay:](self->_internal, "setHighestFrameworkDelay:", [NSNumber numberWithDouble:v15]);
    }
    [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageXPCDelay] doubleValue];
    uint64_t v18 = NSNumber;
    if (v19 == 0.0)
    {
      uint64_t v20 = NSNumber;
      double v21 = v13;
    }
    else
    {
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageXPCDelay] doubleValue];
      double v23 = v22;
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageXPCDelay] doubleValue];
      -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", [v18 numberWithDouble:v23 - v24 / v8]);
      uint64_t v25 = NSNumber;
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageXPCDelay] doubleValue];
      double v21 = v13 / v8 + v26;
      uint64_t v20 = v25;
    }
    -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", [v20 numberWithDouble:v21]);
    [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageXPCDelay] doubleValue];
    uint64_t v27 = NSNumber;
    if (v28 == 0.0)
    {
      -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", [NSNumber numberWithDouble:v13]);
    }
    else
    {
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageFrameworkDelay] doubleValue];
      double v30 = v29;
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageFrameworkDelay] doubleValue];
      -[EAAccessoryInternal setAverageFrameworkDelay:](self->_internal, "setAverageFrameworkDelay:", [v27 numberWithDouble:v30 - v31 / v8]);
      uint64_t v32 = NSNumber;
      [(NSNumber *)[(EAAccessoryInternal *)self->_internal averageFrameworkDelay] doubleValue];
      -[EAAccessoryInternal setAverageFrameworkDelay:](self->_internal, "setAverageFrameworkDelay:", [v32 numberWithDouble:v15 / v8 + v33]);
    }
    NSLog(&cfstr_LocationCurren.isa, *(void *)&v13, *(void *)&v15, [(EAAccessoryInternal *)self->_internal highestXPCDelay], [(EAAccessoryInternal *)self->_internal highestFrameworkDelay], [(EAAccessoryInternal *)self->_internal averageXPCDelay], [(EAAccessoryInternal *)self->_internal averageFrameworkDelay], a3);
  }
  else
  {
    NSLog(&cfstr_LocationAnNmea.isa);
  }
}

- (id)macAddress
{
  return [(EAAccessoryInternal *)self->_internal macAddress];
}

- (id)certSerial
{
  return [(EAAccessoryInternal *)self->_internal certSerial];
}

- (id)certData
{
  return [(EAAccessoryInternal *)self->_internal certData];
}

- (id)ppid
{
  return [(EAAccessoryInternal *)self->_internal ppid];
}

- (id)regionCode
{
  return [(EAAccessoryInternal *)self->_internal regionCode];
}

- (id)protocolDetails
{
  return [(EAAccessoryInternal *)self->_internal protocolDetails];
}

- (BOOL)supportsPublicIap
{
  if ([(EAAccessoryInternal *)self->_internal capabilities])
  {
    if (objc_msgSend(-[EAAccessory allPublicProtocolStrings](self, "allPublicProtocolStrings"), "count"))
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    BOOL v3 = +[EAAccessoryManager isLoggingEnabled];
    if (!v3) {
      return v3;
    }
    NSLog(&cfstr_Externalaccess_106.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory supportsPublicIap]");
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)shouldBeHiddenFromUI
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 8) & 1;
}

- (id)preferredApp
{
  return [(EAAccessoryInternal *)self->_internal preferredApp];
}

- (int)classType
{
  return [(EAAccessoryInternal *)self->_internal classType];
}

- (id)audioPorts
{
  return [(EAAccessoryInternal *)self->_internal audioPorts];
}

- (id)allPublicProtocolStrings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EAAccessory *)self protocolStrings];
  double v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  uint64_t v17 = 0;
  BOOL v3 = (void *)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:*MEMORY[0x1E4F6A648] options:1 error:&v17];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"com.apple.accessory.cli.*" options:1 error:&v17];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v2);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if (v3)
        {
          uint64_t v10 = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "length"));
          if (v10) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        if (v4) {
          uint64_t v10 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
        }
LABEL_12:
        if (v10 || ![v9 caseInsensitiveCompare:@"com.apple.iPodOut"])
        {
          if (+[EAAccessoryManager isLoggingEnabled]) {
            NSLog(&cfstr_Externalaccess_108.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory allPublicProtocolStrings]", v9);
          }
        }
        else
        {
          NSLog(&cfstr_Externalaccess_107.isa, v9);
          [v12 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  return v12;
}

- (id)dictionaryWithLowercaseKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "lowercaseString"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (BOOL)containsSameProtocolsAsiAPAccessoryProtocols:(id)a3
{
  id v4 = [(EAAccessory *)self dictionaryWithLowercaseKeys:a3];
  id v5 = [(EAAccessory *)self dictionaryWithLowercaseKeys:[(EAAccessoryInternal *)self->_internal protocols]];

  return [v4 isEqualToDictionary:v5];
}

- (void)setEqNames:(id)a3
{
}

- (id)eqNames
{
  return [(EAAccessoryInternal *)self->_internal eqNames];
}

- (void)setEqIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[EAAccessoryInternal setEqIndex:](self->_internal, "setEqIndex:");
  uint64_t v5 = [(EAAccessoryInternal *)self->_internal connectionID];

  MEMORY[0x1F4122A70](v5, v3);
}

- (unsigned)eqIndex
{
  return [(EAAccessoryInternal *)self->_internal eqIndex];
}

- (void)setPointOfInterestHandoffEnabled:(BOOL)a3
{
}

- (BOOL)pointOfInterestHandoffEnabled
{
  return [(EAAccessoryInternal *)self->_internal pointOfInterestHandoffEnabled];
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
}

- (unint64_t)destinationSharingOptions
{
  return [(EAAccessoryInternal *)self->_internal destinationSharingOptions];
}

- (int)locationSentenceTypesMask
{
  return [(EAAccessoryInternal *)self->_internal locationSentenceTypesMask];
}

- (void)setLocationSentenceTypesMask:(int)a3
{
}

- (BOOL)supportsLocation
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 3) & 1;
}

- (BOOL)supportsCamera
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 11) & 1;
}

- (BOOL)accessoryHasNMEASentencesAvailable
{
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    [(id)__gLocationLock lock];
    BOOL v3 = [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] count] != 0;
    [(id)__gLocationLock unlock];
  }
  else
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    IAPLocationIsNMEADataAvailable();
    return 0;
  }
  return v3;
}

- (BOOL)getNMEASentence:(id *)a3
{
  id v13 = 0;
  uint64_t v5 = (void *)MEMORY[0x1C186A640](self, a2);
  unint64_t v6 = [(EAAccessoryInternal *)self->_internal nmeaSentenceAddCounter];
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    [(id)__gLocationLock lock];
    if ([(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] count])
    {
      uint64_t v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "objectAtIndex:", 0), "copy");
      id v13 = (id)v7;
      [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] removeObjectAtIndex:0];
      uint64_t v8 = (void *)[(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEATimestamps] objectAtIndex:0];
      id v9 = v8;
      [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEATimestamps] removeObjectAtIndex:0];
      [(EAAccessoryInternal *)self->_internal setNmeaSentenceGetCounter:[(EAAccessoryInternal *)self->_internal nmeaSentenceGetCounter] + 1];
      if (v7)
      {
        unint64_t v10 = v6 % 0xF;
        if (+[EAAccessoryManager isLoggingEnabled] || !v10) {
          [(EAAccessory *)self logNMEATimestampDelays:v7 timestamps:v8];
        }

        if (+[EAAccessoryManager isLoggingEnabled] || !v10) {
          NSLog(&cfstr_LocationDLluLl.isa, +[EAAccessoryManager isLoggingEnabled], v6, [(EAAccessoryInternal *)self->_internal nmeaSentenceGetCounter], 15, v7, [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] count]);
        }
      }
      else
      {
      }
    }
    [(id)__gLocationLock unlock];
  }
  else
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    IAPLocationCopyNMEAData();
  }
  if (v13)
  {
    *a3 = v13;
    id v11 = v13;
  }
  return 1;
}

- (void)addNMEASentence:(id)a3 withTimestamps:(id)a4
{
  [(id)__gLocationLock lock];
  uint64_t v7 = (void *)[a3 copy];
  uint64_t v8 = (void *)[a4 copy];
  [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] addObject:v7];
  [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEATimestamps] addObject:v8];
  [(EAAccessoryInternal *)self->_internal setNmeaSentenceAddCounter:[(EAAccessoryInternal *)self->_internal nmeaSentenceAddCounter] + 1];
  unint64_t v9 = [(EAAccessoryInternal *)self->_internal nmeaSentenceAddCounter];
  if (+[EAAccessoryManager isLoggingEnabled]
    || +[EAAccessoryManager isLoggingEnabled]
    || !(v9 % 0xF))
  {
    NSLog(&cfstr_LocationDLluLl_0.isa, +[EAAccessoryManager isLoggingEnabled], v9, [(EAAccessoryInternal *)self->_internal nmeaSentenceGetCounter], 15, a3, [(NSMutableArray *)[(EAAccessoryInternal *)self->_internal enqueuedNMEASentences] count]);
  }

  unint64_t v10 = (void *)__gLocationLock;

  [v10 unlock];
}

- (BOOL)setNMEASentencesToFilter:(id)a3
{
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    NSLog(&cfstr_LocationSetnme.isa);
    [+[EAAccessoryManager sharedAccessoryManager] sendNMEAFilterList:a3 forUUID:[(EAAccessory *)self coreAccessoriesPrimaryUUID]];
    return 1;
  }
  else
  {
    NSLog(&cfstr_LocationSetnme_0.isa);
    [(EAAccessoryInternal *)self->_internal connectionID];
    return IAPlocationSetAccessoryNMEAFilter() != 0;
  }
}

- (double)getNMEATimestampAverageSamples
{
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"NMEATimestampAverageSamples", @"com.apple.logging", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  [(id)(id)CFMakeCollectable(v2) doubleValue];
  if (result == 0.0) {
    return *(double *)&EADefaultNMEATimestampAverageSamples;
  }
  return result;
}

- (void)setIAPTimeSyncParams:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:@"EATimeSyncOffsetUncertaintyThreshold"];
  unint64_t v6 = (void *)[a3 objectForKey:@"EATimeSyncOffsetMeasurementInterval"];
  uint64_t v7 = [(EAAccessoryInternal *)self->_internal connectionID];
  uint64_t v8 = [v5 unsignedLongLongValue];
  uint64_t v9 = [v6 unsignedIntValue];

  MEMORY[0x1F4122B80](v7, v8, v9);
}

- (void)getIAPTimeSyncInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [(EAAccessoryInternal *)self->_internal connectionID];

  MEMORY[0x1F4122B70](v6, a3, a4);
}

- (void)resetIAPTimeSyncKalmanFilter
{
  uint64_t v2 = [(EAAccessoryInternal *)self->_internal connectionID];

  MEMORY[0x1F4122B78](v2);
}

- (BOOL)getEphemerisURL:(id *)a3
{
  if (![(EAAccessory *)self createdByCoreAccessories])
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    IAPLocationCopyEphemerisURL();
  }
  return 1;
}

- (BOOL)getEphemerisRecommendRefreshInterval:(double *)a3
{
  double v5 = 0.0;
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    LOBYTE(EphemerisRecommendedRefreshInterval) = 0;
  }
  else
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    int EphemerisRecommendedRefreshInterval = IAPLocationGetEphemerisRecommendedRefreshInterval();
    if (EphemerisRecommendedRefreshInterval)
    {
      double v5 = (double)0;
      LOBYTE(EphemerisRecommendedRefreshInterval) = 0;
    }
  }
  *a3 = v5;
  return EphemerisRecommendedRefreshInterval;
}

- (BOOL)getEphemerisExpirationInterval:(double *)a3
{
  double v5 = 0.0;
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    LOBYTE(EphemerisMaxInterval) = 0;
  }
  else
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    int EphemerisMaxInterval = IAPLocationGetEphemerisMaxInterval();
    if (EphemerisMaxInterval)
    {
      double v5 = (double)0;
      LOBYTE(EphemerisMaxInterval) = 0;
    }
  }
  *a3 = v5;
  return EphemerisMaxInterval;
}

- (BOOL)sendGpsWeek:(unint64_t)a3 gpsTOW:(double)a4
{
  if ([(EAAccessory *)self createdByCoreAccessories]) {
    return 1;
  }
  [(EAAccessoryInternal *)self->_internal connectionID];
  return IAPLocationSendGPSTime() != 0;
}

- (BOOL)sendEphemerisPointDataGpsWeek:(unint64_t)a3 gpsTOW:(double)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(unsigned __int16)a7
{
  if ([(EAAccessory *)self createdByCoreAccessories]) {
    return 1;
  }
  [(EAAccessoryInternal *)self->_internal connectionID];
  return IAPLocationSendEphemerisPointData() != 0;
}

- (BOOL)sendEphemeris:(id)a3
{
  if ([(EAAccessory *)self createdByCoreAccessories]) {
    return 1;
  }
  [(EAAccessoryInternal *)self->_internal connectionID];
  return IAPLocationSendEphemeris() != 0;
}

- (BOOL)sendGPRMCDataStatusValueA:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    [+[EAAccessoryManager sharedAccessoryManager] sendGPRMCDataStatus:v7 ValueV:v6 ValueX:v5 forUUID:[(EAAccessory *)self coreAccessoriesPrimaryUUID]];
    return 1;
  }
  else
  {
    [(EAAccessoryInternal *)self->_internal connectionID];
    return IAPlocationSendGPRMCDataStatusValues() != 0;
  }
}

- (BOOL)sendPointOfInterestInformation:(id)a3 identifier:(unsigned __int16)a4
{
  return 0;
}

- (BOOL)sendDestinationInformation:(id)a3 identifier:(id)a4
{
  if ([(EAAccessory *)self createdByCoreAccessories])
  {
    BOOL v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
    [v7 setObject:a4 forKey:*MEMORY[0x1E4F6A5B8]];
    [+[EAAccessoryManager sharedAccessoryManager] destinationInformation:v7 forAccessoryUUID:[(EAAccessory *)self coreAccessoriesPrimaryUUID]];
    return 1;
  }
  else
  {
    uint64_t v9 = [(EAAccessoryInternal *)self->_internal connectionID];
    uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3];
    return MEMORY[0x1F4122AC8](v9, v10, a4);
  }
}

- (void)beginOOBBTPairingWithCompletionBlock:(id)a3
{
  [(EAAccessoryInternal *)self->_internal setPairingCompletionBlock:a3];
  uint64_t v4 = [(EAAccessoryInternal *)self->_internal connectionID];

  MEMORY[0x1F4122A78](v4);
}

- (void)_OOBBTPairingCompletedWithStatus:(unsigned __int8)a3 forAccessoryWithMACAddress:(id)a4
{
  internal = self->_internal;
  if (internal)
  {
    uint64_t v7 = a3;
    if ([(EAAccessoryInternal *)internal pairingCompletionBlock])
    {
      uint64_t v8 = [(EAAccessoryInternal *)self->_internal pairingCompletionBlock];
      v8[2](v8, v7, a4);
      uint64_t v9 = self->_internal;
      [(EAAccessoryInternal *)v9 setPairingCompletionBlock:0];
    }
  }
}

- (void)requestIAPAccessoryWiFiCredentials
{
  if ([(EAAccessoryInternal *)self->_internal createdByCoreAccessories])
  {
    BOOL v3 = +[EAAccessoryManager sharedAccessoryManager];
    id v4 = [(EAAccessory *)self coreAccessoriesPrimaryUUID];
    [(EAAccessoryManager *)v3 requestIAPAccessoryWiFiCredentials:v4];
  }
  else
  {
    uint64_t v5 = [(EAAccessoryInternal *)self->_internal connectionID];
    MEMORY[0x1F4122AB0](v5);
  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4
{
  if ([(EAAccessoryInternal *)self->_internal createdByCoreAccessories])
  {
    uint64_t v7 = +[EAAccessoryManager sharedAccessoryManager];
    id v8 = [(EAAccessory *)self coreAccessoriesPrimaryUUID];
    [(EAAccessoryManager *)v7 sendDeviceIdentifierNotification:a3 usbIdentifier:a4 forUUID:v8];
  }
  else
  {
    uint64_t v9 = [(EAAccessoryInternal *)self->_internal connectionID];
    uint64_t v10 = [a3 UTF8String];
    uint64_t v11 = [a4 UTF8String];
    MEMORY[0x1F4122AC0](v9, v10, v11);
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6
{
  uint64_t v11 = +[EAAccessoryManager sharedAccessoryManager];
  id v12 = [(EAAccessory *)self coreAccessoriesPrimaryUUID];

  [(EAAccessoryManager *)v11 sendWiredCarPlayAvailable:a3 usbIdentifier:a4 wirelessCarPlayAvailable:a5 bluetoothIdentifier:a6 forUUID:v12];
}

- (id)vehicleInfoSupportedTypes
{
  return [(EAAccessoryInternal *)self->_internal vehicleInfoSupportedTypes];
}

- (void)setVehicleInfoSupportedTypes:(id)a3
{
}

- (id)vehicleInfoInitialData
{
  return [(EAAccessoryInternal *)self->_internal vehicleInfoInitialData];
}

- (void)setVehicleInfovehicleInfoInitialData:(id)a3
{
}

- (id)getVehicleInfoData
{
  BOOL v3 = +[EAAccessoryManager sharedAccessoryManager];
  id v4 = [(EAAccessory *)self coreAccessoriesPrimaryUUID];

  return [(EAAccessoryManager *)v3 currentVehicleInformation:v4];
}

- (id)cameraComponents
{
  return [(EAAccessoryInternal *)self->_internal cameraComponents];
}

- (void)setCameraComponents:(id)a3
{
}

- (int)startCameraInfo:(unsigned int)a3 forCameraIds:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = IAPCameraSendCameraControlMessage();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraActiveImageCaptureFormatIndex");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraExposureMode");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraExposureAreaOfInterest");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraFocusMode");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraFocusAreaOfInterest");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraISO");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraLensPosition");
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraExposureMode");
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", 1), @"EACameraFocusMode");
  LODWORD(a4) = [(EAAccessory *)self startCameraUpdates:v5 forCameraIds:a4 withProperties:v8 withCapabilities:v9] | v7;

  return (int)a4;
}

- (int)stopCameraInfo:(unsigned int)a3 forCameraIds:(id)a4
{
  int v4 = -[EAAccessory stopCameraUpdates:forCameraIds:](self, "stopCameraUpdates:forCameraIds:");
  return IAPCameraSendCameraControlMessage() | v4;
}

- (int)startCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4 withProperties:(id)a5 withCapabilities:(id)a6
{
  return MEMORY[0x1F4122B00](*(void *)&a3, a4, a5, a6);
}

- (int)stopCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (int)setCameraProperties:(unsigned int)a3 forCameraId:(unsigned __int16)a4 withProperties:(id)a5
{
  return MEMORY[0x1F4122AF8](*(void *)&a3, a4, a5);
}

- (int)startLivePreview:(unsigned int)a3 forCameraIds:(id)a4
{
  return MEMORY[0x1F4122B08](*(void *)&a3, a4, 0);
}

- (int)stopLivePreview:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (int)captureStillImage:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (BOOL)supportsAccessibility
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 1) & 1;
}

- (void)updateSystemProperty:(int)a3 withValue:(id)a4
{
  if ((a3 - 1) <= 2)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v7 = [(EAAccessoryInternal *)self->_internal connectionID];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6), @"EAAccessoryAccessibilitySystemPropertyKey", a4, @"EAAccessoryAccessibilityResponseKey", 0);
    MEMORY[0x1F4122AB8](v7, v8);
  }
}

- (void)updateItemProperty:(int)a3 withValue:(id)a4
{
  if ((a3 - 1) <= 4)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v7 = [(EAAccessoryInternal *)self->_internal connectionID];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6), @"EAAccessoryAccessibilityItemPropertyKey", a4, @"EAAccessoryAccessibilityResponseKey", 0);
    MEMORY[0x1F4122AB8](v7, v8);
  }
}

- (BOOL)supportsPointOfInterest
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 7) & 1;
}

- (BOOL)supportsDestinationSharing
{
  return ([(EAAccessoryInternal *)self->_internal capabilities] >> 17) & 1;
}

@end