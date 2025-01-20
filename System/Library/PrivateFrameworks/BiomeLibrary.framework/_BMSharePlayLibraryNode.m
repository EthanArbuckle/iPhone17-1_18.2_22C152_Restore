@interface _BMSharePlayLibraryNode
+ (id)GroupActivitySession;
+ (id)configurationForGroupActivitySession;
+ (id)identifier;
+ (id)storeConfigurationForGroupActivitySession;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForGroupActivitySession;
+ (id)validKeyPaths;
@end

@implementation _BMSharePlayLibraryNode

+ (id)identifier
{
  return @"SharePlay";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"GroupActivitySession"])
  {
    v4 = [a1 GroupActivitySession];
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
  v3 = +[BMSharePlayGroupActivitySession validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF6840;
}

+ (id)configurationForGroupActivitySession
{
  v3 = [a1 storeConfigurationForGroupActivitySession];
  v4 = [a1 syncPolicyForGroupActivitySession];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C109D386-39DC-4C10-9E61-545C3963F811"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SharePlay.GroupActivitySession", objc_opt_class(), v3, v4, &unk_1F0BF6828, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForGroupActivitySession
{
  return 0;
}

+ (id)storeConfigurationForGroupActivitySession
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SharePlay.GroupActivitySession" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)GroupActivitySession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForGroupActivitySession];
  v3 = +[BMSharePlayGroupActivitySession columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SharePlay.GroupActivitySession" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SharePlay.GroupActivitySession" schema:v9 configuration:v2];

  return v10;
}

@end