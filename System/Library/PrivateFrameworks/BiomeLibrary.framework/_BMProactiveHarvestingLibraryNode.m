@interface _BMProactiveHarvestingLibraryNode
+ (id)Mail;
+ (id)Messages;
+ (id)News;
+ (id)Notes;
+ (id)NotificationStacks;
+ (id)Notifications;
+ (id)ParsecSearch;
+ (id)Photos;
+ (id)Reminders;
+ (id)Safari;
+ (id)Siri;
+ (id)ThirdPartyApp;
+ (id)configurationForMail;
+ (id)configurationForMessages;
+ (id)configurationForNotes;
+ (id)configurationForNotificationStacks;
+ (id)configurationForNotifications;
+ (id)configurationForParsecSearch;
+ (id)configurationForReminders;
+ (id)configurationForThirdPartyApp;
+ (id)identifier;
+ (id)storeConfigurationForMail;
+ (id)storeConfigurationForMessages;
+ (id)storeConfigurationForNotes;
+ (id)storeConfigurationForNotificationStacks;
+ (id)storeConfigurationForNotifications;
+ (id)storeConfigurationForParsecSearch;
+ (id)storeConfigurationForReminders;
+ (id)storeConfigurationForThirdPartyApp;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMail;
+ (id)syncPolicyForMessages;
+ (id)syncPolicyForNotes;
+ (id)syncPolicyForNotificationStacks;
+ (id)syncPolicyForNotifications;
+ (id)syncPolicyForParsecSearch;
+ (id)syncPolicyForReminders;
+ (id)syncPolicyForThirdPartyApp;
+ (id)validKeyPaths;
@end

@implementation _BMProactiveHarvestingLibraryNode

