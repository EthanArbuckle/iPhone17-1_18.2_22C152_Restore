@interface _BMCommCenterCallLibraryNode
+ (id)EmergencyVoiceCall;
+ (id)configurationForEmergencyVoiceCall;
+ (id)identifier;
+ (id)storeConfigurationForEmergencyVoiceCall;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForEmergencyVoiceCall;
+ (id)validKeyPaths;
@end

@implementation _BMCommCenterCallLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"EmergencyVoiceCall"])
  {
    v4 = [a1 EmergencyVoiceCall];
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
  v3 = +[BMCommCenterEmergencyVoiceCall validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5AC0;
}

+ (id)identifier
{
  return @"Call";
}

+ (id)configurationForEmergencyVoiceCall
{
  v3 = [a1 storeConfigurationForEmergencyVoiceCall];
  v4 = [a1 syncPolicyForEmergencyVoiceCall];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE11123E-9872-43D4-A900-A07B3E23D475"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"CommCenter.Call.EmergencyVoiceCall", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForEmergencyVoiceCall
{
  return 0;
}

+ (id)storeConfigurationForEmergencyVoiceCall
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"CommCenter.Call.EmergencyVoiceCall" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)EmergencyVoiceCall
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForEmergencyVoiceCall];
  v3 = +[BMCommCenterEmergencyVoiceCall columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"CommCenter.Call.EmergencyVoiceCall" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"CommCenter.Call.EmergencyVoiceCall" schema:v9 configuration:v2];

  return v10;
}

@end