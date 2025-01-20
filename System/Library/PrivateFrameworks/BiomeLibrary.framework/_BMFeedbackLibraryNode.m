@interface _BMFeedbackLibraryNode
+ (id)EvaluationResponse;
+ (id)TextImageToImageEvaluationData;
+ (id)TextToImageEvaluationData;
+ (id)TextToTextEvaluationData;
+ (id)configurationForEvaluationResponse;
+ (id)configurationForTextImageToImageEvaluationData;
+ (id)configurationForTextToImageEvaluationData;
+ (id)configurationForTextToTextEvaluationData;
+ (id)identifier;
+ (id)storeConfigurationForEvaluationResponse;
+ (id)storeConfigurationForTextImageToImageEvaluationData;
+ (id)storeConfigurationForTextToImageEvaluationData;
+ (id)storeConfigurationForTextToTextEvaluationData;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForEvaluationResponse;
+ (id)syncPolicyForTextImageToImageEvaluationData;
+ (id)syncPolicyForTextToImageEvaluationData;
+ (id)syncPolicyForTextToTextEvaluationData;
+ (id)validKeyPaths;
@end

@implementation _BMFeedbackLibraryNode

+ (id)identifier
{
  return @"Feedback";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"EvaluationResponse"])
  {
    uint64_t v5 = [a1 EvaluationResponse];
LABEL_9:
    v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"TextImageToImageEvaluationData"])
  {
    uint64_t v5 = [a1 TextImageToImageEvaluationData];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"TextToImageEvaluationData"])
  {
    uint64_t v5 = [a1 TextToImageEvaluationData];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"TextToTextEvaluationData"])
  {
    uint64_t v5 = [a1 TextToTextEvaluationData];
    goto LABEL_9;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMFeedbackEvaluationResponse validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMFeedbackTextImageToImageEvaluationData validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMFeedbackTextToImageEvaluationData validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMFeedbackTextToTextEvaluationData validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = (void *)[v2 copy];

  return v7;
}

+ (id)streamNames
{
  return &unk_1F0BF6FD8;
}

+ (id)configurationForTextToTextEvaluationData
{
  v3 = [a1 storeConfigurationForTextToTextEvaluationData];
  id v4 = [a1 syncPolicyForTextToTextEvaluationData];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3E98CDE2-2C6B-4F4A-99AA-99D433B3191C"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Feedback.TextToTextEvaluationData", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTextToTextEvaluationData
{
  return 0;
}

+ (id)storeConfigurationForTextToTextEvaluationData
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Feedback.TextToTextEvaluationData" domain:0 segmentSize:0x100000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTextToImageEvaluationData
{
  v3 = [a1 storeConfigurationForTextToImageEvaluationData];
  id v4 = [a1 syncPolicyForTextToImageEvaluationData];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DBE2E2CE-C003-4116-BFCC-02DAC557A569"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Feedback.TextToImageEvaluationData", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTextToImageEvaluationData
{
  return 0;
}

+ (id)storeConfigurationForTextToImageEvaluationData
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Feedback.TextToImageEvaluationData" domain:0 segmentSize:0x100000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTextImageToImageEvaluationData
{
  v3 = [a1 storeConfigurationForTextImageToImageEvaluationData];
  id v4 = [a1 syncPolicyForTextImageToImageEvaluationData];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5E1FAC51-8912-4FE7-BA6E-7071A4241966"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Feedback.TextImageToImageEvaluationData", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTextImageToImageEvaluationData
{
  return 0;
}

+ (id)storeConfigurationForTextImageToImageEvaluationData
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Feedback.TextImageToImageEvaluationData" domain:0 segmentSize:0x100000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForEvaluationResponse
{
  v3 = [a1 storeConfigurationForEvaluationResponse];
  id v4 = [a1 syncPolicyForEvaluationResponse];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B88AA895-D8F1-4CB8-983E-4CD272F3D93E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Feedback.EvaluationResponse", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForEvaluationResponse
{
  return 0;
}

+ (id)storeConfigurationForEvaluationResponse
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Feedback.EvaluationResponse" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)TextToTextEvaluationData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTextToTextEvaluationData];
  v3 = +[BMFeedbackTextToTextEvaluationData columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Feedback.TextToTextEvaluationData" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Feedback.TextToTextEvaluationData" schema:v9 configuration:v2];

  return v10;
}

+ (id)TextToImageEvaluationData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTextToImageEvaluationData];
  v3 = +[BMFeedbackTextToImageEvaluationData columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Feedback.TextToImageEvaluationData" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Feedback.TextToImageEvaluationData" schema:v9 configuration:v2];

  return v10;
}

+ (id)TextImageToImageEvaluationData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTextImageToImageEvaluationData];
  v3 = +[BMFeedbackTextImageToImageEvaluationData columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Feedback.TextImageToImageEvaluationData" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Feedback.TextImageToImageEvaluationData" schema:v9 configuration:v2];

  return v10;
}

+ (id)EvaluationResponse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForEvaluationResponse];
  v3 = +[BMFeedbackEvaluationResponse columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Feedback.EvaluationResponse" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Feedback.EvaluationResponse" schema:v9 configuration:v2];

  return v10;
}

@end