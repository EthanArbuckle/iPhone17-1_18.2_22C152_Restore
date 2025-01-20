@interface EAAccessoryInternal
- (BOOL)connected;
- (BOOL)createdByCoreAccessories;
- (BOOL)hasIPConnection;
- (BOOL)isAvailableOverBonjour;
- (BOOL)notPresentInIAPAccessoriesArray;
- (BOOL)pointOfInterestHandoffEnabled;
- (EAAccessoryDelegate)delegate;
- (EAAccessoryInternal)init;
- (NSArray)cameraComponents;
- (NSArray)eqNames;
- (NSArray)sessionsList;
- (NSData)certData;
- (NSData)certSerial;
- (NSDictionary)audioPorts;
- (NSDictionary)protocolDetails;
- (NSDictionary)protocols;
- (NSDictionary)vehicleInfoInitialData;
- (NSDictionary)vehicleInfoSupportedTypes;
- (NSMutableArray)enqueuedNMEASentences;
- (NSMutableArray)enqueuedNMEATimestamps;
- (NSNumber)averageFrameworkDelay;
- (NSNumber)averageXPCDelay;
- (NSNumber)highestFrameworkDelay;
- (NSNumber)highestXPCDelay;
- (NSString)bonjourName;
- (NSString)coreAccessoryPrimaryUUID;
- (NSString)dockType;
- (NSString)firmwareRevisionActive;
- (NSString)firmwareRevisionPending;
- (NSString)hardwareRevision;
- (NSString)macAddress;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSString)ppid;
- (NSString)preferredApp;
- (NSString)regionCode;
- (NSString)serialNumber;
- (id)WiFiCredentialsCompletionBlock;
- (id)pairingCompletionBlock;
- (int)classType;
- (int)locationSentenceTypesMask;
- (int64_t)transportType;
- (unint64_t)destinationSharingOptions;
- (unint64_t)nmeaSentenceAddCounter;
- (unint64_t)nmeaSentenceGetCounter;
- (unsigned)capabilities;
- (unsigned)connectionID;
- (unsigned)eqIndex;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)removeSession:(id)a3;
- (void)setAudioPorts:(id)a3;
- (void)setAverageFrameworkDelay:(id)a3;
- (void)setAverageXPCDelay:(id)a3;
- (void)setBonjourName:(id)a3;
- (void)setCameraComponents:(id)a3;
- (void)setCapabilities:(unsigned int)a3;
- (void)setCertData:(id)a3;
- (void)setCertSerial:(id)a3;
- (void)setClassType:(int)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionID:(unsigned int)a3;
- (void)setCoreAccessoryPrimaryUUID:(id)a3;
- (void)setCreatedByCoreAccessories:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationSharingOptions:(unint64_t)a3;
- (void)setDockType:(id)a3;
- (void)setEnqueuedNMEASentences:(id)a3;
- (void)setEnqueuedNMEATimestamps:(id)a3;
- (void)setEqIndex:(unsigned int)a3;
- (void)setEqNames:(id)a3;
- (void)setFirmwareRevisionActive:(id)a3;
- (void)setFirmwareRevisionPending:(id)a3;
- (void)setHardwareRevision:(id)a3;
- (void)setHasIPConnection:(BOOL)a3;
- (void)setHighestFrameworkDelay:(id)a3;
- (void)setHighestXPCDelay:(id)a3;
- (void)setIsAvailableOverBonjour:(BOOL)a3;
- (void)setLocationSentenceTypesMask:(int)a3;
- (void)setMacAddress:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setNmeaSentenceAddCounter:(unint64_t)a3;
- (void)setNmeaSentenceGetCounter:(unint64_t)a3;
- (void)setNotPresentInIAPAccessoriesArray:(BOOL)a3;
- (void)setPairingCompletionBlock:(id)a3;
- (void)setPointOfInterestHandoffEnabled:(BOOL)a3;
- (void)setPpid:(id)a3;
- (void)setPreferredApp:(id)a3;
- (void)setProtocolDetails:(id)a3;
- (void)setProtocols:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setVehicleInfoInitialData:(id)a3;
- (void)setVehicleInfoSupportedTypes:(id)a3;
- (void)setWiFiCredentialsCompletionBlock:(id)a3;
@end

