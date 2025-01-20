@interface _BMPortraitLibraryNode
+ (id)Entity;
+ (id)Topic;
+ (id)configurationForEntity;
+ (id)configurationForTopic;
+ (id)identifier;
+ (id)storeConfigurationForEntity;
+ (id)storeConfigurationForTopic;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForEntity;
+ (id)syncPolicyForTopic;
+ (id)validKeyPaths;
@end

@implementation _BMPortraitLibraryNode

+ (id)identifier
{
  return @"Portrait";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Entity"])
  {
    uint64_t v5 = [a1 Entity];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Topic"])
  {
    uint64_t v5 = [a1 Topic];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMPortraitEntity validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMPortraitTopic validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF4680;
}

+ (id)configurationForTopic
{
  v3 = [a1 storeConfigurationForTopic];
  id v4 = [a1 syncPolicyForTopic];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FA423997-F253-4AD3-8C7A-37E3C2EF2732"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Portrait.Topic", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTopic
{
  return 0;
}

+ (id)storeConfigurationForTopic
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:30000 maxEventCount:45100800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Portrait.Topic" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForEntity
{
  v3 = [a1 storeConfigurationForEntity];
  id v4 = [a1 syncPolicyForEntity];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9BD10277-41A8-46CA-8650-99A797ACBB1F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Portrait.Entity", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForEntity
{
  return 0;
}

+ (id)storeConfigurationForEntity
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Portrait.Entity" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Topic
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTopic];
  v3 = +[BMPortraitTopic columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Portrait.Topic" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Portrait.Topic" schema:v9 configuration:v2];

  return v10;
}

+ (id)Entity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForEntity];
  v3 = +[BMPortraitEntity columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Portrait.Entity" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Portrait.Entity" schema:v9 configuration:v2];

  return v10;
}

@end