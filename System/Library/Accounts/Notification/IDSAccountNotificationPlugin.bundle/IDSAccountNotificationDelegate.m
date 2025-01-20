@interface IDSAccountNotificationDelegate
- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4;
- (IDSAccountNotificationDelegate)init;
- (id)_findExistingIdentityServicesACAccountWithUserName:(id)a3 inStore:(id)a4;
- (id)_passwordEquivalentTokenFromAccount:(id)a3;
- (void)_gameCenterModifyBasedOnUsername:(id)a3;
- (void)_gameCenterSignInBasedOnAccount:(id)a3 inStore:(id)a4;
- (void)_gameCenterSignOut;
- (void)_iCloudModifyBasedOnUsername:(id)a3;
- (void)_iCloudSignInBasedOnAccount:(id)a3 inStore:(id)a4;
- (void)_iCloudSignOut;
- (void)_iTunesSignInBasedOnAccount:(id)a3;
- (void)_iTunesSignOut;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation IDSAccountNotificationDelegate

- (IDSAccountNotificationDelegate)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)IDSAccountNotificationDelegate;
  v2 = [(IDSAccountNotificationDelegate *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v2;
      _os_log_impl(&dword_2405AF000, v3, OS_LOG_TYPE_DEFAULT, "IDSAccountNotificationDelegate loaded { self: %p }", buf, 0xCu);
    }

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.identityservices.idsaccountnotficationdelegate", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_setupRequestPending = 0;
  }
  return v2;
}

- (id)_findExistingIdentityServicesACAccountWithUserName:(id)a3 inStore:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263EFAF20];
  objc_super v8 = [v6 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF20]];
  if (!v8)
  {
    v9 = [MEMORY[0x263F4A860] warning];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_2405B18C0(v7, v9);
    }
    goto LABEL_18;
  }
  v9 = [v6 accountsWithAccountType:v8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (!v10)
  {
LABEL_18:
    id v12 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  id v20 = v6;
  id v12 = 0;
  uint64_t v13 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v9);
      }
      if (!v12)
      {
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 username];
        int v17 = [v16 isEqualToIgnoringCase:v5];

        if (v17)
        {
          id v12 = v15;
          v18 = [MEMORY[0x263F4A860] registration];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v12;
            _os_log_impl(&dword_2405AF000, v18, OS_LOG_TYPE_DEFAULT, "Found matching IDS ACAccount { account: %@ }", buf, 0xCu);
          }
        }
        else
        {
          id v12 = 0;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
  }
  while (v11);
  id v6 = v20;
LABEL_19:

  return v12;
}

- (void)_iCloudSignInBasedOnAccount:(id)a3 inStore:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263F4A860];
  id v8 = a4;
  v9 = [v7 registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_2405AF000, v9, OS_LOG_TYPE_DEFAULT, "Signing in iCloud-based IDS services { account: %@ }", buf, 0xCu);
  }

  uint64_t v10 = [v6 username];
  uint64_t v11 = [(IDSAccountNotificationDelegate *)self _findExistingIdentityServicesACAccountWithUserName:v10 inStore:v8];

  if (v11)
  {
    self->_setupRequestPending = 0;
    id v12 = [v11 username];
    uint64_t v13 = (void *)[v12 copy];

    v14 = [v11 credential];
    v15 = [v14 token];
    v16 = (void *)[v15 copy];

    int v17 = [v11 accountPropertyForKey:*MEMORY[0x263F49E08]];
    v18 = (void *)[v17 copy];

    v19 = [v11 accountPropertyForKey:*MEMORY[0x263F49E10]];
    id v20 = (void *)[v19 copy];

    queue = self->_queue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2405B0564;
    v27[3] = &unk_2650C4400;
    id v28 = v13;
    id v29 = v16;
    id v30 = v18;
    id v31 = v20;
    id v22 = v20;
    id v23 = v18;
    id v24 = v16;
    v25 = v13;
    dispatch_async(queue, v27);
    self->_setupRequestPending = 0;
  }
  else
  {
    self->_setupRequestPending = 1;
    v25 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v6 username];
      *(_DWORD *)buf = 138412290;
      id v33 = v26;
      _os_log_impl(&dword_2405AF000, v25, OS_LOG_TYPE_DEFAULT, "No existing ACAccount for this username, waiting... { username: %@ }", buf, 0xCu);
    }
  }
}

- (void)_iCloudSignOut
{
}

