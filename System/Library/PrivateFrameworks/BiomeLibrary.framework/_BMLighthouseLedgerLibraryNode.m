@interface _BMLighthouseLedgerLibraryNode
+ (id)DediscoPrivacyEvent;
+ (id)DeviceTelemetry;
+ (id)LighthousePluginEvent;
+ (id)MlruntimedEvent;
+ (id)TaskCustomEvent;
+ (id)TaskError;
+ (id)TaskStatus;
+ (id)TaskTelemetry;
+ (id)TrialdEvent;
+ (id)configurationForDediscoPrivacyEvent;
+ (id)configurationForDeviceTelemetry;
+ (id)configurationForLighthousePluginEvent;
+ (id)configurationForMlruntimedEvent;
+ (id)configurationForTaskCustomEvent;
+ (id)configurationForTaskError;
+ (id)configurationForTaskStatus;
+ (id)configurationForTaskTelemetry;
+ (id)configurationForTrialdEvent;
+ (id)identifier;
+ (id)storeConfigurationForDediscoPrivacyEvent;
+ (id)storeConfigurationForDeviceTelemetry;
+ (id)storeConfigurationForLighthousePluginEvent;
+ (id)storeConfigurationForMlruntimedEvent;
+ (id)storeConfigurationForTaskCustomEvent;
+ (id)storeConfigurationForTaskError;
+ (id)storeConfigurationForTaskStatus;
+ (id)storeConfigurationForTaskTelemetry;
+ (id)storeConfigurationForTrialdEvent;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDediscoPrivacyEvent;
+ (id)syncPolicyForDeviceTelemetry;
+ (id)syncPolicyForLighthousePluginEvent;
+ (id)syncPolicyForMlruntimedEvent;
+ (id)syncPolicyForTaskCustomEvent;
+ (id)syncPolicyForTaskError;
+ (id)syncPolicyForTaskStatus;
+ (id)syncPolicyForTaskTelemetry;
+ (id)syncPolicyForTrialdEvent;
+ (id)validKeyPaths;
@end

@implementation _BMLighthouseLedgerLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"DediscoPrivacyEvent"])
  {
    uint64_t v5 = [a1 DediscoPrivacyEvent];
LABEL_19:
    v6 = (void *)v5;
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"DeviceTelemetry"])
  {
    uint64_t v5 = [a1 DeviceTelemetry];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"LighthousePluginEvent"])
  {
    uint64_t v5 = [a1 LighthousePluginEvent];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"MlruntimedEvent"])
  {
    uint64_t v5 = [a1 MlruntimedEvent];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"TaskCustomEvent"])
  {
    uint64_t v5 = [a1 TaskCustomEvent];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"TaskError"])
  {
    uint64_t v5 = [a1 TaskError];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"TaskStatus"])
  {
    uint64_t v5 = [a1 TaskStatus];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"TaskTelemetry"])
  {
    uint64_t v5 = [a1 TaskTelemetry];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"TrialdEvent"])
  {
    uint64_t v5 = [a1 TrialdEvent];
    goto LABEL_19;
  }
  v6 = 0;
LABEL_20:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMLighthouseLedgerDediscoPrivacyEvent validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMLighthouseDeviceTelemetry validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMLighthouseLedgerLighthousePluginEvent validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMLighthouseLedgerMlruntimedEvent validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMLighthouseTaskCustomEvent validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMLighthouseTaskError validKeyPaths];
  [v2 addObjectsFromArray:v8];

  v9 = +[BMLighthouseTaskStatus validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMLighthouseTaskTelemetry validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMLighthouseLedgerTrialdEvent validKeyPaths];
  [v2 addObjectsFromArray:v11];

  v12 = (void *)[v2 copy];

  return v12;
}

+ (id)streamNames
{
  return &unk_1F0BF5CD0;
}

+ (id)identifier
{
  return @"Ledger";
}

