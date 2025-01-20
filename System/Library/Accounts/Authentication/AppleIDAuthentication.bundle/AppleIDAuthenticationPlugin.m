@interface AppleIDAuthenticationPlugin
+ (id)_grayModeWhitelist;
- (AppleIDAuthenticationPlugin)init;
- (BOOL)_clientHasEntitlement:(id)a3;
- (BOOL)_isAccountInGrayMode:(id)a3;
- (BOOL)isPushSupportedForAccount:(id)a3;
- (NSString)idmsDataToken;
- (NSString)passwordlessToken;
- (id)_accountTypeIDsThatReplacedAppleIDAccountType;
- (id)_authController;
- (id)_findAndRemoveOldFMIPTokenForAccount:(id)a3;
- (id)_findAndRemoveOldiCloudTokenForAccount:(id)a3;
- (id)_frontmostApplicationId;
- (id)_loginDelegatesParameters;
- (id)_parametersForIDSAlertFromLoginResponse:(id)a3;
- (id)_parametersForProxiedAuthentication;
- (id)_userInfoForRenewCredentialsFollowUpWithAccountStore:(id)a3 proxiedDevice:(id)a4;
- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6;
- (void)_authenticateAccount:(id)a3 inStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7;
- (void)_beginPETBasedLoginWithAccount:(id)a3 PET:(id)a4 store:(id)a5 completion:(id)a6;
- (void)_convertPasswordToPETForAppleID:(id)a3 altDSID:(id)a4 password:(id)a5 services:(id)a6 completion:(id)a7;
- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 forceFetch:(BOOL)a5 withHandler:(id)a6;
- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 withHandler:(id)a5;
- (void)_getPasswordFromCompanionForAccount:(id)a3 store:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 forAccount:(id)a5 inStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 completion:(id)a8;
- (void)_handleDelegatesResponseForAccount:(id)a3 store:(id)a4 response:(id)a5 error:(id)a6 handler:(id)a7;
- (void)_handleRenewFailure:(id)a3 forAccount:(id)a4 accountStore:(id)a5 options:(id)a6 completion:(id)a7;
- (void)_invokeDelegatesWithAuthenticationResponse:(id)a3 password:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7;
- (void)_isAccountReallyInGreyMode:(id)a3 accountStore:(id)a4 completion:(id)a5;
- (void)_loginWithAccount:(id)a3 store:(id)a4 companionDevice:(id)a5 options:(id)a6 completion:(id)a7;
- (void)_migrateAppleIDTokensIfNeededForAccount:(id)a3 credential:(id *)a4 store:(id)a5;
- (void)_migrateFMIPTokenIfNeededForAccount:(id)a3 credential:(id)a4;
- (void)_migrateiCloudTokenIfNeededForAccount:(id)a3 credential:(id)a4;
- (void)_performLoginDelegatesRequestForAccount:(id)a3 store:(id)a4 handler:(id)a5;
- (void)_renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7;
- (void)_silentlyAuthenticateAppleID:(id)a3 altDSID:(id)a4 companionDevice:(id)a5 services:(id)a6 completion:(id)a7;
- (void)_tryPasswordLoginWithAccount:(id)a3 store:(id)a4 services:(id)a5 completion:(id)a6;
- (void)_updateDSID:(id)a3 withRawPassword:(id)a4 suggestedAccount:(id)a5 store:(id)a6 completion:(id)a7;
- (void)_validateAuthenticationResults:(id)a3 error:(id)a4 forContext:(id)a5 completion:(id)a6;
- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)setIdmsDataToken:(id)a3;
- (void)setPasswordlessToken:(id)a3;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation AppleIDAuthenticationPlugin

- (BOOL)_clientHasEntitlement:(id)a3
{
  id v3 = a3;
  v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2404EA54C();
  }

  if ([v3 hasEntitlement:*MEMORY[0x263EFB2B0]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v3 hasEntitlement:*MEMORY[0x263EFB2B8]];
  }

  return v5;
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v54 = [(AppleIDAuthenticationPlugin *)self _clientHasEntitlement:v11];
  v13 = [v11 bundleID];
  if (v13)
  {
    v14 = +[AppleIDAuthenticationPlugin _grayModeWhitelist];
    int v15 = [v14 containsObject:v13];

    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v15 = 0;
  if (a6) {
LABEL_3:
  }
    *a6 = 0;
LABEL_4:
  v16 = [v10 accountType];
  v17 = [v16 identifier];
  int v18 = [v17 isEqualToString:*MEMORY[0x263EFAE58]];

  if (!v18)
  {
    v53 = self;
    id v20 = v11;
    v21 = [v10 accountType];
    v22 = [v21 identifier];
    if (([v22 isEqualToString:*MEMORY[0x263EFAEA0]] & 1) == 0)
    {
      v23 = [v10 accountType];
      v24 = [v23 identifier];
      if (([v24 isEqualToString:*MEMORY[0x263EFAEA8]] & 1) == 0)
      {
        [v10 accountType];
        v31 = v52 = v13;
        [v31 identifier];
        v32 = v51 = a6;
        char v50 = [v32 isEqualToString:*MEMORY[0x263EFAED0]];

        a6 = v51;
        v13 = v52;

        id v11 = v20;
        self = v53;
        if ((v50 & 1) == 0) {
          goto LABEL_24;
        }
        goto LABEL_13;
      }
    }
    id v11 = v20;
    self = v53;
LABEL_13:
    [v10 parentAccount];
    v26 = v25 = v13;
    BOOL v27 = [(AppleIDAuthenticationPlugin *)self _isAccountInGrayMode:v26];

    v13 = v25;
    if ((!v27 | v15)) {
      goto LABEL_24;
    }
    v28 = _AALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v11 bundleID];
      *(_DWORD *)buf = 138412290;
      id v58 = v29;
      _os_log_impl(&dword_2404DE000, v28, OS_LOG_TYPE_DEFAULT, "%@ was denied credential access due to account being in Gray Mode", buf, 0xCu);

      v13 = v25;
    }
    goto LABEL_21;
  }
  if (!v15)
  {
    if (![(AppleIDAuthenticationPlugin *)self _isAccountInGrayMode:v10]) {
      goto LABEL_24;
    }
    v28 = _AALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v11 bundleID];
      *(_DWORD *)buf = 138412290;
      id v58 = v30;
      _os_log_impl(&dword_2404DE000, v28, OS_LOG_TYPE_DEFAULT, "%@ was denied credential access due to account being in Gray Mode", buf, 0xCu);
    }
LABEL_21:

    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.appleaccount" code:-10 userInfo:0];
    }
    goto LABEL_30;
  }
  v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v19, OS_LOG_TYPE_DEFAULT, "Allowing whitelisted client free access to AppleAccount credential without checking for Gray Mode.", buf, 2u);
  }

