@interface LSApplicationExtensionRecord(FPUIAdditions)
+ (id)fpui_extensionRecordByFiltering:()FPUIAdditions useCase:isUIExtension:;
+ (id)fpui_extensionRecordForIdentifier:()FPUIAdditions useCase:isUIExtension:;
+ (id)fpui_extensionRecordForURL:()FPUIAdditions useCase:isUIExtension:;
+ (uint64_t)_fpui_exactPlatformRequiredExtensionUseCase:()FPUIAdditions isUIExtension:;
- (id)fpui_entitlementValueForKey:()FPUIAdditions ofClass:;
- (id)fpui_extensionInfoForKey:()FPUIAdditions ofClass:;
@end

@implementation LSApplicationExtensionRecord(FPUIAdditions)

+ (id)fpui_extensionRecordForIdentifier:()FPUIAdditions useCase:isUIExtension:
{
  v8 = (objc_class *)MEMORY[0x263F01858];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithBundleIdentifier:v9 error:0];

  v11 = objc_msgSend(a1, "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v10, a4, a5);

  return v11;
}

+ (id)fpui_extensionRecordForURL:()FPUIAdditions useCase:isUIExtension:
{
  v8 = (objc_class *)MEMORY[0x263F01858];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithURL:v9 error:0];

  v11 = objc_msgSend(a1, "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v10, a4, a5);

  return v11;
}

+ (id)fpui_extensionRecordByFiltering:()FPUIAdditions useCase:isUIExtension:
{
  id v8 = a3;
  if (v8
    && ((int v9 = objc_msgSend(a1, "_fpui_exactPlatformRequiredExtensionUseCase:isUIExtension:", a4, a5)) == 0
     || [v8 platform] == v9))
  {
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (uint64_t)_fpui_exactPlatformRequiredExtensionUseCase:()FPUIAdditions isUIExtension:
{
  if (!a4) {
    return 0;
  }
  v4 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  uint64_t v6 = [v4 platform];

  if ((v6 - 13) <= 0xFFFFFFFD) {
    return 0;
  }
  return v6;
}

- (id)fpui_extensionInfoForKey:()FPUIAdditions ofClass:
{
  id v4 = a3;
  v5 = [a1 infoDictionary];
  uint64_t v6 = [v5 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  v7 = [v6 objectForKey:v4];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)fpui_entitlementValueForKey:()FPUIAdditions ofClass:
{
  id v6 = a3;
  v7 = [a1 entitlements];
  id v8 = [v7 objectForKey:v6 ofClass:a4];

  return v8;
}

@end