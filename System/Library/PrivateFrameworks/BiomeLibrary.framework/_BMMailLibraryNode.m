@interface _BMMailLibraryNode
+ (id)Categorization;
+ (id)CategorizationAnalytics;
+ (id)Recategorization;
+ (id)configurationForCategorization;
+ (id)configurationForRecategorization;
+ (id)identifier;
+ (id)storeConfigurationForCategorization;
+ (id)storeConfigurationForRecategorization;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForCategorization;
+ (id)syncPolicyForRecategorization;
+ (id)validKeyPaths;
@end

@implementation _BMMailLibraryNode

+ (id)identifier
{
  return @"Mail";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 CategorizationAnalytics];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Categorization"])
  {
    uint64_t v5 = [a1 Categorization];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Recategorization"])
  {
    uint64_t v5 = [a1 Recategorization];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMailCategorization validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMailRecategorization validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF4B30;
}

+ (id)CategorizationAnalytics
{
  return (id)objc_opt_class();
}

+ (id)configurationForRecategorization
{
  v3 = [a1 storeConfigurationForRecategorization];
  id v4 = [a1 syncPolicyForRecategorization];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"38885812-A0DB-4DEF-9B31-CA4198DA0D51"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mail.Recategorization", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilemail");

  return v7;
}

+ (id)syncPolicyForRecategorization
{
  return 0;
}

+ (id)storeConfigurationForRecategorization
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mail.Recategorization" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCategorization
{
  v3 = [a1 storeConfigurationForCategorization];
  id v4 = [a1 syncPolicyForCategorization];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AA21D965-0903-497B-8C07-24E166528412"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Mail.Categorization", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilemail");

  return v7;
}

+ (id)syncPolicyForCategorization
{
  return 0;
}

+ (id)storeConfigurationForCategorization
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Mail.Categorization" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Recategorization
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRecategorization];
  v3 = +[BMMailRecategorization columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mail.Recategorization" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mail.Recategorization" schema:v9 configuration:v2];

  return v10;
}

+ (id)Categorization
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCategorization];
  v3 = +[BMMailCategorization columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Mail.Categorization" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Mail.Categorization" schema:v9 configuration:v2];

  return v10;
}

@end