LABEL_24:
  if (!v54)
  {
LABEL_30:
    v35 = _ACDLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v10;
      _os_log_impl(&dword_2404DE000, v35, OS_LOG_TYPE_DEFAULT, "\"AppleIDAuthenticationPlugin is withholding the credential for account %@.\"", buf, 0xCu);
    }
    goto LABEL_32;
  }
  v33 = a6;
  id v56 = 0;
  v34 = [MEMORY[0x263F230F0] credentialForAccount:v10 clientID:0 error:&v56];
  v35 = v56;
  if (v35)
  {
    v36 = _AALogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      [v10 accountType];
      v38 = v37 = v13;
      v39 = [v38 accountTypeDescription];
      *(_DWORD *)buf = 138412546;
      id v58 = v39;
      __int16 v59 = 2112;
      v60 = v35;
      _os_log_impl(&dword_2404DE000, v36, OS_LOG_TYPE_DEFAULT, "Unable to get credential for %@ account! Error = %@", buf, 0x16u);

      v13 = v37;
    }

    if (v33)
    {
      v35 = v35;
      id *v33 = v35;

LABEL_32:
      id v40 = 0;
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  v42 = [v34 token];
  if (v42)
  {

LABEL_38:
    id v40 = v34;
    goto LABEL_33;
  }
  v43 = v13;
  v44 = [v10 accountType];
  v45 = [v44 identifier];
  char v46 = [v45 isEqualToString:*MEMORY[0x263EFAED0]];

  if (v46)
  {
    id v40 = v34;
  }
  else
  {
    v47 = _AALogSystem();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v47, OS_LOG_TYPE_DEFAULT, "Try to migrate the credential", buf, 2u);
    }

    [(AppleIDAuthenticationPlugin *)self _migrateiCloudTokenIfNeededForAccount:v10 credential:v34];
    [(AppleIDAuthenticationPlugin *)self _migrateFMIPTokenIfNeededForAccount:v10 credential:v34];
    id v55 = v34;
    [(AppleIDAuthenticationPlugin *)self _migrateAppleIDTokensIfNeededForAccount:v10 credential:&v55 store:v12];
    id v40 = v55;

    v48 = [v40 token];

    if (!v48)
    {
      v49 = _AALogSystem();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v49, OS_LOG_TYPE_DEFAULT, "We tried migrating the credentials for this account, it just doesn't exist", buf, 2u);
      }
    }
  }
  v13 = v43;
LABEL_33:

  return v40;
}

- (BOOL)_isAccountInGrayMode:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_aa_isSuspended);
}

+ (id)_grayModeWhitelist
{
  if (qword_26AFC5F18 != -1) {
    dispatch_once(&qword_26AFC5F18, &unk_26F499130);
  }
  v2 = (void *)qword_26AFC5F10;
  return v2;
}

- (AppleIDAuthenticationPlugin)init
{
  v8.receiver = self;
  v8.super_class = (Class)AppleIDAuthenticationPlugin;
  v2 = [(AppleIDAuthenticationPlugin *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    accountsAwaitingRemotePasswordEntry = v2->_accountsAwaitingRemotePasswordEntry;
    v2->_accountsAwaitingRemotePasswordEntry = v3;

    char v5 = (AAFollowUpController *)objc_alloc_init(MEMORY[0x263F25868]);
    followUpController = v2->_followUpController;
    v2->_followUpController = v5;
  }
  return v2;
}

- (void)_isAccountReallyInGreyMode:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v10, OS_LOG_TYPE_DEFAULT, "Make a quick round-trip to the server to see if we really need to accept new terms", buf, 2u);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F08A48]);
  dispatch_source_t v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_2404E10E4;
  handler[3] = &unk_2650BB2B0;
  id v13 = v11;
  id v37 = v13;
  v14 = v12;
  v38 = v14;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
  *(void *)buf = 0;
  v33 = buf;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  v16 = [MEMORY[0x263F230F0] credentialForAccount:v7 clientID:0];
  id v17 = objc_alloc(MEMORY[0x263F259D0]);
  int v18 = [v16 token];
  v19 = (void *)[v17 initWithAccount:v7 token:v18];

  id v20 = objc_alloc(MEMORY[0x263F25938]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2404E1160;
  v26[3] = &unk_2650BB300;
  id v21 = v9;
  id v30 = v21;
  v31 = buf;
  id v22 = v7;
  id v27 = v22;
  id v23 = v8;
  id v28 = v23;
  v24 = v14;
  v29 = v24;
  v25 = (void *)[v20 initWithRequest:v19 handler:v26];
  [v13 addOperation:v25];
  dispatch_resume(v24);

  _Block_object_dispose(buf, 8);
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  return 1;
}

- (id)_findAndRemoveOldiCloudTokenForAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F25898];
  char v5 = [v3 username];
  v6 = [v4 passwordForServiceName:@"com.apple.account.AppleID.appleid-token-icloud" username:v5 accessGroup:0];

  if (v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v7, OS_LOG_TYPE_DEFAULT, "Found an Apple ID iCloud token we can use", buf, 2u);
    }

    id v8 = (void *)MEMORY[0x263F25898];
    id v9 = [v3 username];
    id v10 = @"com.apple.account.AppleID.appleid-token-icloud";
    id v11 = v8;
    dispatch_source_t v12 = v9;
    id v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x263F25898];
    dispatch_time_t v15 = [v3 username];
    v6 = [v14 passwordForServiceName:@"Apple-token-sync" username:v15 accessGroup:@"appleaccount"];

    if (!v6) {
      goto LABEL_10;
    }
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2404DE000, v16, OS_LOG_TYPE_DEFAULT, "Found an old iCloud token we can use", v19, 2u);
    }

    id v17 = (void *)MEMORY[0x263F25898];
    id v9 = [v3 username];
    id v10 = @"Apple-token-sync";
    id v13 = @"appleaccount";
    id v11 = v17;
    dispatch_source_t v12 = v9;
  }
  [v11 removePasswordForService:v10 username:v12 accessGroup:v13];

LABEL_10:
  return v6;
}

- (id)_findAndRemoveOldFMIPTokenForAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F230F0];
  char v5 = [v3 parentAccount];
  v6 = [v4 credentialForAccount:v5 clientID:0];

  uint64_t v7 = [v6 findMyiPhoneToken];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, "Found an old FMIP token we can use, from the iCloud account", buf, 2u);
    }

    [v6 setFindMyiPhoneToken:0];
    id v10 = [v3 parentAccount];
    [v10 setCredential:v6];

    id v11 = (void *)MEMORY[0x263F230F0];
    dispatch_source_t v12 = [v3 parentAccount];
    [v11 setCredentialForAccount:v12];
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F25898];
    v14 = [v3 username];
    id v8 = [v13 passwordForServiceName:@"Apple-token-fmip" username:v14 accessGroup:@"appleaccount"];

    if (!v8) {
      goto LABEL_10;
    }
    dispatch_time_t v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v18 = 0;
      _os_log_impl(&dword_2404DE000, v15, OS_LOG_TYPE_DEFAULT, "Found an old FMIP token we can use", v18, 2u);
    }

    v16 = (void *)MEMORY[0x263F25898];
    dispatch_source_t v12 = [v3 username];
    [v16 removePasswordForService:@"Apple-token-fmip" username:v12 accessGroup:@"appleaccount"];
  }

LABEL_10:
  return v8;
}

- (void)_migrateiCloudTokenIfNeededForAccount:(id)a3 credential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountType];
  id v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x263EFAE58]];

  if (v10)
  {
    id v11 = [v7 token];
    if (!v11)
    {
      dispatch_source_t v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find the AppleAccount token in our keychain. Looking elsewhere.", v13, 2u);
      }

      id v11 = [(AppleIDAuthenticationPlugin *)self _findAndRemoveOldiCloudTokenForAccount:v6];
      if (v11)
      {
        [v7 setToken:v11];
        [v6 setCredential:v7];
        [MEMORY[0x263F230F0] setCredentialForAccount:v6];
      }
    }
  }
}

- (void)_migrateFMIPTokenIfNeededForAccount:(id)a3 credential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountType];
  id v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x263EFAEA8]];

  if (v10)
  {
    id v11 = [v7 token];
    if (!v11)
    {
      dispatch_source_t v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find the FMIP token in our keychain. Looking elsewhere.", v13, 2u);
      }

      id v11 = [(AppleIDAuthenticationPlugin *)self _findAndRemoveOldFMIPTokenForAccount:v6];
      if (v11)
      {
        [v7 setToken:v11];
        [v6 setCredential:v7];
        [MEMORY[0x263F230F0] setCredentialForAccount:v6 error:0];
        [v6 setAuthenticated:1];
      }
    }
  }
}

