@interface _BMUserFocusLibraryNode
+ (id)Activity;
+ (id)ComputedMode;
+ (id)DoNotDisturbWhileDriving;
+ (id)InferredMode;
+ (id)SleepMode;
+ (id)StatusChange;
+ (id)configurationForActivity;
+ (id)configurationForComputedMode;
+ (id)configurationForDoNotDisturbWhileDriving;
+ (id)configurationForInferredMode;
+ (id)configurationForSleepMode;
+ (id)configurationForStatusChange;
+ (id)identifier;
+ (id)storeConfigurationForActivity;
+ (id)storeConfigurationForComputedMode;
+ (id)storeConfigurationForDoNotDisturbWhileDriving;
+ (id)storeConfigurationForInferredMode;
+ (id)storeConfigurationForSleepMode;
+ (id)storeConfigurationForStatusChange;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForActivity;
+ (id)syncPolicyForComputedMode;
+ (id)syncPolicyForDoNotDisturbWhileDriving;
+ (id)syncPolicyForInferredMode;
+ (id)syncPolicyForSleepMode;
+ (id)syncPolicyForStatusChange;
+ (id)validKeyPaths;
@end

@implementation _BMUserFocusLibraryNode

+ (id)identifier
{
  return @"UserFocus";
}

+ (id)streamNames
{
  return &unk_1F0BF6960;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Activity"])
  {
    uint64_t v5 = [a1 Activity];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"ComputedMode"])
  {
    uint64_t v5 = [a1 ComputedMode];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"DoNotDisturbWhileDriving"])
  {
    uint64_t v5 = [a1 DoNotDisturbWhileDriving];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"InferredMode"])
  {
    uint64_t v5 = [a1 InferredMode];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"SleepMode"])
  {
    uint64_t v5 = [a1 SleepMode];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"StatusChange"])
  {
    uint64_t v5 = [a1 StatusChange];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)ComputedMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForComputedMode];
  v3 = +[BMUserFocusModeComputed columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.ComputedMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.ComputedMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForComputedMode
{
  v3 = [a1 storeConfigurationForComputedMode];
  id v4 = [a1 syncPolicyForComputedMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BA2108BB-663B-4278-9E99-ACB23A63F726"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.ComputedMode", objc_opt_class(), v3, v4, &unk_1F0BF68E8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForComputedMode
{
  return 0;
}

+ (id)storeConfigurationForComputedMode
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.ComputedMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)StatusChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForStatusChange];
  v3 = +[BMUserFocusStatusChange columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.StatusChange" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.StatusChange" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForStatusChange
{
  v3 = [a1 storeConfigurationForStatusChange];
  id v4 = [a1 syncPolicyForStatusChange];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"940F0F5E-33BD-47C1-9C07-2F65F77700D2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.StatusChange", objc_opt_class(), v3, v4, &unk_1F0BF6948, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMUserFocusActivity validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMUserFocusModeComputed validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMUserFocusDoNotDisturbWhileDriving validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMUserFocusInferredMode validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMUserFocusSleepMode validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMUserFocusStatusChange validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = (void *)[v2 copy];

  return v9;
}

+ (id)syncPolicyForStatusChange
{
  return 0;
}

+ (id)storeConfigurationForStatusChange
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.StatusChange" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSleepMode
{
  v3 = [a1 storeConfigurationForSleepMode];
  id v4 = [a1 syncPolicyForSleepMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"45187294-E7A3-41A6-BC86-20F30921E2F1"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.SleepMode", objc_opt_class(), v3, v4, &unk_1F0BF6930, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSleepMode
{
  return 0;
}

+ (id)storeConfigurationForSleepMode
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.SleepMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForInferredMode
{
  v3 = [a1 storeConfigurationForInferredMode];
  id v4 = [a1 syncPolicyForInferredMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"748D6F6E-D6C9-4DE7-AF80-202914CCD86E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.InferredMode", objc_opt_class(), v3, v4, &unk_1F0BF6918, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForInferredMode
{
  return 0;
}

+ (id)storeConfigurationForInferredMode
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.InferredMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDoNotDisturbWhileDriving
{
  v3 = [a1 storeConfigurationForDoNotDisturbWhileDriving];
  id v4 = [a1 syncPolicyForDoNotDisturbWhileDriving];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7FF44AAD-D59F-4EEC-B610-FB71D22AD3CE"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.DoNotDisturbWhileDriving", objc_opt_class(), v3, v4, &unk_1F0BF6900, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDoNotDisturbWhileDriving
{
  return 0;
}

+ (id)storeConfigurationForDoNotDisturbWhileDriving
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.DoNotDisturbWhileDriving" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForActivity
{
  v3 = [a1 storeConfigurationForActivity];
  id v4 = [a1 syncPolicyForActivity];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EA3370C8-9BA7-43CF-B930-98C90B1596A4"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"UserFocus.Activity", objc_opt_class(), v3, v4, &unk_1F0BF68D0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForActivity
{
  return 0;
}

+ (id)storeConfigurationForActivity
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"UserFocus.Activity" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)SleepMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSleepMode];
  v3 = +[BMUserFocusSleepMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.SleepMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.SleepMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)InferredMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForInferredMode];
  v3 = +[BMUserFocusInferredMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.InferredMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.InferredMode" schema:v9 configuration:v2];

  return v10;
}

+ (id)DoNotDisturbWhileDriving
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDoNotDisturbWhileDriving];
  v3 = +[BMUserFocusDoNotDisturbWhileDriving columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.DoNotDisturbWhileDriving" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.DoNotDisturbWhileDriving" schema:v9 configuration:v2];

  return v10;
}

+ (id)Activity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForActivity];
  v3 = +[BMUserFocusActivity columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"UserFocus.Activity" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"UserFocus.Activity" schema:v9 configuration:v2];

  return v10;
}

@end