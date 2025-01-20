@interface _BMSiriAnalyticsIdentifiersLibraryNode
+ (id)HomeSeed;
+ (id)UserAggregationId;
+ (id)UserSamplingId;
+ (id)UserSeed;
+ (id)configurationForHomeSeed;
+ (id)configurationForUserAggregationId;
+ (id)configurationForUserSamplingId;
+ (id)configurationForUserSeed;
+ (id)identifier;
+ (id)storeConfigurationForHomeSeed;
+ (id)storeConfigurationForUserAggregationId;
+ (id)storeConfigurationForUserSamplingId;
+ (id)storeConfigurationForUserSeed;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForHomeSeed;
+ (id)syncPolicyForUserAggregationId;
+ (id)syncPolicyForUserSamplingId;
+ (id)syncPolicyForUserSeed;
+ (id)validKeyPaths;
@end

@implementation _BMSiriAnalyticsIdentifiersLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HomeSeed"])
  {
    uint64_t v5 = [a1 HomeSeed];
LABEL_9:
    v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"UserAggregationId"])
  {
    uint64_t v5 = [a1 UserAggregationId];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"UserSamplingId"])
  {
    uint64_t v5 = [a1 UserSamplingId];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"UserSeed"])
  {
    uint64_t v5 = [a1 UserSeed];
    goto LABEL_9;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriHomeSeed validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSiriUserAggregationId validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMSiriUserSamplingId validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMSiriUserSeed validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = (void *)[v2 copy];

  return v7;
}

+ (id)streamNames
{
  return &unk_1F0BF7290;
}

+ (id)identifier
{
  return @"AnalyticsIdentifiers";
}

+ (id)configurationForUserSeed
{
  v3 = [a1 storeConfigurationForUserSeed];
  id v4 = [a1 syncPolicyForUserSeed];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C77E2ABD-DFCE-4DC4-9A62-D747818A3D9E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.AnalyticsIdentifiers.UserSeed", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUserSeed
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v35[0] = v28;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v34 = v27;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v33 = v26;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v32 = v25;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v31 = v23;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v29[0] = v6;
  uint64_t v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v29[1] = v8;
  v30[1] = v7;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v29[3] = v10;
  v30[3] = v3;
  v11 = BMDevicePlatformAsKeyString();
  v29[4] = v11;
  v30[4] = v21;
  v12 = BMDevicePlatformAsKeyString();
  v29[5] = v12;
  uint64_t v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  v14 = BMDevicePlatformAsKeyString();
  v29[6] = v14;
  v30[6] = v13;
  v15 = BMDevicePlatformAsKeyString();
  v29[7] = v15;
  v30[7] = v5;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C77E2ABD-DFCE-4DC4-9A62-D747818A3D9E"];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v16 syncUUID:v17 legacySyncID:0 eventClass:objc_opt_class()];

  return v18;
}

+ (id)storeConfigurationForUserSeed
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2505600.0];
  uint64_t v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.AnalyticsIdentifiers.UserSeed" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForUserSamplingId
{
  uint64_t v3 = [a1 storeConfigurationForUserSamplingId];
  uint64_t v4 = [a1 syncPolicyForUserSamplingId];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"23F3900D-BC06-406F-A65B-536BF3205823"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  uint64_t v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.AnalyticsIdentifiers.UserSamplingId", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUserSamplingId
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v35[0] = v28;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v34 = v27;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v33 = v26;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v32 = v25;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v31 = v23;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v29[0] = v6;
  uint64_t v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v29[1] = v8;
  v30[1] = v7;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v29[3] = v10;
  v30[3] = v3;
  v11 = BMDevicePlatformAsKeyString();
  v29[4] = v11;
  v30[4] = v21;
  v12 = BMDevicePlatformAsKeyString();
  v29[5] = v12;
  uint64_t v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  v14 = BMDevicePlatformAsKeyString();
  v29[6] = v14;
  v30[6] = v13;
  v15 = BMDevicePlatformAsKeyString();
  v29[7] = v15;
  v30[7] = v5;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"23F3900D-BC06-406F-A65B-536BF3205823"];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v16 syncUUID:v17 legacySyncID:0 eventClass:objc_opt_class()];

  return v18;
}