+ (id)identifier
{
  return @"ProactiveHarvesting";
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Mail"])
  {
    uint64_t v5 = [a1 Mail];
LABEL_17:
    v6 = (void *)v5;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"Messages"])
  {
    uint64_t v5 = [a1 Messages];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"Notes"])
  {
    uint64_t v5 = [a1 Notes];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"Notifications"])
  {
    uint64_t v5 = [a1 Notifications];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"NotificationStacks"])
  {
    uint64_t v5 = [a1 NotificationStacks];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"ParsecSearch"])
  {
    uint64_t v5 = [a1 ParsecSearch];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"Reminders"])
  {
    uint64_t v5 = [a1 Reminders];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"ThirdPartyApp"])
  {
    uint64_t v5 = [a1 ThirdPartyApp];
    goto LABEL_17;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

+ (id)NotificationStacks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForNotificationStacks];
  v3 = +[BMProactiveHarvestingNotificationStack columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.NotificationStacks" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.NotificationStacks" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForNotificationStacks
{
  v3 = [a1 storeConfigurationForNotificationStacks];
  id v4 = [a1 syncPolicyForNotificationStacks];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0C5B5D72-3BAC-40C3-9BEA-48691108C52A"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.NotificationStacks", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForNotificationStacks
{
  return 0;
}

+ (id)storeConfigurationForNotificationStacks
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.NotificationStacks" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Notifications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForNotifications];
  v3 = +[BMProactiveHarvestingNotifications columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Notifications" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Notifications" schema:v9 configuration:v2];

  return v10;
}

+ (id)sublibraries
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [a1 News];
  v9[0] = v3;
  id v4 = [a1 Photos];
  v9[1] = v4;
  uint64_t v5 = [a1 Safari];
  v9[2] = v5;
  v6 = [a1 Siri];
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMProactiveHarvestingMail validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMProactiveHarvestingMessages validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMProactiveHarvestingNotes validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMProactiveHarvestingNotifications validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMProactiveHarvestingNotificationStack validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMProactiveHarvestingParsecSearch validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = +[BMProactiveHarvestingReminders validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMProactiveHarvestingThirdPartyApp validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = (void *)[v2 copy];

  return v11;
}

+ (id)streamNames
{
  return &unk_1F0BF5E08;
}

+ (id)Siri
{
  return (id)objc_opt_class();
}

+ (id)Safari
{
  return (id)objc_opt_class();
}

+ (id)Photos
{
  return (id)objc_opt_class();
}

+ (id)News
{
  return (id)objc_opt_class();
}

+ (id)configurationForThirdPartyApp
{
  v3 = [a1 storeConfigurationForThirdPartyApp];
  id v4 = [a1 syncPolicyForThirdPartyApp];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"948A6E0C-F78A-40DC-A755-487D0E2B069E"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.ThirdPartyApp", objc_opt_class(), v3, v4, &unk_1F0BF5DF0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForThirdPartyApp
{
  return 0;
}

+ (id)storeConfigurationForThirdPartyApp
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.ThirdPartyApp" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForReminders
{
  v3 = [a1 storeConfigurationForReminders];
  id v4 = [a1 syncPolicyForReminders];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C6181708-A1BE-4857-AA65-3CBCB3CF3302"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Reminders", objc_opt_class(), v3, v4, &unk_1F0BF5DD8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForReminders
{
  return 0;
}

+ (id)storeConfigurationForReminders
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Reminders" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForParsecSearch
{
  v3 = [a1 storeConfigurationForParsecSearch];
  id v4 = [a1 syncPolicyForParsecSearch];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"708EC8A6-814B-44EB-A621-51E95D10A439"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.ParsecSearch", objc_opt_class(), v3, v4, &unk_1F0BF5DC0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForParsecSearch
{
  return 0;
}

+ (id)storeConfigurationForParsecSearch
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.ParsecSearch" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForNotifications
{
  v3 = [a1 storeConfigurationForNotifications];
  id v4 = [a1 syncPolicyForNotifications];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B805350C-6937-49F5-AF22-427E969DD86B"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Notifications", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForNotifications
{
  return 0;
}

+ (id)storeConfigurationForNotifications
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Notifications" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForNotes
{
  v3 = [a1 storeConfigurationForNotes];
  id v4 = [a1 syncPolicyForNotes];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DCB33C5D-DA04-410B-8AB9-4A2297870199"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Notes", objc_opt_class(), v3, v4, &unk_1F0BF5DA8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForNotes
{
  return 0;
}

+ (id)storeConfigurationForNotes
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Notes" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMessages
{
  v3 = [a1 storeConfigurationForMessages];
  id v4 = [a1 syncPolicyForMessages];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A0DADC40-2F64-4F05-8E50-5D1C6FD7E5AA"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Messages", objc_opt_class(), v3, v4, &unk_1F0BF5D90, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMessages
{
  return 0;
}

+ (id)storeConfigurationForMessages
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Messages" domain:0 segmentSize:0x1000000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMail
{
  v3 = [a1 storeConfigurationForMail];
  id v4 = [a1 syncPolicyForMail];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"87257C5B-4D69-4EE8-AD36-71FF5DBE3BD8"];
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"ProactiveHarvesting.Mail", objc_opt_class(), v3, v4, &unk_1F0BF5D78, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMail
{
  return 0;
}

+ (id)storeConfigurationForMail
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0x40000000 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"ProactiveHarvesting.Mail" domain:0 segmentSize:0x1000000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)ThirdPartyApp
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForThirdPartyApp];
  v3 = +[BMProactiveHarvestingThirdPartyApp columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.ThirdPartyApp" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.ThirdPartyApp" schema:v9 configuration:v2];

  return v10;
}

+ (id)Reminders
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForReminders];
  v3 = +[BMProactiveHarvestingReminders columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Reminders" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Reminders" schema:v9 configuration:v2];

  return v10;
}

+ (id)ParsecSearch
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForParsecSearch];
  v3 = +[BMProactiveHarvestingParsecSearch columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.ParsecSearch" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.ParsecSearch" schema:v9 configuration:v2];

  return v10;
}

+ (id)Notes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForNotes];
  v3 = +[BMProactiveHarvestingNotes columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Notes" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Notes" schema:v9 configuration:v2];

  return v10;
}

+ (id)Messages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMessages];
  v3 = +[BMProactiveHarvestingMessages columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Messages" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Messages" schema:v9 configuration:v2];

  return v10;
}

+ (id)Mail
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMail];
  v3 = +[BMProactiveHarvestingMail columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"ProactiveHarvesting.Mail" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"ProactiveHarvesting.Mail" schema:v9 configuration:v2];

  return v10;
}

@end