@interface ACAccount(AppleIDAuthentication)
- (id)_expirationCheckedTokenForCredential:()AppleIDAuthentication;
- (id)aida_alternateDSID;
- (id)aida_deviceProvisioningInfo;
- (id)aida_dsid;
- (id)aida_tokenForService:()AppleIDAuthentication;
- (id)aida_tokenWithExpirationCheck;
- (id)aida_tokenWithExpiryCheckForService:()AppleIDAuthentication;
- (void)_performSilentReauthForAccount:()AppleIDAuthentication completionHandler:;
- (void)aida_tokenForService:()AppleIDAuthentication completionHandler:;
@end

@implementation ACAccount(AppleIDAuthentication)

- (id)aida_tokenForService:()AppleIDAuthentication
{
  id v4 = a3;
  v5 = [a1 accountStore];
  v6 = [v5 credentialForAccount:a1 serviceID:v4];

  v7 = [v6 token];

  return v7;
}

- (id)aida_tokenWithExpiryCheckForService:()AppleIDAuthentication
{
  id v4 = a3;
  v5 = [a1 accountStore];
  v6 = [v5 credentialForAccount:a1 serviceID:v4];

  v7 = [a1 _expirationCheckedTokenForCredential:v6];

  return v7;
}

- (void)aida_tokenForService:()AppleIDAuthentication completionHandler:
{
  id v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "aida_tokenWithExpiryCheckForService:", v6);
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8, 0);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__ACAccount_AppleIDAuthentication__aida_tokenForService_completionHandler___block_invoke;
    v9[3] = &unk_1E6CBEB28;
    v11 = v7;
    id v10 = v6;
    [a1 _performSilentReauthForAccount:a1 completionHandler:v9];
  }
}

- (id)aida_tokenWithExpirationCheck
{
  v2 = [a1 credential];
  v3 = [a1 _expirationCheckedTokenForCredential:v2];

  return v3;
}

- (id)aida_alternateDSID
{
  v2 = [a1 accountPropertyForKey:@"altDSID"];
  if (!v2)
  {
    v2 = [a1 accountPropertyForKey:@"adsid"];
  }
  return v2;
}

- (id)aida_dsid
{
  v1 = [a1 accountPropertyForKey:@"dsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 stringValue];
  }
  else
  {
    id v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (id)aida_deviceProvisioningInfo
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(a1, "aida_dsid");
  v3 = (void *)MEMORY[0x1E4F28FE8];
  id v4 = objc_msgSend(a1, "aida_dsid");
  v5 = [v3 scannerWithString:v4];

  uint64_t v23 = 0;
  [v5 scanUnsignedLongLong:&v23];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v20 = 0;
  qi864985u0(v23, (uint64_t)&v22, (uint64_t)&v20 + 4, (uint64_t)&v21, (uint64_t)&v20);
  if (v6)
  {
    int v7 = v6;
    if (v6 == -45061)
    {
      v8 = _AIDALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Account not provisioned";
        id v10 = v8;
        uint32_t v11 = 2;
LABEL_14:
        _os_log_impl(&dword_1DD36A000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      v8 = _AIDALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v7;
        v9 = "ADIOTPRequest failed. ERROR: %d";
        id v10 = v8;
        uint32_t v11 = 8;
        goto LABEL_14;
      }
    }
    v18 = 0;
    goto LABEL_16;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v8 = [v12 initWithBytesNoCopy:v22 length:HIDWORD(v20) freeWhenDone:0];
  id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v14 = (void *)[v13 initWithBytesNoCopy:v21 length:v20 freeWhenDone:0];
  v15 = [v8 base64EncodedStringWithOptions:0];
  v16 = [v14 base64EncodedStringWithOptions:0];
  v17 = _AIDALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1DD36A000, v17, OS_LOG_TYPE_DEFAULT, "Provisioning Info: mid - %@ otp - %@", buf, 0x16u);
  }

  v24[0] = @"mid";
  v24[1] = @"otp";
  v25[0] = v15;
  v25[1] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  if (v22) {
    jk24uiwqrg(v22);
  }
  if (v21) {
    jk24uiwqrg(v21);
  }

LABEL_16:
  return v18;
}

- (id)_expirationCheckedTokenForCredential:()AppleIDAuthentication
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  v5 = [v3 tokenExpiryDate];
  int v6 = v5;
  if (v5 && [v5 compare:v4] != 1)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [v3 token];
  }

  return v7;
}

- (void)_performSilentReauthForAccount:()AppleIDAuthentication completionHandler:
{
  id v5 = a4;
  int v6 = (objc_class *)MEMORY[0x1E4F4EF60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setAuthenticationType:1];
  [v8 setIsUsernameEditable:0];
  [v8 setServiceType:1];
  [v8 setShouldUpdatePersistentServiceTokens:1];
  v9 = objc_msgSend(v7, "aida_alternateDSID");

  if (v9 && [v9 length]) {
    [v8 setAltDSID:v9];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__ACAccount_AppleIDAuthentication___performSilentReauthForAccount_completionHandler___block_invoke;
  v12[3] = &unk_1E6CBEB50;
  id v13 = v5;
  id v11 = v5;
  [v10 authenticateWithContext:v8 completion:v12];
}

@end