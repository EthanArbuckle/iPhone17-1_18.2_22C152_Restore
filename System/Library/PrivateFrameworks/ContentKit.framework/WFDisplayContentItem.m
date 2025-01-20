@interface WFDisplayContentItem
+ (BOOL)hasLibrary;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (WFDisplay)display;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFDisplayContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Displays");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Displays", @"Displays");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Display", @"Display");
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
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFDisplayContentItem;
  objc_msgSendSuper2(&v6, sel_runQuery_withItems_permissionRequestor_completionHandler_, a3, a4, a5, a6);
}

+ (id)propertyBuilders
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v3 = +[WFContentLocation windowsLocation];
  v4 = +[WFContentAttributionSet attributionSetWithOrigin:v3 disclosureLevel:1];

  return v4;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (WFDisplay)display
{
  uint64_t v3 = objc_opt_class();
  return (WFDisplay *)[(WFContentItem *)self objectForClass:v3];
}

@end