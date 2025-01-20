@interface _BMContextualUnderstandingLibraryNode
+ (id)ActivityInference;
+ (id)AmbientLight;
+ (id)PeopleDiscovery;
+ (id)PhysicalSocial;
+ (id)SoundAnalysis;
+ (id)configurationForActivityInference;
+ (id)configurationForAmbientLight;
+ (id)configurationForPeopleDiscovery;
+ (id)configurationForPhysicalSocial;
+ (id)configurationForSoundAnalysis;
+ (id)identifier;
+ (id)storeConfigurationForActivityInference;
+ (id)storeConfigurationForAmbientLight;
+ (id)storeConfigurationForPeopleDiscovery;
+ (id)storeConfigurationForPhysicalSocial;
+ (id)storeConfigurationForSoundAnalysis;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForActivityInference;
+ (id)syncPolicyForAmbientLight;
+ (id)syncPolicyForPeopleDiscovery;
+ (id)syncPolicyForPhysicalSocial;
+ (id)syncPolicyForSoundAnalysis;
+ (id)validKeyPaths;
@end

@implementation _BMContextualUnderstandingLibraryNode

+ (id)identifier
{
  return @"ContextualUnderstanding";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ActivityInference"])
  {
    uint64_t v5 = [a1 ActivityInference];
LABEL_11:
    v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"AmbientLight"])
  {
    uint64_t v5 = [a1 AmbientLight];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PeopleDiscovery"])
  {
    uint64_t v5 = [a1 PeopleDiscovery];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PhysicalSocial"])
  {
    uint64_t v5 = [a1 PhysicalSocial];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"SoundAnalysis"])
  {
    uint64_t v5 = [a1 SoundAnalysis];
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMContextualUnderstandingActivityInference validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMContextualUnderstandingAmbientLight validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMContextualUnderstandingPeopleDiscovery validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMContextualUnderstandingPhysicalSocial validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMContextualUnderstandingSoundAnalysis validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[v2 copy];

  return v8;
}

+ (id)streamNames
{
  return &unk_1F0BF6108;
}

+ (id)configurationForSoundAnalysis
{
  v3 = [a1 storeConfigurationForSoundAnalysis];
  id v4 = [a1 syncPolicyForSoundAnalysis];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6BD929B5-7BBF-409D-8868-9B9039FD2904"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextualUnderstanding.SoundAnalysis", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSoundAnalysis
{
  return 0;
}

+ (id)storeConfigurationForSoundAnalysis
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextualUnderstanding.SoundAnalysis" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPhysicalSocial
{
  v3 = [a1 storeConfigurationForPhysicalSocial];
  id v4 = [a1 syncPolicyForPhysicalSocial];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"61466143-B29F-4369-B39C-0B91090D10A0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextualUnderstanding.PhysicalSocial", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPhysicalSocial
{
  return 0;
}

+ (id)storeConfigurationForPhysicalSocial
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextualUnderstanding.PhysicalSocial" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPeopleDiscovery
{
  v3 = [a1 storeConfigurationForPeopleDiscovery];
  id v4 = [a1 syncPolicyForPeopleDiscovery];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D0E5021F-41E3-4868-B9D3-6982A0D622EA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextualUnderstanding.PeopleDiscovery", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPeopleDiscovery
{
  return 0;
}

+ (id)storeConfigurationForPeopleDiscovery
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextualUnderstanding.PeopleDiscovery" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAmbientLight
{
  v3 = [a1 storeConfigurationForAmbientLight];
  id v4 = [a1 syncPolicyForAmbientLight];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6B06A8F9-61E9-4B24-95B7-C87C47A0BC03"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextualUnderstanding.AmbientLight", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAmbientLight
{
  return 0;
}

+ (id)storeConfigurationForAmbientLight
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:241920 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextualUnderstanding.AmbientLight" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForActivityInference
{
  v3 = [a1 storeConfigurationForActivityInference];
  id v4 = [a1 syncPolicyForActivityInference];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"17344794-4C6E-47F4-8C0B-5714C7883E27"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ContextualUnderstanding.ActivityInference", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForActivityInference
{
  return 0;
}

+ (id)storeConfigurationForActivityInference
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ContextualUnderstanding.ActivityInference" domain:0 segmentSize:0x40000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)SoundAnalysis
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSoundAnalysis];
  v3 = +[BMContextualUnderstandingSoundAnalysis columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextualUnderstanding.SoundAnalysis" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextualUnderstanding.SoundAnalysis" schema:v9 configuration:v2];

  return v10;
}

+ (id)PhysicalSocial
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPhysicalSocial];
  v3 = +[BMContextualUnderstandingPhysicalSocial columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextualUnderstanding.PhysicalSocial" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextualUnderstanding.PhysicalSocial" schema:v9 configuration:v2];

  return v10;
}

+ (id)PeopleDiscovery
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPeopleDiscovery];
  v3 = +[BMContextualUnderstandingPeopleDiscovery columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextualUnderstanding.PeopleDiscovery" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextualUnderstanding.PeopleDiscovery" schema:v9 configuration:v2];

  return v10;
}

+ (id)AmbientLight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAmbientLight];
  v3 = +[BMContextualUnderstandingAmbientLight columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextualUnderstanding.AmbientLight" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextualUnderstanding.AmbientLight" schema:v9 configuration:v2];

  return v10;
}

+ (id)ActivityInference
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForActivityInference];
  v3 = +[BMContextualUnderstandingActivityInference columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ContextualUnderstanding.ActivityInference" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ContextualUnderstanding.ActivityInference" schema:v9 configuration:v2];

  return v10;
}

@end