+ (id)configurationForTrialdEvent
{
  v3 = [a1 storeConfigurationForTrialdEvent];
  id v4 = [a1 syncPolicyForTrialdEvent];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"024C50A1-F2BD-400C-9F8C-E8E8BC1D800A"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.TrialdEvent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTrialdEvent
{
  return 0;
}

+ (id)storeConfigurationForTrialdEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.TrialdEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTaskTelemetry
{
  v3 = [a1 storeConfigurationForTaskTelemetry];
  id v4 = [a1 syncPolicyForTaskTelemetry];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8066D77A-DA1B-48BE-89A6-7A7470DA10D8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.TaskTelemetry", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTaskTelemetry
{
  return 0;
}

+ (id)storeConfigurationForTaskTelemetry
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:5184000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.TaskTelemetry" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTaskStatus
{
  v3 = [a1 storeConfigurationForTaskStatus];
  id v4 = [a1 syncPolicyForTaskStatus];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"76E93CEE-08B6-41A1-BF53-161578AE80F9"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.TaskStatus", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTaskStatus
{
  return 0;
}

+ (id)storeConfigurationForTaskStatus
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:5184000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.TaskStatus" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTaskError
{
  v3 = [a1 storeConfigurationForTaskError];
  id v4 = [a1 syncPolicyForTaskError];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7C5EA70F-BD0C-4AB8-81B9-9489F1337087"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.TaskError", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTaskError
{
  return 0;
}

+ (id)storeConfigurationForTaskError
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:5184000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.TaskError" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForTaskCustomEvent
{
  v3 = [a1 storeConfigurationForTaskCustomEvent];
  id v4 = [a1 syncPolicyForTaskCustomEvent];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FE0BC00C-41E1-4A5C-A9A6-E4E47D7135EA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.TaskCustomEvent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTaskCustomEvent
{
  return 0;
}

+ (id)storeConfigurationForTaskCustomEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:5184000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.TaskCustomEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMlruntimedEvent
{
  v3 = [a1 storeConfigurationForMlruntimedEvent];
  id v4 = [a1 syncPolicyForMlruntimedEvent];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F6F9EAFD-CEFA-4905-85E8-A59176773D0C"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.MlruntimedEvent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMlruntimedEvent
{
  return 0;
}

+ (id)storeConfigurationForMlruntimedEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.MlruntimedEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForLighthousePluginEvent
{
  v3 = [a1 storeConfigurationForLighthousePluginEvent];
  id v4 = [a1 syncPolicyForLighthousePluginEvent];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BC26EB46-D87D-499F-8ACE-B67CFA6CA037"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.LighthousePluginEvent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForLighthousePluginEvent
{
  return 0;
}

+ (id)storeConfigurationForLighthousePluginEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.LighthousePluginEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDeviceTelemetry
{
  v3 = [a1 storeConfigurationForDeviceTelemetry];
  id v4 = [a1 syncPolicyForDeviceTelemetry];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0E875153-44EC-45F9-8D07-09546C6EC068"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.DeviceTelemetry", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDeviceTelemetry
{
  return 0;
}

+ (id)storeConfigurationForDeviceTelemetry
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:5184000.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.DeviceTelemetry" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForDediscoPrivacyEvent
{
  v3 = [a1 storeConfigurationForDediscoPrivacyEvent];
  id v4 = [a1 syncPolicyForDediscoPrivacyEvent];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4E669FC4-E6F5-48EF-85E1-94387D009A92"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Lighthouse.Ledger.DediscoPrivacyEvent", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForDediscoPrivacyEvent
{
  return 0;
}

+ (id)storeConfigurationForDediscoPrivacyEvent
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Lighthouse.Ledger.DediscoPrivacyEvent" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)TrialdEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTrialdEvent];
  v3 = +[BMLighthouseLedgerTrialdEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.TrialdEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.TrialdEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)TaskTelemetry
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTaskTelemetry];
  v3 = +[BMLighthouseTaskTelemetry columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.TaskTelemetry" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.TaskTelemetry" schema:v9 configuration:v2];

  return v10;
}

+ (id)TaskStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTaskStatus];
  v3 = +[BMLighthouseTaskStatus columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.TaskStatus" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.TaskStatus" schema:v9 configuration:v2];

  return v10;
}

+ (id)TaskError
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTaskError];
  v3 = +[BMLighthouseTaskError columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.TaskError" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.TaskError" schema:v9 configuration:v2];

  return v10;
}

+ (id)TaskCustomEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTaskCustomEvent];
  v3 = +[BMLighthouseTaskCustomEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.TaskCustomEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.TaskCustomEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)MlruntimedEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMlruntimedEvent];
  v3 = +[BMLighthouseLedgerMlruntimedEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.MlruntimedEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.MlruntimedEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)LighthousePluginEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForLighthousePluginEvent];
  v3 = +[BMLighthouseLedgerLighthousePluginEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.LighthousePluginEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.LighthousePluginEvent" schema:v9 configuration:v2];

  return v10;
}

+ (id)DeviceTelemetry
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDeviceTelemetry];
  v3 = +[BMLighthouseDeviceTelemetry columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.DeviceTelemetry" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.DeviceTelemetry" schema:v9 configuration:v2];

  return v10;
}

+ (id)DediscoPrivacyEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDediscoPrivacyEvent];
  v3 = +[BMLighthouseLedgerDediscoPrivacyEvent columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Lighthouse.Ledger.DediscoPrivacyEvent" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Lighthouse.Ledger.DediscoPrivacyEvent" schema:v9 configuration:v2];

  return v10;
}

@end