- (void)_migrateAppleIDTokensIfNeededForAccount:(id)a3 credential:(id *)a4 store:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(AppleIDAuthenticationPlugin *)self _accountTypeIDsThatReplacedAppleIDAccountType];
  id v11 = [v8 accountType];
  dispatch_source_t v12 = [v11 identifier];
  int v13 = [v10 containsObject:v12];

  if (v13)
  {
    v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v15 = [v8 accountType];
      v16 = [v15 identifier];
      int v25 = 138412290;
      v26 = v16;
      _os_log_impl(&dword_2404DE000, v14, OS_LOG_TYPE_DEFAULT, "The %@ account we're dealing with is a successor of Apple ID accounts. We'll check to see if its credential is still associated with the Apple ID account, and we'll migrate it if necessary.", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v17 = *MEMORY[0x263F25C08];
    int v18 = [v8 accountPropertyForKey:*MEMORY[0x263F25C08]];
    if (v18)
    {
      v19 = objc_opt_new();
      id v20 = [v19 migrateAppleIDBasedCredentialForAccount:v8];
      id v21 = _AALogSystem();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          id v23 = [v8 shortDebugName];
          int v25 = 138412290;
          v26 = v23;
          _os_log_impl(&dword_2404DE000, v21, OS_LOG_TYPE_DEFAULT, "Success! We managed to find a credential for %@ that was associated with a stale AppleID account.", (uint8_t *)&v25, 0xCu);
        }
        *a4 = v20;
        [v8 setAccountProperty:0 forKey:v17];
        [v9 saveVerifiedAccount:v8 withCompletionHandler:&unk_26F499110];
      }
      else
      {
        if (v22)
        {
          v24 = [v8 shortDebugName];
          int v25 = 138412290;
          v26 = v24;
          _os_log_impl(&dword_2404DE000, v21, OS_LOG_TYPE_DEFAULT, "Well, that didn't work. I guess the token for %@ really isn't there.", (uint8_t *)&v25, 0xCu);
        }
      }
    }
  }
}

- (id)_accountTypeIDsThatReplacedAppleIDAccountType
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFAEE0];
  v6[0] = *MEMORY[0x263EFAF20];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFAF60];
  v6[2] = *MEMORY[0x263EFAEB8];
  v6[3] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  return v4;
}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _AASignpostLogSystem();
  os_signpost_id_t v15 = _AASignpostCreate();
  uint64_t v17 = v16;

  int v18 = _AASignpostLogSystem();
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    [v11 client];
    id v20 = v53 = v12;
    [v20 bundleID];
    v51 = self;
    v22 = id v21 = v10;
    id v23 = [v21 accountType];
    v24 = [v23 identifier];
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v71 = (os_signpost_id_t)v22;
    __int16 v72 = 2114;
    v73 = v24;
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "DiscoverProperties", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

    id v10 = v21;
    self = v51;

    id v12 = v53;
  }

  int v25 = _AASignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    [v11 client];
    id v52 = v11;
    v26 = id v54 = v12;
    [v26 bundleID];
    v28 = uint64_t v27 = v17;
    v29 = [v10 accountType];
    [v29 identifier];
    id v30 = v13;
    v31 = self;
    v33 = id v32 = v10;
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v71 = v15;
    __int16 v72 = 2114;
    v73 = v28;
    __int16 v74 = 2114;
    v75 = v33;
    _os_log_impl(&dword_2404DE000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DiscoverProperties  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

    id v10 = v32;
    self = v31;
    id v13 = v30;

    uint64_t v17 = v27;
    id v11 = v52;
    id v12 = v54;
  }

  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = sub_2404E238C;
  v60[3] = &unk_2650BB368;
  os_signpost_id_t v62 = v15;
  uint64_t v63 = v17;
  id v34 = v13;
  id v61 = v34;
  char v35 = (void (**)(void, void, void))MEMORY[0x2455E8E80](v60);
  v36 = [v11 client];
  BOOL v37 = [(AppleIDAuthenticationPlugin *)self _clientHasEntitlement:v36];

  if (!v37)
  {
    v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263EFB070];
    uint64_t v68 = *MEMORY[0x263F08320];
    v69 = @"The application is not permitted to verify Apple ID accounts";
    v45 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    char v46 = v43;
    uint64_t v47 = v44;
    uint64_t v48 = 7;
LABEL_11:
    v42 = [v46 errorWithDomain:v47 code:v48 userInfo:v45];

    ((void (**)(void, void, void *))v35)[2](v35, 0, v42);
    goto LABEL_12;
  }
  v38 = [v10 accountType];
  v39 = [v38 identifier];
  char v40 = [v39 isEqualToString:*MEMORY[0x263EFAE58]];

  if ((v40 & 1) == 0)
  {
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263EFB070];
    uint64_t v66 = *MEMORY[0x263F08320];
    v67 = @"Unsupported account type provided to -discoverPropertiesForAccount:accountStore:options:completion:";
    v45 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    char v46 = v49;
    uint64_t v47 = v50;
    uint64_t v48 = 4;
    goto LABEL_11;
  }
  uint64_t v64 = *MEMORY[0x263EFB388];
  uint64_t v65 = MEMORY[0x263EFFA88];
  v41 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_2404E2560;
  v55[3] = &unk_2650BB3B8;
  id v56 = v12;
  __int16 v59 = v35;
  id v57 = v10;
  id v58 = v11;
  objc_msgSend(v58, "aa_updatePropertiesForAppleAccount:options:completion:", v57, v41, v55);

  v42 = v56;
