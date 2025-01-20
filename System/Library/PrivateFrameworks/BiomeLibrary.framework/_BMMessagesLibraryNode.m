@interface _BMMessagesLibraryNode
+ (id)CommunicationSafety;
+ (id)Media;
+ (id)Read;
+ (id)SharedWithYou;
+ (id)configurationForRead;
+ (id)identifier;
+ (id)storeConfigurationForRead;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForRead;
+ (id)validKeyPaths;
@end

@implementation _BMMessagesLibraryNode

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [a1 CommunicationSafety];
  v4 = objc_msgSend(a1, "Media", v3);
  v8[1] = v4;
  v5 = [a1 SharedWithYou];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)Media
{
  return (id)objc_opt_class();
}

+ (id)SharedWithYou
{
  return (id)objc_opt_class();
}

+ (id)CommunicationSafety
{
  return (id)objc_opt_class();
}

+ (id)identifier
{
  return @"Messages";
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Read"])
  {
    v4 = [a1 Read];
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
  v3 = +[BMMessagesRead validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF3A20;
}

+ (id)configurationForRead
{
  v3 = [a1 storeConfigurationForRead];
  v4 = [a1 syncPolicyForRead];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"33251B1D-BB7E-46CC-BFE1-F7E7F3C56C21"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Messages.Read", objc_opt_class(), v3, v4, &unk_1F0BF3A08, 0, v9, 0, 0, @"com.apple.MobileSMS");

  return v7;
}

+ (id)syncPolicyForRead
{
  return 0;
}

+ (id)storeConfigurationForRead
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Messages.Read" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Read
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRead];
  v3 = +[BMMessagesRead columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Messages.Read" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Messages.Read" schema:v9 configuration:v2];

  return v10;
}

@end