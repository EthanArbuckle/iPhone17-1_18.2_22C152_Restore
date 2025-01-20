@interface SLYahooAuthenticationPlugin
+ (BOOL)supportsAccountType:(id)a3;
+ (id)webClientForAccount:(id)a3;
- (BOOL)isPushSupportedForAccount:(id)a3;
- (id)_getLegacyTokenForAccount:(id)a3 password:(id)a4 username:(id)a5;
- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6;
- (id)renewalIDsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5;
- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8;
- (void)_migrateLegacyToken:(id)a3 account:(id)a4 completion:(id)a5;
- (void)_refreshTokenForAccount:(id)a3 store:(id)a4 completion:(id)a5;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation SLYahooAuthenticationPlugin

+ (id)webClientForAccount:(id)a3
{
  v3 = [a3 accountType];
  v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x263EFAE50]];
  v6 = (Class *)0x263F17818;
  if (!v5) {
    v6 = (Class *)0x263F17898;
  }
  id v7 = objc_alloc_init(*v6);

  return v7;
}

+ (BOOL)supportsAccountType:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if ([v4 isEqualToString:*MEMORY[0x263EFAFE0]])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 identifier];
    char v5 = [v6 isEqualToString:*MEMORY[0x263EFAE50]];
  }
  return v5;
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v4 = (void *)qword_268C87AB0;
  uint64_t v17 = qword_268C87AB0;
  if (!qword_268C87AB0)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_240521380;
    v13[3] = &unk_2650BE3E0;
    v13[4] = &v14;
    sub_240521380((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v12 = 0;
  v6 = [v5 accountWithPersistentAccount:v3 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v10 = [v6 canReceiveNewMailNotifications];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (void)showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  id v26 = a4;
  id v11 = a7;
  id v12 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v13 = *MEMORY[0x263EFFFC8];
  uint64_t v14 = *MEMORY[0x263F00000];
  uint64_t v15 = *MEMORY[0x263EFFFE8];
  uint64_t v16 = (void *)MEMORY[0x263F086E0];
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
  block[2] = sub_24051EFE8;
  block[3] = &unk_2650BE200;
  id v28 = v23;
  v29 = v30;
  id v25 = v23;
  dispatch_async(v24, block);

  _Block_object_dispose(v30, 8);
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 hasEntitlement:*MEMORY[0x263EFB2B0]];
  id v11 = _ACDLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      sub_24052157C((uint64_t)v9, v11);
    }

    uint64_t v13 = [MEMORY[0x263F230F0] credentialForAccount:v8 clientID:0 error:a6];
  }
  else
  {
    if (v12) {
      sub_2405215F4((uint64_t)v9, v11);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  v38[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, void))a6;
  BOOL v12 = [v9 username];
  if (([v12 hasSuffix:@"yahoo.co.jp"] & 1) == 0)
  {

LABEL_5:
    uint64_t v21 = [v9 username];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [v9 credential];
      uint64_t v24 = [v23 oauthToken];
      if (v24)
      {
        id v25 = (void *)v24;
        id v26 = [v9 credential];
        v27 = [v26 oauthRefreshToken];

        if (v27)
        {
          v11[2](v11, v9, 0);
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    uint64_t v35 = *MEMORY[0x263EFB388];
    uint64_t v36 = MEMORY[0x263EFFA88];
    id v28 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_24051F4E4;
    v29[3] = &unk_2650BE250;
    CFUserNotificationRef v31 = v11;
    id v30 = v9;
    [(SLYahooAuthenticationPlugin *)self renewCredentialsForAccount:v30 accountStore:v10 options:v28 completion:v29];

    goto LABEL_11;
  }
  uint64_t v13 = [v9 credential];
  uint64_t v14 = [v13 password];

  if (!v14) {
    goto LABEL_5;
  }
  id v15 = objc_alloc(MEMORY[0x263EFB1F8]);
  uint64_t v16 = [v10 accountTypeWithIdentifier:*MEMORY[0x263EFAF08]];
  id v17 = (void *)[v15 initWithAccountType:v16];

  id v18 = [v9 username];
  [v17 setUsername:v18];

  id v19 = [v9 credential];
  [v17 setCredential:v19];

  uint64_t v37 = *MEMORY[0x263EFB3A0];
  v38[0] = MEMORY[0x263EFFA80];
  v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_24051F4B8;
  v32[3] = &unk_2650BE228;
  v34 = v11;
  id v33 = v9;
  [v10 verifyCredentialsForAccount:v17 options:v20 completion:v32];

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
    id v9 = NSString;
    id v10 = [v6 identifier];
    id v11 = [v9 stringWithFormat:@"%@.AvoidUI", v10];
    v16[0] = v11;
    BOOL v12 = [v6 identifier];
    v16[1] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  }
  else
  {
    id v10 = [v6 identifier];
    id v15 = v10;
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
    _os_log_impl(&dword_24051D000, v14, OS_LOG_TYPE_DEFAULT, "\"Yahoo! plugin got renewCredentialsForAccount: %@ options: %{public}@ completion:\"", buf, 0x16u);
  }

  id v15 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
  char v16 = [v15 BOOLValue];

  id v17 = [v10 username];
  if (([v17 hasSuffix:@"yahoo.co.jp"] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v18 = [v10 credential];
  id v19 = [v18 password];

  if (!v19)
  {
LABEL_9:
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_24051F9D8;
    v21[3] = &unk_2650BE2C8;
    id v22 = v10;
    id v26 = v13;
    id v23 = v12;
    uint64_t v24 = self;
    id v25 = v11;
    char v27 = v16;
    [(SLYahooAuthenticationPlugin *)self _refreshTokenForAccount:v22 store:v25 completion:v21];

    goto LABEL_10;
  }
  v20 = _ACLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_24052166C(v20);
  }

  (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
LABEL_10:
}

- (id)_getLegacyTokenForAccount:(id)a3 password:(id)a4 username:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_240520004;
  uint64_t v32 = sub_240520014;
  id v33 = 0;
  id v11 = +[SLYahooAuthenticationPlugin webClientForAccount:v7];
  id v12 = (void *)MEMORY[0x263F17878];
  id v13 = [v11 source];
  uint64_t v14 = [v12 urlRequestForLoginTokenFromUsername:v9 password:v8 src:v13];

  id v15 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  char v16 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v15];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = sub_24052001C;
  id v25 = &unk_2650BE2F0;
  char v27 = &v28;
  id v17 = v10;
  id v26 = v17;
  id v18 = [v16 dataTaskWithRequest:v14 completionHandler:&v22];
  objc_msgSend(v18, "resume", v22, v23, v24, v25);
  dispatch_time_t v19 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v17, v19);
  id v20 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v20;
}

