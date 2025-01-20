@interface _BMDeviceSettingsLibraryNode
+ (id)DoNotDisturb;
+ (id)configurationForDoNotDisturb;
+ (id)identifier;
+ (id)storeConfigurationForDoNotDisturb;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDoNotDisturb;
+ (id)validKeyPaths;
@end

@implementation _BMDeviceSettingsLibraryNode

+ (id)identifier
{
  return @"Settings";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF6048;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"DoNotDisturb"])
  {
    v4 = [a1 DoNotDisturb];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)DoNotDisturb
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForDoNotDisturb];
  v3 = +[BMDeviceDoNotDisturb columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Settings.DoNotDisturb" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Settings.DoNotDisturb" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForDoNotDisturb
{
  v3 = [a1 storeConfigurationForDoNotDisturb];
  v4 = [a1 syncPolicyForDoNotDisturb];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8DE91432-19E8-4CC3-9D9A-B17C3A060583"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Settings.DoNotDisturb", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDoNotDisturb
{
  return 0;
}

+ (id)storeConfigurationForDoNotDisturb
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Settings.DoNotDisturb" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDeviceDoNotDisturb validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

@end