@interface _BMDeviceWirelessLibraryNode
+ (id)APSDInterfaceStatus;
+ (id)AirplaneMode;
+ (id)Bluetooth;
+ (id)BluetoothGATTSession;
+ (id)BluetoothNearbyDevice;
+ (id)BluetoothPowerEnabled;
+ (id)BluetoothUseCase;
+ (id)CellularAvailabilityStatus;
+ (id)CellularDataEnabled;
+ (id)CellularQualityStatus;
+ (id)ConnectivityContext;
+ (id)DefaultPairedNearby;
+ (id)NFCTag;
+ (id)WakeOnWiFiStatus;
+ (id)WiFi;
+ (id)WiFiAvailabilityStatus;
+ (id)configurationForAPSDInterfaceStatus;
+ (id)configurationForAirplaneMode;
+ (id)configurationForBluetooth;
+ (id)configurationForBluetoothGATTSession;
+ (id)configurationForBluetoothNearbyDevice;
+ (id)configurationForBluetoothPowerEnabled;
+ (id)configurationForBluetoothUseCase;
+ (id)configurationForCellularAvailabilityStatus;
+ (id)configurationForCellularDataEnabled;
+ (id)configurationForCellularQualityStatus;
+ (id)configurationForConnectivityContext;
+ (id)configurationForDefaultPairedNearby;
+ (id)configurationForNFCTag;
+ (id)configurationForWakeOnWiFiStatus;
+ (id)configurationForWiFi;
+ (id)configurationForWiFiAvailabilityStatus;
+ (id)identifier;
+ (id)storeConfigurationForAPSDInterfaceStatus;
+ (id)storeConfigurationForAirplaneMode;
+ (id)storeConfigurationForBluetooth;
+ (id)storeConfigurationForBluetoothGATTSession;
+ (id)storeConfigurationForBluetoothNearbyDevice;
+ (id)storeConfigurationForBluetoothPowerEnabled;
+ (id)storeConfigurationForBluetoothUseCase;
+ (id)storeConfigurationForCellularAvailabilityStatus;
+ (id)storeConfigurationForCellularDataEnabled;
+ (id)storeConfigurationForCellularQualityStatus;
+ (id)storeConfigurationForConnectivityContext;
+ (id)storeConfigurationForDefaultPairedNearby;
+ (id)storeConfigurationForNFCTag;
+ (id)storeConfigurationForWakeOnWiFiStatus;
+ (id)storeConfigurationForWiFi;
+ (id)storeConfigurationForWiFiAvailabilityStatus;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAPSDInterfaceStatus;
+ (id)syncPolicyForAirplaneMode;
+ (id)syncPolicyForBluetooth;
+ (id)syncPolicyForBluetoothGATTSession;
+ (id)syncPolicyForBluetoothNearbyDevice;
+ (id)syncPolicyForBluetoothPowerEnabled;
+ (id)syncPolicyForBluetoothUseCase;
+ (id)syncPolicyForCellularAvailabilityStatus;
+ (id)syncPolicyForCellularDataEnabled;
+ (id)syncPolicyForCellularQualityStatus;
+ (id)syncPolicyForConnectivityContext;
+ (id)syncPolicyForDefaultPairedNearby;
+ (id)syncPolicyForNFCTag;
+ (id)syncPolicyForWakeOnWiFiStatus;
+ (id)syncPolicyForWiFi;
+ (id)syncPolicyForWiFiAvailabilityStatus;
+ (id)validKeyPaths;
@end

@implementation _BMDeviceWirelessLibraryNode

+ (id)streamNames
{
  return &unk_1F0BF64C8;
}

