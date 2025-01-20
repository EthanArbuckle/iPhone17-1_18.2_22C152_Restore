@interface _BMRemindersGroceryLibraryNode
+ (id)MiscategorizedGroceryItem;
+ (id)configurationForMiscategorizedGroceryItem;
+ (id)identifier;
+ (id)storeConfigurationForMiscategorizedGroceryItem;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForMiscategorizedGroceryItem;
+ (id)validKeyPaths;
@end

@implementation _BMRemindersGroceryLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"MiscategorizedGroceryItem"])
  {
    v4 = [a1 MiscategorizedGroceryItem];
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
  v3 = +[BMRemindersMiscategorizedGroceryItem validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF61C8;
}

+ (id)identifier
{
  return @"Grocery";
}

+ (id)configurationForMiscategorizedGroceryItem
{
  v3 = [a1 storeConfigurationForMiscategorizedGroceryItem];
  v4 = [a1 syncPolicyForMiscategorizedGroceryItem];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B63BAB3C-13DD-4A3B-A346-BB6BE344E69D"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Reminders.Grocery.MiscategorizedGroceryItem", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.reminders");

  return v7;
}

+ (id)syncPolicyForMiscategorizedGroceryItem
{
  return 0;
}

+ (id)storeConfigurationForMiscategorizedGroceryItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Reminders.Grocery.MiscategorizedGroceryItem" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)MiscategorizedGroceryItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMiscategorizedGroceryItem];
  v3 = +[BMRemindersMiscategorizedGroceryItem columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Reminders.Grocery.MiscategorizedGroceryItem" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Reminders.Grocery.MiscategorizedGroceryItem" schema:v9 configuration:v2];

  return v10;
}

@end