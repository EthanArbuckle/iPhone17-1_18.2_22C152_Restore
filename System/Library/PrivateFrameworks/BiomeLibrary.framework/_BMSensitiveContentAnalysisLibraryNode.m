@interface _BMSensitiveContentAnalysisLibraryNode
+ (id)MediaAnalysis;
+ (id)UIInteraction;
+ (id)configurationForMediaAnalysis;
+ (id)configurationForUIInteraction;
+ (id)identifier;
+ (id)storeConfigurationForMediaAnalysis;
+ (id)storeConfigurationForUIInteraction;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMediaAnalysis;
+ (id)syncPolicyForUIInteraction;
+ (id)validKeyPaths;
@end

@implementation _BMSensitiveContentAnalysisLibraryNode

+ (id)identifier
{
  return @"SensitiveContentAnalysis";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"MediaAnalysis"])
  {
    uint64_t v5 = [a1 MediaAnalysis];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"UIInteraction"])
  {
    uint64_t v5 = [a1 UIInteraction];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSensitiveContentAnalysisMediaAnalysis validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSensitiveContentAnalysisUIInteraction validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF4218;
}

+ (id)configurationForUIInteraction
{
  v3 = [a1 storeConfigurationForUIInteraction];
  id v4 = [a1 syncPolicyForUIInteraction];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E229DAFC-0DE9-4ED6-9495-1B1A0FD856D2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SensitiveContentAnalysis.UIInteraction", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUIInteraction
{
  return 0;
}

+ (id)storeConfigurationForUIInteraction
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SensitiveContentAnalysis.UIInteraction" domain:0 segmentSize:0x20000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMediaAnalysis
{
  v3 = [a1 storeConfigurationForMediaAnalysis];
  id v4 = [a1 syncPolicyForMediaAnalysis];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C11F6EBF-47E5-4733-BE59-33E1EC3DF2A6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SensitiveContentAnalysis.MediaAnalysis", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMediaAnalysis
{
  return 0;
}

+ (id)storeConfigurationForMediaAnalysis
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SensitiveContentAnalysis.MediaAnalysis" domain:0 segmentSize:0x20000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)UIInteraction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForUIInteraction];
  v3 = +[BMSensitiveContentAnalysisUIInteraction columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SensitiveContentAnalysis.UIInteraction" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SensitiveContentAnalysis.UIInteraction" schema:v9 configuration:v2];

  return v10;
}

+ (id)MediaAnalysis
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMediaAnalysis];
  v3 = +[BMSensitiveContentAnalysisMediaAnalysis columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SensitiveContentAnalysis.MediaAnalysis" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SensitiveContentAnalysis.MediaAnalysis" schema:v9 configuration:v2];

  return v10;
}

@end