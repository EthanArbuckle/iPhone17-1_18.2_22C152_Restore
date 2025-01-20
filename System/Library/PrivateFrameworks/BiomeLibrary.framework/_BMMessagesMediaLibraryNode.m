@interface _BMMessagesMediaLibraryNode
+ (id)Rendered;
+ (id)configurationForRendered;
+ (id)identifier;
+ (id)storeConfigurationForRendered;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRendered;
+ (id)validKeyPaths;
@end

@implementation _BMMessagesMediaLibraryNode

+ (id)identifier
{
  return @"Media";
}

+ (id)Rendered
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForRendered];
  v3 = +[BMMessagesMediaRendered columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Messages.Media.Rendered" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Messages.Media.Rendered" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForRendered
{
  v3 = [a1 storeConfigurationForRendered];
  v4 = [a1 syncPolicyForRendered];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DB61E363-A8DE-4536-AAA1-89B2DEC1D2A1"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Messages.Media.Rendered", objc_opt_class(), v3, v4, &unk_1F0BF6750, 0, v9, 0, 0, @"com.apple.MobileSMS");

  return v7;
}

+ (id)syncPolicyForRendered
{
  return 0;
}

+ (id)storeConfigurationForRendered
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Messages.Media.Rendered" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Rendered"])
  {
    v4 = [a1 Rendered];
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
  v3 = +[BMMessagesMediaRendered validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF6768;
}

@end