- (void)_refreshTokenForAccount:(id)a3 store:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v37 = 0;
  id v11 = [MEMORY[0x263F230F0] credentialForAccount:v8 clientID:0 error:&v37];
  id v12 = v37;
  if (v11
    && ([v11 oauthRefreshToken], id v13 = objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    uint64_t v30 = v9;
    uint64_t v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24051D000, v14, OS_LOG_TYPE_DEFAULT, "\"refreshing Yahoo! access token\"", buf, 2u);
    }

    id v15 = +[SLYahooAuthenticationPlugin webClientForAccount:v8];
    char v16 = (void *)MEMORY[0x263F178A0];
    id v17 = [v15 clientID];
    id v18 = [v15 clientSecret];
    dispatch_time_t v19 = [v11 oauthRefreshToken];
    id v20 = [v15 tokenURL];
    uint64_t v21 = [v16 urlRequestForClientID:v17 secret:v18 refreshToken:v19 tokenURL:v20];

    uint64_t v22 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    uint64_t v23 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v22];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2405204D8;
    v31[3] = &unk_2650BE340;
    id v32 = v11;
    id v35 = v10;
    id v33 = v8;
    id v9 = v30;
    id v34 = v30;
    uint64_t v24 = [v23 dataTaskWithRequest:v21 completionHandler:v31];
    [v24 resume];
  }
  else
  {
    id v15 = [v11 password];
    uint64_t v25 = [v11 credentialItemForKey:*MEMORY[0x263EFB1F0]];
    uint64_t v21 = (void *)v25;
    if (v15) {
      BOOL v26 = v25 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    if (v26)
    {
      char v27 = [v8 username];
      uint64_t v21 = [(SLYahooAuthenticationPlugin *)self _getLegacyTokenForAccount:v8 password:v15 username:v27];
    }
    if (v21)
    {
      [(SLYahooAuthenticationPlugin *)self _migrateLegacyToken:v21 account:v8 completion:v10];
    }
    else
    {
      if ([v12 code] == 10)
      {
        id v28 = v10;
        uint64_t v29 = 3;
      }
      else
      {
        id v28 = v10;
        uint64_t v29 = 0;
      }
      (*((void (**)(id, uint64_t, void))v10 + 2))(v28, v29, 0);
    }
  }
}

