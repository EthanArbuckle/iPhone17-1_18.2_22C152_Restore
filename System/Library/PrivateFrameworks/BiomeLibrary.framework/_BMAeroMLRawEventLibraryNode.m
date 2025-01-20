@interface _BMAeroMLRawEventLibraryNode
+ (id)PhotosSearchSession;
+ (id)configurationForPhotosSearchSession;
+ (id)identifier;
+ (id)storeConfigurationForPhotosSearchSession;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPhotosSearchSession;
+ (id)validKeyPaths;
@end

@implementation _BMAeroMLRawEventLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"PhotosSearchSession"])
  {
    v4 = [a1 PhotosSearchSession];
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
  v3 = +[BMAeroMLPhotosSearchSession validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5340;
}

+ (id)identifier
{
  return @"RawEvent";
}

+ (id)configurationForPhotosSearchSession
{
  v3 = [a1 storeConfigurationForPhotosSearchSession];
  v4 = [a1 syncPolicyForPhotosSearchSession];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2507B610-0283-4F0D-9074-0833AC706B2F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"AeroML.RawEvent.PhotosSearchSession", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPhotosSearchSession
{
  return 0;
}

+ (id)storeConfigurationForPhotosSearchSession
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"AeroML.RawEvent.PhotosSearchSession" domain:0 segmentSize:0x200000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PhotosSearchSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPhotosSearchSession];
  v3 = +[BMAeroMLPhotosSearchSession columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"AeroML.RawEvent.PhotosSearchSession" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"AeroML.RawEvent.PhotosSearchSession" schema:v9 configuration:v2];

  return v10;
}

@end