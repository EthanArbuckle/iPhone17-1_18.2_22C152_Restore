@interface _BMSiriLibraryNode
+ (id)ASR;
+ (id)AnalyticsIdentifiers;
+ (id)AppSelection;
+ (id)AssistantSuggestionFeatures;
+ (id)Audio;
+ (id)ContextRefreshTriggers;
+ (id)Dictation;
+ (id)Execution;
+ (id)FeedbackLearning;
+ (id)Health;
+ (id)InferredHelpfulness;
+ (id)Metrics;
+ (id)OnDeviceAnalytics;
+ (id)Orchestration;
+ (id)PostSiriEngagement;
+ (id)PrivateLearning;
+ (id)RecognizedUser;
+ (id)Remembers;
+ (id)SELFProcessedEvent;
+ (id)SelfTriggerSuppression;
+ (id)Service;
+ (id)SiriRequestCounts;
+ (id)TaskAggregation;
+ (id)UI;
+ (id)UserEngagement;
+ (id)VoiceTriggerStatistics;
+ (id)configurationForAssistantSuggestionFeatures;
+ (id)configurationForContextRefreshTriggers;
+ (id)configurationForDictation;
+ (id)configurationForExecution;
+ (id)configurationForInferredHelpfulness;
+ (id)configurationForPostSiriEngagement;
+ (id)configurationForRecognizedUser;
+ (id)configurationForSELFProcessedEvent;
+ (id)configurationForSelfTriggerSuppression;
+ (id)configurationForService;
+ (id)configurationForSiriRequestCounts;
+ (id)configurationForTaskAggregation;
+ (id)configurationForUI;
+ (id)configurationForVoiceTriggerStatistics;
+ (id)identifier;
+ (id)storeConfigurationForAssistantSuggestionFeatures;
+ (id)storeConfigurationForContextRefreshTriggers;
+ (id)storeConfigurationForDictation;
+ (id)storeConfigurationForExecution;
+ (id)storeConfigurationForInferredHelpfulness;
+ (id)storeConfigurationForPostSiriEngagement;
+ (id)storeConfigurationForRecognizedUser;
+ (id)storeConfigurationForSELFProcessedEvent;
+ (id)storeConfigurationForSelfTriggerSuppression;
+ (id)storeConfigurationForService;
+ (id)storeConfigurationForSiriRequestCounts;
+ (id)storeConfigurationForTaskAggregation;
+ (id)storeConfigurationForUI;
+ (id)storeConfigurationForVoiceTriggerStatistics;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAssistantSuggestionFeatures;
+ (id)syncPolicyForContextRefreshTriggers;
+ (id)syncPolicyForDictation;
+ (id)syncPolicyForExecution;
+ (id)syncPolicyForInferredHelpfulness;
+ (id)syncPolicyForPostSiriEngagement;
+ (id)syncPolicyForRecognizedUser;
+ (id)syncPolicyForSELFProcessedEvent;
+ (id)syncPolicyForSelfTriggerSuppression;
+ (id)syncPolicyForService;
+ (id)syncPolicyForSiriRequestCounts;
+ (id)syncPolicyForTaskAggregation;
+ (id)syncPolicyForUI;
+ (id)syncPolicyForVoiceTriggerStatistics;
+ (id)validKeyPaths;
@end

@implementation _BMSiriLibraryNode

+ (id)identifier
{
  return @"Siri";
}

