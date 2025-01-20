@interface _BMGenerativeExperiencesGeneratedImageFeaturesLibraryNode
+ (id)UserInteraction;
+ (id)configurationForUserInteraction;
+ (id)identifier;
+ (id)storeConfigurationForUserInteraction;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForUserInteraction;
+ (id)validKeyPaths;
@end

@implementation _BMGenerativeExperiencesGeneratedImageFeaturesLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"UserInteraction"])
  {
    v4 = [a1 UserInteraction];
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
  v3 = +[BMGeneratedImageUserInteraction validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF7A88;
}

+ (id)identifier
{
  return @"GeneratedImageFeatures";
}

+ (id)configurationForUserInteraction
{
  v3 = [a1 storeConfigurationForUserInteraction];
  v4 = [a1 syncPolicyForUserInteraction];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9701B19A-6440-4326-AB28-8A0B6E7C6793"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"GenerativeExperiences.GeneratedImageFeatures.UserInteraction", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUserInteraction
{
  return 0;
}

+ (id)storeConfigurationForUserInteraction
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:10485760 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"GenerativeExperiences.GeneratedImageFeatures.UserInteraction" domain:0 segmentSize:0x40000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)UserInteraction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForUserInteraction];
  v3 = +[BMGeneratedImageUserInteraction columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"GenerativeExperiences.GeneratedImageFeatures.UserInteraction" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"GenerativeExperiences.GeneratedImageFeatures.UserInteraction" schema:v9 configuration:v2];

  return v10;
}

@end