@interface _BMWalletPaymentsCommerceFinancialInsightsLibraryNode
+ (id)PaymentRingSuggestions;
+ (id)RecurringSendSuggestions;
+ (id)Search;
+ (id)configurationForPaymentRingSuggestions;
+ (id)configurationForRecurringSendSuggestions;
+ (id)configurationForSearch;
+ (id)identifier;
+ (id)storeConfigurationForPaymentRingSuggestions;
+ (id)storeConfigurationForRecurringSendSuggestions;
+ (id)storeConfigurationForSearch;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForPaymentRingSuggestions;
+ (id)syncPolicyForRecurringSendSuggestions;
+ (id)syncPolicyForSearch;
+ (id)validKeyPaths;
@end

@implementation _BMWalletPaymentsCommerceFinancialInsightsLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"PaymentRingSuggestions"])
  {
    uint64_t v5 = [a1 PaymentRingSuggestions];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"RecurringSendSuggestions"])
  {
    uint64_t v5 = [a1 RecurringSendSuggestions];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Search"])
  {
    uint64_t v5 = [a1 Search];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMWalletPaymentsCommercePaymentRingSuggestions validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMWalletPaymentsCommerceRecurringSendSuggestions validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMWalletPaymentsCommerceSearch validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = (void *)[v2 copy];

  return v6;
}

+ (id)streamNames
{
  return &unk_1F0BF4248;
}

+ (id)identifier
{
  return @"FinancialInsights";
}

+ (id)configurationForSearch
{
  v3 = [a1 storeConfigurationForSearch];
  id v4 = [a1 syncPolicyForSearch];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"83F35AD2-ED5B-44A7-920F-432EDA25BFC3"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"WalletPaymentsCommerce.FinancialInsights.Search", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Passbook");

  return v7;
}

+ (id)syncPolicyForSearch
{
  return 0;
}

+ (id)storeConfigurationForSearch
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"WalletPaymentsCommerce.FinancialInsights.Search" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForRecurringSendSuggestions
{
  v3 = [a1 storeConfigurationForRecurringSendSuggestions];
  id v4 = [a1 syncPolicyForRecurringSendSuggestions];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C6A77134-628C-4A51-BB0C-98C1A3865397"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Passbook");

  return v7;
}

+ (id)syncPolicyForRecurringSendSuggestions
{
  return 0;
}

+ (id)storeConfigurationForRecurringSendSuggestions
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForPaymentRingSuggestions
{
  v3 = [a1 storeConfigurationForPaymentRingSuggestions];
  id v4 = [a1 syncPolicyForPaymentRingSuggestions];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DFFF090C-D0BB-4A47-AA2D-5A4C912E3E49"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.Passbook");

  return v7;
}

+ (id)syncPolicyForPaymentRingSuggestions
{
  return 0;
}

+ (id)storeConfigurationForPaymentRingSuggestions
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Search
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSearch];
  v3 = +[BMWalletPaymentsCommerceSearch columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"WalletPaymentsCommerce.FinancialInsights.Search" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"WalletPaymentsCommerce.FinancialInsights.Search" schema:v9 configuration:v2];

  return v10;
}

+ (id)RecurringSendSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForRecurringSendSuggestions];
  v3 = +[BMWalletPaymentsCommerceRecurringSendSuggestions columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions" schema:v9 configuration:v2];

  return v10;
}

+ (id)PaymentRingSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForPaymentRingSuggestions];
  v3 = +[BMWalletPaymentsCommercePaymentRingSuggestions columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions" schema:v9 configuration:v2];

  return v10;
}

@end