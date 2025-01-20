@interface _BMFamilyScreenTimeLibraryNode
+ (id)ChildState;
+ (id)Request;
+ (id)configurationForChildState;
+ (id)configurationForRequest;
+ (id)identifier;
+ (id)storeConfigurationForChildState;
+ (id)storeConfigurationForRequest;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForChildState;
+ (id)syncPolicyForRequest;
+ (id)validKeyPaths;
@end

@implementation _BMFamilyScreenTimeLibraryNode

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ChildState"])
  {
    uint64_t v5 = [a1 ChildState];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Request"])
  {
    uint64_t v5 = [a1 Request];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)Request
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForRequest];
  v3 = +[BMFamilyScreenTimeRequest columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Family.ScreenTime.Request" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Family.ScreenTime.Request" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForRequest
{
  v3 = [a1 storeConfigurationForRequest];
  id v4 = [a1 syncPolicyForRequest];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DBF0CD14-7822-4AD5-906F-2FCC967BC2FE"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Family.ScreenTime.Request", objc_opt_class(), v3, v4, &unk_1F0BF4050, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForRequest
{
  return 0;
}

+ (id)storeConfigurationForRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Family.ScreenTime.Request" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)ChildState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForChildState];
  v3 = +[BMScreenTimeChildState columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Family.ScreenTime.ChildState" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Family.ScreenTime.ChildState" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForChildState
{
  v3 = [a1 storeConfigurationForChildState];
  id v4 = [a1 syncPolicyForChildState];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"95E9EA71-D23F-426A-8259-6CE653638BC6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Family.ScreenTime.ChildState", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMScreenTimeChildState validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMFamilyScreenTimeRequest validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF4068;
}

+ (id)identifier
{
  return @"ScreenTime";
}

+ (id)syncPolicyForChildState
{
  return 0;
}

+ (id)storeConfigurationForChildState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Family.ScreenTime.ChildState" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

@end