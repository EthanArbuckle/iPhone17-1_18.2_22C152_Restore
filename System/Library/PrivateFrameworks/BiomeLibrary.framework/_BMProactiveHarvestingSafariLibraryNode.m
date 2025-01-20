@interface _BMProactiveHarvestingSafariLibraryNode
+ (id)PageView;
+ (id)configurationForPageView;
+ (id)identifier;
+ (id)storeConfigurationForPageView;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPageView;
+ (id)validKeyPaths;
@end

@implementation _BMProactiveHarvestingSafariLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"PageView"])
  {
    v4 = [a1 PageView];
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
  v3 = +[BMProactiveHarvestingPageView validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF3708;
}

+ (id)identifier
{
  return @"Safari";
}

+ (id)configurationForPageView
{
  v3 = [a1 storeConfigurationForPageView];
  v4 = [a1 syncPolicyForPageView];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F0BAD425-8E52-4525-A017-D2640F29AE8C"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Safari.PageView", objc_opt_class(), v3, v4, &unk_1F0BF36F0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPageView
{
  return 0;
}

+ (id)storeConfigurationForPageView
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Safari.PageView" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PageView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPageView];
  v3 = +[BMProactiveHarvestingPageView columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Safari.PageView" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Safari.PageView" schema:v9 configuration:v2];

  return v10;
}

@end