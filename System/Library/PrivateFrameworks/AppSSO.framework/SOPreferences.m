@interface SOPreferences
+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4;
+ (BOOL)isAssociatedDomainValidated;
+ (BOOL)isExtensionSignatureValidated;
@end

@implementation SOPreferences

+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  v5 = (void *)CFPreferencesCopyValue(a3, @"com.apple.AppSSO", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

+ (BOOL)isExtensionSignatureValidated
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SOPreferences_isExtensionSignatureValidated__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isExtensionSignatureValidated_onceToken != -1) {
    dispatch_once(&isExtensionSignatureValidated_onceToken, block);
  }
  return isExtensionSignatureValidated_extensionSignatureValidated;
}

void __46__SOPreferences_isExtensionSignatureValidated__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([getSOUtilsClass_0() isInternalBuild])
  {
    CFPreferencesSynchronize(@"com.apple.AppSSO", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    char v2 = [*(id *)(a1 + 32) BOOLValueForKey:@"ExtensionSignatureValidated" defaultValue:1];
  }
  else
  {
    char v2 = 1;
  }
  isExtensionSignatureValidated_extensionSignatureValidated = v2;
  v3 = SO_LOG_SOPreferences();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (isExtensionSignatureValidated_extensionSignatureValidated) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    int v5 = 136446210;
    v6 = v4;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "extensionSignatureValidated=%{public}s", (uint8_t *)&v5, 0xCu);
  }
}

+ (BOOL)isAssociatedDomainValidated
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SOPreferences_isAssociatedDomainValidated__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAssociatedDomainValidated_onceToken != -1) {
    dispatch_once(&isAssociatedDomainValidated_onceToken, block);
  }
  return isAssociatedDomainValidated_associatedDomainValidated;
}

void __44__SOPreferences_isAssociatedDomainValidated__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([getSOUtilsClass_0() isInternalBuild])
  {
    CFPreferencesSynchronize(@"com.apple.AppSSO", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    char v2 = [*(id *)(a1 + 32) BOOLValueForKey:@"AssociatedDomainValidated" defaultValue:1];
  }
  else
  {
    char v2 = 1;
  }
  isAssociatedDomainValidated_associatedDomainValidated = v2;
  v3 = SO_LOG_SOPreferences();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (isAssociatedDomainValidated_associatedDomainValidated) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    int v5 = 136446210;
    v6 = v4;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "associatedDomainValidated=%{public}s", (uint8_t *)&v5, 0xCu);
  }
}

@end