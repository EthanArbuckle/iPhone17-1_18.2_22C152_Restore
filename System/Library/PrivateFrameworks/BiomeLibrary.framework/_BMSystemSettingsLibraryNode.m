@interface _BMSystemSettingsLibraryNode
+ (id)AppearanceSetup;
+ (id)ChildMultitaskingSetup;
+ (id)GestureEducation;
+ (id)SearchTerms;
+ (id)configurationForAppearanceSetup;
+ (id)configurationForChildMultitaskingSetup;
+ (id)configurationForSearchTerms;
+ (id)identifier;
+ (id)storeConfigurationForAppearanceSetup;
+ (id)storeConfigurationForChildMultitaskingSetup;
+ (id)storeConfigurationForSearchTerms;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAppearanceSetup;
+ (id)syncPolicyForChildMultitaskingSetup;
+ (id)syncPolicyForSearchTerms;
+ (id)validKeyPaths;
@end

@implementation _BMSystemSettingsLibraryNode

+ (id)identifier
{
  return @"SystemSettings";
}

+ (id)streamNames
{
  return &unk_1F0BF6858;
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 GestureEducation];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)GestureEducation
{
  return (id)objc_opt_class();
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AppearanceSetup"])
  {
    uint64_t v5 = [a1 AppearanceSetup];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"ChildMultitaskingSetup"])
  {
    uint64_t v5 = [a1 ChildMultitaskingSetup];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"SearchTerms"])
  {
    uint64_t v5 = [a1 SearchTerms];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)SearchTerms
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForSearchTerms];
  v3 = +[BMSystemSettingsSearchTerms columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SystemSettings.SearchTerms" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SystemSettings.SearchTerms" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForSearchTerms
{
  v3 = [a1 storeConfigurationForSearchTerms];
  id v4 = [a1 syncPolicyForSearchTerms];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8542704B-813A-40D9-BEFF-B422445FB40F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SystemSettings.SearchTerms", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSearchTerms
{
  return 0;
}

+ (id)storeConfigurationForSearchTerms
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SystemSettings.SearchTerms" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)ChildMultitaskingSetup
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForChildMultitaskingSetup];
  v3 = +[BMSystemSettingsChildMultitaskingSetup columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SystemSettings.ChildMultitaskingSetup" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SystemSettings.ChildMultitaskingSetup" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForChildMultitaskingSetup
{
  v3 = [a1 storeConfigurationForChildMultitaskingSetup];
  id v4 = [a1 syncPolicyForChildMultitaskingSetup];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"08A95594-A3F1-4274-A5AA-AD569DC25BE7"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SystemSettings.ChildMultitaskingSetup", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForChildMultitaskingSetup
{
  return 0;
}

+ (id)storeConfigurationForChildMultitaskingSetup
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SystemSettings.ChildMultitaskingSetup" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AppearanceSetup
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForAppearanceSetup];
  v3 = +[BMSystemSettingsAppearanceSetup columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SystemSettings.AppearanceSetup" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SystemSettings.AppearanceSetup" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAppearanceSetup
{
  v3 = [a1 storeConfigurationForAppearanceSetup];
  id v4 = [a1 syncPolicyForAppearanceSetup];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A5403BAB-1A1E-4151-BC68-34A9F711AFE9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SystemSettings.AppearanceSetup", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAppearanceSetup
{
  return 0;
}

+ (id)storeConfigurationForAppearanceSetup
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SystemSettings.AppearanceSetup" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSystemSettingsAppearanceSetup validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSystemSettingsChildMultitaskingSetup validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMSystemSettingsSearchTerms validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

@end