+ (id)identifier
{
  return @"Wireless";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AirplaneMode"])
  {
    uint64_t v5 = [a1 AirplaneMode];
LABEL_33:
    v6 = (void *)v5;
    goto LABEL_34;
  }
  if ([v4 isEqualToString:@"APSDInterfaceStatus"])
  {
    uint64_t v5 = [a1 APSDInterfaceStatus];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"Bluetooth"])
  {
    uint64_t v5 = [a1 Bluetooth];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"BluetoothGATTSession"])
  {
    uint64_t v5 = [a1 BluetoothGATTSession];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"BluetoothNearbyDevice"])
  {
    uint64_t v5 = [a1 BluetoothNearbyDevice];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"BluetoothPowerEnabled"])
  {
    uint64_t v5 = [a1 BluetoothPowerEnabled];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"BluetoothUseCase"])
  {
    uint64_t v5 = [a1 BluetoothUseCase];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"CellularAvailabilityStatus"])
  {
    uint64_t v5 = [a1 CellularAvailabilityStatus];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"CellularDataEnabled"])
  {
    uint64_t v5 = [a1 CellularDataEnabled];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"CellularQualityStatus"])
  {
    uint64_t v5 = [a1 CellularQualityStatus];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"ConnectivityContext"])
  {
    uint64_t v5 = [a1 ConnectivityContext];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"DefaultPairedNearby"])
  {
    uint64_t v5 = [a1 DefaultPairedNearby];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"NFCTag"])
  {
    uint64_t v5 = [a1 NFCTag];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"WakeOnWiFiStatus"])
  {
    uint64_t v5 = [a1 WakeOnWiFiStatus];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"WiFi"])
  {
    uint64_t v5 = [a1 WiFi];
    goto LABEL_33;
  }
  if ([v4 isEqualToString:@"WiFiAvailabilityStatus"])
  {
    uint64_t v5 = [a1 WiFiAvailabilityStatus];
    goto LABEL_33;
  }
  v6 = 0;
LABEL_34:

  return v6;
}