@implementation EAAccessoryInternal

- (EAAccessoryInternal)init
{
  if (-[EAAccessoryInternal init]::onceToken != -1) {
    dispatch_once(&-[EAAccessoryInternal init]::onceToken, &__block_literal_global_0);
  }
  v6.receiver = self;
  v6.super_class = (Class)EAAccessoryInternal;
  v3 = [(EAAccessoryInternal *)&v6 init];
  v4 = v3;
  if (v3)
  {
    v3->_connected = 0;
    v3->_connectionID = 0;
    v3->_notPresentInIAPAccessoriesArray = 0;
    v3->_pointOfInterestHandoffEnabled = 0;
    v3->_destinationSharingOptions = 0;
    v3->_enqueuedNMEASentences = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    v4->_enqueuedNMEATimestamps = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    v4->_highestXPCDelay = (NSNumber *)&unk_1F159A630;
    v4->_highestFrameworkDelay = (NSNumber *)&unk_1F159A630;
    v4->_averageXPCDelay = (NSNumber *)&unk_1F159A630;
    v4->_averageFrameworkDelay = (NSNumber *)&unk_1F159A630;
  }
  return v4;
}

id __27__EAAccessoryInternal_init__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  __gLocationLock = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  self->_connected = 0;
  self->_connectionID = 0;

  self->_notPresentInIAPAccessoriesArray = 0;
  v3.receiver = self;
  v3.super_class = (Class)EAAccessoryInternal;
  [(EAAccessoryInternal *)&v3 dealloc];
}

- (void)addSession:(id)a3
{
  sessionsList = self->_sessionsList;
  if (!sessionsList)
  {
    sessionsList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_sessionsList = sessionsList;
  }

  [(NSMutableArray *)sessionsList addObject:a3];
}

- (void)removeSession:(id)a3
{
  if (![(NSMutableArray *)self->_sessionsList count])
  {

    self->_sessionsList = 0;
  }
}

- (NSArray)sessionsList
{
  return &self->_sessionsList->super;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unsigned int)a3
{
  self->_connectionID = a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareRevisionActive
{
  return self->_firmwareRevisionActive;
}

- (void)setFirmwareRevisionActive:(id)a3
{
}

- (NSString)firmwareRevisionPending
{
  return self->_firmwareRevisionPending;
}

- (void)setFirmwareRevisionPending:(id)a3
{
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
}

- (NSString)dockType
{
  return self->_dockType;
}

- (void)setDockType:(id)a3
{
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)preferredApp
{
  return self->_preferredApp;
}

- (void)setPreferredApp:(id)a3
{
}

- (NSData)certSerial
{
  return self->_certSerial;
}

- (void)setCertSerial:(id)a3
{
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
}

- (NSString)ppid
{
  return self->_ppid;
}

- (void)setPpid:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (int)classType
{
  return self->_classType;
}

- (void)setClassType:(int)a3
{
  self->_classType = a3;
}

- (NSDictionary)audioPorts
{
  return self->_audioPorts;
}

- (void)setAudioPorts:(id)a3
{
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (BOOL)notPresentInIAPAccessoriesArray
{
  return self->_notPresentInIAPAccessoriesArray;
}

- (void)setNotPresentInIAPAccessoriesArray:(BOOL)a3
{
  self->_notPresentInIAPAccessoriesArray = a3;
}

- (NSArray)eqNames
{
  return self->_eqNames;
}

- (void)setEqNames:(id)a3
{
}

- (unsigned)eqIndex
{
  return self->_eqIndex;
}

- (void)setEqIndex:(unsigned int)a3
{
  self->_eqIndex = a3;
}

- (NSDictionary)vehicleInfoSupportedTypes
{
  return self->_vehicleInfoSupportedTypes;
}

- (void)setVehicleInfoSupportedTypes:(id)a3
{
}

- (NSDictionary)vehicleInfoInitialData
{
  return self->_vehicleInfoInitialData;
}

- (void)setVehicleInfoInitialData:(id)a3
{
}

- (NSArray)cameraComponents
{
  return self->_cameraComponents;
}

- (void)setCameraComponents:(id)a3
{
}

- (NSDictionary)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
}

- (NSNumber)highestXPCDelay
{
  return self->_highestXPCDelay;
}

- (void)setHighestXPCDelay:(id)a3
{
}

- (NSNumber)highestFrameworkDelay
{
  return self->_highestFrameworkDelay;
}

- (void)setHighestFrameworkDelay:(id)a3
{
}

- (NSNumber)averageXPCDelay
{
  return self->_averageXPCDelay;
}

- (void)setAverageXPCDelay:(id)a3
{
}

- (NSNumber)averageFrameworkDelay
{
  return self->_averageFrameworkDelay;
}

- (void)setAverageFrameworkDelay:(id)a3
{
}

- (EAAccessoryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EAAccessoryDelegate *)a3;
}

