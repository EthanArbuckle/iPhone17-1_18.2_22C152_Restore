@interface _BMHealthLibraryNode
+ (id)FocusedEvaluationMode;
+ (id)Medications;
+ (id)Workout;
+ (id)configurationForFocusedEvaluationMode;
+ (id)configurationForWorkout;
+ (id)identifier;
+ (id)storeConfigurationForFocusedEvaluationMode;
+ (id)storeConfigurationForWorkout;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForFocusedEvaluationMode;
+ (id)syncPolicyForWorkout;
+ (id)validKeyPaths;
@end

@implementation _BMHealthLibraryNode

+ (id)identifier
{
  return @"Health";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 Medications];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"FocusedEvaluationMode"])
  {
    uint64_t v5 = [a1 FocusedEvaluationMode];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Workout"])
  {
    uint64_t v5 = [a1 Workout];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMHealthFocusedEvaluationMode validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMHealthWorkout validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF6E70;
}

+ (id)Medications
{
  return (id)objc_opt_class();
}

+ (id)configurationForWorkout
{
  v3 = [a1 storeConfigurationForWorkout];
  id v4 = [a1 syncPolicyForWorkout];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2AE0D254-82ED-4B19-920B-D78F5A9A0D73"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Health.Workout", objc_opt_class(), v3, v4, &unk_1F0BF6E58, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWorkout
{
  return 0;
}

+ (id)storeConfigurationForWorkout
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Health.Workout" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForFocusedEvaluationMode
{
  v3 = [a1 storeConfigurationForFocusedEvaluationMode];
  id v4 = [a1 syncPolicyForFocusedEvaluationMode];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E1DF2352-C086-4850-85A9-0EA99D2384AE"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Health.FocusedEvaluationMode", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForFocusedEvaluationMode
{
  return 0;
}

+ (id)storeConfigurationForFocusedEvaluationMode
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Health.FocusedEvaluationMode" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Workout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWorkout];
  v3 = +[BMHealthWorkout columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Health.Workout" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Health.Workout" schema:v9 configuration:v2];

  return v10;
}

+ (id)FocusedEvaluationMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForFocusedEvaluationMode];
  v3 = +[BMHealthFocusedEvaluationMode columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Health.FocusedEvaluationMode" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Health.FocusedEvaluationMode" schema:v9 configuration:v2];

  return v10;
}

@end