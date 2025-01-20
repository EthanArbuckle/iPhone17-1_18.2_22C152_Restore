@interface _BMMLSEShareSheetInferenceLibraryNode
+ (id)AppSuggestions;
+ (id)PeopleSuggestions;
+ (id)configurationForAppSuggestions;
+ (id)configurationForPeopleSuggestions;
+ (id)identifier;
+ (id)storeConfigurationForAppSuggestions;
+ (id)storeConfigurationForPeopleSuggestions;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAppSuggestions;
+ (id)syncPolicyForPeopleSuggestions;
+ (id)validKeyPaths;
@end

@implementation _BMMLSEShareSheetInferenceLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AppSuggestions"])
  {
    uint64_t v5 = [a1 AppSuggestions];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"PeopleSuggestions"])
  {
    uint64_t v5 = [a1 PeopleSuggestions];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMMLSEShareSheetInferenceAppSuggestions validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMMLSEShareSheetInferencePeopleSuggestions validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF37B0;
}

+ (id)identifier
{
  return @"Inference";
}

+ (id)configurationForPeopleSuggestions
{
  v3 = [a1 storeConfigurationForPeopleSuggestions];
  id v4 = [a1 syncPolicyForPeopleSuggestions];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"77F2C2B4-16EE-4209-AEC3-E5AC291106AE"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.Inference.PeopleSuggestions", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPeopleSuggestions
{
  return 0;
}

+ (id)storeConfigurationForPeopleSuggestions
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.Inference.PeopleSuggestions" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAppSuggestions
{
  v3 = [a1 storeConfigurationForAppSuggestions];
  id v4 = [a1 syncPolicyForAppSuggestions];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EE433BE4-CA8F-4797-A820-C381AF699C7C"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"MLSE.ShareSheet.Inference.AppSuggestions", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAppSuggestions
{
  return 0;
}

+ (id)storeConfigurationForAppSuggestions
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"MLSE.ShareSheet.Inference.AppSuggestions" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PeopleSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPeopleSuggestions];
  v3 = +[BMMLSEShareSheetInferencePeopleSuggestions columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.Inference.PeopleSuggestions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.Inference.PeopleSuggestions" schema:v9 configuration:v2];

  return v10;
}

+ (id)AppSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAppSuggestions];
  v3 = +[BMMLSEShareSheetInferenceAppSuggestions columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"MLSE.ShareSheet.Inference.AppSuggestions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"MLSE.ShareSheet.Inference.AppSuggestions" schema:v9 configuration:v2];

  return v10;
}

@end