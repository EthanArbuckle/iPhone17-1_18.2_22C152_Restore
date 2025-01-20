@interface SLGoogleAuthenticationPlugin
+ (BOOL)supportsAccountType:(id)a3;
- (id)_cancelButtonTitleForBadCredentialsAlert;
- (id)_messageForBadCredentialsAlertWithReason:(id)a3 account:(id)a4;
- (id)_otherButtonTitleForBadCredentialsAlert;
- (id)_titleForBadCredentialsAlertForAccount:(id)a3;
- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6;
- (id)renewalIDsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5;
- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8;
- (void)_migrateLegacyToken:(id)a3 account:(id)a4 password:(id)a5 completion:(id)a6;
- (void)_refreshTokenForAccount:(id)a3 store:(id)a4 completion:(id)a5;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation SLGoogleAuthenticationPlugin

+ (BOOL)supportsAccountType:(id)a3
{
  v3 = [a3 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263EFAEE8]];

  return v4;
}

- (void)showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  id v26 = a4;
  id v11 = a7;
  v12 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v13 = *MEMORY[0x263EFFFC8];
  uint64_t v14 = *MEMORY[0x263F00000];
  uint64_t v15 = *MEMORY[0x263EFFFE8];
  v16 = (void *)MEMORY[0x263F086E0];
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  v20 = [v16 bundleForClass:objc_opt_class()];
  v21 = [v20 resourceURL];
  v22 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v19, v13, v18, v14, v17, v15, v21, *MEMORY[0x263F00018], 0);

  if (v26) {
    [v22 setObject:v26 forKey:*MEMORY[0x263EFFFD8]];
  }
  v23 = (void *)[v11 copy];

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  CFUserNotificationRef v31 = 0;
  CFUserNotificationRef v31 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, (CFDictionaryRef)v22);
  v24 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24050EC10;
  block[3] = &unk_2650BD5A8;
  id v28 = v23;
  v29 = v30;
  id v25 = v23;
  dispatch_async(v24, block);

  _Block_object_dispose(v30, 8);
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 hasEntitlement:*MEMORY[0x263EFB2B0]];
  id v11 = _ACDLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_24050D000, v11, OS_LOG_TYPE_DEFAULT, "\"%@ is entitled for all-account access. Returning Google credentials.\"", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v13 = [MEMORY[0x263F230F0] credentialForAccount:v8 clientID:0 error:a6];
  }
  else
  {
    if (v12)
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_24050D000, v11, OS_LOG_TYPE_DEFAULT, "\"%@ is a non-entitled client. No Google credential for you.\"", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a6;
  uint64_t v9 = [v7 username];
  if (!v9) {
    goto LABEL_10;
  }
  int v10 = (void *)v9;
  id v11 = [v7 credential];
  BOOL v12 = [v11 credentialType];
  if (![v12 isEqualToString:*MEMORY[0x263EFB040]]) {
    goto LABEL_9;
  }
  uint64_t v13 = [v7 credential];
  uint64_t v14 = [v13 oauthToken];
  if (!v14)
  {

LABEL_9:
    goto LABEL_10;
  }
  int v15 = (void *)v14;
  id v16 = [v7 credential];
  uint64_t v17 = [v16 oauthRefreshToken];

  if (!v17)
  {
LABEL_10:
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263EFB070];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24 = @"The account could not be verified because it does not have the necessary credentials.";
    v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = [v19 errorWithDomain:v20 code:3 userInfo:v21];

    v8[2](v8, 0, v22);
    goto LABEL_11;
  }
  id v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_24050D000, v18, OS_LOG_TYPE_DEFAULT, "\"%@ is an OAuth account. we're good!\"", buf, 0xCu);
  }

  ((void (**)(id, id, void *))v8)[2](v8, v7, 0);
LABEL_11:
}

- (id)renewalIDsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [a5 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = NSString;
    int v10 = [v6 identifier];
    id v11 = [v9 stringWithFormat:@"%@.AvoidUI", v10];
    v16[0] = v11;
    BOOL v12 = [v6 identifier];
    v16[1] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  }
  else
  {
    int v10 = [v6 identifier];
    int v15 = v10;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  }

  return v13;
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _ACDLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_24050D000, v14, OS_LOG_TYPE_DEFAULT, "\"Google plugin got renewCredentialsForAccount: %@ options: %{public}@ completion:\"", buf, 0x16u);
  }

  int v15 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
  char v16 = [v15 BOOLValue];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_24050F340;
  v21[3] = &unk_2650BD620;
  id v25 = v11;
  id v26 = v13;
  id v22 = v10;
  id v23 = v12;
  v24 = self;
  char v27 = v16;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  id v20 = v10;
  [(SLGoogleAuthenticationPlugin *)self _refreshTokenForAccount:v20 store:v17 completion:v21];
}