+ (id)sublibraries
{
  v17[12] = *MEMORY[0x1E4F143B8];
  v16 = [a1 AnalyticsIdentifiers];
  v17[0] = v16;
  v15 = [a1 AppSelection];
  v17[1] = v15;
  v14 = [a1 ASR];
  v17[2] = v14;
  v3 = [a1 Audio];
  v17[3] = v3;
  v4 = [a1 FeedbackLearning];
  v17[4] = v4;
  v5 = [a1 Health];
  v17[5] = v5;
  v6 = [a1 Metrics];
  v17[6] = v6;
  v7 = [a1 OnDeviceAnalytics];
  v17[7] = v7;
  v8 = [a1 Orchestration];
  v17[8] = v8;
  v9 = [a1 PrivateLearning];
  v17[9] = v9;
  v10 = [a1 Remembers];
  v17[10] = v10;
  v11 = [a1 UserEngagement];
  v17[11] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:12];

  return v12;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AssistantSuggestionFeatures"])
  {
    uint64_t v5 = [a1 AssistantSuggestionFeatures];
LABEL_29:
    v6 = (void *)v5;
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"ContextRefreshTriggers"])
  {
    uint64_t v5 = [a1 ContextRefreshTriggers];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"Dictation"])
  {
    uint64_t v5 = [a1 Dictation];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"Execution"])
  {
    uint64_t v5 = [a1 Execution];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"InferredHelpfulness"])
  {
    uint64_t v5 = [a1 InferredHelpfulness];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"PostSiriEngagement"])
  {
    uint64_t v5 = [a1 PostSiriEngagement];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"RecognizedUser"])
  {
    uint64_t v5 = [a1 RecognizedUser];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"SELFProcessedEvent"])
  {
    uint64_t v5 = [a1 SELFProcessedEvent];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"SelfTriggerSuppression"])
  {
    uint64_t v5 = [a1 SelfTriggerSuppression];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"Service"])
  {
    uint64_t v5 = [a1 Service];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"SiriRequestCounts"])
  {
    uint64_t v5 = [a1 SiriRequestCounts];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"TaskAggregation"])
  {
    uint64_t v5 = [a1 TaskAggregation];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"UI"])
  {
    uint64_t v5 = [a1 UI];
    goto LABEL_29;
  }
  if ([v4 isEqualToString:@"VoiceTriggerStatistics"])
  {
    uint64_t v5 = [a1 VoiceTriggerStatistics];
    goto LABEL_29;
  }
  v6 = 0;
LABEL_30:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriAssistantSuggestionFeatures validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSiriContextRefreshTriggers validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMSiriDictation validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMSiriExecution validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMSiriInferredHelpfulness validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMSiriPostSiriEngagement validKeyPaths];
  [v2 addObjectsFromArray:v8];

  v9 = +[BMSiriRecognizedUser validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMSiriSELFProcessedEvent validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMSiriSelfTriggerSuppression validKeyPaths];
  [v2 addObjectsFromArray:v11];

  v12 = +[BMSiriService validKeyPaths];
  [v2 addObjectsFromArray:v12];

  v13 = +[BMSiriRequestCounts validKeyPaths];
  [v2 addObjectsFromArray:v13];

  v14 = +[BMSiriTaskAggregation validKeyPaths];
  [v2 addObjectsFromArray:v14];

  v15 = +[BMSiriUI validKeyPaths];
  [v2 addObjectsFromArray:v15];

  v16 = +[BMSiriVoiceTriggerStatistics validKeyPaths];
  [v2 addObjectsFromArray:v16];

  v17 = (void *)[v2 copy];

  return v17;
}

+ (id)streamNames
{
  return &unk_1F0BF6C18;
}

+ (id)UserEngagement
{
  return (id)objc_opt_class();
}

+ (id)Remembers
{
  return (id)objc_opt_class();
}

+ (id)PrivateLearning
{
  return (id)objc_opt_class();
}

+ (id)Orchestration
{
  return (id)objc_opt_class();
}

+ (id)OnDeviceAnalytics
{
  return (id)objc_opt_class();
}

+ (id)Metrics
{
  return (id)objc_opt_class();
}

+ (id)Health
{
  return (id)objc_opt_class();
}

+ (id)FeedbackLearning
{
  return (id)objc_opt_class();
}

+ (id)Audio
{
  return (id)objc_opt_class();
}

+ (id)ASR
{
  return (id)objc_opt_class();
}

+ (id)AppSelection
{
  return (id)objc_opt_class();
}

+ (id)AnalyticsIdentifiers
{
  return (id)objc_opt_class();
}