- (void)_iCloudModifyBasedOnUsername:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405B0628;
  block[3] = &unk_2650C4448;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)_passwordEquivalentTokenFromAccount:(id)a3
{
  v3 = [a3 credential];
  id v4 = [v3 password];

  return v4;
}

- (void)_iTunesSignInBasedOnAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_2405AF000, v5, OS_LOG_TYPE_DEFAULT, "Signing in iTunes-based IDS services { account: %@ }", buf, 0xCu);
  }

  id v6 = [v4 username];
  uint64_t v7 = (void *)[v6 copy];

  id v8 = [(IDSAccountNotificationDelegate *)self _passwordEquivalentTokenFromAccount:v4];
  v9 = (void *)[v8 copy];

  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2405B0804;
  v13[3] = &unk_2650C4470;
  id v14 = v7;
  id v15 = v9;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(queue, v13);
}

- (void)_iTunesSignOut
{
}

- (void)_gameCenterSignInBasedOnAccount:(id)a3 inStore:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_2405AF000, v6, OS_LOG_TYPE_DEFAULT, "Signing in GameCenter-based IDS services { account: %@ }", buf, 0xCu);
  }

  uint64_t v7 = [v5 username];
  id v8 = (void *)[v7 copy];

  v9 = [(IDSAccountNotificationDelegate *)self _passwordEquivalentTokenFromAccount:v5];
  uint64_t v10 = (void *)[v9 copy];

  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2405B09B8;
  v14[3] = &unk_2650C4470;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (void)_gameCenterSignOut
{
}

