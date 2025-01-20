@interface SecureBackupAccountNotification
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation SecureBackupAccountNotification

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [NSString stringWithUTF8String:"-[SecureBackupAccountNotification account:willChangeWithType:inStore:oldAccount:]"];
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl(&dword_2405E6000, v8, OS_LOG_TYPE_DEFAULT, "in %@", buf, 0xCu);
  }
  v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithUnsignedInt:v6];
    *(_DWORD *)buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_2405E6000, v10, OS_LOG_TYPE_DEFAULT, "account %@, ACAccountChangeType = %@", buf, 0x16u);
  }
  if (sub_2405E7450() && sub_2405E74CC(v7))
  {
    v12 = [v7 identifier];
    if (v6 == 3)
    {
      v13 = [objc_alloc(MEMORY[0x263F32998]) initWithUserActivityLabel:@"EMCS backup"];
      uint64_t v23 = *MEMORY[0x263F329F0];
      uint64_t v24 = MEMORY[0x263EFFA88];
      v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v15 = [v13 backupWithInfo:v14];
      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_2405E7D2C();
      }
    }
    else
    {
      if (MKBGetDeviceLockState() != 3)
      {
        v13 = CloudServicesLog();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        v14 = [v7 username];
        *(_DWORD *)buf = 138412546;
        id v26 = v12;
        __int16 v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_2405E6000, v13, OS_LOG_TYPE_DEFAULT, "nothing to do for account %@: %@", buf, 0x16u);
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v17 = objc_msgSend(v7, "_aa_rawPassword");
      if (!v17)
      {
        v13 = CloudServicesLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v12;
          _os_log_impl(&dword_2405E6000, v13, OS_LOG_TYPE_DEFAULT, "Account %@ did not present a password", buf, 0xCu);
        }
        goto LABEL_19;
      }
      v13 = v17;
      v14 = objc_msgSend(v7, "aa_personID");
      v18 = CloudServicesLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v14;
        _os_log_impl(&dword_2405E6000, v18, OS_LOG_TYPE_DEFAULT, " got password for dsid: %@", buf, 0xCu);
      }

      v15 = (void *)[objc_alloc(MEMORY[0x263F32998]) initWithUserActivityLabel:@"EMCS enable"];
      uint64_t v19 = *MEMORY[0x263F32A18];
      v21[0] = *MEMORY[0x263F329F0];
      v21[1] = v19;
      v22[0] = MEMORY[0x263EFFA88];
      v22[1] = v13;
      v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v15 enableWithInfo:v16 completionBlock:&unk_26F4B78B0];
    }

    goto LABEL_17;
  }
LABEL_20:

  return 1;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [NSString stringWithUTF8String:"-[SecureBackupAccountNotification account:didChangeWithType:inStore:oldAccount:]"];
    *(_DWORD *)buf = 138412290;
    id v32 = v9;
    _os_log_impl(&dword_2405E6000, v8, OS_LOG_TYPE_DEFAULT, "in %@", buf, 0xCu);
  }
  v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithUnsignedInt:v6];
    *(_DWORD *)buf = 138412546;
    id v32 = v7;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_2405E6000, v10, OS_LOG_TYPE_DEFAULT, "account %@, ACAccountChangeType = %@", buf, 0x16u);
  }
  if (sub_2405E7450() && sub_2405E74CC(v7))
  {
    v12 = [v7 identifier];
    if (v6 == 2 && MKBGetDeviceLockState() != 3)
    {
      v13 = objc_msgSend(v7, "_aa_rawPassword");
      v15 = [v7 credential];
      v14 = [v15 credentialItemForKey:@"old-password"];

      if (v14 && v13 && ([(__CFString *)v14 isEqualToString:v13] & 1) == 0)
      {
        uint64_t v19 = objc_alloc_init(MEMORY[0x263F29110]);
        id v20 = objc_alloc_init(MEMORY[0x263F29118]);
        v21 = [v7 username];
        [v19 setUsername:v21];

        [v19 _setPassword:v13];
        [v19 setIsUsernameEditable:0];
        [v19 setShouldAllowAppleIDCreation:0];
        [v19 setNeedsCredentialRecovery:0];
        [v19 setNeedsNewAppleID:0];
        [v19 setServiceType:0];
        [v19 setAuthenticationType:1];
        [v19 setShouldRequestShortLivedToken:1];
        [v19 setShouldRequestConfigurationInfo:1];
        [v19 setIsEphemeral:1];
        dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = sub_2405E7A08;
        v26[3] = &unk_2650C6250;
        __int16 v27 = v14;
        v28 = v13;
        id v29 = v7;
        dispatch_semaphore_t v30 = v22;
        uint64_t v23 = v22;
        uint64_t v24 = v13;
        v25 = v14;
        [v20 authenticateWithContext:v19 completion:v26];
        dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

        v13 = v19;
        goto LABEL_23;
      }
      v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = &stru_26F4B79B0;
        if (v14) {
          v18 = @"non-";
        }
        else {
          v18 = &stru_26F4B79B0;
        }
        *(_DWORD *)buf = 138412802;
        id v32 = v12;
        v34 = v18;
        __int16 v33 = 2112;
        if (v13) {
          uint64_t v17 = @"non-";
        }
        __int16 v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_2405E6000, v16, OS_LOG_TYPE_DEFAULT, "Account %@ modified but old password = %@nil, new password = %@nil", buf, 0x20u);
      }
    }
    else
    {
      v13 = CloudServicesLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      v14 = [v7 username];
      *(_DWORD *)buf = 138412546;
      id v32 = v12;
      __int16 v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_2405E6000, v13, OS_LOG_TYPE_DEFAULT, "nothing to do for account %@: %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
LABEL_24:
}

@end