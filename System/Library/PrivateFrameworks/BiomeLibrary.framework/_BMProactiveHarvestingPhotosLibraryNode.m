@interface _BMProactiveHarvestingPhotosLibraryNode
+ (id)KnowledgeGraphEnrichment;
+ (id)View;
+ (id)configurationForKnowledgeGraphEnrichment;
+ (id)configurationForView;
+ (id)identifier;
+ (id)storeConfigurationForKnowledgeGraphEnrichment;
+ (id)storeConfigurationForView;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForKnowledgeGraphEnrichment;
+ (id)syncPolicyForView;
+ (id)validKeyPaths;
@end

@implementation _BMProactiveHarvestingPhotosLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"KnowledgeGraphEnrichment"])
  {
    uint64_t v5 = [a1 KnowledgeGraphEnrichment];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"View"])
  {
    uint64_t v5 = [a1 View];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMProactiveHarvestingPhotosView validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF6A68;
}

+ (id)identifier
{
  return @"Photos";
}

+ (id)configurationForView
{
  v3 = [a1 storeConfigurationForView];
  id v4 = [a1 syncPolicyForView];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"760EF2BE-9076-4893-A18D-42B19BC1FA43"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Photos.View", objc_opt_class(), v3, v4, &unk_1F0BF6A50, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForView
{
  return 0;
}

+ (id)storeConfigurationForView
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Photos.View" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForKnowledgeGraphEnrichment
{
  v3 = [a1 storeConfigurationForKnowledgeGraphEnrichment];
  id v4 = [a1 syncPolicyForKnowledgeGraphEnrichment];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E1C54619-CBA3-403F-AB18-C01380F138C3"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Photos.KnowledgeGraphEnrichment", objc_opt_class(), v3, v4, &unk_1F0BF6A38, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForKnowledgeGraphEnrichment
{
  return 0;
}

+ (id)storeConfigurationForKnowledgeGraphEnrichment
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Photos.KnowledgeGraphEnrichment" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)View
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForView];
  v3 = +[BMProactiveHarvestingPhotosView columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Photos.View" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Photos.View" schema:v9 configuration:v2];

  return v10;
}

+ (id)KnowledgeGraphEnrichment
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForKnowledgeGraphEnrichment];
  v3 = +[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Photos.KnowledgeGraphEnrichment" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Photos.KnowledgeGraphEnrichment" schema:v9 configuration:v2];

  return v10;
}

@end