+ (id)configurationForVoiceTriggerStatistics
{
  v3 = [a1 storeConfigurationForVoiceTriggerStatistics];
  id v4 = [a1 syncPolicyForVoiceTriggerStatistics];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BCAF9EC2-20CA-4DB7-BD8C-EB128E0DA225"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.VoiceTriggerStatistics", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForVoiceTriggerStatistics
{
  return 0;
}

+ (id)storeConfigurationForVoiceTriggerStatistics
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.VoiceTriggerStatistics" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForUI
{
  v3 = [a1 storeConfigurationForUI];
  id v4 = [a1 syncPolicyForUI];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"22FF3C9C-8F2C-4670-BE6A-775941F6BCA0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.UI", objc_opt_class(), v3, v4, &unk_1F0BF6C00, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUI
{
  return 0;
}

+ (id)storeConfigurationForUI
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.UI" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTaskAggregation
{
  v3 = [a1 storeConfigurationForTaskAggregation];
  id v4 = [a1 syncPolicyForTaskAggregation];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"65C175CB-EEA9-4A46-AB4A-F0F0AB78CEF8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.TaskAggregation", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTaskAggregation
{
  return 0;
}

+ (id)storeConfigurationForTaskAggregation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.TaskAggregation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSiriRequestCounts
{
  v3 = [a1 storeConfigurationForSiriRequestCounts];
  id v4 = [a1 syncPolicyForSiriRequestCounts];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0981E4C7-38C3-44B1-954E-E4AF45568430"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.SiriRequestCounts", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSiriRequestCounts
{
  return 0;
}

+ (id)storeConfigurationForSiriRequestCounts
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.SiriRequestCounts" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForService
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForService];
  id v4 = [a1 syncPolicyForService];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3053CE72-8134-48D4-BBE0-1012A1308BD6"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.Service", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForService
{
  return 0;
}

+ (id)storeConfigurationForService
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Service" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSelfTriggerSuppression
{
  v3 = [a1 storeConfigurationForSelfTriggerSuppression];
  id v4 = [a1 syncPolicyForSelfTriggerSuppression];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A3406BE3-483E-4D59-9376-7DEEB24319F6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.SelfTriggerSuppression", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSelfTriggerSuppression
{
  return 0;
}

+ (id)storeConfigurationForSelfTriggerSuppression
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.SelfTriggerSuppression" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSELFProcessedEvent
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForSELFProcessedEvent];
  id v4 = [a1 syncPolicyForSELFProcessedEvent];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"106573F0-1C67-4CEF-951C-0736F49E7B57"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.SELFProcessedEvent", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForSELFProcessedEvent
{
  return 0;
}

+ (id)storeConfigurationForSELFProcessedEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:604800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.SELFProcessedEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForRecognizedUser
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForRecognizedUser];
  id v4 = [a1 syncPolicyForRecognizedUser];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"66E40C34-C973-483F-92C5-162C854420A4"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.RecognizedUser", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForRecognizedUser
{
  return 0;
}

+ (id)storeConfigurationForRecognizedUser
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.RecognizedUser" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPostSiriEngagement
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForPostSiriEngagement];
  id v4 = [a1 syncPolicyForPostSiriEngagement];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D079ECAC-7B06-4830-84BD-54AB0D17E7DE"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.PostSiriEngagement", objc_opt_class(), v3, v4, &unk_1F0BF6BE8, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForPostSiriEngagement
{
  return 0;
}

+ (id)storeConfigurationForPostSiriEngagement
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.PostSiriEngagement" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForInferredHelpfulness
{
  v3 = [a1 storeConfigurationForInferredHelpfulness];
  id v4 = [a1 syncPolicyForInferredHelpfulness];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C066A011-66C6-4E74-96FE-869B3F2B6BEB"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.InferredHelpfulness", objc_opt_class(), v3, v4, &unk_1F0BF6BD0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForInferredHelpfulness
{
  return 0;
}

+ (id)storeConfigurationForInferredHelpfulness
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.InferredHelpfulness" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForExecution
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForExecution];
  id v4 = [a1 syncPolicyForExecution];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C4ABC4BA-BC8E-4517-AEFA-8BFF300DDD51"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.Execution", objc_opt_class(), v3, v4, &unk_1F0BF6BB8, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForExecution
{
  return 0;
}

+ (id)storeConfigurationForExecution
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Execution" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDictation
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForDictation];
  id v4 = [a1 syncPolicyForDictation];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B3376BEF-1D90-4AC9-85C3-24AFC1B42285"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.Dictation", objc_opt_class(), v3, v4, &unk_1F0BF6BA0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForDictation
{
  return 0;
}