LABEL_12:
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v10 = a4;
  id v47 = a5;
  id v11 = a6;
  id v12 = _AASignpostLogSystem();
  os_signpost_id_t v13 = _AASignpostCreate();
  uint64_t v15 = v14;

  uint64_t v16 = _AASignpostLogSystem();
  uint64_t v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = [v10 client];
    v19 = [v18 bundleID];
    id v20 = [v48 accountType];
    id v21 = [v20 identifier];
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v62 = (os_signpost_id_t)v19;
    __int16 v63 = 2114;
    uint64_t v64 = v21;
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VerifyCredentials", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);
  }
  BOOL v22 = _AASignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v10 client];
    v24 = [v23 bundleID];
    int v25 = [v48 accountType];
    v26 = [v25 identifier];
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v62 = v13;
    __int16 v63 = 2114;
    uint64_t v64 = v24;
    __int16 v65 = 2114;
    uint64_t v66 = v26;
    _os_log_impl(&dword_2404DE000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: VerifyCredentials  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);
  }
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_2404E2EC8;
  v55[3] = &unk_2650BB368;
  os_signpost_id_t v57 = v13;
  uint64_t v58 = v15;
  id v27 = v11;
  id v56 = v27;
  id v28 = (void (**)(void, void, void))MEMORY[0x2455E8E80](v55);
  v29 = [v10 client];
  BOOL v30 = [(AppleIDAuthenticationPlugin *)self _clientHasEntitlement:v29];

  if (v30)
  {
    BOOL v31 = +[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts];
    id v32 = _AALogSystem();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v32, OS_LOG_TYPE_DEFAULT, "Device relies on companion auth, proceeding...", buf, 2u);
      }

      id v34 = self;
      objc_sync_enter(v34);
      accountsAwaitingRemotePasswordEntry = v34->_accountsAwaitingRemotePasswordEntry;
      v36 = [v48 identifier];
      LODWORD(accountsAwaitingRemotePasswordEntry) = [(NSMutableSet *)accountsAwaitingRemotePasswordEntry containsObject:v36];

      objc_sync_exit(v34);
      if (accountsAwaitingRemotePasswordEntry)
      {
        BOOL v37 = _AALogSystem();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_signpost_id_t v62 = (os_signpost_id_t)v48;
          _os_log_impl(&dword_2404DE000, v37, OS_LOG_TYPE_DEFAULT, "Warning! verifyCredentials is ignoring request for account %@ because we are waiting for a password for that account from ACRemoteDeviceProxy", buf, 0xCu);
        }

        id v38 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.appleaccount" code:-4 userInfo:0];
        ((void (**)(void, void, id))v28)[2](v28, 0, v38);
      }
      else
      {
        passwordlessToken = v34->_passwordlessToken;
        v34->_passwordlessToken = 0;

        idmsDataToken = v34->_idmsDataToken;
        v34->_idmsDataToken = 0;

        if (v47)
        {
          v43 = _AALogSystem();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2404DE000, v43, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin will use provided options for login.", buf, 2u);
          }

          uint64_t v44 = [v47 objectForKeyedSubscript:*MEMORY[0x263F25BB0]];
          uint64_t v45 = [v47 objectForKeyedSubscript:*MEMORY[0x263F25BB8]];
          if (v44 | v45)
          {
            id v38 = objc_alloc_init(MEMORY[0x263F291C0]);
            [v38 setServerFriendlyDescription:v44];
            [v38 setUniqueDeviceIdentifier:v45];
            [v38 setLinkType:2];
          }
          else
          {
            id v38 = 0;
          }
        }
        else
        {
          id v38 = 0;
        }
        char v46 = _AALogSystem();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_signpost_id_t v62 = (os_signpost_id_t)v48;
          _os_log_impl(&dword_2404DE000, v46, OS_LOG_TYPE_DEFAULT, "Logging in with account %@....", buf, 0xCu);
        }

        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = sub_2404E309C;
        v52[3] = &unk_2650BB3E0;
        id v54 = v28;
        id v53 = v48;
        [(AppleIDAuthenticationPlugin *)v34 _loginWithAccount:v53 store:v10 companionDevice:v38 options:v47 completion:v52];
      }
    }
    else
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v32, OS_LOG_TYPE_DEFAULT, "Device suppoprts standalone auth, proceeding...", buf, 2u);
      }

      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = sub_2404E30C0;
      v49[3] = &unk_2650BB3E0;
      v51 = v28;
      id v50 = v48;
      [(AppleIDAuthenticationPlugin *)self _fetchTokenForAccount:v50 accountStore:v10 withHandler:v49];

      id v38 = v51;
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60 = @"The application is not permitted to verify Apple ID accounts";
    char v40 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v38 = [v39 errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:v40];

    ((void (**)(void, void, id))v28)[2](v28, 0, v38);
  }
}

- (void)_loginWithAccount:(id)a3 store:(id)a4 companionDevice:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = *MEMORY[0x263EFB380];
  id v16 = a5;
  uint64_t v17 = [a6 objectForKeyedSubscript:v15];
  int v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v12;
    _os_log_impl(&dword_2404DE000, v18, OS_LOG_TYPE_DEFAULT, "Trying password-less login with account %@ with the help of Companion's Anisette data.", buf, 0xCu);
  }

  v19 = [v12 username];
  id v20 = objc_msgSend(v12, "aa_altDSID");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_2404E32D8;
  v25[3] = &unk_2650BB408;
  v25[4] = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v17;
  id v29 = v14;
  id v21 = v14;
  id v22 = v17;
  id v23 = v13;
  id v24 = v12;
  [(AppleIDAuthenticationPlugin *)self _silentlyAuthenticateAppleID:v19 altDSID:v20 companionDevice:v16 services:v22 completion:v25];
}

- (void)_tryPasswordLoginWithAccount:(id)a3 store:(id)a4 services:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 credential];
  uint64_t v15 = [v14 credentialItemForKey:*MEMORY[0x263EFB170]];

  if (v15) {
    goto LABEL_5;
  }
  id v16 = _AALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_2404EA72C();
  }

  uint64_t v17 = [v10 credential];
  uint64_t v15 = [v17 credentialItemForKey:*MEMORY[0x263EFB0F8]];

  if (v15)
  {
LABEL_5:
    int v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_2404DE000, v18, OS_LOG_TYPE_DEFAULT, "Trying password-based login for account %@...", buf, 0xCu);
    }

    v19 = [v10 username];
    id v20 = objc_msgSend(v10, "aa_altDSID");
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2404E3854;
    v24[3] = &unk_2650BB430;
    v24[4] = self;
    id v25 = v10;
    id v26 = v11;
    id v27 = v13;
    [(AppleIDAuthenticationPlugin *)self _convertPasswordToPETForAppleID:v19 altDSID:v20 password:v15 services:v12 completion:v24];
  }
  else
  {
    id v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_2404DE000, v21, OS_LOG_TYPE_DEFAULT, "_tryPasswordLoginWithAccount: we do not have a password for %@. Login has officially failed.", buf, 0xCu);
    }

    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = [(AppleIDAuthenticationPlugin *)self _parametersForProxiedAuthentication];
    id v23 = [v22 errorWithDomain:@"com.apple.appleaccount" code:-7 userInfo:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v23);
  }
}

- (void)_silentlyAuthenticateAppleID:(id)a3 altDSID:(id)a4 companionDevice:(id)a5 services:(id)a6 completion:(id)a7
{
  id v11 = (objc_class *)MEMORY[0x263F29110];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = objc_alloc_init(v11);
  [v18 setAltDSID:v15];

  [v18 setCompanionDevice:v14];
  [v18 setIsUsernameEditable:0];
  [v18 setAuthenticationType:1];
  [v18 setShouldUpdatePersistentServiceTokens:1];
  [v18 setServiceIdentifiers:v13];

  [v18 setUsername:v16];
  id v17 = objc_alloc_init(MEMORY[0x263F29118]);
  [v17 authenticateWithContext:v18 completion:v12];
}

- (void)_convertPasswordToPETForAppleID:(id)a3 altDSID:(id)a4 password:(id)a5 services:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = (objc_class *)MEMORY[0x263F29110];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_alloc_init(v13);
  [v17 setAltDSID:v16];

  [v17 setIsUsernameEditable:0];
  [v17 setServiceIdentifiers:v14];

  [v17 setAuthenticationType:1];
  [v17 setShouldUpdatePersistentServiceTokens:1];
  [v17 setUsername:v11];
  [v17 _setPassword:v15];

  [v17 _setProxyingForApp:1];
  id v18 = objc_alloc_init(MEMORY[0x263F29118]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2404E3BE8;
  v21[3] = &unk_2650BB458;
  id v22 = v11;
  id v23 = v12;
  id v19 = v11;
  id v20 = v12;
  [v18 authenticateWithContext:v17 completion:v21];
}

- (id)_parametersForProxiedAuthentication
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F291C0] currentDevice];
  [v2 setLinkType:2];
  uint64_t v3 = [v2 serializedData];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = *MEMORY[0x263F25AF8];
    v10[0] = v3;
    char v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "Failed to encode AKDevice! Proxied auth is doomed.", v8, 2u);
    }

    char v5 = 0;
  }

  return v5;
}

