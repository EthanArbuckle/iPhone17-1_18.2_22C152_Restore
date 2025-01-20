@interface _BMActivitySchedulerDependencyLibraryNode
+ (id)Completion;
+ (id)Result;
+ (id)configurationForCompletion;
+ (id)configurationForResult;
+ (id)identifier;
+ (id)storeConfigurationForCompletion;
+ (id)storeConfigurationForResult;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForCompletion;
+ (id)syncPolicyForResult;
+ (id)validKeyPaths;
@end

@implementation _BMActivitySchedulerDependencyLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Completion"])
  {
    uint64_t v5 = [a1 Completion];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Result"])
  {
    uint64_t v5 = [a1 Result];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMActivitySchedulerDependencyCompletion validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMActivitySchedulerDependencyResult validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF5208;
}

+ (id)identifier
{
  return @"Dependency";
}

+ (id)configurationForResult
{
  v3 = [a1 storeConfigurationForResult];
  id v4 = [a1 syncPolicyForResult];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8468567A-1014-4602-859E-E3DDF42FD86D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ActivityScheduler.Dependency.Result", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.dasd");

  return v7;
}

+ (id)syncPolicyForResult
{
  return 0;
}

+ (id)storeConfigurationForResult
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:13107200 maxStreamSize:1000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ActivityScheduler.Dependency.Result" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCompletion
{
  v3 = [a1 storeConfigurationForCompletion];
  id v4 = [a1 syncPolicyForCompletion];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AB345AE8-7635-4A67-B4B7-984E4F8EFE04"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ActivityScheduler.Dependency.Completion", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.dasd");

  return v7;
}

+ (id)syncPolicyForCompletion
{
  return 0;
}

+ (id)storeConfigurationForCompletion
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:13107200 maxStreamSize:1000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ActivityScheduler.Dependency.Completion" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForResult];
  v3 = +[BMActivitySchedulerDependencyResult columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ActivityScheduler.Dependency.Result" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ActivityScheduler.Dependency.Result" schema:v9 configuration:v2];

  return v10;
}

+ (id)Completion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCompletion];
  v3 = +[BMActivitySchedulerDependencyCompletion columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ActivityScheduler.Dependency.Completion" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ActivityScheduler.Dependency.Completion" schema:v9 configuration:v2];

  return v10;
}

@end