+ (id)storeConfigurationForDictation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:14515200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Dictation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForContextRefreshTriggers
{
  v3 = [a1 storeConfigurationForContextRefreshTriggers];
  id v4 = [a1 syncPolicyForContextRefreshTriggers];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D2D1AB25-945A-41A6-BF86-59DEA046C830"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.ContextRefreshTriggers", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForContextRefreshTriggers
{
  return 0;
}

+ (id)storeConfigurationForContextRefreshTriggers
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.ContextRefreshTriggers" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAssistantSuggestionFeatures
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForAssistantSuggestionFeatures];
  id v4 = [a1 syncPolicyForAssistantSuggestionFeatures];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B66D84F7-4914-4208-A051-18DD239DACFC"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.AssistantSuggestionFeatures", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForAssistantSuggestionFeatures
{
  return 0;
}

+ (id)storeConfigurationForAssistantSuggestionFeatures
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:15811200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.AssistantSuggestionFeatures" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)VoiceTriggerStatistics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForVoiceTriggerStatistics];
  v3 = +[BMSiriVoiceTriggerStatistics columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.VoiceTriggerStatistics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.VoiceTriggerStatistics" schema:v9 configuration:v2];

  return v10;
}

+ (id)UI
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForUI];
  v3 = +[BMSiriUI columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.UI" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.UI" schema:v9 configuration:v2];

  return v10;
}

+ (id)TaskAggregation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTaskAggregation];
  v3 = +[BMSiriTaskAggregation columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.TaskAggregation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.TaskAggregation" schema:v9 configuration:v2];

  return v10;
}

+ (id)SiriRequestCounts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSiriRequestCounts];
  v3 = +[BMSiriRequestCounts columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.SiriRequestCounts" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.SiriRequestCounts" schema:v9 configuration:v2];

  return v10;
}

+ (id)Service
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForService];
  v3 = +[BMSiriService columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Service" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Service" schema:v9 configuration:v2];

  return v10;
}

+ (id)SelfTriggerSuppression
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSelfTriggerSuppression];
  v3 = +[BMSiriSelfTriggerSuppression columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.SelfTriggerSuppression" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.SelfTriggerSuppression" schema:v9 configuration:v2];

  return v10;
}

+ (id)SELFProcessedEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSELFProcessedEvent];
  v3 = +[BMSiriSELFProcessedEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.SELFProcessedEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.SELFProcessedEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)RecognizedUser
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRecognizedUser];
  v3 = +[BMSiriRecognizedUser columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.RecognizedUser" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.RecognizedUser" schema:v9 configuration:v2];

  return v10;
}

+ (id)PostSiriEngagement
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPostSiriEngagement];
  v3 = +[BMSiriPostSiriEngagement columns];
  id v4 = BMEventTimestampSQLColumn();
  uint64_t v15 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v16 = v5;
  v6 = BMEventClassNameSQLColumn();
  v17 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v15, v16);

  uint64_t v9 = BMEventBookmarkSQLColumns();
  v10 = [v8 arrayByAddingObjectsFromArray:v9];

  v11 = [v10 arrayByAddingObjectsFromArray:MEMORY[0x1E4F1CBF0]];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.PostSiriEngagement" columns:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.PostSiriEngagement" schema:v12 configuration:v2];

  return v13;
}

+ (id)InferredHelpfulness
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForInferredHelpfulness];
  v3 = +[BMSiriInferredHelpfulness columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.InferredHelpfulness" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.InferredHelpfulness" schema:v9 configuration:v2];

  return v10;
}

+ (id)Execution
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForExecution];
  v3 = +[BMSiriExecution columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Execution" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Execution" schema:v9 configuration:v2];

  return v10;
}

+ (id)Dictation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDictation];
  v3 = +[BMSiriDictation columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Dictation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Dictation" schema:v9 configuration:v2];

  return v10;
}

+ (id)ContextRefreshTriggers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForContextRefreshTriggers];
  v3 = +[BMSiriContextRefreshTriggers columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.ContextRefreshTriggers" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.ContextRefreshTriggers" schema:v9 configuration:v2];

  return v10;
}

+ (id)AssistantSuggestionFeatures
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAssistantSuggestionFeatures];
  v3 = +[BMSiriAssistantSuggestionFeatures columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.AssistantSuggestionFeatures" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.AssistantSuggestionFeatures" schema:v9 configuration:v2];

  return v10;
}

@end