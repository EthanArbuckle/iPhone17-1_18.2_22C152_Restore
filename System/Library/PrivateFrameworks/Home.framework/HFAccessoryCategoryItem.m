@interface HFAccessoryCategoryItem
- (HFAccessoryCategoryItem)initWithCategoryType:(id)a3;
- (NSString)categoryType;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCategoryType:(id)a3;
@end

@implementation HFAccessoryCategoryItem

- (HFAccessoryCategoryItem)initWithCategoryType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAccessoryCategoryItem;
  v6 = [(HFAccessoryCategoryItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_categoryType, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v5 = (void *)MEMORY[0x263F0DF00];
  v6 = [(HFAccessoryCategoryItem *)self categoryType];
  v7 = objc_msgSend(v5, "hf_userFriendlyLocalizedCapitalizedPluralDescription:", v6);

  [v4 setObject:v7 forKeyedSubscript:@"title"];
  v8 = [NSString stringWithFormat:@"Home.AccessoryCategory.%@", v7];
  [v4 setObject:v8 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  objc_super v9 = [(HFAccessoryCategoryItem *)self categoryType];
  v10 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:v9];
  [v4 setObject:v10 forKeyedSubscript:@"icon"];

  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v4 setObject:v13 forKeyedSubscript:@"dependentHomeKitClasses"];

  v14 = (void *)MEMORY[0x263F58190];
  v15 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HFAccessoryCategoryItem allocWithZone:a3];
  id v5 = [(HFAccessoryCategoryItem *)self categoryType];
  v6 = [(HFAccessoryCategoryItem *)v4 initWithCategoryType:v5];

  return v6;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end