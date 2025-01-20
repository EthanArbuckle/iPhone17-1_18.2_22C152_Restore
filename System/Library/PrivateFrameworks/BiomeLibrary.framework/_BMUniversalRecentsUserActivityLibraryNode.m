@interface _BMUniversalRecentsUserActivityLibraryNode
+ (id)Metadata;
+ (id)configurationForMetadata;
+ (id)identifier;
+ (id)storeConfigurationForMetadata;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMetadata;
+ (id)validKeyPaths;
@end

@implementation _BMUniversalRecentsUserActivityLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF4DA0;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Metadata"])
  {
    v4 = [a1 Metadata];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)Metadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForMetadata];
  v3 = +[BMUniversalRecentsMetadata columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UniversalRecents.UserActivity.Metadata" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UniversalRecents.UserActivity.Metadata" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForMetadata
{
  v3 = [a1 storeConfigurationForMetadata];
  v4 = [a1 syncPolicyForMetadata];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FCDCC6E4-61FB-4A76-911F-5877634296FD"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UniversalRecents.UserActivity.Metadata", objc_opt_class(), v3, v4, &unk_1F0BF4D88, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMetadata
{
  return 0;
}

+ (id)storeConfigurationForMetadata
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UniversalRecents.UserActivity.Metadata" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMUniversalRecentsMetadata validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)identifier
{
  return @"UserActivity";
}

@end