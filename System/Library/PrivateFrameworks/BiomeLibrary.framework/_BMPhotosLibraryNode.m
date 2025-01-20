@interface _BMPhotosLibraryNode
+ (id)AutonamingSuggestions;
+ (id)Delete;
+ (id)Edit;
+ (id)Engagement;
+ (id)Favorite;
+ (id)Live;
+ (id)Map;
+ (id)Memories;
+ (id)MemoryCreation;
+ (id)Picker;
+ (id)Search;
+ (id)Share;
+ (id)Style;
+ (id)UserAnalytics;
+ (id)configurationForDelete;
+ (id)configurationForEdit;
+ (id)configurationForEngagement;
+ (id)configurationForFavorite;
+ (id)configurationForLive;
+ (id)configurationForMap;
+ (id)configurationForMemoryCreation;
+ (id)configurationForPicker;
+ (id)configurationForSearch;
+ (id)configurationForShare;
+ (id)configurationForStyle;
+ (id)configurationForUserAnalytics;
+ (id)identifier;
+ (id)storeConfigurationForDelete;
+ (id)storeConfigurationForEdit;
+ (id)storeConfigurationForEngagement;
+ (id)storeConfigurationForFavorite;
+ (id)storeConfigurationForLive;
+ (id)storeConfigurationForMap;
+ (id)storeConfigurationForMemoryCreation;
+ (id)storeConfigurationForPicker;
+ (id)storeConfigurationForSearch;
+ (id)storeConfigurationForShare;
+ (id)storeConfigurationForStyle;
+ (id)storeConfigurationForUserAnalytics;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDelete;
+ (id)syncPolicyForEdit;
+ (id)syncPolicyForEngagement;
+ (id)syncPolicyForFavorite;
+ (id)syncPolicyForLive;
+ (id)syncPolicyForMap;
+ (id)syncPolicyForMemoryCreation;
+ (id)syncPolicyForPicker;
+ (id)syncPolicyForSearch;
+ (id)syncPolicyForShare;
+ (id)syncPolicyForStyle;
+ (id)syncPolicyForUserAnalytics;
+ (id)validKeyPaths;
@end

@implementation _BMPhotosLibraryNode

+ (id)identifier
{
  return @"Photos";
}

