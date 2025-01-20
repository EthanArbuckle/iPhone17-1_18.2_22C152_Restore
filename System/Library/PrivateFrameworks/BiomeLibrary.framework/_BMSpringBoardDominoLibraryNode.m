@interface _BMSpringBoardDominoLibraryNode
+ (id)StackRotation;
+ (id)ViewAppearance;
+ (id)WidgetTap;
+ (id)configurationForStackRotation;
+ (id)configurationForViewAppearance;
+ (id)configurationForWidgetTap;
+ (id)identifier;
+ (id)storeConfigurationForStackRotation;
+ (id)storeConfigurationForViewAppearance;
+ (id)storeConfigurationForWidgetTap;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForStackRotation;
+ (id)syncPolicyForViewAppearance;
+ (id)syncPolicyForWidgetTap;
+ (id)validKeyPaths;
@end

@implementation _BMSpringBoardDominoLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"StackRotation"])
  {
    uint64_t v5 = [a1 StackRotation];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"ViewAppearance"])
  {
    uint64_t v5 = [a1 ViewAppearance];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"WidgetTap"])
  {
    uint64_t v5 = [a1 WidgetTap];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSpringBoardDominoStackRotation validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSpringBoardDominoViewAppearance validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMSpringBoardDominoWidgetTap validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)streamNames
{
  return &unk_1F0BF37C8;
}

+ (id)identifier
{
  return @"Domino";
}

+ (id)configurationForWidgetTap
{
  v3 = [a1 storeConfigurationForWidgetTap];
  id v4 = [a1 syncPolicyForWidgetTap];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C9269789-2CDD-4734-8876-0634E60A76D8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SpringBoard.Domino.WidgetTap", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWidgetTap
{
  return 0;
}

+ (id)storeConfigurationForWidgetTap
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SpringBoard.Domino.WidgetTap" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForViewAppearance
{
  v3 = [a1 storeConfigurationForViewAppearance];
  id v4 = [a1 syncPolicyForViewAppearance];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8C5D6487-7756-4AE1-B234-1474AE7EB921"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SpringBoard.Domino.ViewAppearance", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForViewAppearance
{
  return 0;
}

+ (id)storeConfigurationForViewAppearance
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SpringBoard.Domino.ViewAppearance" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForStackRotation
{
  v3 = [a1 storeConfigurationForStackRotation];
  id v4 = [a1 syncPolicyForStackRotation];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D6EEBB33-D861-4F09-916F-D62B9F6EB258"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SpringBoard.Domino.StackRotation", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForStackRotation
{
  return 0;
}

+ (id)storeConfigurationForStackRotation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SpringBoard.Domino.StackRotation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WidgetTap
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWidgetTap];
  v3 = +[BMSpringBoardDominoWidgetTap columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SpringBoard.Domino.WidgetTap" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SpringBoard.Domino.WidgetTap" schema:v9 configuration:v2];

  return v10;
}

+ (id)ViewAppearance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForViewAppearance];
  v3 = +[BMSpringBoardDominoViewAppearance columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SpringBoard.Domino.ViewAppearance" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SpringBoard.Domino.ViewAppearance" schema:v9 configuration:v2];

  return v10;
}

+ (id)StackRotation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForStackRotation];
  v3 = +[BMSpringBoardDominoStackRotation columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SpringBoard.Domino.StackRotation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SpringBoard.Domino.StackRotation" schema:v9 configuration:v2];

  return v10;
}

@end