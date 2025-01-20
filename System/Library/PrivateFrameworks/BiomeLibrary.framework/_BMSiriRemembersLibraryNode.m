@interface _BMSiriRemembersLibraryNode
+ (id)AssistantSuggestions;
+ (id)AudioHistory;
+ (id)CallHistory;
+ (id)HomeHistory;
+ (id)Intent;
+ (id)InteractionHistory;
+ (id)MessageHistory;
+ (id)configurationForAssistantSuggestions;
+ (id)configurationForAudioHistory;
+ (id)configurationForCallHistory;
+ (id)configurationForHomeHistory;
+ (id)configurationForIntent;
+ (id)configurationForInteractionHistory;
+ (id)configurationForMessageHistory;
+ (id)identifier;
+ (id)storeConfigurationForAssistantSuggestions;
+ (id)storeConfigurationForAudioHistory;
+ (id)storeConfigurationForCallHistory;
+ (id)storeConfigurationForHomeHistory;
+ (id)storeConfigurationForIntent;
+ (id)storeConfigurationForInteractionHistory;
+ (id)storeConfigurationForMessageHistory;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAssistantSuggestions;
+ (id)syncPolicyForAudioHistory;
+ (id)syncPolicyForCallHistory;
+ (id)syncPolicyForHomeHistory;
+ (id)syncPolicyForIntent;
+ (id)syncPolicyForInteractionHistory;
+ (id)syncPolicyForMessageHistory;
+ (id)validKeyPaths;
@end