+ (id)streamNames
{
  return &unk_1F0BF6FF0;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Delete"])
  {
    uint64_t v5 = [a1 Delete];
LABEL_25:
    v6 = (void *)v5;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"Edit"])
  {
    uint64_t v5 = [a1 Edit];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Engagement"])
  {
    uint64_t v5 = [a1 Engagement];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Favorite"])
  {
    uint64_t v5 = [a1 Favorite];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Live"])
  {
    uint64_t v5 = [a1 Live];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Map"])
  {
    uint64_t v5 = [a1 Map];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"MemoryCreation"])
  {
    uint64_t v5 = [a1 MemoryCreation];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Picker"])
  {
    uint64_t v5 = [a1 Picker];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Search"])
  {
    uint64_t v5 = [a1 Search];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Share"])
  {
    uint64_t v5 = [a1 Share];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Style"])
  {
    uint64_t v5 = [a1 Style];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"UserAnalytics"])
  {
    uint64_t v5 = [a1 UserAnalytics];
    goto LABEL_25;
  }
  v6 = 0;
LABEL_26:

  return v6;
}

+ (id)Edit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForEdit];
  v3 = +[BMPhotosEdit columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Edit" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Edit" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForEdit
{
  v3 = [a1 storeConfigurationForEdit];
  id v4 = [a1 syncPolicyForEdit];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BD80BD8C-F742-4DCC-BB64-E67135D0FF11"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Edit", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForEdit
{
  return 0;
}

+ (id)storeConfigurationForEdit
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Edit" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)syncPolicyForFavorite
{
  return 0;
}

+ (id)storeConfigurationForFavorite
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Favorite" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForFavorite
{
  v3 = [a1 storeConfigurationForFavorite];
  id v4 = [a1 syncPolicyForFavorite];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A23015CE-C8AB-4ED6-B29E-ED9A2B456535"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Favorite", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)MemoryCreation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForMemoryCreation];
  v3 = +[BMPhotosMemoryCreation columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.MemoryCreation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.MemoryCreation" schema:v9 configuration:v2];

  return v10;
}

+ (id)sublibraries
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 AutonamingSuggestions];
  v7[0] = v3;
  id v4 = [a1 Memories];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMPhotosDelete validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMPhotosEdit validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMPhotosEngagement validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMPhotosFavorite validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMPhotosLive validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMPhotosMap validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = +[BMPhotosMemoryCreation validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMPhotosPicker validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMPhotosSearch validKeyPaths];
  [v2 addObjectsFromArray:v11];

  v12 = +[BMPhotosShare validKeyPaths];
  [v2 addObjectsFromArray:v12];

  v13 = +[BMPhotosStyle validKeyPaths];
  [v2 addObjectsFromArray:v13];

  v14 = +[BMPhotosUserAnalytics validKeyPaths];
  [v2 addObjectsFromArray:v14];

  uint64_t v15 = (void *)[v2 copy];

  return v15;
}

+ (id)Memories
{
  return (id)objc_opt_class();
}

+ (id)AutonamingSuggestions
{
  return (id)objc_opt_class();
}

+ (id)configurationForUserAnalytics
{
  v3 = [a1 storeConfigurationForUserAnalytics];
  id v4 = [a1 syncPolicyForUserAnalytics];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B8C80FCE-33C9-47B6-9F6D-1DE933FA6A8A"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.UserAnalytics", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForUserAnalytics
{
  return 0;
}

+ (id)storeConfigurationForUserAnalytics
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.UserAnalytics" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForStyle
{
  v3 = [a1 storeConfigurationForStyle];
  id v4 = [a1 syncPolicyForStyle];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8F7776C5-9222-44DA-9B24-D3C1045FF427"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Style", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForStyle
{
  return 0;
}

+ (id)storeConfigurationForStyle
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31536000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Style" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForShare
{
  v3 = [a1 storeConfigurationForShare];
  id v4 = [a1 syncPolicyForShare];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0E2362E0-A646-4D08-ADBF-B53EE7840CF3"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Share", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForShare
{
  return 0;
}

+ (id)storeConfigurationForShare
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:2500 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Share" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSearch
{
  v3 = [a1 storeConfigurationForSearch];
  id v4 = [a1 syncPolicyForSearch];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"50A448E4-A6FF-47CC-97A4-15293AF061DB"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Search", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForSearch
{
  return 0;
}

+ (id)storeConfigurationForSearch
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Search" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPicker
{
  v3 = [a1 storeConfigurationForPicker];
  id v4 = [a1 syncPolicyForPicker];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"126CA7D9-8D9C-4BC4-BD06-9D3260444F5F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Picker", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForPicker
{
  return 0;
}

+ (id)storeConfigurationForPicker
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Picker" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMemoryCreation
{
  v3 = [a1 storeConfigurationForMemoryCreation];
  id v4 = [a1 syncPolicyForMemoryCreation];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E1C064C8-0BB3-4ABC-9AF1-05FEAF4D4542"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.MemoryCreation", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForMemoryCreation
{
  return 0;
}

+ (id)storeConfigurationForMemoryCreation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:15724800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.MemoryCreation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMap
{
  v3 = [a1 storeConfigurationForMap];
  id v4 = [a1 syncPolicyForMap];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B2CEDB75-B08A-4076-95A4-A909F37AE339"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Map", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForMap
{
  return 0;
}

+ (id)storeConfigurationForMap
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Map" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForLive
{
  v3 = [a1 storeConfigurationForLive];
  id v4 = [a1 syncPolicyForLive];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F5195AD3-9D99-43B8-ACF6-A5D8792F8E95"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Live", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForLive
{
  return 0;
}

+ (id)storeConfigurationForLive
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Live" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForEngagement
{
  v3 = [a1 storeConfigurationForEngagement];
  id v4 = [a1 syncPolicyForEngagement];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"44D22D46-24D2-49DB-96BD-C5477736FDD4"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Engagement", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForEngagement
{
  return 0;
}

+ (id)storeConfigurationForEngagement
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1500 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Engagement" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDelete
{
  v3 = [a1 storeConfigurationForDelete];
  id v4 = [a1 syncPolicyForDelete];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1E716AF0-7A34-4C15-8E80-C43B3AF4DE74"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Photos.Delete", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobileslideshow");

  return v7;
}

+ (id)syncPolicyForDelete
{
  return 0;
}

+ (id)storeConfigurationForDelete
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:31449600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Photos.Delete" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)UserAnalytics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForUserAnalytics];
  v3 = +[BMPhotosUserAnalytics columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.UserAnalytics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.UserAnalytics" schema:v9 configuration:v2];

  return v10;
}

+ (id)Style
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForStyle];
  v3 = +[BMPhotosStyle columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Style" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Style" schema:v9 configuration:v2];

  return v10;
}

+ (id)Share
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForShare];
  v3 = +[BMPhotosShare columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Share" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Share" schema:v9 configuration:v2];

  return v10;
}

+ (id)Search
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSearch];
  v3 = +[BMPhotosSearch columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Search" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Search" schema:v9 configuration:v2];

  return v10;
}

+ (id)Picker
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPicker];
  v3 = +[BMPhotosPicker columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Picker" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Picker" schema:v9 configuration:v2];

  return v10;
}

+ (id)Map
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMap];
  v3 = +[BMPhotosMap columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Map" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Map" schema:v9 configuration:v2];

  return v10;
}

+ (id)Live
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLive];
  v3 = +[BMPhotosLive columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Live" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Live" schema:v9 configuration:v2];

  return v10;
}

+ (id)Favorite
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForFavorite];
  v3 = +[BMPhotosFavorite columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Favorite" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Favorite" schema:v9 configuration:v2];

  return v10;
}

+ (id)Engagement
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForEngagement];
  v3 = +[BMPhotosEngagement columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Engagement" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Engagement" schema:v9 configuration:v2];

  return v10;
}

+ (id)Delete
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDelete];
  v3 = +[BMPhotosDelete columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Photos.Delete" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Photos.Delete" schema:v9 configuration:v2];

  return v10;
}

@end