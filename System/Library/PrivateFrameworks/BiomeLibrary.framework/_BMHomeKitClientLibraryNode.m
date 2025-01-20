@interface _BMHomeKitClientLibraryNode
+ (id)AccessoryControl;
+ (id)ActionSet;
+ (id)MediaAccessoryControl;
+ (id)configurationForAccessoryControl;
+ (id)configurationForActionSet;
+ (id)configurationForMediaAccessoryControl;
+ (id)identifier;
+ (id)storeConfigurationForAccessoryControl;
+ (id)storeConfigurationForActionSet;
+ (id)storeConfigurationForMediaAccessoryControl;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAccessoryControl;
+ (id)syncPolicyForActionSet;
+ (id)syncPolicyForMediaAccessoryControl;
+ (id)validKeyPaths;
@end

@implementation _BMHomeKitClientLibraryNode

+ (id)streamNames
{
  return &unk_1F0BF6B40;
}

+ (id)identifier
{
  return @"Client";
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AccessoryControl"])
  {
    uint64_t v5 = [a1 AccessoryControl];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"ActionSet"])
  {
    uint64_t v5 = [a1 ActionSet];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"MediaAccessoryControl"])
  {
    uint64_t v5 = [a1 MediaAccessoryControl];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)MediaAccessoryControl
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForMediaAccessoryControl];
  v3 = +[BMHomeKitClientMediaAccessoryControl columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"HomeKit.Client.MediaAccessoryControl" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"HomeKit.Client.MediaAccessoryControl" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForMediaAccessoryControl
{
  v3 = [a1 storeConfigurationForMediaAccessoryControl];
  id v4 = [a1 syncPolicyForMediaAccessoryControl];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3F6BD669-59BB-4F24-AD3C-943A7225EB9B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"HomeKit.Client.MediaAccessoryControl", objc_opt_class(), v3, v4, &unk_1F0BF6B28, 0, v9, 0, 0, @"com.apple.Home");

  return v7;
}

+ (id)syncPolicyForMediaAccessoryControl
{
  return 0;
}

+ (id)storeConfigurationForMediaAccessoryControl
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"HomeKit.Client.MediaAccessoryControl" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)ActionSet
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForActionSet];
  v3 = +[BMHomeKitClientActionSet columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"HomeKit.Client.ActionSet" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"HomeKit.Client.ActionSet" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForActionSet
{
  v3 = [a1 storeConfigurationForActionSet];
  id v4 = [a1 syncPolicyForActionSet];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B92625D2-A9B8-4645-941E-E65E433D27CF"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"HomeKit.Client.ActionSet", objc_opt_class(), v3, v4, &unk_1F0BF6B10, 0, v9, 0, 0, @"com.apple.Home");

  return v7;
}

+ (id)syncPolicyForActionSet
{
  return 0;
}

+ (id)storeConfigurationForActionSet
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"HomeKit.Client.ActionSet" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AccessoryControl
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForAccessoryControl];
  v3 = +[BMHomeKitClientAccessoryControl columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"HomeKit.Client.AccessoryControl" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"HomeKit.Client.AccessoryControl" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAccessoryControl
{
  v3 = [a1 storeConfigurationForAccessoryControl];
  id v4 = [a1 syncPolicyForAccessoryControl];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A51A9719-8FB9-4A6E-B2F2-1FB82C094042"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"HomeKit.Client.AccessoryControl", objc_opt_class(), v3, v4, &unk_1F0BF6AF8, 0, v9, 0, 0, @"com.apple.Home");

  return v7;
}

+ (id)syncPolicyForAccessoryControl
{
  return 0;
}

+ (id)storeConfigurationForAccessoryControl
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"HomeKit.Client.AccessoryControl" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMHomeKitClientAccessoryControl validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMHomeKitClientActionSet validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMHomeKitClientMediaAccessoryControl validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

@end