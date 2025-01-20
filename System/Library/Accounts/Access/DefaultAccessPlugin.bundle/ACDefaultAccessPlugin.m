@interface ACDefaultAccessPlugin
+ (BOOL)_accessAlertFormerlySupportedByAccountType:(id)a3;
+ (BOOL)_accessAlertSupportedByAccountType:(id)a3;
+ (BOOL)supportsAccountTypeWithIdentifier:(id)a3;
+ (id)_defaultAccessEntitlementForAccountType:(id)a3;
+ (id)_fullAccessEntitlementForAccountType:(id)a3;
+ (id)_supportedAccountTypeIdentifiers;
- (BOOL)_shouldGrantClient:(id)a3 defaultAccessToAccountType:(id)a4;
- (BOOL)_shouldGrantClient:(id)a3 unrestrictedAccessToAccountType:(id)a4;
- (void)_presentAccessAlertforClient:(id)a3 onAccountType:(id)a4 withHandler:(id)a5;
- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8;
- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5;
@end

@implementation ACDefaultAccessPlugin

+ (id)_supportedAccountTypeIdentifiers
{
  v12[14] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFAEB8];
  v12[0] = *MEMORY[0x263EFAE70];
  v12[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFAEE0];
  v12[2] = *MEMORY[0x263EFAF60];
  v12[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFAE58];
  v12[4] = *MEMORY[0x263EFB000];
  v12[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFAFD0];
  v12[6] = *MEMORY[0x263EFAE68];
  v12[7] = v5;
  uint64_t v6 = *MEMORY[0x263EFAED8];
  v12[8] = *MEMORY[0x263EFAFA0];
  v12[9] = v6;
  uint64_t v7 = *MEMORY[0x263EFAFC0];
  v12[10] = *MEMORY[0x263EFAFD8];
  v12[11] = v7;
  uint64_t v8 = *MEMORY[0x263EFAF00];
  v12[12] = *MEMORY[0x263EFAFF8];
  v12[13] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:14];
  v10 = [MEMORY[0x263EFFA08] setWithArray:v9];

  return v10;
}

+ (BOOL)supportsAccountTypeWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _supportedAccountTypeIdentifiers];
  char v5 = [v4 containsObject:v3];

  if (v3 && (v5 & 1) == 0) {
    char v5 = [v3 rangeOfString:@"com.apple.account.kerberos.sso." options:8] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(id, uint64_t, void))a8;
  v37 = [v13 identifier];
  v18 = [v16 authorizationManager];
  if ([v14 hasEntitlement:*MEMORY[0x263EFB2B0]])
  {
    v17[2](v17, 1, 0);
  }
  else if ([(ACDefaultAccessPlugin *)self _shouldGrantClient:v14 unrestrictedAccessToAccountType:v13])
  {
    v19 = _ACDLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_2404DA8AC();
    }

    v17[2](v17, 1, 0);
  }
  else
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    v36 = [MEMORY[0x263EFF910] date];
    BOOL v20 = [(ACDefaultAccessPlugin *)self _shouldGrantClient:v14 defaultAccessToAccountType:v13];
    int v21 = [(id)objc_opt_class() _accessAlertSupportedByAccountType:v13];
    if ((v20 | v21) == 1
      && ([v18 authorizationForClient:v14 accountType:v13],
          v22 = objc_claimAutoreleasedReturnValue(),
          (v23 = v22) != 0))
    {
      uint64_t v24 = [v22 isGranted];
      v25 = _ACDLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        [NSNumber numberWithBool:v24];
        objc_claimAutoreleasedReturnValue();
        sub_2404DAA9C();
      }

      v17[2](v17, v24, 0);
    }
    else
    {
      if (v20)
      {
        v26 = _ACDLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_2404DA91C();
        }

        v23 = 0;
        int v27 = 1;
        *((unsigned char *)v42 + 24) = 1;
      }
      else if (v21)
      {
        v28 = _ACDLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_2404DA98C((uint64_t)v14, v28);
        }

        dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = sub_2404D9FC8;
        v38[3] = &unk_2650BADA0;
        v40 = &v41;
        v30 = v29;
        v39 = v30;
        [(ACDefaultAccessPlugin *)self _presentAccessAlertforClient:v14 onAccountType:v13 withHandler:v38];
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

        v23 = 0;
        int v27 = 1;
      }
      else
      {
        if ([(id)objc_opt_class() _accessAlertFormerlySupportedByAccountType:v13])
        {
          v31 = _ACDLogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            [v13 identifier];
            objc_claimAutoreleasedReturnValue();
            sub_2404DAA04();
          }
        }
        else
        {
          v31 = _ACDLogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            [v13 identifier];
            objc_claimAutoreleasedReturnValue();
            sub_2404DAA4C();
          }
        }

        v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
        int v27 = 0;
      }
      v32 = (void *)[objc_alloc(MEMORY[0x263F230E8]) initForClient:v14];
      [v32 setIsGranted:*((unsigned __int8 *)v42 + 24)];
      if (v27)
      {
        uint64_t v33 = [v18 setAuthorization:v32 forClient:v14 onAccountType:v13];

        v23 = (void *)v33;
      }
      v34 = [v13 identifier];
      v35 = [v14 bundleID];
      [v36 timeIntervalSinceNow];
      ACDLogAccessRequest();

      ((void (**)(id, uint64_t, void *))v17)[2](v17, *((unsigned __int8 *)v42 + 24), v23);
    }

    _Block_object_dispose(&v41, 8);
  }
}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F230E8];
  v10 = (void (**)(id, BOOL, void *))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v18 = (id)[[v9 alloc] initForClient:v12];
  [v18 setIsGranted:1];
  id v14 = [v11 authorizationManager];

  id v15 = [v14 setAuthorization:v18 forClient:v12 onAccountType:v13];

  id v16 = [v13 identifier];

  v17 = [v12 bundleID];

  [v18 isGranted];
  ACDLogAccessRequest();

  v10[2](v10, v15 == 0, v15);
}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, BOOL, void *))a6;
  id v12 = a5;
  id v13 = _ACDLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_2404DAAE4((uint64_t)v10, v9, v13);
  }

  id v14 = (void *)[objc_alloc(MEMORY[0x263F230E8]) initForClient:v10];
  [v14 setIsGranted:0];
  id v15 = [v12 authorizationManager];

  id v16 = [v15 setAuthorization:v14 forClient:v10 onAccountType:v9];

  v17 = [v9 identifier];
  id v18 = [v10 bundleID];
  [v14 isGranted];
  ACDLogAccessRequest();

  v11[2](v11, v16 == 0, v16);
}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, void *))a5;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_2404DAB90(v7, v10);
  }

  id v11 = [v9 authorizationManager];

  id v12 = [v11 removeAllClientAuthorizationsForAccountType:v7];

  v8[2](v8, v12 == 0, v12);
}

