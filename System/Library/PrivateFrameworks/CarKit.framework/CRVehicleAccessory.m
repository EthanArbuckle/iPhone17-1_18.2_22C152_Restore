@interface CRVehicleAccessory
+ (int64_t)_transportTypeForExternalAccessoryTransportType:(int)a3;
- (BOOL)_updateName;
- (BOOL)isBluetoothConnected;
- (BOOL)supportsBluetoothLE;
- (BOOL)supportsCarPlayConnectionRequest;
- (BOOL)supportsEnhancedIntegration;
- (BOOL)supportsThemeAssets;
- (BOOL)supportsUSBCarPlay;
- (BOOL)supportsWiredBluetoothPairing;
- (BOOL)supportsWirelessCarPlay;
- (EAAccessory)accessory;
- (NSArray)accessoryProtocols;
- (NSData)certificateSerialNumber;
- (NSDictionary)analyticsDescription;
- (NSDictionary)digitalCarKeyInformation;
- (NSDictionary)vehicleAccessoryInfoKeys;
- (NSDictionary)vehicleAccessoryInfoKeysCache;
- (NSDictionary)vehicleInfoDataCache;
- (NSNumber)connectionID;
- (NSString)PPID;
- (NSString)bluetoothAddress;
- (NSString)description;
- (NSString)radarDescription;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (id)coreAccessoriesEndpointUUID;
- (id)displayName;
- (int64_t)transportType;
- (void)beginWiredBluetoothPairing:(id)a3;
- (void)requestWiFiCredentials;
- (void)sendDeviceTransportIdentifiers;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7;
- (void)setAccessory:(id)a3;
- (void)setAccessoryProtocols:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setCertificateSerialNumber:(id)a3;
- (void)setConnectionID:(id)a3;
- (void)setDigitalCarKeyInformation:(id)a3;
- (void)setPPID:(id)a3;
- (void)setSupportsBluetoothLE:(BOOL)a3;
- (void)setSupportsCarPlayConnectionRequest:(BOOL)a3;
- (void)setSupportsEnhancedIntegration:(BOOL)a3;
- (void)setSupportsThemeAssets:(BOOL)a3;
- (void)setSupportsUSBCarPlay:(BOOL)a3;
- (void)setSupportsWiredBluetoothPairing:(BOOL)a3;
- (void)setSupportsWirelessCarPlay:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setVehicleAccessoryInfoKeysCache:(id)a3;
- (void)setVehicleInfoDataCache:(id)a3;
- (void)setVehicleModelName:(id)a3;
- (void)setVehicleName:(id)a3;
@end

@implementation CRVehicleAccessory

+ (int64_t)_transportTypeForExternalAccessoryTransportType:(int)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return qword_1ABB4CB30[a3];
  }
}

- (BOOL)isBluetoothConnected
{
  v2 = [(CRVehicleAccessory *)self bluetoothAddress];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)displayName
{
  BOOL v3 = [(CRVehicleAccessory *)self vehicleName];
  if (![v3 length])
  {
    v4 = [(CRVehicleAccessory *)self bluetoothAddress];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      v6 = [(CRVehicleAccessory *)self bluetoothAddress];
    }
    else
    {
      v6 = &stru_1F03060C0;
    }

    BOOL v3 = v6;
  }
  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v4 = [(CRVehicleAccessory *)self vehicleName];
  int64_t v5 = [(CRVehicleAccessory *)self transportType];
  if ((unint64_t)(v5 - 1) > 3) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E5E3BA08[v5 - 1];
  }
  if (v4) {
    v7 = v4;
  }
  else {
    v7 = @"<unnamed>";
  }
  v8 = [(CRVehicleAccessory *)self accessoryProtocols];
  v9 = [(CRVehicleAccessory *)self bluetoothAddress];
  v10 = [v3 stringWithFormat:@"%@ (transport: %@, protocols: %@, bluetoothAddress: %@)", v7, v6, v8, v9];

  return (NSString *)v10;
}

