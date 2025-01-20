@interface WFAppContentItem
+ (BOOL)hasLibrary;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (int64_t)tableTemplateSubjectType;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (LNValue)intentApplication;
- (WFApp)app;
- (id)displays;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)windows;
@end

@implementation WFAppContentItem

- (id)displays
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)windows
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(WFAppContentItem *)self app];
  v3 = [v2 bundleIdentifier];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = +[WFWindow allWindowsForBundleIdentifiers:v4];

  return v5;
}

- (WFApp)app
{
  uint64_t v3 = objc_opt_class();
  return (WFApp *)[(WFContentItem *)self objectForClass:v3];
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFAppContentItem *)self windows];
    v7 = +[WFObjectRepresentation objects:v8];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_7;
    }
    v8 = [(WFAppContentItem *)self intentApplication];
    v11[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v7 = +[WFObjectRepresentation objects:v9];
  }
LABEL_7:
  return v7;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFAppContentItem *)self app];
    v9 = [v8 localizedName];
    if (v9)
    {
      v10 = [(WFAppContentItem *)self app];
      v11 = [v10 localizedName];
      v7 = +[WFObjectRepresentation object:v11];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v8 = [(WFAppContentItem *)self intentApplication];
    v7 = +[WFObjectRepresentation object:v8];
  }

LABEL_10:
  return v7;
}

+ (int64_t)tableTemplateSubjectType
{
  return 9;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Apps");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"apps-type-description", @"Apps");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"App", @"App");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Sharing";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  v7 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count])
  {
    v14 = +[WFApp allApps];
    uint64_t v15 = objc_msgSend(v14, "if_map:", &__block_literal_global_7718);

    id v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFAppContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
}

WFAppContentItem *__77__WFAppContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v35[10] = *MEMORY[0x263EF8340];
  v33 = WFLocalizedContentPropertyNameMarker(@"Is Running");
  v34 = [NSNumber numberWithBool:1];
  v32 = +[WFContentPropertyBuilder keyPath:@"app.isRunning" name:v33 class:objc_opt_class()];
  v31 = WFLocalizedContentPropertyNameMarker(@"Is Not Running");
  v30 = [v32 negativeName:v31];
  v35[0] = v30;
  v28 = WFLocalizedContentPropertyNameMarker(@"Is Hidden");
  v29 = [NSNumber numberWithBool:1];
  v27 = +[WFContentPropertyBuilder keyPath:@"app.isHidden" name:v28 class:objc_opt_class()];
  v26 = WFLocalizedContentPropertyNameMarker(@"Is Visible");
  v25 = [v27 negativeName:v26];
  v35[1] = v25;
  v23 = WFLocalizedContentPropertyNameMarker(@"Is Frontmost");
  v24 = [NSNumber numberWithBool:1];
  v22 = +[WFContentPropertyBuilder keyPath:@"app.isFrontmost" name:v23 class:objc_opt_class()];
  v21 = WFLocalizedContentPropertyNameMarker(@"Is Not Frontmost");
  v20 = [v22 negativeName:v21];
  v35[2] = v20;
  v19 = WFLocalizedContentPropertyNameMarker(@"Icon");
  v18 = +[WFContentPropertyBuilder keyPath:@"app.icon" name:v19 class:objc_opt_class()];
  v35[3] = v18;
  v17 = WFLocalizedContentPropertyNameMarker(@"Bundle Identifier");
  objc_super v16 = +[WFContentPropertyBuilder keyPath:@"app.bundleIdentifier" name:v17 class:objc_opt_class()];
  v35[4] = v16;
  uint64_t v15 = WFLocalizedContentPropertyNameMarker(@"Process Identifier");
  v14 = +[WFContentPropertyBuilder keyPath:@"app.processIdentifier" name:v15 class:objc_opt_class()];
  v35[5] = v14;
  v2 = WFLocalizedContentPropertyNameMarker(@"Bundle Path");
  id v3 = +[WFContentPropertyBuilder keyPath:@"app.bundleURL" name:v2 class:objc_opt_class()];
  v35[6] = v3;
  v4 = WFLocalizedContentPropertyNameMarker(@"Launch Date");
  v5 = +[WFContentPropertyBuilder keyPath:@"app.launchDate" name:v4 class:objc_opt_class()];
  v35[7] = v5;
  v6 = WFLocalizedContentPropertyNameMarker(@"Windows");
  v7 = +[WFContentPropertyBuilder keyPath:@"windows" name:v6 class:objc_opt_class()];
  v8 = [v7 multipleValues:1];
  v35[8] = v8;
  v9 = WFLocalizedContentPropertyNameMarker(@"Displays");
  id v10 = +[WFContentPropertyBuilder keyPath:@"displays" name:v9 class:objc_opt_class()];
  id v11 = [v10 multipleValues:1];
  v35[9] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:10];

  return v13;
}

- (LNValue)intentApplication
{
  id v3 = objc_alloc(MEMORY[0x263F521B0]);
  v4 = [(WFAppContentItem *)self app];
  v5 = [v4 bundleIdentifier];
  v6 = [MEMORY[0x263F52088] applicationValueType];
  v7 = (void *)[v3 initWithValue:v5 valueType:v6];

  return (LNValue *)v7;
}

@end