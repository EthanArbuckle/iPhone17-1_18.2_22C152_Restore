@interface _BMGenerativeExperiencesLibraryNode
+ (id)GeneratedImageFeatures;
+ (id)TransparencyLog;
+ (id)configurationForTransparencyLog;
+ (id)identifier;
+ (id)storeConfigurationForTransparencyLog;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForTransparencyLog;
+ (id)validKeyPaths;
@end

@implementation _BMGenerativeExperiencesLibraryNode

+ (id)identifier
{
  return @"GenerativeExperiences";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 GeneratedImageFeatures];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"TransparencyLog"])
  {
    v4 = [a1 TransparencyLog];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMGenerativeExperiencesTransparencyLog validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5E68;
}

+ (id)GeneratedImageFeatures
{
  return (id)objc_opt_class();
}

+ (id)configurationForTransparencyLog
{
  v3 = [a1 storeConfigurationForTransparencyLog];
  v4 = [a1 syncPolicyForTransparencyLog];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D80BEF5D-C1C8-48E4-8BE9-F05062A6CC4D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"GenerativeExperiences.TransparencyLog", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.AppleIntelligenceReport");

  return v7;
}

+ (id)syncPolicyForTransparencyLog
{
  return 0;
}

+ (id)storeConfigurationForTransparencyLog
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:604800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"GenerativeExperiences.TransparencyLog" domain:0 segmentSize:5242880 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)TransparencyLog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTransparencyLog];
  v3 = +[BMGenerativeExperiencesTransparencyLog columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"GenerativeExperiences.TransparencyLog" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"GenerativeExperiences.TransparencyLog" schema:v9 configuration:v2];

  return v10;
}

@end