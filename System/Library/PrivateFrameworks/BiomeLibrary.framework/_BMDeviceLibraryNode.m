@interface _BMDeviceLibraryNode
+ (id)Audio;
+ (id)BootSession;
+ (id)Charging;
+ (id)Display;
+ (id)KeybagLocked;
+ (id)Metadata;
+ (id)Networking;
+ (id)Power;
+ (id)ScreenLocked;
+ (id)Settings;
+ (id)SilentMode;
+ (id)Thermals;
+ (id)TimeZone;
+ (id)Wireless;
+ (id)configurationForBootSession;
+ (id)configurationForKeybagLocked;
+ (id)configurationForMetadata;
+ (id)configurationForScreenLocked;
+ (id)configurationForSilentMode;
+ (id)configurationForTimeZone;
+ (id)identifier;
+ (id)storeConfigurationForBootSession;
+ (id)storeConfigurationForKeybagLocked;
+ (id)storeConfigurationForMetadata;
+ (id)storeConfigurationForScreenLocked;
+ (id)storeConfigurationForSilentMode;
+ (id)storeConfigurationForTimeZone;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForBootSession;
+ (id)syncPolicyForKeybagLocked;
+ (id)syncPolicyForMetadata;
+ (id)syncPolicyForScreenLocked;
+ (id)syncPolicyForSilentMode;
+ (id)syncPolicyForTimeZone;
+ (id)validKeyPaths;
@end

@implementation _BMDeviceLibraryNode

+ (id)sublibraries
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Audio];
  v13[0] = v3;
  v4 = [a1 Charging];
  v13[1] = v4;
  v5 = [a1 Display];
  v13[2] = v5;
  v6 = [a1 Networking];
  v13[3] = v6;
  v7 = [a1 Power];
  v13[4] = v7;
  v8 = [a1 Settings];
  v13[5] = v8;
  v9 = [a1 Thermals];
  v13[6] = v9;
  v10 = [a1 Wireless];
  v13[7] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];

  return v11;
}

+ (id)Power
{
  return (id)objc_opt_class();
}

+ (id)Wireless
{
  return (id)objc_opt_class();
}

+ (id)Thermals
{
  return (id)objc_opt_class();
}

+ (id)Settings
{
  return (id)objc_opt_class();
}

+ (id)Networking
{
  return (id)objc_opt_class();
}

+ (id)Display
{
  return (id)objc_opt_class();
}

+ (id)Charging
{
  return (id)objc_opt_class();
}

+ (id)Audio
{
  return (id)objc_opt_class();
}

+ (id)identifier
{
  return @"Device";
}

+ (id)streamNames
{
  return &unk_1F0BF33F0;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"BootSession"])
  {
    uint64_t v5 = [a1 BootSession];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"KeybagLocked"])
  {
    uint64_t v5 = [a1 KeybagLocked];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Metadata"])
  {
    uint64_t v5 = [a1 Metadata];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"ScreenLocked"])
  {
    uint64_t v5 = [a1 ScreenLocked];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"SilentMode"])
  {
    uint64_t v5 = [a1 SilentMode];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"TimeZone"])
  {
    uint64_t v5 = [a1 TimeZone];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)TimeZone
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForTimeZone];
  v3 = +[BMDeviceTimeZone columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.TimeZone" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.TimeZone" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForTimeZone
{
  v3 = [a1 storeConfigurationForTimeZone];
  id v4 = [a1 syncPolicyForTimeZone];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"005DDB73-4A3B-42B7-9248-B79DD750A796"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.TimeZone", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTimeZone
{
  return 0;
}

+ (id)storeConfigurationForTimeZone
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.TimeZone" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)SilentMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForSilentMode];
  v3 = +[BMDeviceSilentMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.SilentMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.SilentMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForSilentMode
{
  v3 = [a1 storeConfigurationForSilentMode];
  id v4 = [a1 syncPolicyForSilentMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"42F54E31-3FCF-4F6D-BC40-F903BFD3049F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.SilentMode", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSilentMode
{
  return 0;
}

+ (id)storeConfigurationForSilentMode
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.SilentMode" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)ScreenLocked
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForScreenLocked];
  v3 = +[BMDeviceScreenLocked columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.ScreenLocked" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.ScreenLocked" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForScreenLocked
{
  v3 = [a1 storeConfigurationForScreenLocked];
  id v4 = [a1 syncPolicyForScreenLocked];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FFC34BE2-247E-48A2-A938-9BEDED035AC0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.ScreenLocked", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForScreenLocked
{
  return 0;
}

+ (id)storeConfigurationForScreenLocked
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.ScreenLocked" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Metadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForMetadata];
  v3 = +[BMDeviceMetadata columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Metadata" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Metadata" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForMetadata
{
  v3 = [a1 storeConfigurationForMetadata];
  id v4 = [a1 syncPolicyForMetadata];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"64604D4C-2A61-4066-964C-DE45160E49E7"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Metadata", objc_opt_class(), v3, v4, &unk_1F0BF33D8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMetadata
{
  return 0;
}

+ (id)storeConfigurationForMetadata
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x20000 maxStreamSize:10000 maxEventCount:*MEMORY[0x1E4F50250]];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Metadata" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)KeybagLocked
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForKeybagLocked];
  v3 = +[BMDeviceKeybagLocked columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.KeybagLocked" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.KeybagLocked" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForKeybagLocked
{
  v3 = [a1 storeConfigurationForKeybagLocked];
  id v4 = [a1 syncPolicyForKeybagLocked];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"ABD50648-7A45-4CBE-B030-1D6CEC26F9F9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.KeybagLocked", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForKeybagLocked
{
  return 0;
}

+ (id)storeConfigurationForKeybagLocked
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.KeybagLocked" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)BootSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForBootSession];
  v3 = +[BMDeviceBootSession columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.BootSession" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.BootSession" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBootSession
{
  v3 = [a1 storeConfigurationForBootSession];
  id v4 = [a1 syncPolicyForBootSession];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E4B4BD0A-356B-4F9A-B205-FAE36BC5131A"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.BootSession", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBootSession
{
  return 0;
}

+ (id)storeConfigurationForBootSession
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.BootSession" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDeviceBootSession validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMDeviceKeybagLocked validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMDeviceMetadata validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMDeviceScreenLocked validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMDeviceSilentMode validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMDeviceTimeZone validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = (void *)[v2 copy];

  return v9;
}

@end