- (void)_beginPETBasedLoginWithAccount:(id)a3 PET:(id)a4 store:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_msgSend(v10, "aa_setPassword:", a4);
  id v13 = [v10 accountType];
  id v14 = [v13 identifier];
  char v15 = [v14 isEqual:*MEMORY[0x263EFAE58]];

  id v16 = _AALogSystem();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v16, OS_LOG_TYPE_DEFAULT, "iCloud account. Will talk to SetupService now...", buf, 2u);
    }

    int v18 = [MEMORY[0x263F25918] shouldUseUnifiedLoginEndpoint];
    id v19 = _AASignpostLogSystem();
    os_signpost_id_t v20 = _AASignpostCreate();
    uint64_t v22 = v21;

    id v23 = _AASignpostLogSystem();
    id v24 = v23;
    if (v18)
    {
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2404DE000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "LoginAndUpdateAccount", " enableTelemetry=YES ", buf, 2u);
      }

      id v25 = _AASignpostLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v41 = v20;
        _os_log_impl(&dword_2404DE000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginAndUpdateAccount  enableTelemetry=YES ", buf, 0xCu);
      }

      id v26 = [(AppleIDAuthenticationPlugin *)self _loginDelegatesParameters];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = sub_2404E42A4;
      v34[3] = &unk_2650BB480;
      os_signpost_id_t v38 = v20;
      uint64_t v39 = v22;
      v34[4] = self;
      id v35 = v10;
      id v36 = v11;
      id v37 = v12;
      objc_msgSend(v36, "aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:", v35, v26, v34);
    }
    else
    {
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2404DE000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
      }

      id v27 = _AASignpostLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v41 = v20;
        _os_log_impl(&dword_2404DE000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
      }

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_2404E4480;
      v28[3] = &unk_2650BB4A8;
      os_signpost_id_t v32 = v20;
      uint64_t v33 = v22;
      v28[4] = self;
      id v29 = v10;
      id v30 = v11;
      id v31 = v12;
      objc_msgSend(v30, "aa_registerAppleAccountWithHSA:completion:", v29, v28);
    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v16, OS_LOG_TYPE_DEFAULT, "Not an iCloud account. Going straight to delegate login...", buf, 2u);
    }

    [(AppleIDAuthenticationPlugin *)self _fetchTokenForAccount:v10 accountStore:v11 withHandler:v12];
  }
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _AASignpostLogSystem();
  os_signpost_id_t v15 = _AASignpostCreate();
  uint64_t v17 = v16;

  int v18 = _AASignpostLogSystem();
  id v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v49 = [v11 client];
    id v47 = [v49 bundleID];
    [v10 accountType];
    os_signpost_id_t v20 = v51 = v17;
    [v20 identifier];
    id v53 = v13;
    uint64_t v21 = v12;
    v23 = uint64_t v22 = self;
    uint64_t v24 = *MEMORY[0x263EFB390];
    id v25 = v21;
    id v26 = [v25 objectForKeyedSubscript:v24];
    [v26 BOOLValue];

    id v27 = [v25 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
    [v27 BOOLValue];

    id v28 = [v25 objectForKeyedSubscript:@"AARenewShouldForceInteraction"];

    [v28 BOOLValue];
    *(_DWORD *)buf = 138543874;
    os_signpost_id_t v63 = (os_signpost_id_t)v47;
    __int16 v64 = 2114;
    __int16 v65 = v23;
    __int16 v66 = 1026;
    LODWORD(v67) = 0;
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RenewCredentials", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  Options=%{public,signpost.telemetry:number1,name=Options}d  enableTelemetry=YES ", buf, 0x1Cu);

    self = v22;
    id v12 = v21;
    id v13 = v53;

    uint64_t v17 = v51;
  }

  id v29 = _AASignpostLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v52 = [v11 client];
    id v48 = [v52 bundleID];
    [v10 accountType];
    id v50 = v54 = self;
    id v30 = [v50 identifier];
    os_signpost_id_t v31 = v15;
    id v32 = v13;
    id v33 = v11;
    id v34 = v10;
    uint64_t v35 = *MEMORY[0x263EFB390];
    uint64_t v36 = v17;
    id v37 = v12;
    id v38 = v12;
    uint64_t v39 = [v38 objectForKeyedSubscript:v35];
    [v39 BOOLValue];

    char v40 = [v38 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
    [v40 BOOLValue];

    os_signpost_id_t v41 = [v38 objectForKeyedSubscript:@"AARenewShouldForceInteraction"];

    id v12 = v37;
    uint64_t v17 = v36;
    [v41 BOOLValue];

    id v10 = v34;
    id v11 = v33;
    id v13 = v32;
    os_signpost_id_t v15 = v31;
    *(_DWORD *)buf = 134218754;
    os_signpost_id_t v63 = v31;
    __int16 v64 = 2114;
    __int16 v65 = v48;
    __int16 v66 = 2114;
    uint64_t v67 = v30;
    __int16 v68 = 1026;
    int v69 = 0;
    _os_log_impl(&dword_2404DE000, v29, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RenewCredentials  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  Options=%{public,signpost.telemetry:number1,name=Options}d  enableTelemetry=YES ", buf, 0x26u);

    self = v54;
  }

  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_2404E4ACC;
  v55[3] = &unk_2650BB4D0;
  os_signpost_id_t v60 = v15;
  uint64_t v61 = v17;
  void v55[4] = self;
  id v56 = v10;
  id v57 = v11;
  id v58 = v12;
  id v59 = v13;
  id v42 = v13;
  id v43 = v12;
  id v44 = v11;
  id v45 = v10;
  char v46 = (void *)MEMORY[0x2455E8E80](v55);
  [(AppleIDAuthenticationPlugin *)self _renewCredentialsForAccount:v45 accountStore:v44 options:v43 errorMessage:0 completion:v46];
}

- (void)_handleRenewFailure:(id)a3 forAccount:(id)a4 accountStore:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, uint64_t, id))a7;
  if (!+[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts])goto LABEL_10; {
  if (objc_msgSend(v12, "ak_isAuthenticationErrorWithCode:", -7026))
  }
  {
    uint64_t v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2404EA760();
    }
LABEL_9:

LABEL_10:
    v16[2](v16, 2, v12);
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "ak_isServiceError") & 1) != 0
    || objc_msgSend(v12, "ak_isAuthenticationErrorWithCode:", -7065))
  {
    uint64_t v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2404EA7A0();
    }
    goto LABEL_9;
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_2404E4FA0;
  v30[3] = &unk_2650BB520;
  v30[4] = self;
  id v18 = v13;
  id v31 = v18;
  id v23 = v14;
  id v32 = v23;
  id v19 = v16;
  id v33 = v19;
  os_signpost_id_t v20 = (void *)MEMORY[0x2455E8E80](v30);
  uint64_t v21 = _AALogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v18;
    _os_log_impl(&dword_2404DE000, v21, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: could not silently obtain PET for account %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2404E5068;
  v24[3] = &unk_2650BB570;
  id v28 = v19;
  id v25 = v15;
  id v26 = self;
  id v27 = v18;
  id v29 = v20;
  id v22 = v20;
  [(AppleIDAuthenticationPlugin *)self _getPasswordFromCompanionForAccount:v27 store:v23 options:v25 completion:v24];

LABEL_11:
}

- (void)_getPasswordFromCompanionForAccount:(id)a3 store:(id)a4 options:(id)a5 completion:(id)a6
{
  v44[4] = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v33 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, const __CFDictionary *))a6;
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
  LODWORD(a5) = [v12 BOOLValue];

  if (a5)
  {
    id v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "Can't get password from companion, told to avoid UI", buf, 2u);
    }

    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:underlyingError:", -4405, 0);
    CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v14);
    goto LABEL_16;
  }
  v43[0] = *MEMORY[0x263EFFFC8];
  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"PASSWORD_ENTRY_REQUIRED_TITLE" value:&stru_26F499490 table:@"Localizable"];
  v44[0] = v16;
  v43[1] = *MEMORY[0x263EFFFD8];
  uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"PASSWORD_ENTRY_REQUIRED_MESSAGE" value:&stru_26F499490 table:@"Localizable"];
  v44[1] = v18;
  v43[2] = *MEMORY[0x263F00000];
  id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_signpost_id_t v20 = [v19 localizedStringForKey:@"PASSWORD_ENTRY_DISMISS_BUTTON" value:&stru_26F499490 table:@"Localizable"];
  v44[2] = v20;
  v43[3] = *MEMORY[0x263EFFFE0];
  v44[3] = MEMORY[0x263EFFA88];
  CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];

  CFUserNotificationRef v21 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v14);
  id v22 = _AALogSystem();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Showing renew-credentials prompt...";
