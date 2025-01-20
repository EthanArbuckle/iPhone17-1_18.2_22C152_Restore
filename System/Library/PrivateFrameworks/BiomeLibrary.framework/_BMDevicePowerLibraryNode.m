@interface _BMDevicePowerLibraryNode
+ (id)BatteryLevel;
+ (id)EnergyMode;
+ (id)LowPowerMode;
+ (id)PluggedIn;
+ (id)configurationForBatteryLevel;
+ (id)configurationForEnergyMode;
+ (id)configurationForLowPowerMode;
+ (id)configurationForPluggedIn;
+ (id)identifier;
+ (id)storeConfigurationForBatteryLevel;
+ (id)storeConfigurationForEnergyMode;
+ (id)storeConfigurationForLowPowerMode;
+ (id)storeConfigurationForPluggedIn;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForBatteryLevel;
+ (id)syncPolicyForEnergyMode;
+ (id)syncPolicyForLowPowerMode;
+ (id)syncPolicyForPluggedIn;
+ (id)validKeyPaths;
@end

@implementation _BMDevicePowerLibraryNode

+ (id)BatteryLevel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForBatteryLevel];
  v3 = +[BMDeviceBatteryLevel columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Power.BatteryLevel" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Power.BatteryLevel" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBatteryLevel
{
  v3 = [a1 storeConfigurationForBatteryLevel];
  v4 = [a1 syncPolicyForBatteryLevel];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BDE9A404-9A1D-4844-A47D-92DEC7628986"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Power.BatteryLevel", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBatteryLevel
{
  return 0;
}

+ (id)storeConfigurationForBatteryLevel
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Power.BatteryLevel" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)identifier
{
  return @"Power";
}

+ (id)streamNames
{
  return &unk_1F0BF4E18;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"BatteryLevel"])
  {
    uint64_t v5 = [a1 BatteryLevel];
LABEL_9:
    v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"EnergyMode"])
  {
    uint64_t v5 = [a1 EnergyMode];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"LowPowerMode"])
  {
    uint64_t v5 = [a1 LowPowerMode];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"PluggedIn"])
  {
    uint64_t v5 = [a1 PluggedIn];
    goto LABEL_9;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

+ (id)PluggedIn
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForPluggedIn];
  v3 = +[BMDevicePluggedIn columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Power.PluggedIn" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Power.PluggedIn" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForPluggedIn
{
  v3 = [a1 storeConfigurationForPluggedIn];
  id v4 = [a1 syncPolicyForPluggedIn];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2FEE7364-BA27-47DB-9779-796E8D9B014E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Power.PluggedIn", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPluggedIn
{
  return 0;
}

+ (id)storeConfigurationForPluggedIn
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Power.PluggedIn" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)LowPowerMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForLowPowerMode];
  v3 = +[BMDeviceLowPowerMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Power.LowPowerMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Power.LowPowerMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForLowPowerMode
{
  v3 = [a1 storeConfigurationForLowPowerMode];
  id v4 = [a1 syncPolicyForLowPowerMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"097B026F-5852-40F8-9DC8-FC433F1C36A2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Power.LowPowerMode", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForLowPowerMode
{
  return 0;
}

+ (id)storeConfigurationForLowPowerMode
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Power.LowPowerMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)EnergyMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForEnergyMode];
  v3 = +[BMEnergyMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Power.EnergyMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Power.EnergyMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForEnergyMode
{
  v3 = [a1 storeConfigurationForEnergyMode];
  id v4 = [a1 syncPolicyForEnergyMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D5E993B1-3A29-4C8E-B575-DD880EF5DD66"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Power.EnergyMode", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForEnergyMode
{
  return 0;
}

+ (id)storeConfigurationForEnergyMode
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Power.EnergyMode" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDeviceBatteryLevel validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMEnergyMode validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMDeviceLowPowerMode validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMDevicePluggedIn validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = (void *)[v2 copy];

  return v7;
}

@end