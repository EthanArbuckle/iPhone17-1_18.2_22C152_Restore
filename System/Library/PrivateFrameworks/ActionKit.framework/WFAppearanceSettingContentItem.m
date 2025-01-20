@interface WFAppearanceSettingContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFAppearanceSettingValue)settingValue;
@end

@implementation WFAppearanceSettingContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d appearances");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Appearances", @"Appearances");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Appearance", @"Appearance");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A38];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  return (id)[MEMORY[0x263EFF9D8] orderedSet];
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33808];
  id v3 = WFLocalizedContentPropertyNameMarker(@"Dark Mode Is On");
  v4 = [NSNumber numberWithBool:1];
  v5 = [v2 keyPath:@"settingValue.isDarkModeOn" name:v3 class:objc_opt_class()];
  v6 = WFLocalizedContentPropertyNameMarker(@"Light Mode Is On");
  v7 = [v5 negativeName:v6];
  v13[0] = v7;
  v8 = (void *)MEMORY[0x263F33808];
  v9 = WFLocalizedContentPropertyNameMarker(@"Inverse Appearance");
  v10 = [v8 keyPath:@"settingValue.valueByInvertingSetting" name:v9 class:objc_opt_class()];
  v13[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

- (WFAppearanceSettingValue)settingValue
{
  uint64_t v3 = objc_opt_class();
  return (WFAppearanceSettingValue *)[(WFAppearanceSettingContentItem *)self objectForClass:v3];
}

@end