@interface _BMLocationMicroLocationLibraryNode
+ (id)Localization;
+ (id)TruthTag;
+ (id)configurationForLocalization;
+ (id)configurationForTruthTag;
+ (id)identifier;
+ (id)storeConfigurationForLocalization;
+ (id)storeConfigurationForTruthTag;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForLocalization;
+ (id)syncPolicyForTruthTag;
+ (id)validKeyPaths;
@end

@implementation _BMLocationMicroLocationLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Localization"])
  {
    uint64_t v5 = [a1 Localization];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"TruthTag"])
  {
    uint64_t v5 = [a1 TruthTag];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMicroLocationLocalization validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMicroLocationTruthTag validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF5AA8;
}

+ (id)identifier
{
  return @"MicroLocation";
}

+ (id)configurationForTruthTag
{
  v3 = [a1 storeConfigurationForTruthTag];
  id v4 = [a1 syncPolicyForTruthTag];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BCE11012-4CD2-4DB8-932C-AEA6906FA9F1"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.MicroLocation.TruthTag", objc_opt_class(), v3, v4, &unk_1F0BF5A90, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTruthTag
{
  return 0;
}

+ (id)storeConfigurationForTruthTag
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.MicroLocation.TruthTag" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForLocalization
{
  v3 = [a1 storeConfigurationForLocalization];
  id v4 = [a1 syncPolicyForLocalization];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0A504BD2-BD70-4EEE-80C8-42B3A59CAE96"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.MicroLocation.Localization", objc_opt_class(), v3, v4, &unk_1F0BF5A78, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForLocalization
{
  return 0;
}

+ (id)storeConfigurationForLocalization
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.MicroLocation.Localization" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)TruthTag
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTruthTag];
  v3 = +[BMMicroLocationTruthTag columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.MicroLocation.TruthTag" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.MicroLocation.TruthTag" schema:v9 configuration:v2];

  return v10;
}

+ (id)Localization
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLocalization];
  v3 = +[BMMicroLocationLocalization columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.MicroLocation.Localization" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.MicroLocation.Localization" schema:v9 configuration:v2];

  return v10;
}

@end