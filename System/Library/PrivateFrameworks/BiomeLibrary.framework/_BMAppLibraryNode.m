@interface _BMAppLibraryNode
+ (id)Activity;
+ (id)Clip;
+ (id)ContextualActions;
+ (id)InFocus;
+ (id)Install;
+ (id)Intent;
+ (id)Intents;
+ (id)LocationActivity;
+ (id)MediaUsage;
+ (id)RelevantShortcuts;
+ (id)WebApp;
+ (id)WebUsage;
+ (id)configurationForActivity;
+ (id)configurationForContextualActions;
+ (id)configurationForInFocus;
+ (id)configurationForInstall;
+ (id)configurationForIntent;
+ (id)configurationForLocationActivity;
+ (id)configurationForMediaUsage;
+ (id)configurationForRelevantShortcuts;
+ (id)configurationForWebUsage;
+ (id)identifier;
+ (id)storeConfigurationForActivity;
+ (id)storeConfigurationForContextualActions;
+ (id)storeConfigurationForInFocus;
+ (id)storeConfigurationForInstall;
+ (id)storeConfigurationForIntent;
+ (id)storeConfigurationForLocationActivity;
+ (id)storeConfigurationForMediaUsage;
+ (id)storeConfigurationForRelevantShortcuts;
+ (id)storeConfigurationForWebUsage;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForActivity;
+ (id)syncPolicyForContextualActions;
+ (id)syncPolicyForInFocus;
+ (id)syncPolicyForInstall;
+ (id)syncPolicyForIntent;
+ (id)syncPolicyForLocationActivity;
+ (id)syncPolicyForMediaUsage;
+ (id)syncPolicyForRelevantShortcuts;
+ (id)syncPolicyForWebUsage;
+ (id)validKeyPaths;
@end

@implementation _BMAppLibraryNode

+ (id)identifier
{
  return @"App";
}

+ (id)streamNames
{
  return &unk_1F0BF3B28;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Activity"])
  {
    uint64_t v5 = [a1 Activity];
LABEL_19:
    v6 = (void *)v5;
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"ContextualActions"])
  {
    uint64_t v5 = [a1 ContextualActions];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"InFocus"])
  {
    uint64_t v5 = [a1 InFocus];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"Install"])
  {
    uint64_t v5 = [a1 Install];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"Intent"])
  {
    uint64_t v5 = [a1 Intent];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"LocationActivity"])
  {
    uint64_t v5 = [a1 LocationActivity];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"MediaUsage"])
  {
    uint64_t v5 = [a1 MediaUsage];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"RelevantShortcuts"])
  {
    uint64_t v5 = [a1 RelevantShortcuts];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"WebUsage"])
  {
    uint64_t v5 = [a1 WebUsage];
    goto LABEL_19;
  }
  v6 = 0;
LABEL_20:

  return v6;
}

+ (id)InFocus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForInFocus];
  v3 = +[BMAppInFocus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.InFocus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.InFocus" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForInFocus
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForInFocus];
  id v4 = [a1 syncPolicyForInFocus];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == bundleIdentifier" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"app-uninstall" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT bundleIdentifier IN $installed" argumentArray:0];
  v10 = (void *)[v8 initWithIdentifier:@"app-uninstall-nightly" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0171748D-1B75-47EB-B34D-008EDC2F7A6A"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"App.InFocus", objc_opt_class(), v3, v4, &unk_1F0BF3AE0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)storeConfigurationForInFocus
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.InFocus" domain:0 segmentSize:0x80000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)syncPolicyForInFocus
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:3 direction:3];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v23[0] = v18;
  v23[1] = v17;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:3 direction:3];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:3];
  v22[0] = v16;
  v22[1] = v15;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F504B8]) initWithTransportType:2 direction:2];
  v21 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v6 = BMDevicePlatformAsKeyString();
  v19[0] = v6;
  v20[0] = v2;
  v7 = BMDevicePlatformAsKeyString();
  v19[1] = v7;
  v20[1] = v2;
  id v8 = BMDevicePlatformAsKeyString();
  v19[2] = v8;
  v20[2] = v3;
  v9 = BMDevicePlatformAsKeyString();
  v19[3] = v9;
  v20[3] = v3;
  v10 = BMDevicePlatformAsKeyString();
  v19[4] = v10;
  v20[4] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0171748D-1B75-47EB-B34D-008EDC2F7A6A"];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F504C0]) initWithPolicyDictionary:v11 syncUUID:v12 legacySyncID:@"public/AppLaunch" eventClass:objc_opt_class()];

  return v13;
}

