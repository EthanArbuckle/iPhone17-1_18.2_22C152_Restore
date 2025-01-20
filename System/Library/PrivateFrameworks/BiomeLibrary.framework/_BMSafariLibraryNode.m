@interface _BMSafariLibraryNode
+ (id)AutoPlay;
+ (id)Browsing;
+ (id)MemoryFootprint;
+ (id)Navigations;
+ (id)PageLoad;
+ (id)WebPagePerformance;
+ (id)WindowProxy;
+ (id)configurationForAutoPlay;
+ (id)configurationForMemoryFootprint;
+ (id)configurationForNavigations;
+ (id)configurationForPageLoad;
+ (id)configurationForWebPagePerformance;
+ (id)configurationForWindowProxy;
+ (id)identifier;
+ (id)storeConfigurationForAutoPlay;
+ (id)storeConfigurationForMemoryFootprint;
+ (id)storeConfigurationForNavigations;
+ (id)storeConfigurationForPageLoad;
+ (id)storeConfigurationForWebPagePerformance;
+ (id)storeConfigurationForWindowProxy;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAutoPlay;
+ (id)syncPolicyForMemoryFootprint;
+ (id)syncPolicyForNavigations;
+ (id)syncPolicyForPageLoad;
+ (id)syncPolicyForWebPagePerformance;
+ (id)syncPolicyForWindowProxy;
+ (id)validKeyPaths;
@end

@implementation _BMSafariLibraryNode

+ (id)identifier
{
  return @"Safari";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 Browsing];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AutoPlay"])
  {
    uint64_t v5 = [a1 AutoPlay];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"MemoryFootprint"])
  {
    uint64_t v5 = [a1 MemoryFootprint];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Navigations"])
  {
    uint64_t v5 = [a1 Navigations];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"PageLoad"])
  {
    uint64_t v5 = [a1 PageLoad];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"WebPagePerformance"])
  {
    uint64_t v5 = [a1 WebPagePerformance];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"WindowProxy"])
  {
    uint64_t v5 = [a1 WindowProxy];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMSafariAutoPlay validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMSafariMemoryFootprint validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMSafariNavigations validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMSafariPageLoad validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMSafariWebPagePerformance validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMSafariWindowProxy validKeyPaths];
  [v2 addObjectsFromArray:v8];

  v9 = (void *)[v2 copy];

  return v9;
}

+ (id)streamNames
{
  return &unk_1F0BF4DB8;
}

+ (id)Browsing
{
  return (id)objc_opt_class();
}

+ (id)configurationForWindowProxy
{
  v3 = [a1 storeConfigurationForWindowProxy];
  id v4 = [a1 syncPolicyForWindowProxy];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"38C11543-3679-411C-B3FF-711D03734963"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.WindowProxy", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilesafari");

  return v7;
}

+ (id)syncPolicyForWindowProxy
{
  return 0;
}

+ (id)storeConfigurationForWindowProxy
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.WindowProxy" domain:0 segmentSize:0x20000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForWebPagePerformance
{
  v3 = [a1 storeConfigurationForWebPagePerformance];
  id v4 = [a1 syncPolicyForWebPagePerformance];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A5AB12EA-1F12-4971-8146-192DBEE389F5"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.WebPagePerformance", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilesafari");

  return v7;
}

+ (id)syncPolicyForWebPagePerformance
{
  return 0;
}

+ (id)storeConfigurationForWebPagePerformance
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.WebPagePerformance" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPageLoad
{
  v3 = [a1 storeConfigurationForPageLoad];
  id v4 = [a1 syncPolicyForPageLoad];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"13116B78-F87C-4C58-BAEA-9967D881E811"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.PageLoad", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilesafari");

  return v7;
}

+ (id)syncPolicyForPageLoad
{
  return 0;
}

+ (id)storeConfigurationForPageLoad
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.PageLoad" domain:0 segmentSize:0x20000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForNavigations
{
  v3 = [a1 storeConfigurationForNavigations];
  id v4 = [a1 syncPolicyForNavigations];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4D4CDB4A-8DCC-4D1F-8276-33FE195FE680"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.Navigations", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilesafari");

  return v7;
}

+ (id)syncPolicyForNavigations
{
  return 0;
}

+ (id)storeConfigurationForNavigations
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.Navigations" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMemoryFootprint
{
  v3 = [a1 storeConfigurationForMemoryFootprint];
  id v4 = [a1 syncPolicyForMemoryFootprint];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2C44BEA5-5638-4C67-8C65-E8428C8DCE22"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.MemoryFootprint", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMemoryFootprint
{
  return 0;
}

+ (id)storeConfigurationForMemoryFootprint
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.MemoryFootprint" domain:0 segmentSize:0x20000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForAutoPlay
{
  v3 = [a1 storeConfigurationForAutoPlay];
  id v4 = [a1 syncPolicyForAutoPlay];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C7500EE0-6B01-4A9F-8BD4-8D5D1ABDB658"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Safari.AutoPlay", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.mobilesafari");

  return v7;
}

+ (id)syncPolicyForAutoPlay
{
  return 0;
}

+ (id)storeConfigurationForAutoPlay
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Safari.AutoPlay" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)WindowProxy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWindowProxy];
  v3 = +[BMSafariWindowProxy columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.WindowProxy" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.WindowProxy" schema:v9 configuration:v2];

  return v10;
}

+ (id)WebPagePerformance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWebPagePerformance];
  v3 = +[BMSafariWebPagePerformance columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.WebPagePerformance" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.WebPagePerformance" schema:v9 configuration:v2];

  return v10;
}

+ (id)PageLoad
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPageLoad];
  v3 = +[BMSafariPageLoad columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.PageLoad" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.PageLoad" schema:v9 configuration:v2];

  return v10;
}

+ (id)Navigations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForNavigations];
  v3 = +[BMSafariNavigations columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.Navigations" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.Navigations" schema:v9 configuration:v2];

  return v10;
}

+ (id)MemoryFootprint
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMemoryFootprint];
  v3 = +[BMSafariMemoryFootprint columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.MemoryFootprint" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.MemoryFootprint" schema:v9 configuration:v2];

  return v10;
}

+ (id)AutoPlay
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAutoPlay];
  v3 = +[BMSafariAutoPlay columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Safari.AutoPlay" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Safari.AutoPlay" schema:v9 configuration:v2];

  return v10;
}

@end