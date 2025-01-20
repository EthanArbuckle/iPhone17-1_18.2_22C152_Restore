@interface _BMTrialExperimentLibraryNode
+ (id)NamespaceUpdates;
+ (id)configurationForNamespaceUpdates;
+ (id)identifier;
+ (id)storeConfigurationForNamespaceUpdates;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForNamespaceUpdates;
+ (id)validKeyPaths;
@end

@implementation _BMTrialExperimentLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF75A8;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"NamespaceUpdates"])
  {
    v4 = [a1 NamespaceUpdates];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)NamespaceUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForNamespaceUpdates];
  v3 = +[BMTrialNamespaceUpdates columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Trial.Experiment.NamespaceUpdates" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Trial.Experiment.NamespaceUpdates" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForNamespaceUpdates
{
  v3 = [a1 storeConfigurationForNamespaceUpdates];
  v4 = [a1 syncPolicyForNamespaceUpdates];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DBD6E49F-36D5-4E40-9D33-10A5C6DB37F7"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Trial.Experiment.NamespaceUpdates", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.triald");

  return v7;
}

+ (id)syncPolicyForNamespaceUpdates
{
  return 0;
}

+ (id)storeConfigurationForNamespaceUpdates
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:63072000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Trial.Experiment.NamespaceUpdates" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMTrialNamespaceUpdates validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)identifier
{
  return @"Experiment";
}

@end