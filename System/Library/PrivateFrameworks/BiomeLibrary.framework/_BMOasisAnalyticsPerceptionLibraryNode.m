@interface _BMOasisAnalyticsPerceptionLibraryNode
+ (id)SLAM;
+ (id)configurationForSLAM;
+ (id)identifier;
+ (id)storeConfigurationForSLAM;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSLAM;
+ (id)validKeyPaths;
@end

@implementation _BMOasisAnalyticsPerceptionLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"SLAM"])
  {
    v4 = [a1 SLAM];
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
  v3 = +[BMOasisAnalyticsPerceptionSLAM validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF4B78;
}

+ (id)identifier
{
  return @"Perception";
}

+ (id)configurationForSLAM
{
  v3 = [a1 storeConfigurationForSLAM];
  v4 = [a1 syncPolicyForSLAM];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"63D82BE1-49B0-4FAA-98E4-25630F7685C5"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"OasisAnalytics.Perception.SLAM", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.arkitd");

  return v7;
}

+ (id)syncPolicyForSLAM
{
  return 0;
}

+ (id)storeConfigurationForSLAM
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:104857600 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"OasisAnalytics.Perception.SLAM" domain:1 segmentSize:5242880 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)SLAM
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSLAM];
  v3 = +[BMOasisAnalyticsPerceptionSLAM columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"OasisAnalytics.Perception.SLAM" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"OasisAnalytics.Perception.SLAM" schema:v9 configuration:v2];

  return v10;
}

@end