@interface _BMTextLibraryNode
+ (id)InputSession;
+ (id)configurationForInputSession;
+ (id)identifier;
+ (id)storeConfigurationForInputSession;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForInputSession;
+ (id)validKeyPaths;
@end

@implementation _BMTextLibraryNode

+ (id)identifier
{
  return @"Text";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF7038;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"InputSession"])
  {
    v4 = [a1 InputSession];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)InputSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForInputSession];
  v3 = +[BMTextInputSession columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Text.InputSession" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Text.InputSession" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForInputSession
{
  v3 = [a1 storeConfigurationForInputSession];
  v4 = [a1 syncPolicyForInputSession];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"84E983A2-152A-4096-BE5E-9C60D824630B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Text.InputSession", objc_opt_class(), v3, v4, &unk_1F0BF7020, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForInputSession
{
  return 0;
}

+ (id)storeConfigurationForInputSession
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Text.InputSession" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMTextInputSession validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

@end