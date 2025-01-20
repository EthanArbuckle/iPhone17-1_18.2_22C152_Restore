@interface WFBooleanContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
- (id)allowedClassesForDecodingInternalRepresentations;
@end

@implementation WFBooleanContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 1;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Booleans");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Booleans", @"Booleans");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Boolean", @"Boolean");
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
  id v3 = [NSNumber numberWithBool:1];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = [v2 orderedSetWithObject:v4];

  return v5;
}

- (id)allowedClassesForDecodingInternalRepresentations
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end