@interface _BMSiriOrchestrationLibraryNode
+ (id)RequestContext;
+ (id)configurationForRequestContext;
+ (id)identifier;
+ (id)storeConfigurationForRequestContext;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRequestContext;
+ (id)validKeyPaths;
@end

@implementation _BMSiriOrchestrationLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF7068;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"RequestContext"])
  {
    v4 = [a1 RequestContext];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)RequestContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForRequestContext];
  v3 = +[BMSiriRequestContext columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Orchestration.RequestContext" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Orchestration.RequestContext" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForRequestContext
{
  v3 = [a1 storeConfigurationForRequestContext];
  v4 = [a1 syncPolicyForRequestContext];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E1673BCB-7DFC-417C-97F1-AB2859DEC326"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.Orchestration.RequestContext", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForRequestContext
{
  return 0;
}

+ (id)storeConfigurationForRequestContext
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Orchestration.RequestContext" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriRequestContext validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)identifier
{
  return @"Orchestration";
}

@end