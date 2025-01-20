@interface _BMSiriAudioLibraryNode
+ (id)CompanionContext;
+ (id)configurationForCompanionContext;
+ (id)identifier;
+ (id)storeConfigurationForCompanionContext;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForCompanionContext;
+ (id)validKeyPaths;
@end

@implementation _BMSiriAudioLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"CompanionContext"])
  {
    v4 = [a1 CompanionContext];
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
  v3 = +[BMSiriCompanionContext validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5430;
}

+ (id)identifier
{
  return @"Audio";
}

+ (id)configurationForCompanionContext
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForCompanionContext];
  v4 = [a1 syncPolicyForCompanionContext];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"disable-siri" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"35D8B8AF-E1A6-4DB0-ABDC-ECAF5CFF4503"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.Audio.CompanionContext", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForCompanionContext
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:2];
  v16[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v15 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v13[0] = v6;
  v14[0] = v3;
  v7 = BMDevicePlatformAsKeyString();
  v13[1] = v7;
  v14[1] = v5;
  id v8 = BMDevicePlatformAsKeyString();
  v13[2] = v8;
  v14[2] = v5;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"35D8B8AF-E1A6-4DB0-ABDC-ECAF5CFF4503"];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v9 syncUUID:v10 legacySyncID:0 eventClass:objc_opt_class()];

  return v11;
}

+ (id)storeConfigurationForCompanionContext
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Audio.CompanionContext" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)CompanionContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForCompanionContext];
  v3 = +[BMSiriCompanionContext columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Audio.CompanionContext" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Audio.CompanionContext" schema:v9 configuration:v2];

  return v10;
}

@end