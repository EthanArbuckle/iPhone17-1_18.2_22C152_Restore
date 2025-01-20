@interface _BMSystemSettingsGestureEducationLibraryNode
+ (id)Multitasking;
+ (id)PillOutcome;
+ (id)configurationForMultitasking;
+ (id)configurationForPillOutcome;
+ (id)identifier;
+ (id)storeConfigurationForMultitasking;
+ (id)storeConfigurationForPillOutcome;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMultitasking;
+ (id)syncPolicyForPillOutcome;
+ (id)validKeyPaths;
@end

@implementation _BMSystemSettingsGestureEducationLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF7260;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Multitasking"])
  {
    uint64_t v5 = [a1 Multitasking];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"PillOutcome"])
  {
    uint64_t v5 = [a1 PillOutcome];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)Multitasking
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForMultitasking];
  v3 = +[BMSystemSettingsMultitasking columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SystemSettings.GestureEducation.Multitasking" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SystemSettings.GestureEducation.Multitasking" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForMultitasking
{
  v3 = [a1 storeConfigurationForMultitasking];
  id v4 = [a1 syncPolicyForMultitasking];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5F28104B-D659-40FD-A419-C8917E89AAEB"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SystemSettings.GestureEducation.Multitasking", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMultitasking
{
  return 0;
}

+ (id)storeConfigurationForMultitasking
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SystemSettings.GestureEducation.Multitasking" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSystemSettingsMultitasking validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSystemSettingsPillOutcome validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)identifier
{
  return @"GestureEducation";
}

+ (id)configurationForPillOutcome
{
  v3 = [a1 storeConfigurationForPillOutcome];
  id v4 = [a1 syncPolicyForPillOutcome];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"359EE8C7-72A9-4FBA-B2E7-51AC9111861B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"SystemSettings.GestureEducation.PillOutcome", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPillOutcome
{
  return 0;
}

+ (id)storeConfigurationForPillOutcome
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"SystemSettings.GestureEducation.PillOutcome" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PillOutcome
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPillOutcome];
  v3 = +[BMSystemSettingsPillOutcome columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"SystemSettings.GestureEducation.PillOutcome" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"SystemSettings.GestureEducation.PillOutcome" schema:v9 configuration:v2];

  return v10;
}

@end