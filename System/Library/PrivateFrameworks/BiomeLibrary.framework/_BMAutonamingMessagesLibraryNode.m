@interface _BMAutonamingMessagesLibraryNode
+ (id)Inferences;
+ (id)MessageIds;
+ (id)configurationForInferences;
+ (id)configurationForMessageIds;
+ (id)identifier;
+ (id)storeConfigurationForInferences;
+ (id)storeConfigurationForMessageIds;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForInferences;
+ (id)syncPolicyForMessageIds;
+ (id)validKeyPaths;
@end

@implementation _BMAutonamingMessagesLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Inferences"])
  {
    uint64_t v5 = [a1 Inferences];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"MessageIds"])
  {
    uint64_t v5 = [a1 MessageIds];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMAutonamingInferences validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMAutonamingMessageIds validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF6498;
}

+ (id)identifier
{
  return @"Messages";
}

+ (id)configurationForMessageIds
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForMessageIds];
  id v4 = [a1 syncPolicyForMessageIds];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"\"com.apple.MobileSMS\" IN $disabledApps" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"learn-from-this-app" predicate:v6];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  v9 = (void *)MEMORY[0x1E4F504B0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"20C3E6E8-463D-4946-A782-0BAAFB8F425E"];
  BYTE2(v13) = 1;
  LOWORD(v13) = 1;
  v11 = objc_msgSend(v9, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v10, @"Autonaming.Messages.MessageIds", objc_opt_class(), v3, v4, 0, 0, v13, 0, v8, 0);

  return v11;
}

+ (id)syncPolicyForMessageIds
{
  return 0;
}

+ (id)storeConfigurationForMessageIds
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Autonaming.Messages.MessageIds" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForInferences
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForInferences];
  id v4 = [a1 syncPolicyForInferences];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"\"com.apple.MobileSMS\" IN $disabledApps" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"learn-from-this-app" predicate:v6];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  v9 = (void *)MEMORY[0x1E4F504B0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F9833224-FBFE-4073-BFC3-1353F4D2B555"];
  BYTE2(v13) = 1;
  LOWORD(v13) = 1;
  v11 = objc_msgSend(v9, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v10, @"Autonaming.Messages.Inferences", objc_opt_class(), v3, v4, 0, 0, v13, 0, v8, 0);

  return v11;
}

+ (id)syncPolicyForInferences
{
  return 0;
}

+ (id)storeConfigurationForInferences
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Autonaming.Messages.Inferences" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)MessageIds
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMessageIds];
  v3 = +[BMAutonamingMessageIds columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Autonaming.Messages.MessageIds" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Autonaming.Messages.MessageIds" schema:v9 configuration:v2];

  return v10;
}

+ (id)Inferences
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForInferences];
  v3 = +[BMAutonamingInferences columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Autonaming.Messages.Inferences" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Autonaming.Messages.Inferences" schema:v9 configuration:v2];

  return v10;
}

@end