@interface AASetupAssistantConfigResponse
- (AASetupAssistantConfigResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BOOL)setupAssistantServerEnabled;
- (NSString)aboutURL;
- (NSString)activeEmailDomain;
- (NSString)authenticateURL;
- (NSString)checkValidityURL;
- (NSString)createAppleIDURL;
- (NSString)createDelegateAccountsURL;
- (NSString)existingAppleIDTermsUIURL;
- (NSString)genericTermsURL;
- (NSString)iForgotUIURL;
- (NSString)iForgotURL;
- (NSString)loginDelegatesURL;
- (NSString)signingSessionCertURL;
- (NSString)signingSessionURL;
- (NSString)updateAppleIDURL;
- (NSString)upgradeIOSTermsUI;
- (NSString)upgradeStatusURL;
- (NSString)xmlUI;
@end

@implementation AASetupAssistantConfigResponse

- (AASetupAssistantConfigResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AASetupAssistantConfigResponse;
  v4 = [(AAResponse *)&v16 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];

    if (v6)
    {
      v7 = [(AAResponse *)v5 responseDictionary];
      v8 = [v7 objectForKey:@"urls"];
      uint64_t v9 = [v8 copy];
      urls = v5->_urls;
      v5->_urls = (NSDictionary *)v9;
    }
    else
    {
      v11 = _AALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Empty response for configuration plist", v15, 2u);
      }

      v7 = [MEMORY[0x1E4F1CA60] dictionary];
      v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"COMMUNICATIONS_ERROR" value:&stru_1EF456870 table:@"Localizable"];
      [v7 setObject:v13 forKey:*MEMORY[0x1E4F28568]];

      v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:0 userInfo:v7];
      [(AAResponse *)v5 setError:v8];
    }
  }
  return v5;
}

- (NSString)signingSessionCertURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:@"qualifyCert"];
}

- (NSString)signingSessionURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:@"qualifySession"];
}

- (NSString)xmlUI
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantXMLUIKey];
}

- (NSString)aboutURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantAboutURLKey];
}

- (NSString)authenticateURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantAuthenticateURLKey];
}

- (NSString)createAppleIDURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantCreateAppleIDURLKey];
}

- (NSString)updateAppleIDURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantUpdateAppleIDURLKey];
}

- (NSString)createDelegateAccountsURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantCreateDelegateAccountsURLKey];
}

- (NSString)checkValidityURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantCheckValidityURLKey];
}

- (NSString)iForgotURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantIForgotURLKey];
}

- (NSString)existingAppleIDTermsUIURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantExistingAppleIDTermsUIURLKey];
}

- (NSString)loginDelegatesURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantLoginDelegatesURLKey];
}

- (NSString)upgradeIOSTermsUI
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantUpgradeiOSTermsUIURLKey];
}

- (NSString)genericTermsURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:@"genericTermsUI"];
}

- (NSString)upgradeStatusURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantUpgradeStatusURLKey];
}

- (BOOL)setupAssistantServerEnabled
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantServerEnabledKey];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)activeEmailDomain
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantActiveEmailDomainKey];

  return (NSString *)v3;
}

- (NSString)iForgotUIURL
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:AASetupAssistantiForgotUIURLKey];
}

- (void).cxx_destruct
{
}

@end