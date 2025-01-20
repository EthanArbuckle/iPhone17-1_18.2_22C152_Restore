@interface WFWindowContentItem
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
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (WFWindow)window;
- (id)app;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)display;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFWindowContentItem

- (id)defaultSourceForRepresentation:(id)a3
{
  v3 = +[WFContentLocation windowsLocation];
  v4 = +[WFContentAttributionSet attributionSetWithOrigin:v3 disclosureLevel:0];

  return v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFWindowContentItem *)self app];
    v7 = +[WFObjectRepresentation object:v8];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v9 = [(WFWindowContentItem *)self window];
    v8 = [v9 image];

    if (v8)
    {
      v10 = [(WFContentItem *)self name];
      v7 = +[WFObjectRepresentation object:v8 named:v10];
    }
    else
    {
      v7 = 0;
    }
  }

LABEL_9:

  return v7;
}

- (id)display
{
  return 0;
}

- (id)app
{
  id v3 = objc_alloc(MEMORY[0x263F0F988]);
  v4 = [(WFWindowContentItem *)self window];
  v5 = [v4 bundleIdentifier];
  v6 = (void *)[v3 initWithBundleIdentifier:v5];

  v7 = [MEMORY[0x263F0F9B0] sharedResolver];
  v8 = [v7 resolvedAppMatchingDescriptor:v6];

  if (v8)
  {
    v9 = [WFApp alloc];
    v10 = [v8 bundleIdentifier];
    v11 = [v8 localizedName];
    v12 = [(WFApp *)v9 initWithBundleIdentifier:v10 localizedName:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFWindow)window
{
  uint64_t v3 = objc_opt_class();

  return (WFWindow *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Windows");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Windows", @"Windows");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Window", @"Window");
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
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count])
  {
    v14 = +[WFWindow allWindows];
    uint64_t v15 = objc_msgSend(v14, "if_map:", &__block_literal_global_226);

    id v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFWindowContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
}

WFWindowContentItem *__80__WFWindowContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

+ (id)propertyBuilders
{
  v27[10] = *MEMORY[0x263EF8340];
  v26 = WFLocalizedContentPropertyNameMarker(@"App Name");
  v25 = +[WFContentPropertyBuilder keyPath:@"window.applicationName" name:v26 class:objc_opt_class()];
  v27[0] = v25;
  v23 = WFLocalizedContentPropertyNameMarker(@"Is Hidden");
  v24 = [NSNumber numberWithBool:1];
  v22 = +[WFContentPropertyBuilder keyPath:@"window.isHidden" name:v23 class:objc_opt_class()];
  v21 = WFLocalizedContentPropertyNameMarker(@"Is Visible");
  v20 = [v22 negativeName:v21];
  v27[1] = v20;
  v19 = WFLocalizedContentPropertyNameMarker(@"Image");
  v18 = +[WFContentPropertyBuilder block:&__block_literal_global_6466 name:v19 class:objc_opt_class()];
  v27[2] = v18;
  v17 = WFLocalizedContentPropertyNameMarker(@"Width");
  objc_super v16 = +[WFContentPropertyBuilder block:&__block_literal_global_181_6468 name:v17 class:objc_opt_class()];
  v27[3] = v16;
  uint64_t v15 = WFLocalizedContentPropertyNameMarker(@"Height");
  v14 = +[WFContentPropertyBuilder block:&__block_literal_global_186 name:v15 class:objc_opt_class()];
  v27[4] = v14;
  v2 = WFLocalizedContentPropertyNameMarker(@"X Position");
  id v3 = +[WFContentPropertyBuilder block:&__block_literal_global_191_6470 name:v2 class:objc_opt_class()];
  v27[5] = v3;
  v4 = WFLocalizedContentPropertyNameMarker(@"Y Position");
  v5 = +[WFContentPropertyBuilder block:&__block_literal_global_196 name:v4 class:objc_opt_class()];
  v27[6] = v5;
  v6 = WFLocalizedContentPropertyNameMarker(@"Window Index");
  v7 = +[WFContentPropertyBuilder block:&__block_literal_global_201_6472 name:v6 class:objc_opt_class()];
  v27[7] = v7;
  v8 = WFLocalizedContentPropertyNameMarker(@"Display");
  v9 = +[WFContentPropertyBuilder keyPath:@"display" name:v8 class:objc_opt_class()];
  v27[8] = v9;
  id v10 = WFLocalizedContentPropertyNameMarker(@"App");
  id v11 = +[WFContentPropertyBuilder keyPath:@"app" name:v10 class:objc_opt_class()];
  v27[9] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:10];

  return v13;
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = a4;
  id v8 = [a2 window];
  v7 = [v8 windowIndex];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = NSNumber;
  v7 = a4;
  id v10 = [a2 window];
  [v10 position];
  v9 = [v6 numberWithDouble:v8];
  ((void (**)(void, void *))a4)[2](v7, v9);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = NSNumber;
  v7 = a4;
  id v9 = [a2 window];
  [v9 position];
  double v8 = objc_msgSend(v6, "numberWithDouble:");
  ((void (**)(void, void *))a4)[2](v7, v8);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = NSNumber;
  v7 = a4;
  id v10 = [a2 window];
  [v10 size];
  id v9 = [v6 numberWithDouble:v8];
  ((void (**)(void, void *))a4)[2](v7, v9);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = NSNumber;
  v7 = a4;
  id v9 = [a2 window];
  [v9 size];
  double v8 = objc_msgSend(v6, "numberWithDouble:");
  ((void (**)(void, void *))a4)[2](v7, v8);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = a4;
  id v8 = [a2 window];
  v7 = [v8 image];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

- (BOOL)getListAltText:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFWindowContentItem *)self window];
  v6 = NSString;
  [v5 size];
  unint64_t v8 = (unint64_t)v7;
  [v5 size];
  id v10 = objc_msgSend(v6, "stringWithFormat:", @"%lu×%lu", v8, (unint64_t)v9);
  if (v4) {
    v4[2](v4, v10);
  }

  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *, void *))a3;
  v6 = (void *)MEMORY[0x263F85308];
  double v7 = [(WFWindowContentItem *)self window];
  unint64_t v8 = [v7 bundleIdentifier];
  double v9 = [v6 applicationIconImageForBundleIdentifier:v8];

  if (v5)
  {
    if (v9)
    {
      uint64_t v13 = *MEMORY[0x263F85630];
      v14[0] = &unk_26C741FF8;
      BOOL v10 = 1;
      id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      v5[2](v5, v9, v11);
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = v9 != 0;
  }

  return v10;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(WFWindowContentItem *)self window];
    double v7 = [v6 applicationName];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

@end