@interface _BMPrivateCloudComputeLibraryNode
+ (id)RequestLog;
+ (id)configurationForRequestLog;
+ (id)identifier;
+ (id)storeConfigurationForRequestLog;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRequestLog;
+ (id)validKeyPaths;
@end

@implementation _BMPrivateCloudComputeLibraryNode

+ (id)identifier
{
  return @"PrivateCloudCompute";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"RequestLog"])
  {
    v4 = [a1 RequestLog];
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
  v3 = +[BMPrivateCloudComputeRequestLog validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF7518;
}

+ (id)configurationForRequestLog
{
  v3 = [a1 storeConfigurationForRequestLog];
  v4 = [a1 syncPolicyForRequestLog];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7EC4C68A-B0F6-41F1-8C15-C9F3C6EBE1D6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"PrivateCloudCompute.RequestLog", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForRequestLog
{
  return 0;
}

+ (id)storeConfigurationForRequestLog
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:604800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"PrivateCloudCompute.RequestLog" domain:0 segmentSize:5242880 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)RequestLog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRequestLog];
  v3 = +[BMPrivateCloudComputeRequestLog columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"PrivateCloudCompute.RequestLog" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"PrivateCloudCompute.RequestLog" schema:v9 configuration:v2];

  return v10;
}

@end