LABEL_10:
      _os_log_impl(&dword_2404DE000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    }
  }
  else if (v23)
  {
    *(_WORD *)buf = 0;
    uint64_t v24 = "CFUserNotificationCreate in renewCredentials!";
    goto LABEL_10;
  }

  id v25 = (void *)[v10 mutableCopy];
  id v26 = [(AppleIDAuthenticationPlugin *)self _parametersForProxiedAuthentication];
  if (v26) {
    [v25 addEntriesFromDictionary:v26];
  }
  id v27 = self;
  objc_sync_enter(v27);
  accountsAwaitingRemotePasswordEntry = v27->_accountsAwaitingRemotePasswordEntry;
  id v29 = [v34 identifier];
  [(NSMutableSet *)accountsAwaitingRemotePasswordEntry addObject:v29];

  objc_sync_exit(v27);
  id v30 = _AALogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v34;
    __int16 v41 = 2112;
    id v42 = v25;
    _os_log_impl(&dword_2404DE000, v30, OS_LOG_TYPE_DEFAULT, "Asking ACRemoteDeviceProxy to obtain password for account %@ with options: %@", buf, 0x16u);
  }

  id v31 = [v33 remoteDeviceProxy];
  uint64_t v32 = *MEMORY[0x263EFB360];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_2404E5798;
  v35[3] = &unk_2650BB598;
  CFUserNotificationRef v38 = v21;
  v35[4] = v27;
  id v36 = v34;
  id v37 = v11;
  [v31 sendCommand:v32 withAccount:v36 options:v25 completion:v35];

LABEL_16:
}

- (void)_renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7
{
  v46[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, uint64_t, void *))a7;
  uint64_t v17 = [v13 client];
  BOOL v18 = [(AppleIDAuthenticationPlugin *)self _clientHasEntitlement:v17];

  if (v18)
  {
    uint64_t v37 = 0;
    CFUserNotificationRef v38 = &v37;
    uint64_t v39 = 0x2020000000;
    id v19 = (unsigned int (*)(void))off_26AFC5F08;
    id v40 = off_26AFC5F08;
    if (!off_26AFC5F08)
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = sub_2404EA360;
      v36[3] = &unk_2650BB8E0;
      v36[4] = &v37;
      sub_2404EA360((uint64_t)v36);
      id v19 = (unsigned int (*)(void))v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v19) {
      sub_2404EA808();
    }
    if (v19())
    {
      os_signpost_id_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F08320];
      id v44 = @"SetupAssistant is running SLT upgrade, force-failing credential renewal.";
      CFUserNotificationRef v21 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id v22 = [v20 errorWithDomain:*MEMORY[0x263EFB070] code:17 userInfo:v21];

      v16[2](v16, 2, v22);
    }
    else if (DMIsMigrationNeeded())
    {
      id v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08320];
      id v42 = @"DataMigration is needed, force-failing credential renewal.";
      id v26 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v22 = [v25 errorWithDomain:*MEMORY[0x263EFB070] code:17 userInfo:v26];

      v16[2](v16, 2, v22);
    }
    else
    {
      id v22 = [MEMORY[0x263F230F0] credentialForAccount:v12 clientID:0];
      id v27 = [v22 token];
      if (v27)
      {
        BOOL v28 = 0;
      }
      else
      {
        id v29 = [v22 password];
        BOOL v28 = v29 == 0;
      }
      if (![(AppleIDAuthenticationPlugin *)self _isAccountInGrayMode:v12] || v28)
      {
        [(AppleIDAuthenticationPlugin *)self _authenticateAccount:v12 inStore:v13 options:v14 errorMessage:v15 completion:v16];
      }
      else
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = sub_2404E5F2C;
        v30[3] = &unk_2650BB5C0;
        id v35 = v16;
        v30[4] = self;
        id v31 = v12;
        id v32 = v13;
        id v33 = v14;
        id v34 = v15;
        [(AppleIDAuthenticationPlugin *)self _isAccountReallyInGreyMode:v31 accountStore:v32 completion:v30];
      }
    }
  }
  else
  {
    BOOL v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F08320];
    v46[0] = @"The application is not permitted to renew Apple ID account credentials.";
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
    id v22 = [v23 errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:v24];

    v16[2](v16, 2, v22);
  }
}

- (id)_frontmostApplicationId
{
  uint64_t v2 = (void *)SBSCopyFrontmostApplicationDisplayIdentifier();
  return v2;
}

- (void)_authenticateAccount:(id)a3 inStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v49 = a6;
  id v50 = a7;
  char v46 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB378]];
  id v14 = [v13 objectForKeyedSubscript:@"AARenewShouldForceInteraction"];
  id v48 = v12;
  if (([v14 BOOLValue] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v15 = [v12 client];
  uint64_t v16 = [v15 name];
  int v17 = [v16 isEqualToString:@"findmydeviced"];

  if (!v17)
  {
LABEL_7:
    char v21 = 0;
    goto LABEL_8;
  }
  BOOL v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v12 client];
    os_signpost_id_t v20 = [v19 name];
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v71 = v20;
    _os_log_impl(&dword_2404DE000, v18, OS_LOG_TYPE_DEFAULT, "Allow %@ to force interactive auth.", buf, 0xCu);
  }
  char v21 = 1;
LABEL_8:
  id v22 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB388]];
  char v44 = [v22 BOOLValue];

  BOOL v23 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB370]];
  uint64_t v24 = (void *)*MEMORY[0x263EFB368];
  id v25 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB368]];
  uint64_t v43 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB380]];
  uint64_t v45 = [v13 objectForKeyedSubscript:*MEMORY[0x263F25AF8]];
  id v26 = objc_msgSend(MEMORY[0x263F291C0], "deviceWithSerializedData:");
  id v47 = v25;
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v28 = _AALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v71 = v24;
      __int16 v72 = 2112;
      v73 = v25;
      _os_log_impl(&dword_2404DE000, v28, OS_LOG_TYPE_DEFAULT, "Error! Invalid value type for key %@ in renewCredentials options: %@.", buf, 0x16u);
    }

    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = [v25 integerValue];
  }
  char v29 = [v11 isAuthenticated];
  id v30 = [v11 accountType];
  id v31 = [v30 identifier];
  char v32 = [v31 isEqualToString:*MEMORY[0x263EFAE58]];

  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = sub_2404E6640;
  v54[3] = &unk_2650BB6B0;
  id v33 = v11;
  id v55 = v33;
  id v34 = v46;
  id v56 = v34;
  char v66 = v21;
  id v35 = v48;
  id v57 = v35;
  id v36 = v23;
  id v58 = v36;
  id v37 = v26;
  char v67 = v44;
  id v59 = v37;
  uint64_t v65 = v27;
  char v68 = v32;
  id v38 = v43;
  id v60 = v38;
  uint64_t v61 = self;
  id v39 = v13;
  id v62 = v39;
  id v40 = v49;
  id v63 = v40;
  id v41 = v50;
  id v64 = v41;
  char v69 = v29;
  id v42 = (void (**)(void))MEMORY[0x2455E8E80](v54);
  if ([v33 isAuthenticated])
  {
    [v33 setAuthenticated:0];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = sub_2404E7270;
    v52[3] = &unk_2650BB6D8;
    id v53 = v42;
    [v35 saveAccount:v33 withHandler:v52];
  }
  else
  {
    v42[2](v42);
  }
}

