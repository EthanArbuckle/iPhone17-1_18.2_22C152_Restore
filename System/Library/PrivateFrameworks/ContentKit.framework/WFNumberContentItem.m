@interface WFNumberContentItem
+ (BOOL)supportsSecureCoding;
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithNumber:(id)a3 maximumFractionDigitsForDisplay:(id)a4;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)getListSubtitle:(id)a3;
- (NSNumber)maximumFractionDigitsForDisplay;
- (NSNumber)number;
- (WFNumberContentItem)initWithCoder:(id)a3;
- (id)roundedName;
- (void)copyStateToItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumFractionDigitsForDisplay:(id)a3;
@end

@implementation WFNumberContentItem

- (void).cxx_destruct
{
}

- (void)setMaximumFractionDigitsForDisplay:(id)a3
{
}

- (NSNumber)maximumFractionDigitsForDisplay
{
  return self->_maximumFractionDigitsForDisplay;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFNumberContentItem;
  id v4 = a3;
  [(WFContentItem *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(@"WFNumberContentItem", "stringByAppendingString:", @"maximumFractionDigitsForDisplay", v7.receiver, v7.super_class);
  v6 = [(WFNumberContentItem *)self maximumFractionDigitsForDisplay];
  [v4 encodeObject:v6 forKey:v5];
}

- (WFNumberContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFNumberContentItem;
  v5 = [(WFContentItem *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [@"WFNumberContentItem" stringByAppendingString:@"maximumFractionDigitsForDisplay"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v6];
    maximumFractionDigitsForDisplay = v5->_maximumFractionDigitsForDisplay;
    v5->_maximumFractionDigitsForDisplay = (NSNumber *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)copyStateToItem:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v7;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  v6 = [(WFNumberContentItem *)self maximumFractionDigitsForDisplay];
  [v5 setMaximumFractionDigitsForDisplay:v6];
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(WFContentItem *)self name];
  v6 = [(WFNumberContentItem *)self roundedName];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFNumberContentItem;
    unsigned int v9 = [(WFContentItem *)&v12 getListSubtitle:0];
    BOOL v8 = v9;
    if (v4 && v9)
    {
      v10 = [(WFNumberContentItem *)self roundedName];
      v4[2](v4, v10);

      BOOL v8 = 1;
    }
  }

  return v8;
}

- (id)roundedName
{
  v3 = [(WFNumberContentItem *)self number];
  id v4 = [(WFNumberContentItem *)self maximumFractionDigitsForDisplay];
  id v5 = [v3 wfNameWithMaximumFractionDigits:v4];

  return v5;
}

- (NSNumber)number
{
  uint64_t v3 = objc_opt_class();
  return (NSNumber *)[(WFContentItem *)self objectForClass:v3];
}

+ (int64_t)tableTemplateSubjectType
{
  return 3;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Numbers");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Numbers", @"Numbers");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Number", @"Number");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Scripting";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)itemWithNumber:(id)a3 maximumFractionDigitsForDisplay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFNumberContentItem.m", 41, @"Invalid parameter not satisfying: %@", @"number" object file lineNumber description];
  }
  unsigned int v9 = [v7 wfNameWithMaximumFractionDigits:v8];
  v10 = [a1 itemWithObject:v7 named:v9];
  [v10 setMaximumFractionDigitsForDisplay:v8];

  return v10;
}

+ (id)coercions
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  id v3 = +[WFCoercionHandler block:&__block_literal_global_21950];
  id v4 = +[WFCoercion coercionToClass:v2 handler:v3];
  v10[0] = v4;
  uint64_t v5 = objc_opt_class();
  v6 = +[WFCoercionHandler block:&__block_literal_global_14_21952];
  id v7 = +[WFCoercion coercionToClass:v5 handler:v6];
  v10[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

id __32__WFNumberContentItem_coercions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 roundedName];
  id v4 = [v2 name];

  uint64_t v5 = +[WFObjectRepresentation object:v3 named:v4];

  return v5;
}

id __32__WFNumberContentItem_coercions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F087B0];
  id v3 = a2;
  id v4 = [v3 number];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 decimalValue];
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    int v11 = 0;
  }
  v6 = [v2 decimalNumberWithDecimal:v10];
  id v7 = [v3 name];

  id v8 = +[WFObjectRepresentation object:v6 named:v7];

  return v8;
}

@end