- (void)_gameCenterModifyBasedOnUsername:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405B0A80;
  block[3] = &unk_2650C4448;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v10 = (IDSAccountNotificationDelegate *)a3;
  id v11 = a5;
  id v12 = (IDSAccountNotificationDelegate *)a6;
  id v13 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[IDSAccountNotificationDelegate account:didChangeWithType:inStore:oldAccount:]";
    __int16 v79 = 2048;
    v80 = self;
    _os_log_impl(&dword_2405AF000, v13, OS_LOG_TYPE_DEFAULT, "%s invoked { self: %p }", buf, 0x16u);
  }

  id v14 = (void *)MEMORY[0x263EFAE58];
  if (a4 == 3)
  {
    id v15 = [(IDSAccountNotificationDelegate *)v12 accountType];
    id v16 = [v15 identifier];

    if ([v16 isEqualToString:*v14])
    {
      id v17 = self;
      id v18 = v16;
      id v76 = v11;
      uint64_t v19 = v12;
      id v20 = [(IDSAccountNotificationDelegate *)v12 accountPropertyForKey:@"primaryAccount"];
      int v21 = [v20 BOOLValue];
      int v22 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v23 = [(IDSAccountNotificationDelegate *)v10 accountType];
    id v16 = [v23 identifier];

    if ([v16 isEqualToString:*v14])
    {
      id v17 = self;
      id v18 = v16;
      uint64_t v19 = v12;
      id v76 = v11;
      if (a4 == 2)
      {
        id v20 = [(IDSAccountNotificationDelegate *)v10 accountPropertyForKey:@"primaryAccount"];
        int v24 = [v20 BOOLValue];
        int v21 = 0;
        int v22 = 0;
        goto LABEL_11;
      }
      if (a4 != 1)
      {
        int v21 = 0;
        int v22 = 0;
        int v24 = 0;
        goto LABEL_12;
      }
      id v20 = [(IDSAccountNotificationDelegate *)v10 accountPropertyForKey:@"primaryAccount"];
      int v22 = [v20 BOOLValue];
      int v21 = 0;
LABEL_10:
      int v24 = 0;
LABEL_11:

LABEL_12:
      v25 = [MEMORY[0x263F4A860] registration];
      id v12 = v19;
      id v16 = v18;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if ((a4 - 1) > 3) {
          id v26 = @"Unknown";
        }
        else {
          id v26 = off_2650C4490[a4 - 1];
        }
        id v29 = @"NO";
        *(_DWORD *)buf = 138413570;
        v78 = (const char *)v12;
        if (v22) {
          id v30 = @"YES";
        }
        else {
          id v30 = @"NO";
        }
        if (v21) {
          id v31 = @"YES";
        }
        else {
          id v31 = @"NO";
        }
        if (v24) {
          id v29 = @"YES";
        }
        __int16 v79 = 2112;
        v80 = v10;
        __int16 v81 = 2112;
        v82 = v26;
        __int16 v83 = 2112;
        v84 = v30;
        __int16 v85 = 2112;
        v86 = v31;
        __int16 v87 = 2112;
        v88 = v29;
        _os_log_impl(&dword_2405AF000, v25, OS_LOG_TYPE_DEFAULT, "iCloud account changed { oldAccount: %@, newAccount: %@, changeType: %@, didSignIn: %@, didSignOut: %@, wasModified: %@ }", buf, 0x3Eu);
      }

      if (v22)
      {
        v32 = v17;
        id v33 = v10;
        id v11 = v76;
LABEL_37:
        [(IDSAccountNotificationDelegate *)v32 _iCloudSignInBasedOnAccount:v33 inStore:v11];
        goto LABEL_135;
      }
      id v11 = v76;
      if (v21)
      {
        [(IDSAccountNotificationDelegate *)v17 _iCloudSignOut];
        goto LABEL_135;
      }
      if (!v24) {
        goto LABEL_135;
      }
      v40 = [(IDSAccountNotificationDelegate *)v10 username];
      [(IDSAccountNotificationDelegate *)v17 _iCloudModifyBasedOnUsername:v40];
LABEL_134:

      goto LABEL_135;
    }
  }
  if ([v16 isEqualToString:*MEMORY[0x263EFB000]])
  {
    unsigned int v73 = a4 - 1;
    if (a4 == 1)
    {
      id v41 = v11;
      int v75 = [(IDSAccountNotificationDelegate *)v10 isActive];
    }
    else
    {
      if (a4 == 2)
      {
        if ([(IDSAccountNotificationDelegate *)v12 isActive]) {
          int v27 = 0;
        }
        else {
          int v27 = [(IDSAccountNotificationDelegate *)v10 isActive];
        }
        int v75 = v27;
        id v41 = v11;
        if ([(IDSAccountNotificationDelegate *)v10 isActive]) {
          int v43 = [(IDSAccountNotificationDelegate *)v10 isAuthenticated];
        }
        else {
          int v43 = 0;
        }
        int v42 = 1;
        goto LABEL_71;
      }
      id v41 = v11;
      int v75 = 0;
    }
    int v42 = 0;
    int v43 = 0;
LABEL_71:
    v50 = [(IDSAccountNotificationDelegate *)self _passwordEquivalentTokenFromAccount:v10];
    uint64_t v51 = [v50 length];

    if (!v51) {
      int v43 = 0;
    }
    if (a4 == 3) {
      int v52 = [(IDSAccountNotificationDelegate *)v12 isActive];
    }
    else {
      int v52 = 0;
    }
    id v11 = v41;
    if (v42 && [(IDSAccountNotificationDelegate *)v12 isActive]) {
      int v53 = [(IDSAccountNotificationDelegate *)v10 isActive] ^ 1;
    }
    else {
      int v53 = 0;
    }
    int v54 = v52 | v53;
    v55 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      if (v73 > 3) {
        v56 = @"Unknown";
      }
      else {
        v56 = off_2650C4490[v73];
      }
      *(_DWORD *)buf = 138413826;
      v57 = @"YES";
      v78 = (const char *)v12;
      __int16 v79 = 2112;
      if (v75) {
        v58 = @"YES";
      }
      else {
        v58 = @"NO";
      }
      v80 = v10;
      if (v43) {
        v59 = @"YES";
      }
      else {
        v59 = @"NO";
      }
      __int16 v81 = 2112;
      if (!v54) {
        v57 = @"NO";
      }
      v82 = v56;
      __int16 v83 = 2112;
      v84 = @"NO";
      __int16 v85 = 2112;
      v86 = v58;
      __int16 v87 = 2112;
      v88 = v59;
      __int16 v89 = 2112;
      v90 = v57;
      _os_log_impl(&dword_2405AF000, v55, OS_LOG_TYPE_DEFAULT, "iTunes account changed { oldAccount: %@, newAccount: %@, changeType: %@, addedMediaTypes: %@, didSignIn: %@, isInGoodStateForRepair: %@, didSignOut: %@ }", buf, 0x48u);
    }

    if ((v75 | v43) == 1)
    {
      [(IDSAccountNotificationDelegate *)self _iTunesSignInBasedOnAccount:v10];
    }
    else if (v54)
    {
      [(IDSAccountNotificationDelegate *)self _iTunesSignOut];
    }
    goto LABEL_135;
  }
  if ([v16 isEqualToString:*MEMORY[0x263EFAEE0]])
  {
    unsigned int v72 = a4 - 1;
    if (a4 == 1)
    {
      id v47 = v11;
      LODWORD(v74) = 0;
      HIDWORD(v74) = [(IDSAccountNotificationDelegate *)v10 isActive];
    }
    else
    {
      if (a4 == 2)
      {
        if ([(IDSAccountNotificationDelegate *)v12 isActive]) {
          int v28 = 0;
        }
        else {
          int v28 = [(IDSAccountNotificationDelegate *)v10 isActive];
        }
        HIDWORD(v74) = v28;
        id v47 = v11;
        if ([(IDSAccountNotificationDelegate *)v10 isActive])
        {
          int v49 = [(IDSAccountNotificationDelegate *)v10 isAuthenticated];
          LODWORD(v74) = 1;
        }
        else
        {
          LODWORD(v74) = 0;
          int v49 = 0;
        }
        int v48 = 1;
        goto LABEL_102;
      }
      id v47 = v11;
      uint64_t v74 = 0;
    }
    int v48 = 0;
    int v49 = 0;
LABEL_102:
    v60 = [(IDSAccountNotificationDelegate *)self _passwordEquivalentTokenFromAccount:v10];
    uint64_t v61 = [v60 length];

    if (v61) {
      int v62 = v49;
    }
    else {
      int v62 = 0;
    }
    if (a4 == 3) {
      int v63 = [(IDSAccountNotificationDelegate *)v12 isActive];
    }
    else {
      int v63 = 0;
    }
    id v11 = v47;
    if (v48 && [(IDSAccountNotificationDelegate *)v12 isActive]) {
      int v64 = [(IDSAccountNotificationDelegate *)v10 isActive] ^ 1;
    }
    else {
      int v64 = 0;
    }
    int v65 = v63 | v64;
    v66 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v72 > 3) {
        v67 = @"Unknown";
      }
      else {
        v67 = off_2650C4490[v72];
      }
      v68 = @"NO";
      *(_DWORD *)buf = 138413826;
      v78 = (const char *)v12;
      __int16 v79 = 2112;
      if (HIDWORD(v74)) {
        v69 = @"YES";
      }
      else {
        v69 = @"NO";
      }
      v80 = v10;
      if (v62) {
        v70 = @"YES";
      }
      else {
        v70 = @"NO";
      }
      v82 = v67;
      if (v74) {
        v71 = @"YES";
      }
      else {
        v71 = @"NO";
      }
      __int16 v81 = 2112;
      if (v65) {
        v68 = @"YES";
      }
      __int16 v83 = 2112;
      v84 = v69;
      __int16 v85 = 2112;
      v86 = v70;
      __int16 v87 = 2112;
      v88 = v71;
      __int16 v89 = 2112;
      v90 = v68;
      _os_log_impl(&dword_2405AF000, v66, OS_LOG_TYPE_DEFAULT, "GameCenter account changed { oldAccount: %@, newAccount: %@, changeType: %@, didSignIn: %@, isInGoodStateForRepair: %@, wasModified: %@, didSignOut: %@ }", buf, 0x48u);
    }

    if ((HIDWORD(v74) | v62) == 1)
    {
      [(IDSAccountNotificationDelegate *)self _gameCenterSignInBasedOnAccount:v10 inStore:v47];
      goto LABEL_135;
    }
    if (v65)
    {
      [(IDSAccountNotificationDelegate *)self _gameCenterSignOut];
      goto LABEL_135;
    }
    if (!v74) {
      goto LABEL_135;
    }
    v40 = [(IDSAccountNotificationDelegate *)v10 username];
    [(IDSAccountNotificationDelegate *)self _gameCenterModifyBasedOnUsername:v40];
    goto LABEL_134;
  }
  if ([v16 isEqualToString:*MEMORY[0x263EFAF00]])
  {
    uint64_t v34 = [(IDSAccountNotificationDelegate *)v12 username];
    if ([v34 length])
    {
      v35 = [(IDSAccountNotificationDelegate *)v10 username];
      if ([v35 length])
      {
        v36 = [(IDSAccountNotificationDelegate *)v12 username];
        v37 = [(IDSAccountNotificationDelegate *)v10 username];
        char v38 = [v36 isEqualToString:v37];

        if (v38) {
          goto LABEL_135;
        }
        v39 = [MEMORY[0x263F4A860] registration];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)v12;
          __int16 v79 = 2112;
          v80 = v10;
          _os_log_impl(&dword_2405AF000, v39, OS_LOG_TYPE_DEFAULT, "IDMS account username changed { oldAccount: %@, newAccount: %@ }", buf, 0x16u);
        }

        uint64_t v34 = [(IDSAccountNotificationDelegate *)v12 username];
        v35 = [(IDSAccountNotificationDelegate *)v10 username];
        IDSUpdateUser();
      }
    }
    goto LABEL_135;
  }
  if ([v16 isEqualToString:*MEMORY[0x263EFAF20]])
  {
    v44 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_setupRequestPending) {
        v45 = @"YES";
      }
      else {
        v45 = @"NO";
      }
      if ((a4 - 1) > 3) {
        v46 = @"Unknown";
      }
      else {
        v46 = off_2650C4490[a4 - 1];
      }
      *(_DWORD *)buf = 138413058;
      v78 = (const char *)v45;
      __int16 v79 = 2112;
      v80 = v12;
      __int16 v81 = 2112;
      v82 = (__CFString *)v10;
      __int16 v83 = 2112;
      v84 = v46;
      _os_log_impl(&dword_2405AF000, v44, OS_LOG_TYPE_DEFAULT, "IDS account changed { requestPending: %@, oldAccount: %@, newAccount: %@, changeType: %@ }", buf, 0x2Au);
    }

    if (self->_setupRequestPending && a4 <= 4 && ((1 << a4) & 0x16) != 0)
    {
      v32 = self;
      id v33 = v10;
      goto LABEL_37;
    }
  }
