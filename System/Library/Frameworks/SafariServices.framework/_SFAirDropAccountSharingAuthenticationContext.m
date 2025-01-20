@interface _SFAirDropAccountSharingAuthenticationContext
- (BOOL)hasBeenAuthenticated;
- (BOOL)showsAuthenticationPromptAsTitle;
- (NSDictionary)customLocalAuthenticationOptions;
- (NSString)authenticationPrompt;
- (WBSSavedAccount)savedAccount;
- (_SFAirDropAccountSharingAuthenticationContext)initWithSavedAccount:(id)a3;
- (id)_localAuthenticationOptionsForSharingPasskeyWithAirDrop;
- (id)_localAuthenticationOptionsForSharingPasswordWithAirDrop;
- (id)_passcodeTitleForSharingPasskeyWithAirDrop;
- (id)_passcodeTitleForSharingPasswordWithAirDrop;
- (void)setHasBeenAuthenticated:(BOOL)a3;
@end

@implementation _SFAirDropAccountSharingAuthenticationContext

- (_SFAirDropAccountSharingAuthenticationContext)initWithSavedAccount:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAirDropAccountSharingAuthenticationContext;
  v6 = [(_SFAirDropAccountSharingAuthenticationContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_savedAccount, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_localAuthenticationOptionsForSharingPasskeyWithAirDrop
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EFBDEBF0;
  v2 = [(_SFAirDropAccountSharingAuthenticationContext *)self _passcodeTitleForSharingPasskeyWithAirDrop];
  v6[1] = &unk_1EFBDEC08;
  v7[0] = v2;
  v3 = _WBSLocalizedString();
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_localAuthenticationOptionsForSharingPasswordWithAirDrop
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EFBDEBF0;
  v2 = [(_SFAirDropAccountSharingAuthenticationContext *)self _passcodeTitleForSharingPasswordWithAirDrop];
  v6[1] = &unk_1EFBDEC08;
  v7[0] = v2;
  v3 = _WBSLocalizedString();
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_passcodeTitleForSharingPasskeyWithAirDrop
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

- (id)_passcodeTitleForSharingPasswordWithAirDrop
{
  v2 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v2 deviceClass];

  v3 = _WBSLocalizedString();

  return v3;
}

- (NSDictionary)customLocalAuthenticationOptions
{
  if (([(WBSSavedAccount *)self->_savedAccount credentialTypes] & 2) != 0) {
    [(_SFAirDropAccountSharingAuthenticationContext *)self _localAuthenticationOptionsForSharingPasskeyWithAirDrop];
  }
  else {
  v3 = [(_SFAirDropAccountSharingAuthenticationContext *)self _localAuthenticationOptionsForSharingPasswordWithAirDrop];
  }

  return (NSDictionary *)v3;
}

- (BOOL)showsAuthenticationPromptAsTitle
{
  return 0;
}

- (NSString)authenticationPrompt
{
  return (NSString *)&stru_1EFB97EB8;
}

- (BOOL)hasBeenAuthenticated
{
  return self->_hasBeenAuthenticated;
}

- (void)setHasBeenAuthenticated:(BOOL)a3
{
  self->_hasBeenAuthenticated = a3;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (void).cxx_destruct
{
}

@end