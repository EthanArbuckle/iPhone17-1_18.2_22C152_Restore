@interface _BMScreenTimeLibraryNode
+ (id)AppUsage;
+ (id)configurationForAppUsage;
+ (id)identifier;
+ (id)storeConfigurationForAppUsage;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAppUsage;
+ (id)validKeyPaths;
@end

@implementation _BMScreenTimeLibraryNode

+ (id)identifier
{
  return @"ScreenTime";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"AppUsage"])
  {
    v4 = [a1 AppUsage];
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
  v3 = +[BMScreenTimeAppUsage validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF4608;
}

+ (id)configurationForAppUsage
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForAppUsage];
  v4 = [a1 syncPolicyForAppUsage];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == bundleID" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"app-uninstall" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT bundleID IN $installed" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"app-uninstall-nightly" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1024B613-9E9C-4711-9C96-52E92CC76B00"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"ScreenTime.AppUsage", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForAppUsage
{
  return 0;
}

+ (id)storeConfigurationForAppUsage
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ScreenTime.AppUsage" domain:0 segmentSize:0x80000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)AppUsage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAppUsage];
  v3 = +[BMScreenTimeAppUsage columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ScreenTime.AppUsage" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ScreenTime.AppUsage" schema:v9 configuration:v2];

  return v10;
}

@end