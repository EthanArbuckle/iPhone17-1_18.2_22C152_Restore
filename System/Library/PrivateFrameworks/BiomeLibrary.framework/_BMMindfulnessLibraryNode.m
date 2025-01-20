@interface _BMMindfulnessLibraryNode
+ (id)Session;
+ (id)configurationForSession;
+ (id)identifier;
+ (id)storeConfigurationForSession;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSession;
+ (id)validKeyPaths;
@end

@implementation _BMMindfulnessLibraryNode

+ (id)identifier
{
  return @"Mindfulness";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Session"])
  {
    v4 = [a1 Session];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMindfulnessSession validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF38A0;
}

+ (id)configurationForSession
{
  v3 = [a1 storeConfigurationForSession];
  v4 = [a1 syncPolicyForSession];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E8470278-8A47-447B-B564-99235F3BB982"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mindfulness.Session", objc_opt_class(), v3, v4, &unk_1F0BF3888, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSession
{
  return 0;
}

+ (id)storeConfigurationForSession
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mindfulness.Session" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Session
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSession];
  v3 = +[BMMindfulnessSession columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mindfulness.Session" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mindfulness.Session" schema:v9 configuration:v2];

  return v10;
}

@end