- (id)_userInfoForRenewCredentialsFollowUpWithAccountStore:(id)a3 proxiedDevice:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithCapacity:1];
  uint64_t v9 = [v7 client];

  id v10 = [v9 adamOrDisplayID];

  if (v10) {
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F256B8]];
  }
  id v11 = [v5 serializedData];
  if (v11)
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "Adding proxied device identifier to renew follow up user info.", v15, 2u);
    }

    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F256C0]];
  }
  id v13 = (void *)[v8 copy];

  return v13;
}

- (void)_validateAuthenticationResults:(id)a3 error:(id)a4 forContext:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, BOOL))a6;
  id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  id v14 = [v11 clientInfo];
  id v15 = [v14 objectForKeyedSubscript:@"account"];
  uint64_t v16 = [v14 objectForKeyedSubscript:@"accountStore"];
  if ([v11 serviceType] == 2)
  {
    int v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v18 = "AppleIDAuthenticationPlugin: will not try to log in delegates, because this is an iTunes login.";
LABEL_14:
      _os_log_impl(&dword_2404DE000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v13) {
    BOOL v19 = v15 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || v16 == 0)
  {
    int v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v18 = "AppleIDAuthenticationPlugin: will not call loginDelegates, because we are missing critical info.";
      goto LABEL_14;
    }
LABEL_15:

LABEL_16:
    v12[2](v12, a4 == 0);
    goto LABEL_17;
  }
  BOOL v28 = self;
  char v21 = [v11 proxiedDevice];

  id v22 = _AALogSystem();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will not call loginDelegates, because this is a proxied device authentication.", buf, 2u);
    }

    goto LABEL_16;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will attempt loginDelegates...", buf, 2u);
  }

  uint64_t v24 = [v15 credential];

  if (v24)
  {
    id v25 = [v15 credential];
    [v25 setPassword:v13];
  }
  else
  {
    id v25 = [MEMORY[0x263EFB200] credentialWithPassword:v13];
    [v15 setCredential:v25];
  }

  id v26 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
  uint64_t v27 = _AALogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v15;
    _os_log_impl(&dword_2404DE000, v27, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will set raw password for account %@ so that our plugins will be happy.", buf, 0xCu);
  }

  if (v26) {
    objc_msgSend(v15, "_aa_setRawPassword:", v26);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_2404E7770;
  v29[3] = &unk_2650BB700;
  id v30 = v15;
  id v31 = v12;
  [(AppleIDAuthenticationPlugin *)v28 _fetchTokenForAccount:v30 accountStore:v16 withHandler:v29];

LABEL_17:
}

- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 forAccount:(id)a5 inStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (v15 && !objc_msgSend(v15, "ak_isAuthenticationErrorWithCode:", -7033))
  {
    id v22 = (void *)MEMORY[0x263F25790];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2404E8098;
    v23[3] = &unk_2650BB7C8;
    id v24 = v18;
    id v19 = v18;
    [v22 handleAuthenticationError:v15 resetAuthenticatedOnAlertFailure:v9 forAccount:v16 inStore:v17 completion:v23];
    os_signpost_id_t v20 = v24;
  }
  else
  {
    id v19 = [v14 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
    os_signpost_id_t v20 = [v14 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_2404E7A90;
    v25[3] = &unk_2650BB7A0;
    id v26 = v14;
    id v27 = v16;
    id v28 = v17;
    id v29 = v18;
    id v21 = v18;
    [(AppleIDAuthenticationPlugin *)self _updateDSID:v20 withRawPassword:v19 suggestedAccount:v27 store:v28 completion:v25];
  }
}

- (void)_updateDSID:(id)a3 withRawPassword:(id)a4 suggestedAccount:(id)a5 store:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(void))a7;
  if (v12)
  {
    id v16 = [v13 accountType];
    id v17 = [v16 identifier];
    char v18 = [v17 isEqualToString:*MEMORY[0x263EFAE58]];

    if (v18) {
      goto LABEL_7;
    }
    id v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      _os_log_impl(&dword_2404DE000, v19, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Looking for iCloud account with DSID %@ for raw password update.", buf, 0xCu);
    }

    if (!v11)
    {
LABEL_7:
      id v21 = 0;
    }
    else
    {
      os_signpost_id_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v11, "longLongValue"));
      id v21 = objc_msgSend(v14, "aa_appleAccountWithPersonID:", v20);
    }
    id v22 = _AALogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_2404DE000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin setting raw password for account %@", buf, 0xCu);
    }

    objc_msgSend(v13, "_aa_setRawPassword:", v12);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_2404E8390;
    v25[3] = &unk_2650BB7F0;
    id v26 = v21;
    id v27 = v12;
    id v28 = v14;
    id v29 = v15;
    id v23 = v21;
    [v28 saveVerifiedAccount:v13 withCompletionHandler:v25];
  }
  else
  {
    id v24 = _AALogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v24, OS_LOG_TYPE_DEFAULT, "Error: AppleIDAuthenticationPlugin did not get raw password back from AuthKit.", buf, 2u);
    }

    v15[2](v15);
  }
}

- (void)_invokeDelegatesWithAuthenticationResponse:(id)a3 password:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v57 = a4;
  id v56 = a5;
  id v59 = a6;
  id v12 = (void (**)(void))a7;
  id v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse start", buf, 2u);
  }

  id v54 = v12;
  if (qword_26AFC5F00 != -1) {
    dispatch_once(&qword_26AFC5F00, &unk_26F499150);
  }
  id v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)qword_26AFC5EF8, "count"));
  id v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)qword_26AFC5EF8, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v16 = (id)qword_26AFC5EF8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v71 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = objc_alloc_init(*(Class *)(*((void *)&v70 + 1) + 8 * i));
        [v14 addObject:v21];
        [v15 addObject:objc_opt_class()];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v70 objects:v81 count:16];
    }
    while (v18);
  }

  if ([v14 count])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v50 = v14;
    obuint64_t j = v14;
    id v22 = v54;
    uint64_t v58 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v58)
    {
      uint64_t v55 = *(void *)v67;
      uint64_t v51 = *MEMORY[0x263F25B70];
      id v53 = v11;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v67 != v55) {
            objc_enumerationMutation(obj);
          }
          id v24 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            id v25 = [v24 delegateServiceIdentifier];
            id v26 = [v11 responseParametersForServiceIdentifier:v25];
            id v27 = [v26 objectForKeyedSubscript:@"service-data"];
            if (v27
              || [(__CFString *)v25 isEqualToString:v51]
              && (id v27 = v26) != 0)
            {
              id v28 = _AALogSystem();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = objc_opt_class();
                *(_DWORD *)buf = 138412546;
                os_signpost_id_t v75 = (os_signpost_id_t)v29;
                __int16 v76 = 2112;
                v77 = v25;
                id v30 = v29;
                _os_log_impl(&dword_2404DE000, v28, OS_LOG_TYPE_DEFAULT, "%@ wants just the dictionary for delegateIdentifier %@", buf, 0x16u);
              }
              id v31 = (void *)[v27 mutableCopy];
              uint64_t v32 = [v11 dsid];
              [v31 setObject:v32 forKey:@"dsid"];
            }
            else
            {
              id v27 = [v11 responseParameters];
              id v31 = (void *)[v27 mutableCopy];
            }
          }
          else
          {
            id v26 = [v11 responseParameters];
            id v31 = (void *)[v26 mutableCopy];
            id v25 = @"Unknown";
          }

          [v31 setObject:v57 forKey:@"password"];
          id v33 = _AALogSystem();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            os_signpost_id_t v75 = (os_signpost_id_t)v34;
            id v35 = v34;
            _os_log_impl(&dword_2404DE000, v33, OS_LOG_TYPE_DEFAULT, "calling delegate %@", buf, 0xCu);
          }
          id v36 = _AASignpostLogSystem();
          os_signpost_id_t v37 = _AASignpostCreate();
          uint64_t v39 = v38;

          id v40 = _AASignpostLogSystem();
          id v41 = v40;
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            id v42 = [v59 accountType];
            uint64_t v43 = [v42 identifier];
            *(_DWORD *)buf = 138543618;
            os_signpost_id_t v75 = (os_signpost_id_t)v25;
            __int16 v76 = 2114;
            v77 = v43;
            _os_signpost_emit_with_name_impl(&dword_2404DE000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v37, "InvokeDelegateWithAuthResponse", " DelegateIdentifier=%{public,signpost.telemetry:string1,name=DelegateIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

            id v22 = v54;
            id v11 = v53;
          }

          char v44 = _AASignpostLogSystem();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v59 accountType];
            char v46 = [v45 identifier];
            *(_DWORD *)buf = 134218498;
            os_signpost_id_t v75 = v37;
            __int16 v76 = 2114;
            v77 = v25;
            __int16 v78 = 2114;
            v79 = v46;
            _os_log_impl(&dword_2404DE000, v44, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: InvokeDelegateWithAuthResponse  DelegateIdentifier=%{public,signpost.telemetry:string1,name=DelegateIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

            id v11 = v53;
            id v22 = v54;
          }

          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = sub_2404E8FA0;
          v60[3] = &unk_2650BB818;
          void v60[4] = v24;
          os_signpost_id_t v64 = v37;
          uint64_t v65 = v39;
          id v47 = v31;
          id v61 = v47;
          id v62 = v15;
          id v63 = v22;
          id v48 = (void *)MEMORY[0x2455E8E80](v60);
          if (objc_opt_respondsToSelector()) {
            [v24 didReceiveAuthenticationResponseParameters:v47 accountStore:v56 account:v59 completion:v48];
          }
          else {
            [v24 didReceiveAuthenticationResponseParameters:v47 accountStore:v56 completion:v48];
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v58);
    }

    id v14 = v50;
  }
  else
  {
    id v49 = _AALogSystem();
    id v22 = v54;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v49, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse completing – no delegates to call", buf, 2u);
    }

    v54[2](v54);
  }
}

- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 withHandler:(id)a5
{
}

- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 forceFetch:(BOOL)a5 withHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = sub_2404E9454;
  id v23 = &unk_2650BB868;
  id v24 = self;
  id v13 = v10;
  id v25 = v13;
  id v14 = v11;
  id v26 = v14;
  id v15 = v12;
  id v27 = v15;
  id v16 = (void (**)(void, void, void))MEMORY[0x2455E8E80](&v20);
  uint64_t v17 = _AALogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v13;
      _os_log_impl(&dword_2404DE000, v17, OS_LOG_TYPE_DEFAULT, "Being forced to skip cached login for account (%@)", buf, 0xCu);
    }

    v16[2](v16, 0, 0);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v13;
      _os_log_impl(&dword_2404DE000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to fetch cached login response for account (%@)", buf, 0xCu);
    }

    id v19 = objc_alloc_init(MEMORY[0x263F25808]);
    objc_msgSend(v19, "fetchCachedLoginResponseForAccount:completion:", v13, v16, v20, v21, v22, v23, v24, v25, v26);
  }
}

- (void)_performLoginDelegatesRequestForAccount:(id)a3 store:(id)a4 handler:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(AppleIDAuthenticationPlugin *)self _loginDelegatesParameters];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F258B0]) initWithAccount:v8 parameters:v11];
  id v13 = objc_msgSend(v8, "aa_personID");

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F25838]);
    id v15 = objc_msgSend(v8, "aa_personID");
    id v16 = (void *)[v14 initWithDSID:v15];

    [v16 addProvisioningInfoToAARequest:v12];
  }
  uint64_t v17 = _AASignpostLogSystem();
  os_signpost_id_t v18 = _AASignpostCreate();
  uint64_t v20 = v19;

  uint64_t v21 = _AASignpostLogSystem();
  id v22 = v21;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    uint64_t v38 = [v9 client];
    [v38 bundleID];
    id v23 = v42 = v10;
    [v8 accountType];
    uint64_t v40 = v20;
    id v25 = v24 = v11;
    id v26 = [v25 identifier];
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v51 = (os_signpost_id_t)v23;
    __int16 v52 = 2114;
    id v53 = v26;
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "LoginDelegates", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

    id v11 = v24;
    uint64_t v20 = v40;

    id v10 = v42;
  }

  id v27 = _AASignpostLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    [v9 client];
    id v41 = self;
    uint64_t v43 = v12;
    id v28 = v39 = v11;
    [v28 bundleID];
    id v29 = v9;
    v31 = id v30 = v10;
    uint64_t v32 = [v8 accountType];
    [v32 identifier];
    uint64_t v34 = v33 = v20;
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v51 = v18;
    __int16 v52 = 2114;
    id v53 = v31;
    __int16 v54 = 2114;
    uint64_t v55 = v34;
    _os_log_impl(&dword_2404DE000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginDelegates  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

    uint64_t v20 = v33;
    id v10 = v30;
    id v9 = v29;

    id v11 = v39;
    self = v41;
    id v12 = v43;
  }

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = sub_2404E9B70;
  v44[3] = &unk_2650BB890;
  os_signpost_id_t v48 = v18;
  uint64_t v49 = v20;
  v44[4] = self;
  id v45 = v8;
  id v46 = v9;
  id v47 = v10;
  id v35 = v10;
  id v36 = v9;
  id v37 = v8;
  [v12 performRequestWithHandler:v44];
}

- (void)_handleDelegatesResponseForAccount:(id)a3 store:(id)a4 response:(id)a5 error:(id)a6 handler:(id)a7
{
  v35[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, id))a7;
  uint64_t v17 = [v14 status];
  uint64_t v18 = [v17 integerValue];

  if (v15 || v18)
  {
    uint64_t v22 = [v14 statusMessage];
    uint64_t v21 = (void *)v22;
    if (v22)
    {
      id v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35[0] = v22;
      id v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v25 = [v23 errorWithDomain:@"com.apple.appleaccount" code:v18 userInfo:v24];

      id v15 = (id)v25;
    }
    id v26 = [v12 credential];
    [v26 setPassword:0];

    v16[2](v16, 0, v15);
  }
  else
  {
    uint64_t v19 = [v12 credential];
    uint64_t v20 = [v19 password];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2404E9FA8;
    v27[3] = &unk_2650BB8B8;
    id v28 = v12;
    id v29 = v20;
    id v30 = self;
    id v31 = v14;
    id v32 = 0;
    uint64_t v33 = v16;
    id v15 = v20;
    [(AppleIDAuthenticationPlugin *)self _invokeDelegatesWithAuthenticationResponse:v31 password:v15 store:v13 account:v28 completion:v27];

    uint64_t v21 = v28;
  }
}

- (id)_loginDelegatesParameters
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F3CC60] sharedInstance];
  int v3 = [v2 needsLostModeExitAuth];

  uint64_t v4 = MEMORY[0x263EFFA78];
  id v5 = (void *)MEMORY[0x263EFFA78];
  if (v3)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "FMDFMIPManager says we need a lost-mode exit token.", v10, 2u);
    }

    id v5 = &unk_26F499F10;
  }
  uint64_t v7 = *MEMORY[0x263F25B70];
  v11[0] = *MEMORY[0x263F25B58];
  v11[1] = v7;
  v12[0] = v4;
  v12[1] = v5;
  v11[2] = *MEMORY[0x263F25B68];
  v12[2] = &unk_26F499F38;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  return v8;
}

- (id)_parametersForIDSAlertFromLoginResponse:(id)a3
{
  return 0;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    uint64_t v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
    id v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsDataToken, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_accountsAwaitingRemotePasswordEntry, 0);
}

@end