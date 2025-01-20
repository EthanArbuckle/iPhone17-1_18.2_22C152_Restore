@interface _BMSiriOnDeviceAnalyticsLibraryNode
+ (id)SpeakerIdSampling;
+ (id)configurationForSpeakerIdSampling;
+ (id)identifier;
+ (id)storeConfigurationForSpeakerIdSampling;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSpeakerIdSampling;
+ (id)validKeyPaths;
@end

@implementation _BMSiriOnDeviceAnalyticsLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF7638;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"SpeakerIdSampling"])
  {
    v4 = [a1 SpeakerIdSampling];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)SpeakerIdSampling
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForSpeakerIdSampling];
  v3 = +[BMSiriSpeakerIdSampling columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Siri.OnDeviceAnalytics.SpeakerIdSampling" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Siri.OnDeviceAnalytics.SpeakerIdSampling" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForSpeakerIdSampling
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForSpeakerIdSampling];
  v4 = [a1 syncPolicyForSpeakerIdSampling];
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
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A055E9EC-BE22-44EF-AE89-71DB3294A7EC"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"Siri.OnDeviceAnalytics.SpeakerIdSampling", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForSpeakerIdSampling
{
  return 0;
}

+ (id)storeConfigurationForSpeakerIdSampling
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:17107200.0];
  v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Siri.OnDeviceAnalytics.SpeakerIdSampling" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSiriSpeakerIdSampling validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)identifier
{
  return @"OnDeviceAnalytics";
}

@end