@implementation _BMSiriRemembersLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF6F48;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AssistantSuggestions"])
  {
    uint64_t v5 = [a1 AssistantSuggestions];
LABEL_15:
    v6 = (void *)v5;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"AudioHistory"])
  {
    uint64_t v5 = [a1 AudioHistory];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"CallHistory"])
  {
    uint64_t v5 = [a1 CallHistory];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"HomeHistory"])
  {
    uint64_t v5 = [a1 HomeHistory];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"Intent"])
  {
    uint64_t v5 = [a1 Intent];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"InteractionHistory"])
  {
    uint64_t v5 = [a1 InteractionHistory];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"MessageHistory"])
  {
    uint64_t v5 = [a1 MessageHistory];
    goto LABEL_15;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

+ (id)InteractionHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForInteractionHistory];
  v3 = +[BMSiriInteractionHistory columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.InteractionHistory" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.InteractionHistory" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForInteractionHistory
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28 = [a1 storeConfigurationForInteractionHistory];
  v27 = [a1 syncPolicyForInteractionHistory];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == interaction.appBundleId" argumentArray:0];
  v25 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v26];
  v29[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT interaction.appBundleId IN $installed" argumentArray:0];
  uint64_t v5 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v24];
  v29[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v8 = (void *)[v6 initWithIdentifier:@"delete-siri-dictation-history" predicate:v7];
  v29[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"disable-siri" predicate:v10];
  v29[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId == $app AND (interaction.appIntentInteractionIdentifier IN $intentIdentifiers OR interaction.groupIdentifier IN $intentGroupIdentifiers)" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"intent-deletion" predicate:v13];
  v29[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F504A8]);
  v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId IN $disabledApps" argumentArray:0];
  v17 = (void *)[v15 initWithIdentifier:@"learn-from-this-app" predicate:v16];
  v29[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  v19 = (void *)MEMORY[0x1E4F504B0];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5270D95A-22C7-4BF1-95E8-DD85C54B8813"];
  BYTE2(v23) = 1;
  LOWORD(v23) = 1;
  v21 = objc_msgSend(v19, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v20, @"Siri.Remembers.InteractionHistory", objc_opt_class(), v28, v27, 0, 0, v23, 0, v18, @"com.apple.siriinferenced");

  return v21;
}

+ (id)syncPolicyForInteractionHistory
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v21[0] = v16;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v20 = v15;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v19 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v6 = BMDevicePlatformAsKeyString();
  v17[0] = v6;
  v18[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v17[1] = v7;
  v18[1] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v17[2] = v8;
  v18[2] = v3;
  id v9 = BMDevicePlatformAsKeyString();
  v17[3] = v9;
  v18[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v17[4] = v10;
  v18[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5270D95A-22C7-4BF1-95E8-DD85C54B8813"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:0 eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForInteractionHistory
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.InteractionHistory" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Intent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForIntent];
  id v3 = +[BMSiriIntent columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.Intent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.Intent" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForIntent
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 storeConfigurationForIntent];
  id v4 = [a1 syncPolicyForIntent];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  id v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E1411DC0-1A96-4FC2-9402-68BB4BC8E19D"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.Remembers.Intent", objc_opt_class(), v3, v4, &unk_1F0BF6F30, 0, v16, 0, v11, @"com.apple.siriinferenced", v17[0]);

  return v14;
}

+ (id)syncPolicyForIntent
{
  return 0;
}

+ (id)storeConfigurationForIntent
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.Intent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)HomeHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForHomeHistory];
  id v3 = +[BMSiriHomeHistory columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.HomeHistory" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.HomeHistory" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForHomeHistory
{
  id v3 = [a1 storeConfigurationForHomeHistory];
  id v4 = [a1 syncPolicyForHomeHistory];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2A547182-AF14-4DCE-BF23-C42E38DBEC9B"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.Remembers.HomeHistory", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.siriinferenced");

  return v7;
}

+ (id)syncPolicyForHomeHistory
{
  return 0;
}

+ (id)storeConfigurationForHomeHistory
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.HomeHistory" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AssistantSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForAssistantSuggestions];
  id v3 = +[BMSiriAssistantSuggestions columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.AssistantSuggestions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.AssistantSuggestions" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAssistantSuggestions
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22 = [a1 storeConfigurationForAssistantSuggestions];
  v21 = [a1 syncPolicyForAssistantSuggestions];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == interaction.appBundleId" argumentArray:0];
  id v5 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v4];
  v23[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT interaction.appBundleId IN $installed" argumentArray:0];
  id v8 = (void *)[v6 initWithIdentifier:@"app-uninstall-nightly" predicate:v7];
  v23[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"delete-siri-dictation-history" predicate:v10];
  v23[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"disable-siri" predicate:v13];
  v23[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  uint64_t v16 = (void *)MEMORY[0x1E4F504B0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CC2F1F2-28F6-4E22-9042-95AD00BBB2E2"];
  BYTE2(v20) = 1;
  LOWORD(v20) = 1;
  v18 = objc_msgSend(v16, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v17, @"Siri.Remembers.AssistantSuggestions", objc_opt_class(), v22, v21, 0, 0, v20, 0, v15, @"com.apple.siriinferenced");

  return v18;
}

+ (id)syncPolicyForAssistantSuggestions
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v26[0] = v20;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v25 = v19;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v24 = v18;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  uint64_t v23 = v17;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v6 = BMDevicePlatformAsKeyString();
  v21[0] = v6;
  uint64_t v16 = (void *)v2;
  v22[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v21[1] = v7;
  v22[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  void v21[2] = v8;
  v22[2] = v3;
  id v9 = BMDevicePlatformAsKeyString();
  v21[3] = v9;
  v22[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v21[4] = v10;
  v22[4] = v4;
  v11 = BMDevicePlatformAsKeyString();
  v21[5] = v11;
  v22[5] = v5;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CC2F1F2-28F6-4E22-9042-95AD00BBB2E2"];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v12 syncUUID:v13 legacySyncID:0 eventClass:objc_opt_class()];

  return v14;
}

+ (id)storeConfigurationForAssistantSuggestions
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.AssistantSuggestions" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMessageHistory
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28 = [a1 storeConfigurationForMessageHistory];
  v27 = [a1 syncPolicyForMessageHistory];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == interaction.appBundleId" argumentArray:0];
  v25 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v26];
  v29[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT interaction.appBundleId IN $installed" argumentArray:0];
  id v5 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v24];
  v29[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  id v8 = (void *)[v6 initWithIdentifier:@"delete-siri-dictation-history" predicate:v7];
  v29[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"disable-siri" predicate:v10];
  v29[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId == $app AND (interaction.appIntentInteractionIdentifier IN $intentIdentifiers OR interaction.groupIdentifier IN $intentGroupIdentifiers)" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"intent-deletion" predicate:v13];
  v29[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId IN $disabledApps" argumentArray:0];
  v17 = (void *)[v15 initWithIdentifier:@"learn-from-this-app" predicate:v16];
  v29[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  v19 = (void *)MEMORY[0x1E4F504B0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6F5F436A-25E2-4C0C-86E6-BB4A82C3502E"];
  BYTE2(v23) = 1;
  LOWORD(v23) = 1;
  v21 = objc_msgSend(v19, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v20, @"Siri.Remembers.MessageHistory", objc_opt_class(), v28, v27, 0, 0, v23, 0, v18, @"com.apple.siriinferenced");

  return v21;
}

+ (id)syncPolicyForMessageHistory
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v21[0] = v16;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  uint64_t v20 = v15;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v19 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v6 = BMDevicePlatformAsKeyString();
  v17[0] = v6;
  v18[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v17[1] = v7;
  v18[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  v17[2] = v8;
  v18[2] = v3;
  id v9 = BMDevicePlatformAsKeyString();
  void v17[3] = v9;
  v18[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v17[4] = v10;
  v18[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6F5F436A-25E2-4C0C-86E6-BB4A82C3502E"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:0 eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForMessageHistory
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.MessageHistory" domain:0 segmentSize:0x200000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)MessageHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForMessageHistory];
  id v3 = +[BMSiriMessageHistory columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.MessageHistory" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.MessageHistory" schema:v9 configuration:v2];

  return v10;
}

+ (id)CallHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForCallHistory];
  id v3 = +[BMSiriCallHistory columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.CallHistory" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.CallHistory" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForCallHistory
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28 = [a1 storeConfigurationForCallHistory];
  v27 = [a1 syncPolicyForCallHistory];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == interaction.appBundleId" argumentArray:0];
  v25 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v26];
  v29[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT interaction.appBundleId IN $installed" argumentArray:0];
  id v5 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v24];
  v29[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  id v8 = (void *)[v6 initWithIdentifier:@"delete-siri-dictation-history" predicate:v7];
  v29[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"disable-siri" predicate:v10];
  v29[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId == $app AND (interaction.appIntentInteractionIdentifier IN $intentIdentifiers OR interaction.groupIdentifier IN $intentGroupIdentifiers)" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"intent-deletion" predicate:v13];
  v29[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId IN $disabledApps" argumentArray:0];
  v17 = (void *)[v15 initWithIdentifier:@"learn-from-this-app" predicate:v16];
  v29[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  v19 = (void *)MEMORY[0x1E4F504B0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F31A4964-E2CE-4AE1-A0B9-7BF60EFCD204"];
  BYTE2(v23) = 1;
  LOWORD(v23) = 1;
  v21 = objc_msgSend(v19, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v20, @"Siri.Remembers.CallHistory", objc_opt_class(), v28, v27, 0, 0, v23, 0, v18, @"com.apple.siriinferenced");

  return v21;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = +[BMSiriAssistantSuggestions validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSiriAudioHistory validKeyPaths];
  [v2 addObjectsFromArray:v4];

  id v5 = +[BMSiriCallHistory validKeyPaths];
  [v2 addObjectsFromArray:v5];

  id v6 = +[BMSiriHomeHistory validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMSiriIntent validKeyPaths];
  [v2 addObjectsFromArray:v7];

  id v8 = +[BMSiriInteractionHistory validKeyPaths];
  [v2 addObjectsFromArray:v8];

  id v9 = +[BMSiriMessageHistory validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = (void *)[v2 copy];

  return v10;
}

+ (id)identifier
{
  return @"Remembers";
}

+ (id)syncPolicyForCallHistory
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v21[0] = v16;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  uint64_t v20 = v15;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v19 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v6 = BMDevicePlatformAsKeyString();
  v17[0] = v6;
  v18[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v17[1] = v7;
  v18[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  v17[2] = v8;
  v18[2] = v3;
  id v9 = BMDevicePlatformAsKeyString();
  void v17[3] = v9;
  v18[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v17[4] = v10;
  v18[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F31A4964-E2CE-4AE1-A0B9-7BF60EFCD204"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:0 eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForCallHistory
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:31536000.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.CallHistory" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAudioHistory
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28 = [a1 storeConfigurationForAudioHistory];
  v27 = [a1 syncPolicyForAudioHistory];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == interaction.appBundleId" argumentArray:0];
  v25 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v26];
  v29[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT interaction.appBundleId IN $installed" argumentArray:0];
  id v5 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v24];
  v29[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  id v8 = (void *)[v6 initWithIdentifier:@"delete-siri-dictation-history" predicate:v7];
  v29[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"disable-siri" predicate:v10];
  v29[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId == $app AND (interaction.appIntentInteractionIdentifier IN $intentIdentifiers OR interaction.groupIdentifier IN $intentGroupIdentifiers)" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"intent-deletion" predicate:v13];
  v29[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interaction.appBundleId IN $disabledApps" argumentArray:0];
  v17 = (void *)[v15 initWithIdentifier:@"learn-from-this-app" predicate:v16];
  v29[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  v19 = (void *)MEMORY[0x1E4F504B0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"80C15BA8-7E6F-4985-BC29-6335B88D590A"];
  BYTE2(v23) = 1;
  LOWORD(v23) = 1;
  v21 = objc_msgSend(v19, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v20, @"Siri.Remembers.AudioHistory", objc_opt_class(), v28, v27, 0, 0, v23, 0, v18, @"com.apple.siriinferenced");

  return v21;
}

+ (id)syncPolicyForAudioHistory
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v26[0] = v20;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v25 = v19;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v24 = v18;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  uint64_t v23 = v17;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v6 = BMDevicePlatformAsKeyString();
  v21[0] = v6;
  uint64_t v16 = (void *)v2;
  v22[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v21[1] = v7;
  v22[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  void v21[2] = v8;
  v22[2] = v3;
  id v9 = BMDevicePlatformAsKeyString();
  v21[3] = v9;
  v22[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v21[4] = v10;
  v22[4] = v4;
  v11 = BMDevicePlatformAsKeyString();
  v21[5] = v11;
  v22[5] = v5;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"80C15BA8-7E6F-4985-BC29-6335B88D590A"];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v12 syncUUID:v13 legacySyncID:0 eventClass:objc_opt_class()];

  return v14;
}

+ (id)storeConfigurationForAudioHistory
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:15552000.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Remembers.AudioHistory" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AudioHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForAudioHistory];
  id v3 = +[BMSiriAudioHistory columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Remembers.AudioHistory" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Remembers.AudioHistory" schema:v9 configuration:v2];

  return v10;
}

@end