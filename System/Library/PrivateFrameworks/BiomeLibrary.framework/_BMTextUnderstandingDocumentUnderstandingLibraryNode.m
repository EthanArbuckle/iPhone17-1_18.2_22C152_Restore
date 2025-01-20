@interface _BMTextUnderstandingDocumentUnderstandingLibraryNode
+ (id)Poem;
+ (id)PoemAnalytics;
+ (id)PoemBuffer;
+ (id)configurationForPoem;
+ (id)configurationForPoemAnalytics;
+ (id)configurationForPoemBuffer;
+ (id)identifier;
+ (id)storeConfigurationForPoem;
+ (id)storeConfigurationForPoemAnalytics;
+ (id)storeConfigurationForPoemBuffer;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPoem;
+ (id)syncPolicyForPoemAnalytics;
+ (id)syncPolicyForPoemBuffer;
+ (id)validKeyPaths;
@end

@implementation _BMTextUnderstandingDocumentUnderstandingLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF5C58;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Poem"])
  {
    uint64_t v5 = [a1 Poem];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"PoemAnalytics"])
  {
    uint64_t v5 = [a1 PoemAnalytics];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"PoemBuffer"])
  {
    uint64_t v5 = [a1 PoemBuffer];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)Poem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForPoem];
  v3 = +[BMTextUnderstandingPoem columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"TextUnderstanding.DocumentUnderstanding.Poem" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"TextUnderstanding.DocumentUnderstanding.Poem" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForPoem
{
  v3 = [a1 storeConfigurationForPoem];
  id v4 = [a1 syncPolicyForPoem];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6D346CE9-6964-4E1D-9031-74CA45BEE8C0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"TextUnderstanding.DocumentUnderstanding.Poem", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPoem
{
  return 0;
}

+ (id)storeConfigurationForPoem
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"TextUnderstanding.DocumentUnderstanding.Poem" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PoemBuffer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForPoemBuffer];
  v3 = +[BMTextUnderstandingPoemBuffer columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"TextUnderstanding.DocumentUnderstanding.PoemBuffer" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"TextUnderstanding.DocumentUnderstanding.PoemBuffer" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForPoemBuffer
{
  v3 = [a1 storeConfigurationForPoemBuffer];
  id v4 = [a1 syncPolicyForPoemBuffer];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DA3E57AB-70D4-4A05-AADE-5D98466D9137"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"TextUnderstanding.DocumentUnderstanding.PoemBuffer", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPoemBuffer
{
  return 0;
}

+ (id)storeConfigurationForPoemBuffer
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"TextUnderstanding.DocumentUnderstanding.PoemBuffer" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PoemAnalytics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForPoemAnalytics];
  v3 = +[BMTextUnderstandingPoemAnalytics columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"TextUnderstanding.DocumentUnderstanding.PoemAnalytics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"TextUnderstanding.DocumentUnderstanding.PoemAnalytics" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForPoemAnalytics
{
  v3 = [a1 storeConfigurationForPoemAnalytics];
  id v4 = [a1 syncPolicyForPoemAnalytics];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3E554CD4-21D8-41A4-8718-3659E4ED8B2D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"TextUnderstanding.DocumentUnderstanding.PoemAnalytics", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPoemAnalytics
{
  return 0;
}

+ (id)storeConfigurationForPoemAnalytics
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"TextUnderstanding.DocumentUnderstanding.PoemAnalytics" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMTextUnderstandingPoem validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMTextUnderstandingPoemAnalytics validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMTextUnderstandingPoemBuffer validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)identifier
{
  return @"DocumentUnderstanding";
}

@end