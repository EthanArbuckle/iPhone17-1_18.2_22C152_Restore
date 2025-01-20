@interface _BMMapsShareEtaLibraryNode
+ (id)Feedback;
+ (id)configurationForFeedback;
+ (id)identifier;
+ (id)storeConfigurationForFeedback;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForFeedback;
+ (id)validKeyPaths;
@end

@implementation _BMMapsShareEtaLibraryNode

+ (id)identifier
{
  return @"ShareEta";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Feedback"])
  {
    v4 = [a1 Feedback];
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
  v3 = +[BMMapsFeedback validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5970;
}

+ (id)configurationForFeedback
{
  v3 = [a1 storeConfigurationForFeedback];
  v4 = [a1 syncPolicyForFeedback];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E25B1268-C960-4109-8B45-D66AC47E1936"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Maps.ShareEta.Feedback", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Maps");

  return v7;
}

+ (id)syncPolicyForFeedback
{
  return 0;
}

+ (id)storeConfigurationForFeedback
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Maps.ShareEta.Feedback" domain:0 segmentSize:0x80000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Feedback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForFeedback];
  v3 = +[BMMapsFeedback columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Maps.ShareEta.Feedback" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Maps.ShareEta.Feedback" schema:v9 configuration:v2];

  return v10;
}

@end