- (BOOL)pointOfInterestHandoffEnabled
{
  return self->_pointOfInterestHandoffEnabled;
}

- (void)setPointOfInterestHandoffEnabled:(BOOL)a3
{
  self->_pointOfInterestHandoffEnabled = a3;
}

- (NSMutableArray)enqueuedNMEASentences
{
  return self->_enqueuedNMEASentences;
}

- (void)setEnqueuedNMEASentences:(id)a3
{
}

- (NSMutableArray)enqueuedNMEATimestamps
{
  return self->_enqueuedNMEATimestamps;
}

- (void)setEnqueuedNMEATimestamps:(id)a3
{
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (NSDictionary)protocolDetails
{
  return self->_protocolDetails;
}

- (void)setProtocolDetails:(id)a3
{
}

- (NSString)coreAccessoryPrimaryUUID
{
  return self->_coreAccessoryPrimaryUUID;
}

- (void)setCoreAccessoryPrimaryUUID:(id)a3
{
}

- (int)locationSentenceTypesMask
{
  return self->_locationSentenceTypesMask;
}

- (void)setLocationSentenceTypesMask:(int)a3
{
  self->_locationSentenceTypesMask = a3;
}

- (unint64_t)nmeaSentenceAddCounter
{
  return self->_nmeaSentenceAddCounter;
}

- (void)setNmeaSentenceAddCounter:(unint64_t)a3
{
  self->_nmeaSentenceAddCounter = a3;
}

- (unint64_t)nmeaSentenceGetCounter
{
  return self->_nmeaSentenceGetCounter;
}

- (void)setNmeaSentenceGetCounter:(unint64_t)a3
{
  self->_nmeaSentenceGetCounter = a3;
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
}

- (BOOL)hasIPConnection
{
  return self->_hasIPConnection;
}

- (void)setHasIPConnection:(BOOL)a3
{
  self->_hasIPConnection = a3;
}

- (BOOL)isAvailableOverBonjour
{
  return self->_isAvailableOverBonjour;
}

- (void)setIsAvailableOverBonjour:(BOOL)a3
{
  self->_isAvailableOverBonjour = a3;
}

- (BOOL)createdByCoreAccessories
{
  return self->_createdByCoreAccessories;
}

- (void)setCreatedByCoreAccessories:(BOOL)a3
{
  self->_createdByCoreAccessories = a3;
}

- (id)pairingCompletionBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setPairingCompletionBlock:(id)a3
{
}

- (id)WiFiCredentialsCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setWiFiCredentialsCompletionBlock:(id)a3
{
}

@end