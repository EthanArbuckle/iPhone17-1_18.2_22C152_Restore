@interface AKAppleIDAuthenticationController(TrustedContacts)
- (id)_authContextForAccount:()TrustedContacts forceInteraction:presentingViewController:;
- (id)_authContextForAccount:()TrustedContacts forceInteraction:verifyCredentialReason:presentingViewController:;
- (void)aaui_authenticateAccount:()TrustedContacts forceInteraction:presentingViewController:completion:;
- (void)aaui_beneficiaryAuthForAccount:()TrustedContacts presentingViewController:completion:;
- (void)aaui_beneficiaryViewAccessKeyForAccount:()TrustedContacts presentingViewController:completion:;
- (void)aaui_custodianAuthForAccount:()TrustedContacts presentingViewController:completion:;
@end

@implementation AKAppleIDAuthenticationController(TrustedContacts)

- (void)aaui_authenticateAccount:()TrustedContacts forceInteraction:presentingViewController:completion:
{
  id v10 = a6;
  id v11 = [a1 _authContextForAccount:a3 forceInteraction:a4 presentingViewController:a5];
  [a1 authenticateWithContext:v11 completion:v10];
}

- (void)aaui_custodianAuthForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8 = a5;
  id v9 = [a1 _authContextForAccount:a3 forceInteraction:1 verifyCredentialReason:2 presentingViewController:a4];
  [a1 authenticateWithContext:v9 completion:v8];
}

- (void)aaui_beneficiaryAuthForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8 = a5;
  id v9 = [a1 _authContextForAccount:a3 forceInteraction:1 verifyCredentialReason:1 presentingViewController:a4];
  [a1 authenticateWithContext:v9 completion:v8];
}

- (void)aaui_beneficiaryViewAccessKeyForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8 = a5;
  id v9 = [a1 _authContextForAccount:a3 forceInteraction:1 verifyCredentialReason:4 presentingViewController:a4];
  [a1 authenticateWithContext:v9 completion:v8];
}

- (id)_authContextForAccount:()TrustedContacts forceInteraction:presentingViewController:
{
  v7 = (objc_class *)MEMORY[0x263F292A8];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = [v9 username];
  [v10 setUsername:v11];

  v12 = objc_msgSend(v9, "aa_altDSID");

  [v10 setAltDSID:v12];
  [v10 setIsUsernameEditable:0];
  [v10 setServiceType:1];
  [v10 setPresentingViewController:v8];

  if (a4) {
    [v10 setAuthenticationType:2];
  }
  return v10;
}

- (id)_authContextForAccount:()TrustedContacts forceInteraction:verifyCredentialReason:presentingViewController:
{
  v7 = [a1 _authContextForAccount:a3 forceInteraction:a4 presentingViewController:a6];
  [v7 setVerifyCredentialReason:a5];
  return v7;
}

@end