+ (id)WiFiAvailabilityStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForWiFiAvailabilityStatus];
  v3 = +[BMDeviceWiFiAvailabilityStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.WiFiAvailabilityStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.WiFiAvailabilityStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForWiFiAvailabilityStatus
{
  v3 = [a1 storeConfigurationForWiFiAvailabilityStatus];
  id v4 = [a1 syncPolicyForWiFiAvailabilityStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D24A8A28-B844-4450-8044-42DBA85D9FEF"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.WiFiAvailabilityStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWiFiAvailabilityStatus
{
  return 0;
}

+ (id)storeConfigurationForWiFiAvailabilityStatus
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:259200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.WiFiAvailabilityStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WiFi
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForWiFi];
  v3 = +[BMDeviceWiFi columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.WiFi" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.WiFi" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForWiFi
{
  v3 = [a1 storeConfigurationForWiFi];
  id v4 = [a1 syncPolicyForWiFi];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DF033FBC-B5CF-4E16-86FA-C1B30FAB122E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.WiFi", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWiFi
{
  return 0;
}

+ (id)storeConfigurationForWiFi
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.WiFi" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WakeOnWiFiStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForWakeOnWiFiStatus];
  v3 = +[BMDeviceWakeOnWiFiStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.WakeOnWiFiStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.WakeOnWiFiStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForWakeOnWiFiStatus
{
  v3 = [a1 storeConfigurationForWakeOnWiFiStatus];
  id v4 = [a1 syncPolicyForWakeOnWiFiStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"645BAE4A-C775-4F39-87B1-658E45F43C55"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.WakeOnWiFiStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWakeOnWiFiStatus
{
  return 0;
}

+ (id)storeConfigurationForWakeOnWiFiStatus
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:259200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.WakeOnWiFiStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)NFCTag
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForNFCTag];
  v3 = +[BMDeviceNFCTag columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.NFCTag" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.NFCTag" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForNFCTag
{
  v3 = [a1 storeConfigurationForNFCTag];
  id v4 = [a1 syncPolicyForNFCTag];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"55DEDFF2-E05F-44E5-AD33-578E3CABFDF8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.NFCTag", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForNFCTag
{
  return 0;
}

+ (id)storeConfigurationForNFCTag
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.NFCTag" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Bluetooth
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForBluetooth];
  v3 = +[BMDeviceBluetooth columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.Bluetooth" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.Bluetooth" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBluetooth
{
  v3 = [a1 storeConfigurationForBluetooth];
  id v4 = [a1 syncPolicyForBluetooth];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7920E574-B675-4313-B1FB-4792805B3B25"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.Bluetooth", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBluetooth
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v26[0] = v20;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v25 = v19;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v24 = v18;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v23 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v21[0] = v6;
  v17 = (void *)v2;
  v22[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v21[1] = v7;
  v22[1] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v21[2] = v8;
  v22[2] = v3;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v21[3] = v9;
  v22[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v21[4] = v10;
  v22[4] = v16;
  v11 = BMDevicePlatformAsKeyString();
  v21[5] = v11;
  v22[5] = v5;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7920E574-B675-4313-B1FB-4792805B3B25"];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v12 syncUUID:v13 legacySyncID:0 eventClass:objc_opt_class()];

  return v14;
}

+ (id)storeConfigurationForBluetooth
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.Bluetooth" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)BluetoothUseCase
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForBluetoothUseCase];
  v3 = +[BMDeviceBluetoothUseCase columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.BluetoothUseCase" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.BluetoothUseCase" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBluetoothUseCase
{
  v3 = [a1 storeConfigurationForBluetoothUseCase];
  id v4 = [a1 syncPolicyForBluetoothUseCase];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"01E60FD6-8451-446F-9F59-665749651E38"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.BluetoothUseCase", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBluetoothUseCase
{
  return 0;
}

+ (id)storeConfigurationForBluetoothUseCase
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.BluetoothUseCase" domain:0 segmentSize:0x100000 protectionClass:5 pruningPolicy:v2];

  return v3;
}

+ (id)BluetoothPowerEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForBluetoothPowerEnabled];
  v3 = +[BMDeviceBluetoothPowerEnabled columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.BluetoothPowerEnabled" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.BluetoothPowerEnabled" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBluetoothPowerEnabled
{
  v3 = [a1 storeConfigurationForBluetoothPowerEnabled];
  id v4 = [a1 syncPolicyForBluetoothPowerEnabled];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F73FFD7F-1B3C-435C-AE64-86D5314E790D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.BluetoothPowerEnabled", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBluetoothPowerEnabled
{
  return 0;
}

+ (id)storeConfigurationForBluetoothPowerEnabled
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.BluetoothPowerEnabled" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)BluetoothNearbyDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForBluetoothNearbyDevice];
  v3 = +[BMDeviceBluetoothNearbyDevice columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.BluetoothNearbyDevice" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.BluetoothNearbyDevice" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBluetoothNearbyDevice
{
  v3 = [a1 storeConfigurationForBluetoothNearbyDevice];
  id v4 = [a1 syncPolicyForBluetoothNearbyDevice];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EEE3223A-C8CC-47D7-8FA0-271FD75D954F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.BluetoothNearbyDevice", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBluetoothNearbyDevice
{
  return 0;
}

+ (id)storeConfigurationForBluetoothNearbyDevice
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.BluetoothNearbyDevice" domain:0 segmentSize:0x20000 protectionClass:5 pruningPolicy:v2];

  return v3;
}

+ (id)BluetoothGATTSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForBluetoothGATTSession];
  v3 = +[BMDeviceBluetoothGATTSession columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.BluetoothGATTSession" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.BluetoothGATTSession" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBluetoothGATTSession
{
  v3 = [a1 storeConfigurationForBluetoothGATTSession];
  id v4 = [a1 syncPolicyForBluetoothGATTSession];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"02882AFB-F125-4DAE-8ED2-9AE1B2743D7D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.BluetoothGATTSession", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBluetoothGATTSession
{
  return 0;
}

+ (id)storeConfigurationForBluetoothGATTSession
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.BluetoothGATTSession" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AirplaneMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForAirplaneMode];
  v3 = +[BMDeviceAirplaneMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.AirplaneMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.AirplaneMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAirplaneMode
{
  v3 = [a1 storeConfigurationForAirplaneMode];
  id v4 = [a1 syncPolicyForAirplaneMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"40DB4DA1-A0B0-4198-BB81-8EF341CCAB8F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.AirplaneMode", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAirplaneMode
{
  return 0;
}

+ (id)storeConfigurationForAirplaneMode
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.AirplaneMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)APSDInterfaceStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForAPSDInterfaceStatus];
  v3 = +[BMDeviceAPSDInterfaceStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.APSDInterfaceStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.APSDInterfaceStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAPSDInterfaceStatus
{
  v3 = [a1 storeConfigurationForAPSDInterfaceStatus];
  id v4 = [a1 syncPolicyForAPSDInterfaceStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"044C3C96-6418-4E5E-8B4C-4B0994CFADA8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.APSDInterfaceStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAPSDInterfaceStatus
{
  return 0;
}

+ (id)storeConfigurationForAPSDInterfaceStatus
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:259200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.APSDInterfaceStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDefaultPairedNearby
{
  v3 = [a1 storeConfigurationForDefaultPairedNearby];
  id v4 = [a1 syncPolicyForDefaultPairedNearby];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"24D3E99E-ABBC-4DFD-997C-AA636A42E9F2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.DefaultPairedNearby", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDefaultPairedNearby
{
  return 0;
}

+ (id)DefaultPairedNearby
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForDefaultPairedNearby];
  v3 = +[BMDeviceDefaultPairedNearby columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.DefaultPairedNearby" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.DefaultPairedNearby" schema:v9 configuration:v2];

  return v10;
}

+ (id)storeConfigurationForDefaultPairedNearby
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.DefaultPairedNearby" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDeviceAirplaneMode validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMDeviceAPSDInterfaceStatus validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMDeviceBluetooth validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMDeviceBluetoothGATTSession validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMDeviceBluetoothNearbyDevice validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMDeviceBluetoothPowerEnabled validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = +[BMDeviceBluetoothUseCase validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMDeviceCellularAvailabilityStatus validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMDeviceCellularDataEnabled validKeyPaths];
  [v2 addObjectsFromArray:v11];

  v12 = +[BMDeviceCellularQualityStatus validKeyPaths];
  [v2 addObjectsFromArray:v12];

  v13 = +[BMDeviceConnectivityContext validKeyPaths];
  [v2 addObjectsFromArray:v13];

  v14 = +[BMDeviceDefaultPairedNearby validKeyPaths];
  [v2 addObjectsFromArray:v14];

  uint64_t v15 = +[BMDeviceNFCTag validKeyPaths];
  [v2 addObjectsFromArray:v15];

  v16 = +[BMDeviceWakeOnWiFiStatus validKeyPaths];
  [v2 addObjectsFromArray:v16];

  v17 = +[BMDeviceWiFi validKeyPaths];
  [v2 addObjectsFromArray:v17];

  v18 = +[BMDeviceWiFiAvailabilityStatus validKeyPaths];
  [v2 addObjectsFromArray:v18];

  v19 = (void *)[v2 copy];

  return v19;
}

+ (id)configurationForConnectivityContext
{
  v3 = [a1 storeConfigurationForConnectivityContext];
  id v4 = [a1 syncPolicyForConnectivityContext];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3352CC72-5879-4250-9A42-3D63D350FB09"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.ConnectivityContext", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForConnectivityContext
{
  return 0;
}

+ (id)storeConfigurationForConnectivityContext
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.ConnectivityContext" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCellularQualityStatus
{
  v3 = [a1 storeConfigurationForCellularQualityStatus];
  id v4 = [a1 syncPolicyForCellularQualityStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"179E578E-A444-43C3-BF36-BB54BF1904CC"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.CellularQualityStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForCellularQualityStatus
{
  return 0;
}

+ (id)storeConfigurationForCellularQualityStatus
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:259200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.CellularQualityStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCellularDataEnabled
{
  v3 = [a1 storeConfigurationForCellularDataEnabled];
  id v4 = [a1 syncPolicyForCellularDataEnabled];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B08AFAE4-D1DF-4623-85A3-99FE76307B84"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.CellularDataEnabled", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForCellularDataEnabled
{
  return 0;
}

+ (id)storeConfigurationForCellularDataEnabled
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.CellularDataEnabled" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCellularAvailabilityStatus
{
  v3 = [a1 storeConfigurationForCellularAvailabilityStatus];
  id v4 = [a1 syncPolicyForCellularAvailabilityStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BC47690A-50B7-420A-A8C4-5DF634E008C9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Wireless.CellularAvailabilityStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForCellularAvailabilityStatus
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v15[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v14 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v12[0] = v6;
  v13[0] = v3;
  v7 = BMDevicePlatformAsKeyString();
  v12[1] = v7;
  v13[1] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BC47690A-50B7-420A-A8C4-5DF634E008C9"];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v8 syncUUID:v9 legacySyncID:0 eventClass:objc_opt_class()];

  return v10;
}

+ (id)storeConfigurationForCellularAvailabilityStatus
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:604800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Wireless.CellularAvailabilityStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)ConnectivityContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForConnectivityContext];
  v3 = +[BMDeviceConnectivityContext columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.ConnectivityContext" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.ConnectivityContext" schema:v9 configuration:v2];

  return v10;
}

+ (id)CellularQualityStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCellularQualityStatus];
  v3 = +[BMDeviceCellularQualityStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.CellularQualityStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.CellularQualityStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)CellularDataEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCellularDataEnabled];
  v3 = +[BMDeviceCellularDataEnabled columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.CellularDataEnabled" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.CellularDataEnabled" schema:v9 configuration:v2];

  return v10;
}

+ (id)CellularAvailabilityStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCellularAvailabilityStatus];
  v3 = +[BMDeviceCellularAvailabilityStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Wireless.CellularAvailabilityStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Wireless.CellularAvailabilityStatus" schema:v9 configuration:v2];

  return v10;
}

@end