- (BOOL)_shouldGrantClient:(id)a3 unrestrictedAccessToAccountType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _fullAccessEntitlementForAccountType:v6];

  if (v7) {
    char v8 = [v5 hasEntitlement:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldGrantClient:(id)a3 defaultAccessToAccountType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _defaultAccessEntitlementForAccountType:v6];

  if (v7) {
    char v8 = [v5 hasEntitlement:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (id)_defaultAccessEntitlementForAccountType:(id)a3
{
  return 0;
}

+ (BOOL)_accessAlertSupportedByAccountType:(id)a3
{
  return 0;
}

+ (BOOL)_accessAlertFormerlySupportedByAccountType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  char v5 = [v4 isEqual:*MEMORY[0x263EFAFD0]];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v3 identifier];
    char v6 = [v7 isEqual:*MEMORY[0x263EFAFA0]];
  }
  return v6;
}

+ (id)_fullAccessEntitlementForAccountType:(id)a3
{
  id v3 = [a3 identifier];
  if (([v3 isEqual:*MEMORY[0x263EFAE70]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x263EFAEB8]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x263EFAF60]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x263EFAEE0]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x263EFB000]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x263EFAE58]] & 1) != 0)
  {
    uint64_t v4 = (id *)MEMORY[0x263EFB2B8];
LABEL_8:
    id v5 = *v4;
    goto LABEL_9;
  }
  if ([v3 isEqual:*MEMORY[0x263EFAE68]])
  {
    uint64_t v4 = (id *)MEMORY[0x263EFB2C0];
    goto LABEL_8;
  }
  if ([v3 isEqual:*MEMORY[0x263EFAF00]])
  {
    uint64_t v4 = (id *)MEMORY[0x263EFB2F0];
    goto LABEL_8;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

- (void)_presentAccessAlertforClient:(id)a3 onAccountType:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int v21 = [a3 localizedAppName];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"ACCOUNT_ACCESS_MESSAGE" value:&stru_26F498468 table:@"Localizable"];

  id v11 = NSString;
  id v12 = [v8 accountTypeDescription];

  id v13 = objc_msgSend(v11, "stringWithFormat:", v10, v21, v12);

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2404DA83C;
  v22[3] = &unk_2650BADC8;
  id v23 = v7;
  id v20 = v7;
  id v14 = (void *)MEMORY[0x2455E89A0](v22);
  id v15 = (void *)MEMORY[0x263F23100];
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"DONT_ALLOW" value:&stru_26F498468 table:@"Localizable"];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"OK" value:&stru_26F498468 table:@"Localizable"];
  [v15 showUserNotificationWithTitle:v13 message:&stru_26F498468 cancelButtonTitle:v17 otherButtonTitle:v19 withCompletionBlock:v14];
}

@end