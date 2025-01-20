@interface _BMIntelligencePlatformEntityTaggingLibraryNode
+ (id)PersonInference;
+ (id)configurationForPersonInference;
+ (id)identifier;
+ (id)storeConfigurationForPersonInference;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPersonInference;
+ (id)validKeyPaths;
@end

@implementation _BMIntelligencePlatformEntityTaggingLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"PersonInference"])
  {
    v4 = [a1 PersonInference];
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
  v3 = +[BMIntelligencePlatformEntityTaggingPersonInference validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5868;
}

+ (id)identifier
{
  return @"EntityTagging";
}

+ (id)configurationForPersonInference
{
  v3 = [a1 storeConfigurationForPersonInference];
  v4 = [a1 syncPolicyForPersonInference];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0727A6B0-4C16-4D5E-8DBB-7B124550E7B8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"IntelligencePlatform.EntityTagging.PersonInference", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForPersonInference
{
  return 0;
}

+ (id)storeConfigurationForPersonInference
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"IntelligencePlatform.EntityTagging.PersonInference" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)PersonInference
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPersonInference];
  v3 = +[BMIntelligencePlatformEntityTaggingPersonInference columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"IntelligencePlatform.EntityTagging.PersonInference" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"IntelligencePlatform.EntityTagging.PersonInference" schema:v9 configuration:v2];

  return v10;
}

@end