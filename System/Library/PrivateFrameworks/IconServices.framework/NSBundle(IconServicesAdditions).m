@interface NSBundle(IconServicesAdditions)
+ (id)__IS__frameworkBundle;
+ (id)__IS__frameworkLocalizedString:()IconServicesAdditions;
+ (id)__IS__iconsetResourceAssetsCatalogURL;
+ (id)__IS__iconsetResourceBundle;
@end

@implementation NSBundle(IconServicesAdditions)

+ (id)__IS__frameworkBundle
{
  if (__IS__frameworkBundle_onceToken != -1) {
    dispatch_once(&__IS__frameworkBundle_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)__IS__frameworkBundle_frameworkBundle;
  return v0;
}

+ (id)__IS__iconsetResourceBundle
{
  if (__IS__iconsetResourceBundle_onceToken != -1) {
    dispatch_once(&__IS__iconsetResourceBundle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)__IS__iconsetResourceBundle_resourceBundle;
  return v0;
}

+ (id)__IS__iconsetResourceAssetsCatalogURL
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "__IS__iconsetResourceBundle");
  v1 = [v0 URLForResource:@"Assets" withExtension:@"car"];

  return v1;
}

+ (id)__IS__frameworkLocalizedString:()IconServicesAdditions
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = objc_msgSend(v3, "__IS__frameworkBundle");
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F06391F0 table:0];

  return v6;
}

@end