- (void)_migrateLegacyToken:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F08C00];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 ephemeralSessionConfiguration];
  id v12 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v11];
  id v13 = +[SLYahooAuthenticationPlugin webClientForAccount:v9];

  uint64_t v14 = (void *)MEMORY[0x263F17888];
  id v15 = [v13 clientID];
  char v16 = [v13 clientSecret];
  id v17 = [v13 source];
  id v18 = [v14 urlRequestForOAuthTokenFromLoginToken:v10 clientID:v15 clientSecret:v16 src:v17];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_240520C2C;
  v21[3] = &unk_2650BE368;
  id v22 = v7;
  id v19 = v7;
  id v20 = [v12 dataTaskWithRequest:v18 completionHandler:v21];
  [v20 resume];
}

- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8
{
  id v11 = a3;
  id v31 = a6;
  id v30 = a8;
  id v12 = (void *)MEMORY[0x263F086E0];
  id v32 = a5;
  id v13 = [v12 bundleForClass:objc_opt_class()];
  uint64_t v14 = [v11 accountType];
  id v15 = [v14 identifier];
  if ([v15 isEqualToString:*MEMORY[0x263EFAE50]]) {
    char v16 = @"YAHOO_AUTH_ACCOUNT_TYPE_AOL";
  }
  else {
    char v16 = @"YAHOO_AUTH_ACCOUNT_TYPE_YAHOO";
  }
  uint64_t v29 = [v13 localizedStringForKey:v16 value:&stru_26F49E340 table:@"Localizable"];

  id v17 = NSString;
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"YAHOO_AUTH_ALERT_TITLE_IOS" value:&stru_26F49E340 table:@"Localizable"];
  id v20 = [v11 username];
  id v28 = objc_msgSend(v17, "stringWithFormat:", v19, v29, v20);

  uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v22 = [v21 localizedStringForKey:@"YAHOO_AUTH_ALERT_SETTINGS_IOS" value:&stru_26F49E340 table:@"Localizable"];

  uint64_t v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v24 = [v23 localizedStringForKey:@"YAHOO_AUTH_ALERT_CANCEL" value:&stru_26F49E340 table:@"Localizable"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_24052116C;
  v35[3] = &unk_2650BE3B8;
  BOOL v39 = a7;
  id v36 = v11;
  id v37 = v31;
  id v38 = v30;
  id v25 = v11;
  id v26 = v31;
  id v27 = v30;
  [(SLYahooAuthenticationPlugin *)self showUserAlertWithTitle:v28 message:v32 cancelButtonTitle:v24 otherButtonTitle:v22 withCompletionBlock:v35];
}

@end