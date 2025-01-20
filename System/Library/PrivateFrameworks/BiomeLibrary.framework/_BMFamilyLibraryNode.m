@interface _BMFamilyLibraryNode
+ (id)AskToBuy;
+ (id)ScreenTime;
+ (id)configurationForAskToBuy;
+ (id)identifier;
+ (id)storeConfigurationForAskToBuy;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAskToBuy;
+ (id)validKeyPaths;
@end

@implementation _BMFamilyLibraryNode

+ (id)identifier
{
  return @"Family";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 ScreenTime];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"AskToBuy"])
  {
    v4 = [a1 AskToBuy];
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
  v3 = +[BMFamilyAskToBuy validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF3D08;
}

+ (id)ScreenTime
{
  return (id)objc_opt_class();
}

+ (id)configurationForAskToBuy
{
  v3 = [a1 storeConfigurationForAskToBuy];
  v4 = [a1 syncPolicyForAskToBuy];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"77728FAD-64C7-4AA5-B987-B7D59846D3DA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Family.AskToBuy", objc_opt_class(), v3, v4, &unk_1F0BF3CF0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAskToBuy
{
  return 0;
}

+ (id)storeConfigurationForAskToBuy
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Family.AskToBuy" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AskToBuy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAskToBuy];
  v3 = +[BMFamilyAskToBuy columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Family.AskToBuy" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Family.AskToBuy" schema:v9 configuration:v2];

  return v10;
}

@end