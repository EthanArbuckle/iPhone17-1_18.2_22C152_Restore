@interface _BMMailCategorizationAnalyticsLibraryNode
+ (id)Read;
+ (id)Recategorize;
+ (id)Receive;
+ (id)configurationForRead;
+ (id)configurationForRecategorize;
+ (id)configurationForReceive;
+ (id)identifier;
+ (id)storeConfigurationForRead;
+ (id)storeConfigurationForRecategorize;
+ (id)storeConfigurationForReceive;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRead;
+ (id)syncPolicyForRecategorize;
+ (id)syncPolicyForReceive;
+ (id)validKeyPaths;
@end

@implementation _BMMailCategorizationAnalyticsLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Read"])
  {
    uint64_t v5 = [a1 Read];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"Recategorize"])
  {
    uint64_t v5 = [a1 Recategorize];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Receive"])
  {
    uint64_t v5 = [a1 Receive];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMailCategorizationAnalyticsRead validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMailCategorizationAnalyticsRecategorize validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMMailCategorizationAnalyticsReceive validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)streamNames
{
  return &unk_1F0BF7788;
}

+ (id)identifier
{
  return @"CategorizationAnalytics";
}

+ (id)configurationForReceive
{
  v3 = [a1 storeConfigurationForReceive];
  id v4 = [a1 syncPolicyForReceive];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"59553F07-B258-4673-9330-FBBE528D8B14"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 0;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mail.CategorizationAnalytics.Receive", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilemail");

  return v7;
}

+ (id)syncPolicyForReceive
{
  return 0;
}

+ (id)storeConfigurationForReceive
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mail.CategorizationAnalytics.Receive" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)configurationForRecategorize
{
  v3 = [a1 storeConfigurationForRecategorize];
  id v4 = [a1 syncPolicyForRecategorize];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BCBB9D23-BBAD-4098-AD01-E559530E75DF"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 0;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mail.CategorizationAnalytics.Recategorize", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilemail");

  return v7;
}

+ (id)syncPolicyForRecategorize
{
  return 0;
}

+ (id)storeConfigurationForRecategorize
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mail.CategorizationAnalytics.Recategorize" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)configurationForRead
{
  v3 = [a1 storeConfigurationForRead];
  id v4 = [a1 syncPolicyForRead];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0BF1FBAF-EF49-493C-A5E9-FA1B7CE8F097"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 0;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mail.CategorizationAnalytics.Read", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilemail");

  return v7;
}

+ (id)syncPolicyForRead
{
  return 0;
}

+ (id)storeConfigurationForRead
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mail.CategorizationAnalytics.Read" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)Receive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForReceive];
  v3 = +[BMMailCategorizationAnalyticsReceive columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mail.CategorizationAnalytics.Receive" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mail.CategorizationAnalytics.Receive" schema:v9 configuration:v2];

  return v10;
}

+ (id)Recategorize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRecategorize];
  v3 = +[BMMailCategorizationAnalyticsRecategorize columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mail.CategorizationAnalytics.Recategorize" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mail.CategorizationAnalytics.Recategorize" schema:v9 configuration:v2];

  return v10;
}

+ (id)Read
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRead];
  v3 = +[BMMailCategorizationAnalyticsRead columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mail.CategorizationAnalytics.Read" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mail.CategorizationAnalytics.Read" schema:v9 configuration:v2];

  return v10;
}

@end