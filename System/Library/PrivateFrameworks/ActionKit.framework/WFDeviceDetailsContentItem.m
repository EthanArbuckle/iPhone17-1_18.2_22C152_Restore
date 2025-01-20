@interface WFDeviceDetailsContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFDevice)device;
- (id)screenHeight;
- (id)screenWidth;
@end

@implementation WFDeviceDetailsContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Device Details");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Device Details", @"Device Details");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Device Detail", @"Device Detail");
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

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v35[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33808];
  v34 = WFLocalizedContentPropertyNameMarker(@"OS");
  v32 = [v2 block:&__block_literal_global_33242 name:v34 class:objc_opt_class()];
  v33 = WFDevicePossiblePlatformsTypeMapping();
  v31 = [v33 allValues];
  v30 = [v32 possibleValues:v31];
  v35[0] = v30;
  id v3 = (void *)MEMORY[0x263F33808];
  v29 = WFLocalizedContentPropertyNameMarker(@"Device Type");
  v27 = [v3 block:&__block_literal_global_14 name:v29 class:objc_opt_class()];
  v28 = WFDevicePossibleIdiomsTypeMapping();
  v26 = [v28 allValues];
  v25 = [v27 possibleValues:v26];
  v35[1] = v25;
  v4 = (void *)MEMORY[0x263F33808];
  v24 = WFLocalizedContentPropertyNameMarker(@"System Version");
  v23 = [v4 keyPath:@"device.systemVersion" name:v24 class:objc_opt_class()];
  v35[2] = v23;
  v5 = (void *)MEMORY[0x263F33808];
  v22 = WFLocalizedContentPropertyNameMarker(@"System Build Number");
  v21 = [v5 keyPath:@"device.systemBuildNumber" name:v22 class:objc_opt_class()];
  v35[3] = v21;
  v20 = [MEMORY[0x263F33808] block:&__block_literal_global_31 name:@"Device Model" class:objc_opt_class()];
  v35[4] = v20;
  v6 = (void *)MEMORY[0x263F33808];
  v7 = WFLocalizedContentPropertyNameMarker(@"Device Hostname");
  v8 = [v6 keyPath:@"device.hostname" name:v7 class:objc_opt_class()];
  v35[5] = v8;
  v9 = (void *)MEMORY[0x263F33808];
  v10 = WFLocalizedContentPropertyNameMarker(@"Screen Width");
  v11 = [v9 keyPath:@"screenWidth" name:v10 class:objc_opt_class()];
  v35[6] = v11;
  v12 = (void *)MEMORY[0x263F33808];
  v13 = WFLocalizedContentPropertyNameMarker(@"Screen Height");
  v14 = [v12 keyPath:@"screenHeight" name:v13 class:objc_opt_class()];
  v35[7] = v14;
  v15 = [MEMORY[0x263F33808] block:&__block_literal_global_54 name:@"Current Volume" class:objc_opt_class()];
  v35[8] = v15;
  v16 = [MEMORY[0x263F33808] block:&__block_literal_global_59 name:@"Current Brightness" class:objc_opt_class()];
  v35[9] = v16;
  v17 = [MEMORY[0x263F33808] block:&__block_literal_global_65 name:@"Current Appearance" class:objc_opt_class()];
  v35[10] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:11];

  return v18;
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = [a2 device];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_8;
  v8[3] = &unk_264E5A440;
  id v9 = v5;
  id v7 = v5;
  [v6 getAppearanceWithCompletion:v8];
}

uint64_t __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = [a2 device];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_6;
  v8[3] = &unk_264E5A418;
  id v9 = v5;
  id v7 = v5;
  [v6 getBrightnessWithCompletion:v8];
}

uint64_t __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = [a2 device];
  uint64_t v8 = 0;
  id v7 = [v6 volumeWithError:&v8];

  v5[2](v5, v7);
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = a4;
  id v8 = [a2 device];
  id v7 = [v8 model];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = a4;
  id v7 = a2;
  WFDevicePossibleIdiomsTypeMapping();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = NSNumber;
  id v9 = [v7 device];

  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "idiom"));
  v11 = [v12 objectForKey:v10];
  ((void (**)(void, void *))a4)[2](v6, v11);
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  v6 = a4;
  id v7 = a2;
  WFDevicePossiblePlatformsTypeMapping();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = NSNumber;
  id v9 = [v7 device];

  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "platform"));
  v11 = [v12 objectForKey:v10];
  ((void (**)(void, void *))a4)[2](v6, v11);
}

- (id)screenHeight
{
  v2 = NSNumber;
  id v3 = [(WFDeviceDetailsContentItem *)self device];
  [v3 screenBounds];
  id v5 = [v2 numberWithDouble:v4];

  return v5;
}

- (id)screenWidth
{
  v2 = NSNumber;
  id v3 = [(WFDeviceDetailsContentItem *)self device];
  [v3 screenBounds];
  id v5 = [v2 numberWithDouble:v4];

  return v5;
}

- (WFDevice)device
{
  uint64_t v3 = objc_opt_class();
  return (WFDevice *)[(WFDeviceDetailsContentItem *)self objectForClass:v3];
}

@end