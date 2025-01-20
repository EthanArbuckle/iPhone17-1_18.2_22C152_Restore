@interface _BMContextSyncLibraryNode
+ (id)AppInFocus;
+ (id)CellularAvailabilityStatus;
+ (id)DeviceActivityLevel;
+ (id)LOI;
+ (id)WalletTransaction;
+ (id)configurationForAppInFocus;
+ (id)configurationForCellularAvailabilityStatus;
+ (id)configurationForDeviceActivityLevel;
+ (id)configurationForLOI;
+ (id)configurationForWalletTransaction;
+ (id)identifier;
+ (id)storeConfigurationForAppInFocus;
+ (id)storeConfigurationForCellularAvailabilityStatus;
+ (id)storeConfigurationForDeviceActivityLevel;
+ (id)storeConfigurationForLOI;
+ (id)storeConfigurationForWalletTransaction;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAppInFocus;
+ (id)syncPolicyForCellularAvailabilityStatus;
+ (id)syncPolicyForDeviceActivityLevel;
+ (id)syncPolicyForLOI;
+ (id)syncPolicyForWalletTransaction;
+ (id)validKeyPaths;
@end

@implementation _BMContextSyncLibraryNode

+ (id)identifier
{
  return @"ContextSync";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AppInFocus"])
  {
    uint64_t v5 = [a1 AppInFocus];
LABEL_11:
    v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"CellularAvailabilityStatus"])
  {
    uint64_t v5 = [a1 CellularAvailabilityStatus];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"DeviceActivityLevel"])
  {
    uint64_t v5 = [a1 DeviceActivityLevel];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"LOI"])
  {
    uint64_t v5 = [a1 LOI];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"WalletTransaction"])
  {
    uint64_t v5 = [a1 WalletTransaction];
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMContextSyncAppInFocus validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMContextSyncCellularAvailabilityStatus validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMContextSyncDeviceActivityLevel validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMContextSyncLOI validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMContextSyncWalletTransaction validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[v2 copy];

  return v8;
}

+ (id)streamNames
{
  return &unk_1F0BF6B58;
}

+ (id)configurationForWalletTransaction
{
  v3 = [a1 storeConfigurationForWalletTransaction];
  id v4 = [a1 syncPolicyForWalletTransaction];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C2D71310-E246-4A7E-898D-B7D792F17865"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextSync.WalletTransaction", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWalletTransaction
{
  return 0;
}

+ (id)storeConfigurationForWalletTransaction
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextSync.WalletTransaction" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForLOI
{
  v3 = [a1 storeConfigurationForLOI];
  id v4 = [a1 syncPolicyForLOI];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CA8BE74B-B9ED-4ADC-9E81-CB6E67F5EB23"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextSync.LOI", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForLOI
{
  return 0;
}

+ (id)storeConfigurationForLOI
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextSync.LOI" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDeviceActivityLevel
{
  v3 = [a1 storeConfigurationForDeviceActivityLevel];
  id v4 = [a1 syncPolicyForDeviceActivityLevel];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AF7B26C6-8378-457B-9BD4-30B9E1CEE366"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextSync.DeviceActivityLevel", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDeviceActivityLevel
{
  return 0;
}

+ (id)storeConfigurationForDeviceActivityLevel
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextSync.DeviceActivityLevel" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCellularAvailabilityStatus
{
  v3 = [a1 storeConfigurationForCellularAvailabilityStatus];
  id v4 = [a1 syncPolicyForCellularAvailabilityStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BEED8CDB-3CA7-42DC-959B-8E8232BE520E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextSync.CellularAvailabilityStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForCellularAvailabilityStatus
{
  return 0;
}

+ (id)storeConfigurationForCellularAvailabilityStatus
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextSync.CellularAvailabilityStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAppInFocus
{
  v3 = [a1 storeConfigurationForAppInFocus];
  id v4 = [a1 syncPolicyForAppInFocus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"638F2DFF-DEDF-482A-9267-B06F3C730481"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextSync.AppInFocus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAppInFocus
{
  return 0;
}

+ (id)storeConfigurationForAppInFocus
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextSync.AppInFocus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WalletTransaction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWalletTransaction];
  v3 = +[BMContextSyncWalletTransaction columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextSync.WalletTransaction" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextSync.WalletTransaction" schema:v9 configuration:v2];

  return v10;
}

+ (id)LOI
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLOI];
  v3 = +[BMContextSyncLOI columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextSync.LOI" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextSync.LOI" schema:v9 configuration:v2];

  return v10;
}

+ (id)DeviceActivityLevel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDeviceActivityLevel];
  v3 = +[BMContextSyncDeviceActivityLevel columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextSync.DeviceActivityLevel" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextSync.DeviceActivityLevel" schema:v9 configuration:v2];

  return v10;
}

+ (id)CellularAvailabilityStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCellularAvailabilityStatus];
  v3 = +[BMContextSyncCellularAvailabilityStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextSync.CellularAvailabilityStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextSync.CellularAvailabilityStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)AppInFocus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAppInFocus];
  v3 = +[BMContextSyncAppInFocus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextSync.AppInFocus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextSync.AppInFocus" schema:v9 configuration:v2];

  return v10;
}

@end