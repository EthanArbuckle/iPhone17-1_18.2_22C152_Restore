@interface BCInternalAuthenticationManager
- (BCInternalAuthenticationManager)initWithAuthenticationRequest:(id)a3;
- (BCInternalAuthenticationRequest)authenticationRequest;
- (BOOL)isUserSignedIn;
- (NSString)action;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)subtitle;
- (NSString)title;
- (NSString)username;
- (id)labelCategory;
- (int64_t)state;
- (void)fetchCredentials:(id)a3;
@end

@implementation BCInternalAuthenticationManager

- (BCInternalAuthenticationManager)initWithAuthenticationRequest:(id)a3
{
  v5 = (objc_class *)MEMORY[0x263EFB210];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  if (self)
  {
    v14.receiver = self;
    v14.super_class = (Class)BCInternalAuthenticationManager;
    v12 = [(BCInternalAuthenticationManager *)&v14 init];
    self = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_accountStore, v7);
      objc_storeStrong((id *)&self->_account, v8);
      objc_storeStrong((id *)&self->_authenticationRequest, a3);
    }
  }

  return self;
}

- (void)fetchCredentials:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F29120]);
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 bundleIdentifier];
  v8 = (void *)[v5 initWithIdentifier:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke;
  v10[3] = &unk_264852170;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 appleIDHeadersForRequest:0 completion:v10];
}

void __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v54[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v53 = *MEMORY[0x263F08320];
      v54[0] = @"Unable to access credentials";
      v31 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
      id v8 = (id)[v30 initWithDomain:@"com.apple.icloud.messages.business.internalAuthentication" code:0 userInfo:v31];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_54;
  }
  id v8 = (id)objc_opt_new();
  id v9 = [*(id *)(a1 + 32) authenticationRequest];
  id v10 = [v9 retrieve];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v17 = [v5 objectForKey:v16];
        if (v17) {
          [v8 setObject:v17 forKey:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v13);
  }

  if ([v11 containsObject:@"X-MMe-Client-Info"])
  {
    v18 = objc_msgSend(MEMORY[0x263F089E0], "ak_clientInfoHeader");
    v19 = [v18 objectForKeyedSubscript:@"X-MMe-Client-Info"];

    if (v19) {
      [v8 setObject:v19 forKey:@"X-MMe-Client-Info"];
    }
  }
  if ([v11 containsObject:@"X-Mme-Device-Id"])
  {
    v20 = objc_msgSend(MEMORY[0x263F089E0], "ak_deviceUDIDHeader");
    v21 = [v20 objectForKeyedSubscript:@"X-Mme-Device-Id"];

    if (v21) {
      [v8 setObject:v21 forKey:@"X-Mme-Device-Id"];
    }
  }
  if ([v11 containsObject:@"person-identifier"])
  {
    uint64_t v22 = *(void *)(a1 + 32);
    if (v22)
    {
      v23 = objc_msgSend(*(id *)(v22 + 16), "aa_personID");
      if (v23) {
        [v8 setObject:v23 forKey:@"person-identifier"];
      }
    }
    else
    {
      v23 = 0;
    }
  }
  if ([v11 containsObject:@"alt-person-identifier"])
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      v25 = objc_msgSend(*(id *)(v24 + 16), "aida_alternateDSID");
      if (v25) {
        [v8 setObject:v25 forKey:@"alt-person-identifier"];
      }
    }
    else
    {
      v25 = 0;
    }
  }
  if ([v11 containsObject:@"serial-number"])
  {
    if (!*(void *)(a1 + 32))
    {
      v29 = 0;
      goto LABEL_42;
    }
    *(_DWORD *)buf = 0;
    v26 = (void *)MGCopyAnswerWithError();
    v27 = v26;
    if (*(_DWORD *)buf)
    {
      v28 = LogCategory_Daemon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v49 = 0;
        _os_log_error_impl(&dword_228C26000, v28, OS_LOG_TYPE_ERROR, "BCInternalAuthenticationManager: Error fetching serial number", v49, 2u);
      }

      v29 = @"Unknown";
    }
    else
    {
      v29 = v26;

      if (!v29)
      {
LABEL_42:

        goto LABEL_43;
      }
    }
    [v8 setObject:v29 forKey:@"serial-number"];
    goto LABEL_42;
  }
LABEL_43:
  if ([v11 containsObject:@"X-Apple-GS-Token"])
  {
    uint64_t v32 = *(void *)(a1 + 32);
    if (v32)
    {
      uint64_t v33 = *(void *)(v32 + 16);
      id v34 = *(id *)(v32 + 24);
      v35 = objc_msgSend(v34, "aida_accountForiCloudAccount:", v33);

      v36 = objc_msgSend(v35, "aida_tokenForService:", @"com.apple.gs.global.auth");

      if (v36) {
        [v8 setObject:v36 forKey:@"X-Apple-GS-Token"];
      }
    }
    else
    {
      v36 = 0;
    }
  }
  v37 = LogCategory_Daemon();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v8;
    _os_log_debug_impl(&dword_228C26000, v37, OS_LOG_TYPE_DEBUG, "BCInternalAuthenticationManager: Retrieved credentials %@", buf, 0xCu);
  }

  id v44 = 0;
  v38 = [MEMORY[0x263F08900] dataWithJSONObject:v8 options:1 error:&v44];
  id v39 = v44;
  if (v39)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v40 = [*(id *)(a1 + 32) authenticationRequest];
    v41 = [v40 responseEncryptionKey];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke_30;
    v42[3] = &unk_264852148;
    id v43 = *(id *)(a1 + 40);
    +[BCCryptor encryptData:v38 key:v41 completion:v42];
  }
