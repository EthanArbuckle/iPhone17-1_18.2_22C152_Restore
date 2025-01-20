@interface _BMSiriPrivateLearningLibraryNode
+ (id)SELFEvent;
+ (id)configurationForSELFEvent;
+ (id)identifier;
+ (id)storeConfigurationForSELFEvent;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSELFEvent;
+ (id)validKeyPaths;
@end

@implementation _BMSiriPrivateLearningLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF3690;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"SELFEvent"])
  {
    v4 = [a1 SELFEvent];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)SELFEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForSELFEvent];
  v3 = +[BMSiriSELFEvent columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.PrivateLearning.SELFEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.PrivateLearning.SELFEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForSELFEvent
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForSELFEvent];
  v4 = [a1 syncPolicyForSELFEvent];
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
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EC84DEDB-093C-41D1-AA89-8C7D500AEDD2"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.PrivateLearning.SELFEvent", objc_opt_class(), v3, v4, &unk_1F0BF3678, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForSELFEvent
{
  return 0;
}

+ (id)storeConfigurationForSELFEvent
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:6291456 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.PrivateLearning.SELFEvent" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriSELFEvent validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)identifier
{
  return @"PrivateLearning";
}

@end