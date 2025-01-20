@interface _BMMediaLibraryNode
+ (id)NowPlaying;
+ (id)Route;
+ (id)StreamingStats;
+ (id)configurationForNowPlaying;
+ (id)configurationForRoute;
+ (id)configurationForStreamingStats;
+ (id)identifier;
+ (id)storeConfigurationForNowPlaying;
+ (id)storeConfigurationForRoute;
+ (id)storeConfigurationForStreamingStats;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForNowPlaying;
+ (id)syncPolicyForRoute;
+ (id)syncPolicyForStreamingStats;
+ (id)validKeyPaths;
@end

@implementation _BMMediaLibraryNode

+ (id)identifier
{
  return @"Media";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"NowPlaying"])
  {
    uint64_t v5 = [a1 NowPlaying];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"Route"])
  {
    uint64_t v5 = [a1 Route];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"StreamingStats"])
  {
    uint64_t v5 = [a1 StreamingStats];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMediaNowPlaying validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMediaRoute validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMMediaStreamingStats validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)streamNames
{
  return &unk_1F0BF5CA0;
}

+ (id)configurationForStreamingStats
{
  v3 = [a1 storeConfigurationForStreamingStats];
  id v4 = [a1 syncPolicyForStreamingStats];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DB4BAB4D-DD4F-45B3-8D34-24D42CFC55D8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Media.StreamingStats", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForStreamingStats
{
  return 0;
}

+ (id)storeConfigurationForStreamingStats
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Media.StreamingStats" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForRoute
{
  v3 = [a1 storeConfigurationForRoute];
  id v4 = [a1 syncPolicyForRoute];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"31C87A4F-1C7A-4EC8-A9CB-7B816C316E49"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Media.Route", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForRoute
{
  return 0;
}

+ (id)storeConfigurationForRoute
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Media.Route" domain:0 segmentSize:0x20000 protectionClass:5 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForNowPlaying
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForNowPlaying];
  id v4 = [a1 syncPolicyForNowPlaying];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == bundleID" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"app-uninstall" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT bundleID IN $installed" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"app-uninstall-nightly" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5015B088-E292-411F-9AEB-40E2B4BF3931"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Media.NowPlaying", objc_opt_class(), v3, v4, &unk_1F0BF5C88, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForNowPlaying
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v21[0] = v16;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v20 = v15;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v19 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v17[0] = v6;
  v18[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v17[1] = v7;
  v18[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  v17[2] = v8;
  v18[2] = v3;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  void v17[3] = v9;
  v18[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v17[4] = v10;
  v18[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5015B088-E292-411F-9AEB-40E2B4BF3931"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:@"public/NowPlaying" eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForNowPlaying
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Media.NowPlaying" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)StreamingStats
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForStreamingStats];
  v3 = +[BMMediaStreamingStats columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Media.StreamingStats" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Media.StreamingStats" schema:v9 configuration:v2];

  return v10;
}

+ (id)Route
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRoute];
  v3 = +[BMMediaRoute columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Media.Route" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Media.Route" schema:v9 configuration:v2];

  return v10;
}

+ (id)NowPlaying
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForNowPlaying];
  v3 = +[BMMediaNowPlaying columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Media.NowPlaying" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Media.NowPlaying" schema:v9 configuration:v2];

  return v10;
}

@end