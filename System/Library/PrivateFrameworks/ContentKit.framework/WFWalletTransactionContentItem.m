@interface WFWalletTransactionContentItem
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFWalletTransaction)transaction;
- (id)defaultSourceForRepresentation:(id)a3;
@end

@implementation WFWalletTransactionContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Transactions");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Transactions", @"Transactions");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Transaction", @"Transaction");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

+ (id)coercions
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  id v3 = +[WFCoercionHandler keyPath:@"transaction.transactionDescription"];
  v4 = +[WFCoercion coercionToClass:v2 handler:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[WFCoercionHandler keyPath:@"transaction.currencyAmount", v4];
  v7 = +[WFCoercion coercionToClass:v5 handler:v6];
  v13[1] = v7;
  uint64_t v8 = objc_opt_class();
  v9 = +[WFCoercionHandler keyPath:@"transaction.paymentMethod"];
  v10 = +[WFCoercion coercionToClass:v8 handler:v9];
  v13[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

  return v11;
}

+ (id)propertyBuilders
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLocalizedContentPropertyNameMarker(@"Card or Pass");
  id v3 = +[WFContentPropertyBuilder keyPath:@"transaction.paymentMethod" name:v2 class:objc_opt_class()];
  v4 = WFLocalizedContentPropertyNameMarker(@"Merchant");
  uint64_t v5 = +[WFContentPropertyBuilder keyPath:@"transaction.merchant.displayName", v4, objc_opt_class(), v3 name class];
  v10[1] = v5;
  v6 = WFLocalizedContentPropertyNameMarker(@"Amount");
  v7 = +[WFContentPropertyBuilder keyPath:@"transaction.currencyAmount" name:v6 class:objc_opt_class()];
  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];

  return v8;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  uint64_t v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F855E8]];
  v6 = [(WFContentItem *)self cachingIdentifier];
  v7 = +[WFContentAttributionSet attributionSetWithAppDescriptor:v5 disclosureLevel:1 originalItemIdentifier:v6];

  return v7;
}

- (WFWalletTransaction)transaction
{
  uint64_t v3 = objc_opt_class();
  return (WFWalletTransaction *)[(WFContentItem *)self objectForClass:v3];
}

@end