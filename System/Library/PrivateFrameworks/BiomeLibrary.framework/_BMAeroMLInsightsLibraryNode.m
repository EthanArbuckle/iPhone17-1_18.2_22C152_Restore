@interface _BMAeroMLInsightsLibraryNode
+ (id)PhotosSearchInsights;
+ (id)configurationForPhotosSearchInsights;
+ (id)identifier;
+ (id)storeConfigurationForPhotosSearchInsights;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPhotosSearchInsights;
+ (id)validKeyPaths;
@end

@implementation _BMAeroMLInsightsLibraryNode

+ (id)identifier
{
  return @"Insights";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"PhotosSearchInsights"])
  {
    v4 = [a1 PhotosSearchInsights];
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
  v3 = +[BMAeroMLPhotosSearchInsights validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF66D8;
}

+ (id)configurationForPhotosSearchInsights
{
  v3 = [a1 storeConfigurationForPhotosSearchInsights];
  v4 = [a1 syncPolicyForPhotosSearchInsights];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C447AE9B-480C-4A3B-A2B9-AA9316EE4BEB"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"AeroML.Insights.PhotosSearchInsights", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPhotosSearchInsights
{
  return 0;
}

+ (id)storeConfigurationForPhotosSearchInsights
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"AeroML.Insights.PhotosSearchInsights" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PhotosSearchInsights
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPhotosSearchInsights];
  v3 = +[BMAeroMLPhotosSearchInsights columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"AeroML.Insights.PhotosSearchInsights" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"AeroML.Insights.PhotosSearchInsights" schema:v9 configuration:v2];

  return v10;
}

@end