- (NSString)radarDescription
{
  BOOL v3 = [(CRVehicleAccessory *)self accessory];
  v18 = NSString;
  v19 = [(CRVehicleAccessory *)self vehicleName];
  int64_t v4 = [(CRVehicleAccessory *)self transportType];
  if ((unint64_t)(v4 - 1) > 3) {
    int64_t v5 = @"unknown";
  }
  else {
    int64_t v5 = off_1E5E3BA08[v4 - 1];
  }
  v17 = v5;
  v6 = [v3 name];
  v7 = [v3 manufacturer];
  v8 = [v3 modelNumber];
  v9 = [v3 firmwareRevision];
  v10 = [v3 hardwareRevision];
  v11 = [v3 serialNumber];
  v12 = @"YES";
  if ([v3 supportsWirelessCarPlay]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (([v3 accessoryCapabilities] & 8) == 0) {
    v12 = @"NO";
  }
  v14 = [v3 ppid];
  v15 = [v18 stringWithFormat:@"Name: %@\nTransport: %@\nAccessory Name: %@\nManufacturer: %@\nModel Number: %@\nFirmware Revision: %@\nHardware Revision: %@\nSerial Number: %@\nSupports Wireless: %@\nProvides Location: %@\nPPID: %@\n", v19, v17, v6, v7, v8, v9, v10, v11, v13, v12, v14];

  return (NSString *)v15;
}

- (NSDictionary)analyticsDescription
{
  v2 = [(CRVehicleAccessory *)self vehicleAccessoryInfoKeys];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v4 = [v2 objectForKeyedSubscript:@"name"];

  if (v4)
  {
    int64_t v5 = [v2 objectForKeyedSubscript:@"name"];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  v6 = [v2 objectForKeyedSubscript:@"modelName"];

  if (v6)
  {
    v7 = [v2 objectForKeyedSubscript:@"modelName"];
    [v3 setObject:v7 forKeyedSubscript:@"modelName"];
  }
  v8 = [v2 objectForKeyedSubscript:@"manufacturer"];

  if (v8)
  {
    v9 = [v2 objectForKeyedSubscript:@"manufacturer"];
    [v3 setObject:v9 forKeyedSubscript:@"manufacturer"];
  }
  v10 = [v2 objectForKeyedSubscript:@"ppid"];

  if (v10)
  {
    v11 = [v2 objectForKeyedSubscript:@"ppid"];
    [v3 setObject:v11 forKeyedSubscript:@"ppid"];
  }
  v12 = [v2 objectForKeyedSubscript:@"firmwareVersion"];

  if (v12)
  {
    v13 = [v2 objectForKeyedSubscript:@"firmwareVersion"];
    [v3 setObject:v13 forKeyedSubscript:@"firmwareVersion"];
  }
  v14 = [v2 objectForKeyedSubscript:@"hardwareVersion"];

  if (v14)
  {
    v15 = [v2 objectForKeyedSubscript:@"hardwareVersion"];
    [v3 setObject:v15 forKeyedSubscript:@"hardwareVersion"];
  }
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return (NSDictionary *)v16;
}

- (NSDictionary)vehicleAccessoryInfoKeys
{
  BOOL v3 = [(CRVehicleAccessory *)self vehicleInfoDataCache];
  int64_t v4 = [(CRVehicleAccessory *)self accessory];
  if (v4)
  {
    if (![v3 count])
    {
      uint64_t v5 = [v4 vehicleInfoInitialData];

      BOOL v3 = (void *)v5;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(CRVehicleAccessory *)self vehicleAccessoryInfoKeysCache];
  if (!v6)
  {
LABEL_8:
    v9 = [v4 manufacturer];
    v10 = [v4 modelNumber];
    v11 = [v4 name];
    v12 = [v4 serialNumber];
    v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F258E8]];
    v29 = [v4 ppid];
    v14 = [v4 firmwareRevision];
    v31 = [v4 hardwareRevision];
    char v28 = [v4 destinationSharingOptions];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = v15;
    if (v9) {
      [v15 setObject:v9 forKey:@"manufacturer"];
    }
    if (v10) {
      [v7 setObject:v10 forKey:@"modelName"];
    }
    if (v11) {
      [v7 setObject:v11 forKey:@"name"];
    }
    if (v14) {
      [v7 setObject:v14 forKey:@"firmwareVersion"];
    }
    if (v31) {
      [v7 setObject:v31 forKey:@"hardwareVersion"];
    }
    if (v12) {
      [v7 setObject:v12 forKey:@"serialNumber"];
    }
    v30 = v13;
    if (v13)
    {
      char v16 = [v13 unsignedIntegerValue];
      [NSNumber numberWithUnsignedInt:v16 & 1];
      v27 = v12;
      v17 = v11;
      v18 = v10;
      v19 = v9;
      v21 = v20 = v3;
      [v7 setObject:v21 forKey:@"engineTypeGasoline"];

      v22 = [NSNumber numberWithUnsignedInt:v16 & 2];
      [v7 setObject:v22 forKey:@"engineTypeDiesel"];

      v23 = [NSNumber numberWithUnsignedInt:v16 & 4];
      [v7 setObject:v23 forKey:@"engineTypeElectric"];

      BOOL v3 = v20;
      v9 = v19;
      v10 = v18;
      v11 = v17;
      v12 = v27;
      v24 = [NSNumber numberWithUnsignedInt:v16 & 8];
      [v7 setObject:v24 forKey:@"engineTypeCNG"];
    }
    if (v29) {
      [v7 setObject:v29 forKey:@"ppid"];
    }
    v25 = [NSNumber numberWithBool:v28 & 1];
    [v7 setObject:v25 forKey:@"destinationSharing"];

    [(CRVehicleAccessory *)self setVehicleAccessoryInfoKeysCache:v7];
    goto LABEL_25;
  }
  v7 = (void *)v6;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "Falling back to cached vehicleAccessoryInfoKeys while accessory is not available", buf, 2u);
  }

