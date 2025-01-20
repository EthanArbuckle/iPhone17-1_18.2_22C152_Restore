@interface _BMSiriMetricsLibraryNode
+ (id)OnDeviceDigestExperimentMetrics;
+ (id)OnDeviceDigestSegmentsCohorts;
+ (id)OnDeviceDigestUsageMetrics;
+ (id)configurationForOnDeviceDigestExperimentMetrics;
+ (id)configurationForOnDeviceDigestSegmentsCohorts;
+ (id)configurationForOnDeviceDigestUsageMetrics;
+ (id)identifier;
+ (id)storeConfigurationForOnDeviceDigestExperimentMetrics;
+ (id)storeConfigurationForOnDeviceDigestSegmentsCohorts;
+ (id)storeConfigurationForOnDeviceDigestUsageMetrics;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForOnDeviceDigestExperimentMetrics;
+ (id)syncPolicyForOnDeviceDigestSegmentsCohorts;
+ (id)syncPolicyForOnDeviceDigestUsageMetrics;
+ (id)validKeyPaths;
@end

@implementation _BMSiriMetricsLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF4DE8;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"OnDeviceDigestExperimentMetrics"])
  {
    uint64_t v5 = [a1 OnDeviceDigestExperimentMetrics];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"OnDeviceDigestSegmentsCohorts"])
  {
    uint64_t v5 = [a1 OnDeviceDigestSegmentsCohorts];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"OnDeviceDigestUsageMetrics"])
  {
    uint64_t v5 = [a1 OnDeviceDigestUsageMetrics];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)OnDeviceDigestUsageMetrics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForOnDeviceDigestUsageMetrics];
  v3 = +[BMSiriOnDeviceDigestUsageMetrics columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Metrics.OnDeviceDigestUsageMetrics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Metrics.OnDeviceDigestUsageMetrics" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForOnDeviceDigestUsageMetrics
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForOnDeviceDigestUsageMetrics];
  id v4 = [a1 syncPolicyForOnDeviceDigestUsageMetrics];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"delete-siri-dictation-history" predicate:v6];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  v9 = (void *)MEMORY[0x1E4F504B0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3620FF69-C102-4450-A9D2-9747F208ED9C"];
  BYTE2(v13) = 1;
  LOWORD(v13) = 1;
  v11 = objc_msgSend(v9, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v10, @"Siri.Metrics.OnDeviceDigestUsageMetrics", objc_opt_class(), v3, v4, 0, 0, v13, 0, v8, 0);

  return v11;
}

+ (id)syncPolicyForOnDeviceDigestUsageMetrics
{
  return 0;
}

+ (id)storeConfigurationForOnDeviceDigestUsageMetrics
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Metrics.OnDeviceDigestUsageMetrics" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)OnDeviceDigestExperimentMetrics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForOnDeviceDigestExperimentMetrics];
  v3 = +[BMSiriOnDeviceDigestExperimentMetrics columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Metrics.OnDeviceDigestExperimentMetrics" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Metrics.OnDeviceDigestExperimentMetrics" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForOnDeviceDigestExperimentMetrics
{
  v3 = [a1 storeConfigurationForOnDeviceDigestExperimentMetrics];
  id v4 = [a1 syncPolicyForOnDeviceDigestExperimentMetrics];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"16B948EB-DD3D-48D7-8263-3F193B73FBC3"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.Metrics.OnDeviceDigestExperimentMetrics", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForOnDeviceDigestExperimentMetrics
{
  return 0;
}

+ (id)storeConfigurationForOnDeviceDigestExperimentMetrics
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Metrics.OnDeviceDigestExperimentMetrics" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)OnDeviceDigestSegmentsCohorts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForOnDeviceDigestSegmentsCohorts];
  v3 = +[BMSiriOnDeviceDigestSegmentsCohorts columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.Metrics.OnDeviceDigestSegmentsCohorts" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.Metrics.OnDeviceDigestSegmentsCohorts" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForOnDeviceDigestSegmentsCohorts
{
  v3 = [a1 storeConfigurationForOnDeviceDigestSegmentsCohorts];
  id v4 = [a1 syncPolicyForOnDeviceDigestSegmentsCohorts];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E34F02A4-CDB9-4031-8B01-1A96FCFBEBDD"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.Metrics.OnDeviceDigestSegmentsCohorts", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForOnDeviceDigestSegmentsCohorts
{
  return 0;
}

+ (id)storeConfigurationForOnDeviceDigestSegmentsCohorts
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.Metrics.OnDeviceDigestSegmentsCohorts" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriOnDeviceDigestExperimentMetrics validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSiriOnDeviceDigestSegmentsCohorts validKeyPaths];
  [v2 addObjectsFromArray:v4];

  id v5 = +[BMSiriOnDeviceDigestUsageMetrics validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)identifier
{
  return @"Metrics";
}

@end