LABEL_135:
}

- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4
{
  v50[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 accountType];
  id v8 = [v7 identifier];
  uint64_t v9 = *MEMORY[0x263EFAF20];
  uint64_t v10 = [v8 compare:*MEMORY[0x263EFAF20] options:4];

  if (v10)
  {
    BOOL v11 = 1;
    goto LABEL_41;
  }
  v50[0] = v9;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
  id v48 = 0;
  id v13 = [v6 accountsWithAccountTypeIdentifiers:v12 error:&v48];
  id v14 = v48;

  if (!v13)
  {
    id v16 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2405B1938((uint64_t)v14, v16);
    }
    goto LABEL_37;
  }
  id v15 = [v5 accountProperties];
  id v16 = [v15 objectForKeyedSubscript:@"profile-id"];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v13;
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v43) {
    goto LABEL_34;
  }
  uint64_t v42 = *(void *)v45;
  id v39 = v14;
  id v40 = v6;
  char v38 = v13;
  do
  {
    uint64_t v17 = 0;
    id v18 = obj;
    do
    {
      if (*(void *)v45 != v42) {
        objc_enumerationMutation(v18);
      }
      uint64_t v19 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
      id v20 = objc_msgSend(v5, "identifier", v38);
      if (![v20 length]) {
        goto LABEL_14;
      }
      int v21 = [v19 identifier];
      if (![v21 length])
      {

LABEL_14:
        goto LABEL_15;
      }
      int v22 = [v5 identifier];
      id v23 = [v19 identifier];
      char v24 = [v22 isEqualToString:v23];

      if (v24)
      {
        BOOL v11 = 1;
LABEL_39:

        id v13 = v18;
        id v14 = v39;
        id v6 = v40;
        goto LABEL_40;
      }
LABEL_15:
      if (objc_msgSend(v5, "aa_isDuplicateAccount:", v19)) {
        goto LABEL_38;
      }
      v25 = [v19 accountProperties];
      id v26 = [v25 objectForKeyedSubscript:@"profile-id"];

      if ([v16 length]
        && [v26 length]
        && [v16 isEqualToString:v26])
      {
        int v27 = [v19 username];
        if ([v27 length])
        {
          int v28 = [v5 username];
          if ([v28 length])
          {
            id v29 = [v19 username];
            id v30 = [v5 username];
            char v31 = [v29 isEqualToString:v30];
          }
          else
          {
            char v31 = 0;
          }
        }
        else
        {
          char v31 = 0;
        }

        v32 = [v19 username];
        if ([v32 length])
        {
          id v33 = [v5 username];
          BOOL v34 = [v33 length] == 0;
        }
        else
        {
          BOOL v34 = 0;
        }

        char v35 = v31 | v34;
        id v18 = obj;
        if (v35)
        {
LABEL_38:
          BOOL v11 = 0;
          goto LABEL_39;
        }
      }
      else
      {
      }
      ++v17;
    }
    while (v43 != v17);
    uint64_t v36 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
    id v14 = v39;
    id v6 = v40;
    id v13 = v38;
    uint64_t v43 = v36;
  }
  while (v36);
LABEL_34:

LABEL_37:
  BOOL v11 = 1;
LABEL_40:

LABEL_41:
  return v11;
}

- (void).cxx_destruct
{
}

@end