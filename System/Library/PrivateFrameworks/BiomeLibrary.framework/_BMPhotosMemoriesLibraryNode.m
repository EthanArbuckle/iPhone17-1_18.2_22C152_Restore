@interface _BMPhotosMemoriesLibraryNode
+ (id)AddToMemories;
+ (id)Curation;
+ (id)MoviePlayed;
+ (id)Notification;
+ (id)Shared;
+ (id)Viewed;
+ (id)configurationForAddToMemories;
+ (id)configurationForCuration;
+ (id)configurationForMoviePlayed;
+ (id)configurationForNotification;
+ (id)configurationForShared;
+ (id)configurationForViewed;
+ (id)identifier;
+ (id)storeConfigurationForAddToMemories;
+ (id)storeConfigurationForCuration;
+ (id)storeConfigurationForMoviePlayed;
+ (id)storeConfigurationForNotification;
+ (id)storeConfigurationForShared;
+ (id)storeConfigurationForViewed;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAddToMemories;
+ (id)syncPolicyForCuration;
+ (id)syncPolicyForMoviePlayed;
+ (id)syncPolicyForNotification;
+ (id)syncPolicyForShared;
+ (id)syncPolicyForViewed;
+ (id)validKeyPaths;
@end

@implementation _BMPhotosMemoriesLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AddToMemories"])
  {
    uint64_t v5 = [a1 AddToMemories];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"Curation"])
  {
    uint64_t v5 = [a1 Curation];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"MoviePlayed"])
  {
    uint64_t v5 = [a1 MoviePlayed];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Notification"])
  {
    uint64_t v5 = [a1 Notification];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Shared"])
  {
    uint64_t v5 = [a1 Shared];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Viewed"])
  {
    uint64_t v5 = [a1 Viewed];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMPhotosAddToMemories validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMPhotosCuration validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMPhotosMoviePlayed validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMPhotosNotification validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMPhotosMemoriesShared validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMPhotosMemoriesViewed validKeyPaths];
  [v2 addObjectsFromArray:v8];

  v9 = (void *)[v2 copy];

  return v9;
}

+ (id)streamNames
{
  return &unk_1F0BF5BB0;
}

+ (id)identifier
{
  return @"Memories";
}

+ (id)configurationForViewed
{
  v3 = [a1 storeConfigurationForViewed];
  id v4 = [a1 syncPolicyForViewed];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0CA97DAE-A48B-4609-91A6-3CC17E5ACB26"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.Viewed", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForViewed
{
  return 0;
}

+ (id)storeConfigurationForViewed
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.Viewed" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForShared
{
  v3 = [a1 storeConfigurationForShared];
  id v4 = [a1 syncPolicyForShared];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1E95A2A3-CA17-4DBE-9B5C-E9BD6C6855E4"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.Shared", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForShared
{
  return 0;
}

+ (id)storeConfigurationForShared
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:15724800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.Shared" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForNotification
{
  v3 = [a1 storeConfigurationForNotification];
  id v4 = [a1 syncPolicyForNotification];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C54C6758-8994-46F6-B4DC-566D394692E7"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.Notification", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForNotification
{
  return 0;
}

+ (id)storeConfigurationForNotification
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.Notification" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMoviePlayed
{
  v3 = [a1 storeConfigurationForMoviePlayed];
  id v4 = [a1 syncPolicyForMoviePlayed];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2F0273EF-7A8E-49E7-8646-FB3FEEDD780E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.MoviePlayed", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForMoviePlayed
{
  return 0;
}

+ (id)storeConfigurationForMoviePlayed
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.MoviePlayed" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForCuration
{
  v3 = [a1 storeConfigurationForCuration];
  id v4 = [a1 syncPolicyForCuration];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0624885B-3656-4879-AC15-A56AD03D690B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.Curation", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForCuration
{
  return 0;
}

+ (id)storeConfigurationForCuration
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.Curation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAddToMemories
{
  v3 = [a1 storeConfigurationForAddToMemories];
  id v4 = [a1 syncPolicyForAddToMemories];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"985AAF74-3CCA-4F43-BC58-0329AEADB604"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Memories.AddToMemories", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForAddToMemories
{
  return 0;
}

+ (id)storeConfigurationForAddToMemories
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Memories.AddToMemories" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Viewed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForViewed];
  v3 = +[BMPhotosMemoriesViewed columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.Viewed" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.Viewed" schema:v9 configuration:v2];

  return v10;
}

+ (id)Shared
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForShared];
  v3 = +[BMPhotosMemoriesShared columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.Shared" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.Shared" schema:v9 configuration:v2];

  return v10;
}

+ (id)Notification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForNotification];
  v3 = +[BMPhotosNotification columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.Notification" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.Notification" schema:v9 configuration:v2];

  return v10;
}

+ (id)MoviePlayed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMoviePlayed];
  v3 = +[BMPhotosMoviePlayed columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.MoviePlayed" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.MoviePlayed" schema:v9 configuration:v2];

  return v10;
}

+ (id)Curation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCuration];
  v3 = +[BMPhotosCuration columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.Curation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.Curation" schema:v9 configuration:v2];

  return v10;
}

+ (id)AddToMemories
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAddToMemories];
  v3 = +[BMPhotosAddToMemories columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Memories.AddToMemories" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Memories.AddToMemories" schema:v9 configuration:v2];

  return v10;
}

@end