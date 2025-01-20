@interface AAAccountRecoveryManagementViewModel
- (NSString)appleDataRecoveryLabel;
- (NSString)details;
- (NSString)detailsForIneligibleAccount;
- (NSString)learnMore;
- (NSString)myRecoveryContactsAdd;
- (NSString)myRecoveryContactsFooter;
- (NSString)myRecoveryContactsFooterForIneligibleAccount;
- (NSString)myRecoveryContactsGroupTitle;
- (NSString)printableSummaryFooter;
- (NSString)printableSummaryLabel;
- (NSString)recoveryContactForGroupTitle;
- (NSString)recoveryKeyDetails;
- (NSString)recoveryKeyLabel;
- (NSString)title;
- (NSURL)footerLearnMoreURL;
- (NSURL)learnMoreURL;
- (NSURL)recoveryKeyLearnMoreURL;
- (id)recoveryKeyStatusText:(BOOL)a3;
@end

@implementation AAAccountRecoveryManagementViewModel

- (NSString)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)details
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_DETAILS" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)detailsForIneligibleAccount
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_DETAILS_FOR_INELIGIBLE_ACCOUNT" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)learnMore
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"LEARN_MORE_ELIPSES" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSURL)learnMoreURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT202303"];
}

- (NSString)appleDataRecoveryLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_APPLE_DATA_RECOVERY" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)myRecoveryContactsGroupTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_MY_CONTACTS_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)myRecoveryContactsAdd
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_MY_CONTACTS_ADD" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)myRecoveryContactsFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_MY_CONTACTS_FOOTER" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)myRecoveryContactsFooterForIneligibleAccount
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_MY_CONTACTS_FOOTER_FOR_INELIGIBLE_ACCOUNT" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSURL)footerLearnMoreURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v4 = [v3 localizedStringForKey:@"ACCOUNT_RECOVERY_MY_CONTACTS_LEARN_MORE_URL" value:0 table:@"Localizable"];
  v5 = [v2 URLWithString:v4];

  return (NSURL *)v5;
}

- (NSString)recoveryContactForGroupTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_CONTACT_FOR_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)recoveryKeyLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_RECOVERY_KEY_LABEL" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)recoveryKeyDetails
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"ACCOUNT_RECOVERY_RECOVERY_KEY_DETAILS" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (id)recoveryKeyStatusText:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v5 = v4;
  if (v3) {
    v6 = @"ACCOUNT_RECOVERY_RECOVERY_KEY_ON";
  }
  else {
    v6 = @"ACCOUNT_RECOVERY_RECOVERY_KEY_OFF";
  }
  v7 = [v4 localizedStringForKey:v6 value:0 table:@"Localizable"];

  return v7;
}

- (NSURL)recoveryKeyLearnMoreURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v4 = [v3 localizedStringForKey:@"ACCOUNT_RECOVERY_RECOVERY_KEY_LEARN_MORE_URL" value:0 table:@"Localizable"];
  v5 = [v2 URLWithString:v4];

  return (NSURL *)v5;
}

- (NSString)printableSummaryLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  BOOL v3 = [v2 localizedStringForKey:@"PRINT_ACCOUNT_ACCESS_SUMMARY_BUTTON_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)printableSummaryFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  BOOL v3 = [v2 localizedStringForKey:@"PRINT_ACCOUNT_ACCESS_SUMMARY_BUTTON_FOOTER" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

@end