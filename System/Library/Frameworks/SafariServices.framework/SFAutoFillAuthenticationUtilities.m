@interface SFAutoFillAuthenticationUtilities
+ (id)customAuthenticationTitleForFillingCreditCard;
+ (id)customAuthenticationTitleForFillingSavedPasskey;
+ (id)customAuthenticationTitleForFillingSavedPassword;
+ (id)customAuthenticationTitleForFillingTimeBasedOneTimeCode;
+ (id)customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:(id)a3;
+ (id)customAuthenticationTitleForViewingSavedAccounts;
+ (id)passcodePromptForFillingCreditCard;
+ (id)passcodePromptForFillingSavedAccount;
+ (id)passcodePromptForFillingTimeBasedOneTimeCode;
+ (id)passcodePromptForLoggingInWithSavedAccountOnWebsite:(id)a3;
+ (id)passcodePromptForViewingSavedAccounts;
@end

@implementation SFAutoFillAuthenticationUtilities

+ (id)passcodePromptForViewingSavedAccounts
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

+ (id)passcodePromptForFillingSavedAccount
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

+ (id)passcodePromptForFillingCreditCard
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

+ (id)passcodePromptForFillingTimeBasedOneTimeCode
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

+ (id)customAuthenticationTitleForViewingSavedAccounts
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingSavedPassword
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingSavedPasskey
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingCreditCard
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingTimeBasedOneTimeCode
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

+ (id)passcodePromptForLoggingInWithSavedAccountOnWebsite:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F98AA8];
  id v4 = a3;
  v5 = [v3 currentDevice];
  [v5 deviceClass];

  v6 = NSString;
  v7 = _WBSLocalizedString();
  v8 = objc_msgSend(v6, "stringWithFormat:", v7, v4);

  return v8;
}

@end