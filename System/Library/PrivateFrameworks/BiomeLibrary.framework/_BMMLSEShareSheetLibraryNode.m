@interface _BMMLSEShareSheetLibraryNode
+ (id)DurableFeatureStore;
+ (id)Feedback;
+ (id)Inference;
+ (id)LabeledDataStore;
+ (id)Metrics;
+ (id)PeopleSuggestionsMetricsStore;
+ (id)VirtualFeatureStore;
+ (id)configurationForDurableFeatureStore;
+ (id)configurationForFeedback;
+ (id)configurationForLabeledDataStore;
+ (id)configurationForPeopleSuggestionsMetricsStore;
+ (id)configurationForVirtualFeatureStore;
+ (id)identifier;
+ (id)storeConfigurationForDurableFeatureStore;
+ (id)storeConfigurationForFeedback;
+ (id)storeConfigurationForLabeledDataStore;
+ (id)storeConfigurationForPeopleSuggestionsMetricsStore;
+ (id)storeConfigurationForVirtualFeatureStore;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDurableFeatureStore;
+ (id)syncPolicyForFeedback;
+ (id)syncPolicyForLabeledDataStore;
+ (id)syncPolicyForPeopleSuggestionsMetricsStore;
+ (id)syncPolicyForVirtualFeatureStore;
+ (id)validKeyPaths;
@end

@implementation _BMMLSEShareSheetLibraryNode

+ (id)sublibraries
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Inference];
  v7[0] = v3;
  v4 = [a1 Metrics];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"DurableFeatureStore"])
  {
    uint64_t v5 = [a1 DurableFeatureStore];
LABEL_11:
    v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Feedback"])
  {
    uint64_t v5 = [a1 Feedback];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"LabeledDataStore"])
  {
    uint64_t v5 = [a1 LabeledDataStore];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PeopleSuggestionsMetricsStore"])
  {
    uint64_t v5 = [a1 PeopleSuggestionsMetricsStore];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"VirtualFeatureStore"])
  {
    uint64_t v5 = [a1 VirtualFeatureStore];
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMLSEDurableFeatureStore validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMLSEShareSheetFeedback validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMMLSELabeledDataStore validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMMLSEPeopleSuggestionsMetricsStore validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMMLSEVirtualFeatureStore validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[v2 copy];

  return v8;
}

+ (id)streamNames
{
  return &unk_1F0BF72A8;
}

+ (id)identifier
{
  return @"ShareSheet";
}

+ (id)Metrics
{
  return (id)objc_opt_class();
}

+ (id)Inference
{
  return (id)objc_opt_class();
}

+ (id)configurationForVirtualFeatureStore
{
  v3 = [a1 storeConfigurationForVirtualFeatureStore];
  id v4 = [a1 syncPolicyForVirtualFeatureStore];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9FCB9545-A0B1-411E-9A64-19461E3008DE"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.VirtualFeatureStore", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForVirtualFeatureStore
{
  return 0;
}

+ (id)storeConfigurationForVirtualFeatureStore
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.VirtualFeatureStore" domain:0 segmentSize:0x200000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPeopleSuggestionsMetricsStore
{
  v3 = [a1 storeConfigurationForPeopleSuggestionsMetricsStore];
  id v4 = [a1 syncPolicyForPeopleSuggestionsMetricsStore];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DEEC2B98-B758-4A6F-99E4-EA6E3ACEB4AD"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.PeopleSuggestionsMetricsStore", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPeopleSuggestionsMetricsStore
{
  return 0;
}

+ (id)storeConfigurationForPeopleSuggestionsMetricsStore
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.PeopleSuggestionsMetricsStore" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForLabeledDataStore
{
  v3 = [a1 storeConfigurationForLabeledDataStore];
  id v4 = [a1 syncPolicyForLabeledDataStore];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"430149E5-857B-45D3-AE56-E0BC709329CE"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.LabeledDataStore", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForLabeledDataStore
{
  return 0;
}

+ (id)storeConfigurationForLabeledDataStore
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.LabeledDataStore" domain:0 segmentSize:0x200000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForFeedback
{
  v3 = [a1 storeConfigurationForFeedback];
  id v4 = [a1 syncPolicyForFeedback];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E7B0B540-24DC-4A28-B82A-C4885124C6C7"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.Feedback", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForFeedback
{
  return 0;
}

+ (id)storeConfigurationForFeedback
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.Feedback" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDurableFeatureStore
{
  v3 = [a1 storeConfigurationForDurableFeatureStore];
  id v4 = [a1 syncPolicyForDurableFeatureStore];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1A32CA36-C398-4658-BCE5-6DB72241A708"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.DurableFeatureStore", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDurableFeatureStore
{
  return 0;
}

+ (id)storeConfigurationForDurableFeatureStore
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.DurableFeatureStore" domain:0 segmentSize:0x200000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)VirtualFeatureStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForVirtualFeatureStore];
  v3 = +[BMMLSEVirtualFeatureStore columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.VirtualFeatureStore" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.VirtualFeatureStore" schema:v9 configuration:v2];

  return v10;
}

+ (id)PeopleSuggestionsMetricsStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPeopleSuggestionsMetricsStore];
  v3 = +[BMMLSEPeopleSuggestionsMetricsStore columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.PeopleSuggestionsMetricsStore" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.PeopleSuggestionsMetricsStore" schema:v9 configuration:v2];

  return v10;
}

+ (id)LabeledDataStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLabeledDataStore];
  v3 = +[BMMLSELabeledDataStore columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.LabeledDataStore" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.LabeledDataStore" schema:v9 configuration:v2];

  return v10;
}

+ (id)Feedback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForFeedback];
  v3 = +[BMMLSEShareSheetFeedback columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.Feedback" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.Feedback" schema:v9 configuration:v2];

  return v10;
}

+ (id)DurableFeatureStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDurableFeatureStore];
  v3 = +[BMMLSEDurableFeatureStore columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.DurableFeatureStore" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.DurableFeatureStore" schema:v9 configuration:v2];

  return v10;
}

@end