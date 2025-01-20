@interface _BMPersonalizedSensingLibraryNode
+ (id)MomentsContext;
+ (id)configurationForMomentsContext;
+ (id)identifier;
+ (id)storeConfigurationForMomentsContext;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMomentsContext;
+ (id)validKeyPaths;
@end

@implementation _BMPersonalizedSensingLibraryNode

+ (id)identifier
{
  return @"PersonalizedSensing";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"MomentsContext"])
  {
    v4 = [a1 MomentsContext];
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
  v3 = +[BMPersonalizedSensingMomentsContext validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5C28;
}

+ (id)configurationForMomentsContext
{
  v3 = [a1 storeConfigurationForMomentsContext];
  v4 = [a1 syncPolicyForMomentsContext];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CCF6077C-15C7-411E-998E-7F68DFAD26DA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"PersonalizedSensing.MomentsContext", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMomentsContext
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:2];
  v24[0] = v18;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v23 = v17;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v22 = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:1];
  v21 = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v19[0] = v6;
  v20[0] = v16;
  v7 = BMDevicePlatformAsKeyString();
  v19[1] = v7;
  v20[1] = v15;
  v8 = BMDevicePlatformAsKeyString();
  v19[2] = v8;
  v20[2] = v3;
  uint64_t v9 = BMDevicePlatformAsKeyString();
  v19[3] = v9;
  v20[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v19[4] = v10;
  v20[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CCF6077C-15C7-411E-998E-7F68DFAD26DA"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:0 eventClass:objc_opt_class()];

  return v13;
}

+ (id)storeConfigurationForMomentsContext
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:18874368 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"PersonalizedSensing.MomentsContext" domain:0 segmentSize:0x200000 protectionClass:2 pruningPolicy:v3];

  return v4;
}

+ (id)MomentsContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMomentsContext];
  v3 = +[BMPersonalizedSensingMomentsContext columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"PersonalizedSensing.MomentsContext" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"PersonalizedSensing.MomentsContext" schema:v9 configuration:v2];

  return v10;
}

@end