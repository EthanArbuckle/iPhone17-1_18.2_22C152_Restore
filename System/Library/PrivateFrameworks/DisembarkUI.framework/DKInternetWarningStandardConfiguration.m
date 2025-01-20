@interface DKInternetWarningStandardConfiguration
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

@implementation DKInternetWarningStandardConfiguration

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)imageName
{
  return 0;
}

- (BOOL)showNotableUserDataCardForFindMy
{
  return 1;
}

- (id)detail
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)requireInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_REQUIRE_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)continueWithoutInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_CONTINUE_WITHOUT_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)continueWithoutInternetButtonTintColor
{
  return 0;
}

- (id)confirmationTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_CONFIRMATION_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

- (id)confirmationContinueWithoutInternetButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INTERNET_WARNING_CONFIRMATION_CONTINUE_WITHOUT_INTERNET_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  return v3;
}

@end