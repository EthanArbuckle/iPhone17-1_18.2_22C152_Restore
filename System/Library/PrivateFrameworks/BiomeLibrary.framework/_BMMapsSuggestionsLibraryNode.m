@interface _BMMapsSuggestionsLibraryNode
+ (id)RecentConversationsIntent;
+ (id)configurationForRecentConversationsIntent;
+ (id)identifier;
+ (id)storeConfigurationForRecentConversationsIntent;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRecentConversationsIntent;
+ (id)validKeyPaths;
@end

@implementation _BMMapsSuggestionsLibraryNode

+ (id)streamNames
{
  return &unk_1F0BF62A0;
}

+ (id)identifier
{
  return @"Suggestions";
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"RecentConversationsIntent"])
  {
    v4 = [a1 RecentConversationsIntent];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)RecentConversationsIntent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForRecentConversationsIntent];
  v3 = +[BMMapsRecentConversationsIntent columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Maps.Suggestions.RecentConversationsIntent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Maps.Suggestions.RecentConversationsIntent" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForRecentConversationsIntent
{
  v3 = [a1 storeConfigurationForRecentConversationsIntent];
  v4 = [a1 syncPolicyForRecentConversationsIntent];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A3DCDA05-C1AC-40D4-B30A-A0B8DC2AECA6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Maps.Suggestions.RecentConversationsIntent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Maps");

  return v7;
}

+ (id)syncPolicyForRecentConversationsIntent
{
  return 0;
}

+ (id)storeConfigurationForRecentConversationsIntent
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Maps.Suggestions.RecentConversationsIntent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMapsRecentConversationsIntent validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

@end