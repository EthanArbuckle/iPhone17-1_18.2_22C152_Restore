@interface _BMSiriUserEngagementLibraryNode
+ (id)UserEngagementStatistics;
+ (id)configurationForUserEngagementStatistics;
+ (id)identifier;
+ (id)storeConfigurationForUserEngagementStatistics;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForUserEngagementStatistics;
+ (id)validKeyPaths;
@end

@implementation _BMSiriUserEngagementLibraryNode

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"UserEngagementStatistics"])
  {
    v4 = [a1 UserEngagementStatistics];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)UserEngagementStatistics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForUserEngagementStatistics];
  v3 = +[BMSiriUserEngagementStatistics columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.UserEngagement.UserEngagementStatistics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.UserEngagement.UserEngagementStatistics" schema:v9 configuration:v2];

  return v10;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriUserEngagementStatistics validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5CB8;
}

+ (id)identifier
{
  return @"UserEngagement";
}

+ (id)configurationForUserEngagementStatistics
{
  v3 = [a1 storeConfigurationForUserEngagementStatistics];
  v4 = [a1 syncPolicyForUserEngagementStatistics];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"764F1097-31D4-4854-9B60-B71CB138085B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.UserEngagement.UserEngagementStatistics", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUserEngagementStatistics
{
  return 0;
}

+ (id)storeConfigurationForUserEngagementStatistics
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.UserEngagement.UserEngagementStatistics" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

@end