+ (id)storeConfigurationForUserSamplingId
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:17366400.0];
  uint64_t v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.AnalyticsIdentifiers.UserSamplingId" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForUserAggregationId
{
  uint64_t v3 = [a1 storeConfigurationForUserAggregationId];
  uint64_t v4 = [a1 syncPolicyForUserAggregationId];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9B3BB3E8-DB19-4624-AA4A-50097329A86C"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  uint64_t v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.AnalyticsIdentifiers.UserAggregationId", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForUserAggregationId
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v35[0] = v28;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v34 = v27;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v33 = v26;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v32 = v25;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v31 = v23;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v29[0] = v6;
  uint64_t v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v29[1] = v8;
  v30[1] = v7;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v29[3] = v10;
  v30[3] = v3;
  v11 = BMDevicePlatformAsKeyString();
  v29[4] = v11;
  v30[4] = v21;
  v12 = BMDevicePlatformAsKeyString();
  v29[5] = v12;
  uint64_t v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  v14 = BMDevicePlatformAsKeyString();
  v29[6] = v14;
  v30[6] = v13;
  v15 = BMDevicePlatformAsKeyString();
  v29[7] = v15;
  v30[7] = v5;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9B3BB3E8-DB19-4624-AA4A-50097329A86C"];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v16 syncUUID:v17 legacySyncID:0 eventClass:objc_opt_class()];

  return v18;
}

+ (id)storeConfigurationForUserAggregationId
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:48643200.0];
  uint64_t v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.AnalyticsIdentifiers.UserAggregationId" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForHomeSeed
{
  uint64_t v3 = [a1 storeConfigurationForHomeSeed];
  uint64_t v4 = [a1 syncPolicyForHomeSeed];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"35B696BC-2762-41E3-9498-C6CEE401ADB9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  uint64_t v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Siri.AnalyticsIdentifiers.HomeSeed", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForHomeSeed
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v35[0] = v28;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v34 = v27;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v33 = v26;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v32 = v25;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v31 = v23;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v29[0] = v6;
  uint64_t v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  v8 = BMDevicePlatformAsKeyString();
  v29[1] = v8;
  v30[1] = v7;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v29[3] = v10;
  v30[3] = v3;
  v11 = BMDevicePlatformAsKeyString();
  v29[4] = v11;
  v30[4] = v21;
  v12 = BMDevicePlatformAsKeyString();
  v29[5] = v12;
  uint64_t v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  v14 = BMDevicePlatformAsKeyString();
  v29[6] = v14;
  v30[6] = v13;
  v15 = BMDevicePlatformAsKeyString();
  v29[7] = v15;
  v30[7] = v5;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"35B696BC-2762-41E3-9498-C6CEE401ADB9"];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v16 syncUUID:v17 legacySyncID:0 eventClass:objc_opt_class()];

  return v18;
}

+ (id)storeConfigurationForHomeSeed
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2505600.0];
  uint64_t v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.AnalyticsIdentifiers.HomeSeed" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)UserSeed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForUserSeed];
  uint64_t v3 = +[BMSiriUserSeed columns];
  uint64_t v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.AnalyticsIdentifiers.UserSeed" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.AnalyticsIdentifiers.UserSeed" schema:v9 configuration:v2];

  return v10;
}

+ (id)UserSamplingId
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForUserSamplingId];
  uint64_t v3 = +[BMSiriUserSamplingId columns];
  uint64_t v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.AnalyticsIdentifiers.UserSamplingId" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.AnalyticsIdentifiers.UserSamplingId" schema:v9 configuration:v2];

  return v10;
}

+ (id)UserAggregationId
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForUserAggregationId];
  uint64_t v3 = +[BMSiriUserAggregationId columns];
  uint64_t v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.AnalyticsIdentifiers.UserAggregationId" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.AnalyticsIdentifiers.UserAggregationId" schema:v9 configuration:v2];

  return v10;
}

+ (id)HomeSeed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 configurationForHomeSeed];
  uint64_t v3 = +[BMSiriHomeSeed columns];
  uint64_t v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.AnalyticsIdentifiers.HomeSeed" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.AnalyticsIdentifiers.HomeSeed" schema:v9 configuration:v2];

  return v10;
}

@end