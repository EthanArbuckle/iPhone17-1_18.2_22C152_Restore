@interface _BMWalletLibraryNode
+ (id)SettledTransaction;
+ (id)Transaction;
+ (id)configurationForSettledTransaction;
+ (id)configurationForTransaction;
+ (id)identifier;
+ (id)storeConfigurationForSettledTransaction;
+ (id)storeConfigurationForTransaction;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForSettledTransaction;
+ (id)syncPolicyForTransaction;
+ (id)validKeyPaths;
@end

@implementation _BMWalletLibraryNode

+ (id)identifier
{
  return @"Wallet";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SettledTransaction"])
  {
    uint64_t v5 = [a1 SettledTransaction];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Transaction"])
  {
    uint64_t v5 = [a1 Transaction];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMWalletSettledTransaction validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMWalletTransaction validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

+ (id)streamNames
{
  return &unk_1F0BF3750;
}

+ (id)configurationForTransaction
{
  v3 = [a1 storeConfigurationForTransaction];
  id v4 = [a1 syncPolicyForTransaction];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B5D7D18C-D5BF-4A5B-84E2-243225E9E434"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Wallet.Transaction", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Passbook");

  return v7;
}

+ (id)syncPolicyForTransaction
{
  return 0;
}

+ (id)storeConfigurationForTransaction
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Wallet.Transaction" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSettledTransaction
{
  v3 = [a1 storeConfigurationForSettledTransaction];
  id v4 = [a1 syncPolicyForSettledTransaction];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8B6D95DC-4558-4C80-B88B-870671A5C1E0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Wallet.SettledTransaction", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Passbook");

  return v7;
}

+ (id)syncPolicyForSettledTransaction
{
  return 0;
}

+ (id)storeConfigurationForSettledTransaction
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Wallet.SettledTransaction" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Transaction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForTransaction];
  v3 = +[BMWalletTransaction columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Wallet.Transaction" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Wallet.Transaction" schema:v9 configuration:v2];

  return v10;
}

+ (id)SettledTransaction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSettledTransaction];
  v3 = +[BMWalletSettledTransaction columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Wallet.SettledTransaction" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Wallet.SettledTransaction" schema:v9 configuration:v2];

  return v10;
}

@end