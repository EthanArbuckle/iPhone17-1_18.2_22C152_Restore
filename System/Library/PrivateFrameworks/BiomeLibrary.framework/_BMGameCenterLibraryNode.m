@interface _BMGameCenterLibraryNode
+ (id)AchievementEarned;
+ (id)SuggestionFeedback;
+ (id)configurationForAchievementEarned;
+ (id)configurationForSuggestionFeedback;
+ (id)identifier;
+ (id)storeConfigurationForAchievementEarned;
+ (id)storeConfigurationForSuggestionFeedback;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAchievementEarned;
+ (id)syncPolicyForSuggestionFeedback;
+ (id)validKeyPaths;
@end

@implementation _BMGameCenterLibraryNode

+ (id)identifier
{
  return @"GameCenter";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AchievementEarned"])
  {
    uint64_t v5 = [a1 AchievementEarned];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"SuggestionFeedback"])
  {
    uint64_t v5 = [a1 SuggestionFeedback];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMGameCenterAchievementEarned validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMGameCenterSuggestionFeedback validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF65B8;
}

+ (id)configurationForSuggestionFeedback
{
  v3 = [a1 storeConfigurationForSuggestionFeedback];
  id v4 = [a1 syncPolicyForSuggestionFeedback];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"39DCFB87-1759-48FE-9D81-E30419BD360A"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"GameCenter.SuggestionFeedback", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSuggestionFeedback
{
  return 0;
}

+ (id)storeConfigurationForSuggestionFeedback
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"GameCenter.SuggestionFeedback" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAchievementEarned
{
  v3 = [a1 storeConfigurationForAchievementEarned];
  id v4 = [a1 syncPolicyForAchievementEarned];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5D482238-969B-4858-867E-E7AC86BD8D22"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"GameCenter.AchievementEarned", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.gamecenter");

  return v7;
}

+ (id)syncPolicyForAchievementEarned
{
  return 0;
}

+ (id)storeConfigurationForAchievementEarned
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"GameCenter.AchievementEarned" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)SuggestionFeedback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSuggestionFeedback];
  v3 = +[BMGameCenterSuggestionFeedback columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"GameCenter.SuggestionFeedback" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"GameCenter.SuggestionFeedback" schema:v9 configuration:v2];

  return v10;
}

+ (id)AchievementEarned
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAchievementEarned];
  v3 = +[BMGameCenterAchievementEarned columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"GameCenter.AchievementEarned" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"GameCenter.AchievementEarned" schema:v9 configuration:v2];

  return v10;
}

@end