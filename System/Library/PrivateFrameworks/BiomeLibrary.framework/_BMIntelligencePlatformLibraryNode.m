@interface _BMIntelligencePlatformLibraryNode
+ (id)ECR;
+ (id)EntityTagging;
+ (id)FeatureStore;
+ (id)MessageTerms;
+ (id)Views;
+ (id)configurationForFeatureStore;
+ (id)configurationForMessageTerms;
+ (id)identifier;
+ (id)storeConfigurationForFeatureStore;
+ (id)storeConfigurationForMessageTerms;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForFeatureStore;
+ (id)syncPolicyForMessageTerms;
+ (id)validKeyPaths;
@end

@implementation _BMIntelligencePlatformLibraryNode

+ (id)identifier
{
  return @"IntelligencePlatform";
}

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [a1 ECR];
  v4 = objc_msgSend(a1, "EntityTagging", v3);
  v8[1] = v4;
  v5 = [a1 Views];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"FeatureStore"])
  {
    uint64_t v5 = [a1 FeatureStore];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"MessageTerms"])
  {
    uint64_t v5 = [a1 MessageTerms];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMIntelligencePlatformFeatureStore validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMIntelligencePlatformMessageTerms validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF5310;
}

+ (id)Views
{
  return (id)objc_opt_class();
}

+ (id)EntityTagging
{
  return (id)objc_opt_class();
}

+ (id)ECR
{
  return (id)objc_opt_class();
}

+ (id)configurationForMessageTerms
{
  v3 = [a1 storeConfigurationForMessageTerms];
  id v4 = [a1 syncPolicyForMessageTerms];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F5873872-1331-4952-9DCA-0E8CC6266734"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"IntelligencePlatform.MessageTerms", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMessageTerms
{
  return 0;
}

+ (id)storeConfigurationForMessageTerms
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"IntelligencePlatform.MessageTerms" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForFeatureStore
{
  v3 = [a1 storeConfigurationForFeatureStore];
  id v4 = [a1 syncPolicyForFeatureStore];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D21A8DB8-7D87-4F3E-B63F-1B173B7907E9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"IntelligencePlatform.FeatureStore", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForFeatureStore
{
  return 0;
}

+ (id)storeConfigurationForFeatureStore
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"IntelligencePlatform.FeatureStore" domain:0 segmentSize:0x40000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)MessageTerms
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMessageTerms];
  v3 = +[BMIntelligencePlatformMessageTerms columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"IntelligencePlatform.MessageTerms" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"IntelligencePlatform.MessageTerms" schema:v9 configuration:v2];

  return v10;
}

+ (id)FeatureStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForFeatureStore];
  v3 = +[BMIntelligencePlatformFeatureStore columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"IntelligencePlatform.FeatureStore" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"IntelligencePlatform.FeatureStore" schema:v9 configuration:v2];

  return v10;
}

@end