@interface _BMMessagesSharedWithYouLibraryNode
+ (id)Feedback;
+ (id)configurationForFeedback;
+ (id)identifier;
+ (id)storeConfigurationForFeedback;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForFeedback;
+ (id)validKeyPaths;
@end

@implementation _BMMessagesSharedWithYouLibraryNode

+ (id)streamNames
{
  return &unk_1F0BF6618;
}

+ (id)identifier
{
  return @"SharedWithYou";
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Feedback"])
  {
    v4 = [a1 Feedback];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)Feedback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForFeedback];
  v3 = +[BMMessagesSharedWithYouFeedback columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Messages.SharedWithYou.Feedback" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Messages.SharedWithYou.Feedback" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForFeedback
{
  v3 = [a1 storeConfigurationForFeedback];
  v4 = [a1 syncPolicyForFeedback];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"851C3B0D-34A4-4E50-BF8F-209CBCAF12E4"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Messages.SharedWithYou.Feedback", objc_opt_class(), v3, v4, &unk_1F0BF6600, 0, v9, 0, 0, @"com.apple.MobileSMS");

  return v7;
}

+ (id)syncPolicyForFeedback
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v21[0] = v16;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v20 = v15;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:2];
  v19 = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v17[0] = v6;
  v18[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v17[1] = v7;
  v18[1] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v17[2] = v8;
  v18[2] = v3;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v17[3] = v9;
  v18[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v17[4] = v10;
  v18[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"851C3B0D-34A4-4E50-BF8F-209CBCAF12E4"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:@"restricted/feedbackSocialHighlights" eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForFeedback
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:7340032 maxStreamSize:10000 maxEventCount:2592000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Messages.SharedWithYou.Feedback" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMessagesSharedWithYouFeedback validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

@end