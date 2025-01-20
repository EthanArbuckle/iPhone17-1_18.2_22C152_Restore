@interface ASCredentialRequestSecurityKeyStringUtilities
+ (NSString)activateSecurityKeyAgainMessageText;
+ (id)_basicAssertionMessageTextWithPresentationContext:(id)a3;
+ (id)_multipleAllowedSecurityKeysMessageTextWithPresentationContext:(id)a3;
+ (id)_registerSecurityKeyMessageTextWithPresentationContext:(id)a3;
+ (id)messageWithPresentationContext:(id)a3;
+ (id)titleWithPresentationContext:(id)a3;
@end

@implementation ASCredentialRequestSecurityKeyStringUtilities

+ (id)titleWithPresentationContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 overrideTitle];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 overrideTitle];
  }
  else
  {
    [v3 isRegistrationRequest];

    v6 = _WBSLocalizedString();
  }

  return v6;
}

+ (id)messageWithPresentationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 overrideSubtitle];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 overrideSubtitle];
  }
  else if ([v4 isRegistrationRequest])
  {
    uint64_t v7 = [a1 _registerSecurityKeyMessageTextWithPresentationContext:v4];
  }
  else
  {
    v8 = [v4 allowedCredentialsForSecurityKeyAssertion];
    unint64_t v9 = [v8 count];

    if (v9 < 2) {
      [a1 _basicAssertionMessageTextWithPresentationContext:v4];
    }
    else {
    uint64_t v7 = [a1 _multipleAllowedSecurityKeysMessageTextWithPresentationContext:v4];
    }
  }
  v10 = (void *)v7;

  return v10;
}

+ (NSString)activateSecurityKeyAgainMessageText
{
  v2 = [MEMORY[0x263F66290] currentDevice];
  [v2 deviceClass];

  id v3 = _WBSLocalizedString();

  return (NSString *)v3;
}

+ (id)_registerSecurityKeyMessageTextWithPresentationContext:(id)a3
{
  id v3 = (void *)MEMORY[0x263F66290];
  id v4 = a3;
  uint64_t v5 = [v3 currentDevice];
  [v5 deviceClass];

  uint64_t v6 = NSString;
  uint64_t v7 = _WBSLocalizedString();
  v8 = [v4 serviceName];

  unint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);

  return v9;
}

+ (id)_multipleAllowedSecurityKeysMessageTextWithPresentationContext:(id)a3
{
  id v3 = (void *)MEMORY[0x263F66290];
  id v4 = a3;
  uint64_t v5 = [v3 currentDevice];
  [v5 deviceClass];

  uint64_t v6 = NSString;
  uint64_t v7 = _WBSLocalizedString();
  v8 = [v4 serviceName];

  unint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);

  return v9;
}

+ (id)_basicAssertionMessageTextWithPresentationContext:(id)a3
{
  id v3 = (void *)MEMORY[0x263F66290];
  id v4 = a3;
  uint64_t v5 = [v3 currentDevice];
  [v5 deviceClass];

  uint64_t v6 = NSString;
  uint64_t v7 = _WBSLocalizedString();
  v8 = [v4 serviceName];

  unint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);

  return v9;
}

@end