LABEL_54:
}

uint64_t __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)username
{
  if (self) {
    self = (BCInternalAuthenticationManager *)self->_account;
  }
  return [(BCInternalAuthenticationManager *)self username];
}

- (NSString)firstName
{
  if (self) {
    self = (BCInternalAuthenticationManager *)self->_account;
  }
  return (NSString *)[(BCInternalAuthenticationManager *)self aa_firstName];
}

- (NSString)middleName
{
  if (self) {
    self = (BCInternalAuthenticationManager *)self->_account;
  }
  return (NSString *)[(BCInternalAuthenticationManager *)self aa_middleName];
}

- (NSString)lastName
{
  if (self) {
    self = (BCInternalAuthenticationManager *)self->_account;
  }
  return (NSString *)[(BCInternalAuthenticationManager *)self aa_lastName];
}

- (BOOL)isUserSignedIn
{
  if (self) {
    self = (BCInternalAuthenticationManager *)self->_account;
  }
  v2 = [(BCInternalAuthenticationManager *)self username];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)title
{
  BOOL v3 = [(BCInternalAuthenticationManager *)self authenticationRequest];
  id v4 = [v3 labels];
  id v5 = -[BCInternalAuthenticationManager labelCategory](self);
  id v6 = [v4 objectForKeyedSubscript:v5];

  int64_t v7 = [(BCInternalAuthenticationManager *)self state];
  if (v7 == 3)
  {
    uint64_t v8 = [v6 title];
    if (!v8)
    {
      id v9 = +[BCShared classBundle]();
      id v10 = v9;
      id v11 = @"SIGN_IN_REQUIRED";
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (v7 != 2)
  {
    uint64_t v12 = +[BCShared classBundle]();
    uint64_t v13 = [v12 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_26DD2B2A8 table:0];
    goto LABEL_8;
  }
  uint64_t v8 = [v6 title];
  if (v8)
  {
LABEL_6:
    uint64_t v12 = (void *)v8;
    uint64_t v13 = [v6 title];
LABEL_8:
    uint64_t v14 = (void *)v13;
    goto LABEL_11;
  }
  id v9 = +[BCShared classBundle]();
  id v10 = v9;
  id v11 = @"CONFIRM_TITLE";
LABEL_10:
  uint64_t v14 = [v9 localizedStringForKey:v11 value:&stru_26DD2B2A8 table:0];

  uint64_t v12 = 0;
LABEL_11:

  return (NSString *)v14;
}

- (id)labelCategory
{
  if (a1)
  {
    uint64_t v2 = [a1 state];
    BOOL v3 = (id *)BCLabelCategoryAuthenticate;
    id v4 = BCLabelCategorySignIn;
    if (v2 != 3) {
      id v4 = BCLabelCategoryFailure;
    }
    if (v2 != 2) {
      BOOL v3 = (id *)v4;
    }
    a1 = *v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)subtitle
{
  BOOL v3 = [(BCInternalAuthenticationManager *)self authenticationRequest];
  id v4 = [v3 labels];
  id v5 = -[BCInternalAuthenticationManager labelCategory](self);
  id v6 = [v4 objectForKeyedSubscript:v5];

  int64_t v7 = [(BCInternalAuthenticationManager *)self state];
  if (v7 == 3)
  {
    uint64_t v8 = [v6 subtitle];
    if (!v8)
    {
      v15 = +[BCShared classBundle]();
      uint64_t v13 = [v15 localizedStringForKey:@"SIGN_IN_MESSAGE" value:&stru_26DD2B2A8 table:0];

      goto LABEL_9;
    }
  }
  else
  {
    if (v7 != 2)
    {
      uint64_t v13 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = [v6 subtitle];
    if (!v8)
    {
      id v9 = NSString;
      id v10 = +[BCShared classBundle]();
      id v11 = [v10 localizedStringForKey:@"CONFIRM_SUBTITLE" value:&stru_26DD2B2A8 table:0];
      uint64_t v12 = [(BCInternalAuthenticationManager *)self username];
      uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

LABEL_9:
      uint64_t v14 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v14 = (void *)v8;
  uint64_t v13 = [v6 subtitle];
LABEL_10:

LABEL_11:

  return (NSString *)v13;
}

- (NSString)action
{
  BOOL v3 = [(BCInternalAuthenticationManager *)self authenticationRequest];
  id v4 = [v3 labels];
  id v5 = -[BCInternalAuthenticationManager labelCategory](self);
  id v6 = [v4 objectForKeyedSubscript:v5];

  int64_t v7 = [(BCInternalAuthenticationManager *)self state];
  if (v7 == 3)
  {
    uint64_t v8 = [v6 action];
    if (!v8)
    {
      id v9 = +[BCShared classBundle]();
      id v10 = v9;
      id v11 = @"SIGN_IN_BUTTON";
      goto LABEL_9;
    }
  }
  else
  {
    if (v7 != 2)
    {
      uint64_t v13 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = [v6 action];
    if (!v8)
    {
      id v9 = +[BCShared classBundle]();
      id v10 = v9;
      id v11 = @"CONFIRM_BUTTON";
LABEL_9:
      uint64_t v13 = [v9 localizedStringForKey:v11 value:&stru_26DD2B2A8 table:0];

      uint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v12 = (void *)v8;
  uint64_t v13 = [v6 action];
LABEL_10:

LABEL_11:

  return (NSString *)v13;
}

- (int64_t)state
{
  if ([(BCInternalAuthenticationManager *)self isUserSignedIn]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BCInternalAuthenticationRequest)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end