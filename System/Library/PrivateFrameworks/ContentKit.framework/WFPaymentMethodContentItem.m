@interface WFPaymentMethodContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (INPaymentMethod)paymentMethod;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFPaymentMethodContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Payment Methods");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Payment Methods", @"Payment Methods");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Payment Method", @"Payment Method");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Scripting";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v7 = [(WFPaymentMethodContentItem *)self paymentMethod];
    v8 = [v7 name];
    v6 = +[WFObjectRepresentation object:v8];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (INPaymentMethod)paymentMethod
{
  uint64_t v3 = objc_opt_class();
  return (INPaymentMethod *)[(WFContentItem *)self objectForClass:v3];
}

@end