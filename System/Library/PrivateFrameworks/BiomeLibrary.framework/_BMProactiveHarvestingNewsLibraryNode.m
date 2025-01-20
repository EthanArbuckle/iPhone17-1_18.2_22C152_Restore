@interface _BMProactiveHarvestingNewsLibraryNode
+ (id)Article;
+ (id)configurationForArticle;
+ (id)identifier;
+ (id)storeConfigurationForArticle;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForArticle;
+ (id)validKeyPaths;
@end

@implementation _BMProactiveHarvestingNewsLibraryNode

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Article"])
  {
    v4 = [a1 Article];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)Article
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForArticle];
  v3 = +[BMProactiveHarvestingNewsArticle columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.News.Article" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.News.Article" schema:v9 configuration:v2];

  return v10;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMProactiveHarvestingNewsArticle validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF4E60;
}

+ (id)identifier
{
  return @"News";
}

+ (id)configurationForArticle
{
  v3 = [a1 storeConfigurationForArticle];
  v4 = [a1 syncPolicyForArticle];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"06B3E303-4AAE-4EBD-AAE3-6775A528FB00"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.News.Article", objc_opt_class(), v3, v4, &unk_1F0BF4E48, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForArticle
{
  return 0;
}

+ (id)storeConfigurationForArticle
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.News.Article" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

@end