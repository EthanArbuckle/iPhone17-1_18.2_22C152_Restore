@interface _BMFindMyLibraryNode
+ (id)ContactActivity;
+ (id)LocationChange;
+ (id)configurationForContactActivity;
+ (id)configurationForLocationChange;
+ (id)identifier;
+ (id)storeConfigurationForContactActivity;
+ (id)storeConfigurationForLocationChange;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForContactActivity;
+ (id)syncPolicyForLocationChange;
+ (id)validKeyPaths;
@end

@implementation _BMFindMyLibraryNode

+ (id)identifier
{
  return @"FindMy";
}

+ (id)streamNames
{
  return &unk_1F0BF7338;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ContactActivity"])
  {
    uint64_t v5 = [a1 ContactActivity];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"LocationChange"])
  {
    uint64_t v5 = [a1 LocationChange];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)ContactActivity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForContactActivity];
  v3 = +[BMFindMyContactActivity columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"FindMy.ContactActivity" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"FindMy.ContactActivity" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForContactActivity
{
  v3 = [a1 storeConfigurationForContactActivity];
  id v4 = [a1 syncPolicyForContactActivity];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A5D8AB11-4CD5-4A67-8878-727A278888C6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"FindMy.ContactActivity", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.findmy");

  return v7;
}

+ (id)syncPolicyForContactActivity
{
  return 0;
}

+ (id)storeConfigurationForContactActivity
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"FindMy.ContactActivity" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMFindMyContactActivity validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMFindMyLocationChange validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)configurationForLocationChange
{
  v3 = [a1 storeConfigurationForLocationChange];
  id v4 = [a1 syncPolicyForLocationChange];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E84B3AF5-052E-48DB-BF4C-B7B3FDEBA508"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"FindMy.LocationChange", objc_opt_class(), v3, v4, &unk_1F0BF7320, 0, v9, 0, 0, @"com.apple.findmy");

  return v7;
}

+ (id)syncPolicyForLocationChange
{
  return 0;
}

+ (id)storeConfigurationForLocationChange
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"FindMy.LocationChange" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)LocationChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLocationChange];
  v3 = +[BMFindMyLocationChange columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"FindMy.LocationChange" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"FindMy.LocationChange" schema:v9 configuration:v2];

  return v10;
}

@end