+ (id)Intent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForIntent];
  v3 = +[BMAppIntent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.Intent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.Intent" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForIntent
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28 = [a1 storeConfigurationForIntent];
  v27 = [a1 syncPolicyForIntent];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled == bundleID" argumentArray:0];
  v25 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v26];
  v29[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT bundleID IN $installed" argumentArray:0];
  id v5 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v24];
  v29[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F504A8]);
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  id v8 = (void *)[v6 initWithIdentifier:@"delete-siri-dictation-history" predicate:v7];
  v29[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F504A8]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"donatedBySiri == YES" argumentArray:0];
  v11 = (void *)[v9 initWithIdentifier:@"disable-siri" predicate:v10];
  v29[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F504A8]);
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleID == $app AND (itemID IN $intentIdentifiers OR groupID IN $intentGroupIdentifiers)" argumentArray:0];
  v14 = (void *)[v12 initWithIdentifier:@"intent-deletion" predicate:v13];
  v29[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleID IN $disabledApps" argumentArray:0];
  v17 = (void *)[v15 initWithIdentifier:@"learn-from-this-app" predicate:v16];
  v29[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  v19 = (void *)MEMORY[0x1E4F504B0];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E89116F4-E17C-48DA-BD91-00BFE0BF38AC"];
  BYTE2(v23) = 1;
  LOWORD(v23) = 1;
  v21 = objc_msgSend(v19, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v20, @"App.Intent", objc_opt_class(), v28, v27, &unk_1F0BF3AF8, 0, v23, 0, v18, 0);

  return v21;
}

+ (id)syncPolicyForIntent
{
  return 0;
}

+ (id)storeConfigurationForIntent
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.Intent" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 Clip];
  id v4 = objc_msgSend(a1, "Intents", v3);
  v8[1] = v4;
  id v5 = [a1 WebApp];
  v8[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = +[BMAppActivity validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMAppContextualActions validKeyPaths];
  [v2 addObjectsFromArray:v4];

  id v5 = +[BMAppInFocus validKeyPaths];
  [v2 addObjectsFromArray:v5];

  id v6 = +[BMAppInstall validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMAppIntent validKeyPaths];
  [v2 addObjectsFromArray:v7];

  id v8 = +[BMAppLocationActivity validKeyPaths];
  [v2 addObjectsFromArray:v8];

  id v9 = +[BMAppMediaUsage validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMAppRelevantShortcuts validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMAppWebUsage validKeyPaths];
  [v2 addObjectsFromArray:v11];

  id v12 = (void *)[v2 copy];

  return v12;
}

+ (id)WebApp
{
  return (id)objc_opt_class();
}

+ (id)Intents
{
  return (id)objc_opt_class();
}

+ (id)Clip
{
  return (id)objc_opt_class();
}

+ (id)configurationForWebUsage
{
  id v3 = [a1 storeConfigurationForWebUsage];
  id v4 = [a1 syncPolicyForWebUsage];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3BDB19A-865C-4532-A5B2-EC35A4053E59"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.WebUsage", objc_opt_class(), v3, v4, &unk_1F0BF3B10, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWebUsage
{
  return 0;
}

+ (id)storeConfigurationForWebUsage
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  id v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.WebUsage" domain:0 segmentSize:0x80000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)configurationForRelevantShortcuts
{
  id v3 = [a1 storeConfigurationForRelevantShortcuts];
  id v4 = [a1 syncPolicyForRelevantShortcuts];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"16D4F2CD-3916-4930-B78E-FBD52BC44897"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.RelevantShortcuts", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForRelevantShortcuts
{
  return 0;
}

+ (id)storeConfigurationForRelevantShortcuts
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.RelevantShortcuts" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMediaUsage
{
  id v3 = [a1 storeConfigurationForMediaUsage];
  id v4 = [a1 syncPolicyForMediaUsage];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CE38AAA5-6FA3-41D6-9720-B2D8290001EC"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.MediaUsage", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMediaUsage
{
  return 0;
}

+ (id)storeConfigurationForMediaUsage
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  id v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:2419200.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.MediaUsage" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)configurationForLocationActivity
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 storeConfigurationForLocationActivity];
  id v4 = [a1 syncPolicyForLocationActivity];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled IN {bundleID, sourceBundleID}", 0 argumentArray];
  v7 = (void *)[v5 initWithIdentifier:@"app-uninstall" predicate:v6];
  v20[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT ALL {bundleID, sourceBundleID} IN $installed", 0 argumentArray];
  v10 = (void *)[v8 initWithIdentifier:@"app-uninstall-nightly" predicate:v9];
  v20[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F504A8]);
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v13 = (void *)[v11 initWithIdentifier:@"reset-privacy-and-location-warnings" predicate:v12];
  v20[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  id v15 = (void *)MEMORY[0x1E4F504B0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3C653F00-4857-4409-9663-FE53B5627185"];
  BYTE2(v19) = 1;
  LOWORD(v19) = 1;
  v17 = objc_msgSend(v15, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v16, @"App.LocationActivity", objc_opt_class(), v3, v4, 0, 0, v19, 0, v14, 0);

  return v17;
}

+ (id)syncPolicyForLocationActivity
{
  return 0;
}

+ (id)storeConfigurationForLocationActivity
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:5242880 maxStreamSize:10000 maxEventCount:172800.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.LocationActivity" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForInstall
{
  id v3 = [a1 storeConfigurationForInstall];
  id v4 = [a1 syncPolicyForInstall];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3DA6B559-B626-4C8F-8ED4-2B9263D08FC2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.Install", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForInstall
{
  return 0;
}

+ (id)storeConfigurationForInstall
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:500 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.Install" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForContextualActions
{
  id v3 = [a1 storeConfigurationForContextualActions];
  id v4 = [a1 syncPolicyForContextualActions];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"16AF2653-AB71-4FD2-8277-52E85C71AB54"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.ContextualActions", objc_opt_class(), v3, v4, &unk_1F0BF3AC8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForContextualActions
{
  return 0;
}

+ (id)storeConfigurationForContextualActions
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.ContextualActions" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForActivity
{
  id v3 = [a1 storeConfigurationForActivity];
  id v4 = [a1 syncPolicyForActivity];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"59D1C2D9-756A-43B6-9781-0D02E71C80E3"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"App.Activity", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForActivity
{
  return 0;
}

+ (id)storeConfigurationForActivity
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  id v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"App.Activity" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WebUsage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWebUsage];
  id v3 = +[BMAppWebUsage columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.WebUsage" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.WebUsage" schema:v9 configuration:v2];

  return v10;
}

+ (id)RelevantShortcuts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRelevantShortcuts];
  id v3 = +[BMAppRelevantShortcuts columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.RelevantShortcuts" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.RelevantShortcuts" schema:v9 configuration:v2];

  return v10;
}

+ (id)MediaUsage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMediaUsage];
  id v3 = +[BMAppMediaUsage columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.MediaUsage" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.MediaUsage" schema:v9 configuration:v2];

  return v10;
}

+ (id)LocationActivity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLocationActivity];
  id v3 = +[BMAppLocationActivity columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.LocationActivity" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.LocationActivity" schema:v9 configuration:v2];

  return v10;
}

+ (id)Install
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForInstall];
  id v3 = +[BMAppInstall columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.Install" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.Install" schema:v9 configuration:v2];

  return v10;
}

+ (id)ContextualActions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForContextualActions];
  id v3 = +[BMAppContextualActions columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.ContextualActions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.ContextualActions" schema:v9 configuration:v2];

  return v10;
}

+ (id)Activity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForActivity];
  id v3 = +[BMAppActivity columns];
  id v4 = BMEventTimestampSQLColumn();
  id v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  id v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"App.Activity" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"App.Activity" schema:v9 configuration:v2];

  return v10;
}

@end