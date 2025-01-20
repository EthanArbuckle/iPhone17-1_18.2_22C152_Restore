@interface _BMOasisAnalyticsLibraryNode
+ (id)Device;
+ (id)GazeKit;
+ (id)Perception;
+ (id)SystemInfo;
+ (id)configurationForSystemInfo;
+ (id)identifier;
+ (id)storeConfigurationForSystemInfo;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSystemInfo;
+ (id)validKeyPaths;
@end

@implementation _BMOasisAnalyticsLibraryNode

+ (id)identifier
{
  return @"OasisAnalytics";
}

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Device];
  v4 = objc_msgSend(a1, "GazeKit", v3);
  v8[1] = v4;
  v5 = [a1 Perception];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"SystemInfo"])
  {
    v4 = [a1 SystemInfo];
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
  v3 = +[BMOasisAnalyticsSystemInfo validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF7668;
}

+ (id)Perception
{
  return (id)objc_opt_class();
}

+ (id)GazeKit
{
  return (id)objc_opt_class();
}

+ (id)Device
{
  return (id)objc_opt_class();
}

+ (id)configurationForSystemInfo
{
  v3 = [a1 storeConfigurationForSystemInfo];
  v4 = [a1 syncPolicyForSystemInfo];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"05848D64-3A31-4472-AFCE-C27EDB32E30C"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"OasisAnalytics.SystemInfo", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.arkitd");

  return v7;
}

+ (id)syncPolicyForSystemInfo
{
  return 0;
}

+ (id)storeConfigurationForSystemInfo
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:10485760 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"OasisAnalytics.SystemInfo" domain:1 segmentSize:0x100000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)SystemInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSystemInfo];
  v3 = +[BMOasisAnalyticsSystemInfo columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"OasisAnalytics.SystemInfo" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"OasisAnalytics.SystemInfo" schema:v9 configuration:v2];

  return v10;
}

@end