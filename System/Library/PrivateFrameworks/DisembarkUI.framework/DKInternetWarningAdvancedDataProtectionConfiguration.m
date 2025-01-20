@interface DKInternetWarningAdvancedDataProtectionConfiguration
- (BOOL)showNotableUserDataCardForFindMy;
- (id)confirmationContinueWithoutInternetButtonTitle;
- (id)confirmationTitle;
- (id)continueWithoutInternetButtonTintColor;
- (id)continueWithoutInternetButtonTitle;
- (id)detail;
- (id)imageName;
- (id)requireInternetButtonTitle;
- (id)title;
@end

@implementation DKInternetWarningAdvancedDataProtectionConfiguration

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)imageName
{
  return @"custom.key.shield.fill.trianglebadge.exclamationmark";
}

- (BOOL)showNotableUserDataCardForFindMy
{
  return 0;
}

- (id)detail
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)requireInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_REQUIRE_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)continueWithoutInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_CONTINUE_WITHOUT_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)continueWithoutInternetButtonTintColor
{
  return (id)[MEMORY[0x263F1C550] systemRedColor];
}

- (id)confirmationTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_CONFIRMATION_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)confirmationContinueWithoutInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_STRICT_CONFIRMATION_CONTINUE_WITHOUT_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

@end