- (void)_refreshTokenForAccount:(id)a3 store:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v32 = 0;
  id v11 = [MEMORY[0x263F230F0] credentialForAccount:v8 clientID:0 error:&v32];
  id v12 = v32;
  if (v11
    && ([v11 oauthRefreshToken], id v13 = objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    uint64_t v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24050D000, v14, OS_LOG_TYPE_DEFAULT, "\"refreshing Google access token\"", buf, 2u);
    }

    id v15 = objc_alloc_init(MEMORY[0x263F17860]);
    char v16 = (void *)MEMORY[0x263F17848];
    id v17 = [v15 clientID];
    id v18 = [v11 oauthRefreshToken];
    id v19 = [v15 tokenURL];
    id v20 = [v16 urlRequestForClientID:v17 secret:0 refreshToken:v18 tokenURL:v19];

    v21 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    id v22 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v21];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_24050F9F8;
    v27[3] = &unk_2650BD648;
    id v28 = v11;
    id v29 = v8;
    id v30 = v10;
    id v23 = [v22 dataTaskWithRequest:v20 completionHandler:v27];
    [v23 resume];
  }
  else
  {
    id v15 = [v9 clientTokenForAccount:v8];
    id v20 = [v11 password];
    if (v20) {
      BOOL v24 = v15 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24)
    {
      if ([v12 code] == 10)
      {
        id v25 = v10;
        uint64_t v26 = 3;
      }
      else
      {
        id v25 = v10;
        uint64_t v26 = 0;
      }
      (*((void (**)(id, uint64_t, void))v10 + 2))(v25, v26, 0);
    }
    else
    {
      [(SLGoogleAuthenticationPlugin *)self _migrateLegacyToken:v15 account:v8 password:v20 completion:v10];
    }
  }
}

- (void)_migrateLegacyToken:(id)a3 account:(id)a4 password:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = (void *)MEMORY[0x263F17838];
  id v11 = a5;
  id v12 = a3;
  id v13 = [a4 username];
  uint64_t v14 = [v10 urlRequestForAuthTokenFromLegacyClientToken:v12 username:v13 password:v11];

  id v15 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  char v16 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v15];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = sub_24050FF54;
  id v23 = &unk_2650BD6C0;
  id v24 = v16;
  id v25 = v9;
  id v17 = v16;
  id v18 = v9;
  id v19 = [v17 dataTaskWithRequest:v14 completionHandler:&v20];
  objc_msgSend(v19, "resume", v20, v21, v22, v23);
}

- (id)_titleForBadCredentialsAlertForAccount:(id)a3
{
  v3 = NSString;
  char v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"GOOGLE_AUTH_ALERT_TITLE_IOS" value:&stru_26F49C588 table:@"Localizable"];
  id v8 = [v5 username];

  id v9 = objc_msgSend(v3, "stringWithFormat:", v7, v8);

  return v9;
}

- (id)_otherButtonTitleForBadCredentialsAlert
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GOOGLE_AUTH_ALERT_SETTINGS_IOS" value:&stru_26F49C588 table:@"Localizable"];

  return v3;
}

- (id)_cancelButtonTitleForBadCredentialsAlert
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GOOGLE_AUTH_ALERT_CANCEL" value:&stru_26F49C588 table:@"Localizable"];

  return v3;
}

- (id)_messageForBadCredentialsAlertWithReason:(id)a3 account:(id)a4
{
  id v4 = a3;
  return v4;
}

- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  id v16 = a5;
  id v17 = [(SLGoogleAuthenticationPlugin *)self _titleForBadCredentialsAlertForAccount:v13];
  id v18 = [(SLGoogleAuthenticationPlugin *)self _otherButtonTitleForBadCredentialsAlert];
  id v19 = [(SLGoogleAuthenticationPlugin *)self _cancelButtonTitleForBadCredentialsAlert];
  uint64_t v20 = [(SLGoogleAuthenticationPlugin *)self _messageForBadCredentialsAlertWithReason:v16 account:v13];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_240510AD8;
  v24[3] = &unk_2650BD710;
  BOOL v28 = a7;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  [(SLGoogleAuthenticationPlugin *)self showUserAlertWithTitle:v17 message:v20 cancelButtonTitle:v19 otherButtonTitle:v18 withCompletionBlock:v24];
}

@end