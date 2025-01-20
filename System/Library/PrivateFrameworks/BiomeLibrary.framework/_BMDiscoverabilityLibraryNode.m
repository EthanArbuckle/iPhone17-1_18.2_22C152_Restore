@interface _BMDiscoverabilityLibraryNode
+ (id)Signals;
+ (id)Usage;
+ (id)configurationForSignals;
+ (id)configurationForUsage;
+ (id)identifier;
+ (id)storeConfigurationForSignals;
+ (id)storeConfigurationForUsage;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSignals;
+ (id)syncPolicyForUsage;
+ (id)validKeyPaths;
@end

@implementation _BMDiscoverabilityLibraryNode

+ (id)identifier
{
  return @"Discoverability";
}

+ (id)streamNames
{
  return &unk_1F0BF46C8;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Signals"])
  {
    uint64_t v5 = [a1 Signals];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Usage"])
  {
    uint64_t v5 = [a1 Usage];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)Signals
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForSignals];
  v3 = +[BMDiscoverabilitySignals columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Discoverability.Signals" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Discoverability.Signals" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForSignals
{
  v3 = [a1 storeConfigurationForSignals];
  id v4 = [a1 syncPolicyForSignals];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E9E38971-8621-4199-B2AC-64B396EE3A33"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Discoverability.Signals", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSignals
{
  return 0;
}

+ (id)storeConfigurationForSignals
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:63072000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Discoverability.Signals" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Usage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForUsage];
  v3 = +[BMDiscoverabilityUsage columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Discoverability.Usage" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Discoverability.Usage" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForUsage
{
  v3 = [a1 storeConfigurationForUsage];
  id v4 = [a1 syncPolicyForUsage];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"10F82986-6B32-45F1-BEC4-0EFA71163742"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Discoverability.Usage", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUsage
{
  return 0;
}

+ (id)storeConfigurationForUsage
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Discoverability.Usage" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDiscoverabilitySignals validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMDiscoverabilityUsage validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

@end