LABEL_25:
  return (NSDictionary *)v7;
}

- (id)coreAccessoriesEndpointUUID
{
  v2 = [(CRVehicleAccessory *)self accessory];
  BOOL v3 = [v2 coreAccessoriesPrimaryUUID];

  return v3;
}

- (BOOL)_updateName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CRVehicleAccessory *)self accessory];
  int64_t v4 = [(CRVehicleAccessory *)self vehicleInfoDataCache];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F258E0]];
  if ([v5 length])
  {
    uint64_t v6 = v5;
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = [v3 name];

    v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "Vehicle did not have display name, falling back to \"%@\"", (uint8_t *)&v16, 0xCu);
    }

    if (!v6) {
      goto LABEL_9;
    }
  }
  v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v9 = [v6 componentsSeparatedByCharactersInSet:v8];
  v10 = [v9 componentsJoinedByString:@" "];

  v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v6 = [v10 stringByTrimmingCharactersInSet:v11];

  if (v6)
  {
    v12 = [(CRVehicleAccessory *)self vehicleName];
    char v13 = [v6 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      [(CRVehicleAccessory *)self setVehicleName:v6];
      BOOL v14 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (void)beginWiredBluetoothPairing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRVehicleAccessory *)self accessory];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__CRVehicleAccessory_beginWiredBluetoothPairing___block_invoke;
    v6[3] = &unk_1E5E3B958;
    id v7 = v4;
    [v5 beginOOBBTPairingWithCompletionBlock:v6];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __49__CRVehicleAccessory_beginWiredBluetoothPairing___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "beginOOBBTPairingWithCompletionBlock %i %@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, a2 == 0, v5);
  }
}

- (void)requestWiFiCredentials
{
  BOOL v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "requesting WiFi credentials", v5, 2u);
  }

  id v4 = [(CRVehicleAccessory *)self accessory];
  [v4 requestIAPAccessoryWiFiCredentials];
}

- (void)sendDeviceTransportIdentifiers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MGGetStringAnswer();
  id v4 = (void *)MGGetStringAnswer();
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "sending device transport identifiers BT: %@ USB: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(CRVehicleAccessory *)self accessory];
  [v6 sendDeviceIdentifierNotification:v3 usbIdentifier:v4];
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F258F8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v20 = [v12 sharedAccessoryManager];
  uint64_t v18 = [(CRVehicleAccessory *)self accessory];
  v19 = [v18 coreAccessoriesPrimaryUUID];
  [v20 sendWiredCarPlayAvailable:v17 usbIdentifier:v16 wirelessCarPlayAvailable:v15 bluetoothIdentifier:v14 themeAssetsAvailable:v13 forUUID:v19];
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (void)setVehicleModelName:(id)a3
{
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (void)setCertificateSerialNumber:(id)a3
{
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (void)setAccessoryProtocols:(id)a3
{
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
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

- (NSNumber)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (void)setSupportsUSBCarPlay:(BOOL)a3
{
  self->_supportsUSBCarPlay = a3;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (void)setSupportsWirelessCarPlay:(BOOL)a3
{
  self->_supportsWirelessCarPlay = a3;
}

- (BOOL)supportsWiredBluetoothPairing
{
  return self->_supportsWiredBluetoothPairing;
}

- (void)setSupportsWiredBluetoothPairing:(BOOL)a3
{
  self->_supportsWiredBluetoothPairing = a3;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return self->_supportsCarPlayConnectionRequest;
}

- (void)setSupportsCarPlayConnectionRequest:(BOOL)a3
{
  self->_supportsCarPlayConnectionRequest = a3;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void)setSupportsBluetoothLE:(BOOL)a3
{
  self->_supportsBluetoothLE = a3;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void)setSupportsThemeAssets:(BOOL)a3
{
  self->_supportsThemeAssets = a3;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (void)setSupportsEnhancedIntegration:(BOOL)a3
{
  self->_supportsEnhancedIntegration = a3;
}

- (EAAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (EAAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (NSString)PPID
{
  return self->_PPID;
}

- (void)setPPID:(id)a3
{
}

- (NSDictionary)vehicleInfoDataCache
{
  return self->_vehicleInfoDataCache;
}

- (void)setVehicleInfoDataCache:(id)a3
{
}

- (NSDictionary)vehicleAccessoryInfoKeysCache
{
  return self->_vehicleAccessoryInfoKeysCache;
}

- (void)setVehicleAccessoryInfoKeysCache:(id)a3
{
}

- (NSDictionary)digitalCarKeyInformation
{
  return self->_digitalCarKeyInformation;
}

- (void)setDigitalCarKeyInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalCarKeyInformation, 0);
  objc_storeStrong((id *)&self->_vehicleAccessoryInfoKeysCache, 0);
  objc_storeStrong((id *)&self->_vehicleInfoDataCache, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
}

@end