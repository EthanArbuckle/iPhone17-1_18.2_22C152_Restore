@interface WFUlyssesSheetContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)sheet;
@end

@implementation WFUlyssesSheetContentItem

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A20];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Ulysses sheets");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Ulysses sheets", @"Ulysses sheets");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Ulysses sheet", @"Ulysses sheet");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x263F337E0];
  id v3 = [a1 propertyForName:@"Contents"];
  v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v21[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33808];
  v20 = WFLocalizedContentPropertyNameMarker(@"Title");
  v19 = [v2 keyPath:@"sheet.title" name:v20 class:objc_opt_class()];
  v21[0] = v19;
  id v3 = (void *)MEMORY[0x263F33808];
  v18 = WFLocalizedContentPropertyNameMarker(@"Identifier");
  v4 = [v3 keyPath:@"sheet.identifier" name:v18 class:objc_opt_class()];
  v21[1] = v4;
  v5 = (void *)MEMORY[0x263F33808];
  v6 = WFLocalizedContentPropertyNameMarker(@"Contents");
  v7 = [v5 keyPath:@"sheet.text" name:v6 class:objc_opt_class()];
  v21[2] = v7;
  v8 = (void *)MEMORY[0x263F33808];
  v9 = WFLocalizedContentPropertyNameMarker(@"Keywords");
  v10 = [v8 keyPath:@"sheet.keywords" name:v9 class:objc_opt_class()];
  v11 = [v10 multipleValues:1];
  v21[3] = v11;
  v12 = (void *)MEMORY[0x263F33808];
  v13 = WFLocalizedContentPropertyNameMarker(@"Notes");
  v14 = [v12 keyPath:@"sheet.notes" name:v13 class:objc_opt_class()];
  v15 = [v14 multipleValues:1];
  v21[4] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:5];

  return v16;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v7 = (void *)MEMORY[0x263F33908];
    v8 = [(WFUlyssesSheetContentItem *)self sheet];
    v9 = [v8 text];
    v10 = [(WFUlyssesSheetContentItem *)self name];
    v6 = [v7 object:v9 named:v10];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)sheet
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFUlyssesSheetContentItem *)self objectForClass:v3];
}

@end