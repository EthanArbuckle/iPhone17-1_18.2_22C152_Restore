@interface ACAccountStore(GameCenter)
- (id)_gkAccountForAppleID:()GameCenter;
- (id)_gkAllCredentialsForEnvironment:()GameCenter;
- (id)_gkCredentialForUsername:()GameCenter environment:;
- (id)_gkMapAccountsWithBlock:()GameCenter;
- (id)_gkPrimaryCredentialForEnvironment:()GameCenter;
- (uint64_t)_gkAllCredentials;
- (void)_getAltDSIDFromIDMSForCredential:()GameCenter completionHandler:;
- (void)_gkDeleteCredential:()GameCenter completionHandler:;
- (void)_gkRenewCredentialForUsername:()GameCenter completionHandler:;
- (void)_gkSaveCredential:()GameCenter completionHandler:;
- (void)_gkSetScope:()GameCenter forCredential:completionHandler:;
@end

@implementation ACAccountStore(GameCenter)

- (id)_gkAllCredentialsForEnvironment:()GameCenter
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ACAccountStore_GameCenter___gkAllCredentialsForEnvironment___block_invoke;
  v5[3] = &__block_descriptor_40_e28___NSArray_16__0__ACAccount_8l;
  v5[4] = a3;
  v3 = [a1 _gkMapAccountsWithBlock:v5];

  return v3;
}

- (id)_gkMapAccountsWithBlock:()GameCenter
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke;
  v10[3] = &unk_1E646DEE0;
  v10[4] = a1;
  id v12 = v4;
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  +[GKDispatchGroup waitUntilDone:v10];
  if ([v6 count]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)_gkPrimaryCredentialForEnvironment:()GameCenter
{
  v1 = objc_msgSend(a1, "_gkAllCredentialsForEnvironment:");
  v2 = [v1 sortedArrayWithOptions:0 usingComparator:&__block_literal_global_97];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke_2;
  v10[3] = &unk_1E6470858;
  v10[4] = &v11;
  [v2 enumerateObjectsUsingBlock:v10];
  if (!v12[5] && [v2 count])
  {
    uint64_t v3 = [v2 firstObject];
    id v4 = (void *)v12[5];
    v12[5] = v3;

    objc_msgSend((id)v12[5], "setScope:", objc_msgSend((id)v12[5], "scope") | 0xC);
  }
  v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = +[GKPlayerCredentialController sharedController];
    id v7 = [v6 signInVisibilityManager];
    [v7 reset];

    v5 = (void *)v12[5];
  }
  id v8 = v5;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_gkCredentialForUsername:()GameCenter environment:
{
  v5 = objc_msgSend(a1, "_gkAccountForAppleID:");
  id v6 = [v5 _gkCredentialForEnvironment:a4];

  return v6;
}

- (void)_gkSetScope:()GameCenter forCredential:completionHandler:
{
  LODWORD(v6) = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 environment];
  id v12 = [v9 accountName];
  uint64_t v13 = [a1 _gkAccountForAppleID:v12];
  v14 = os_log_GKGeneral;
  if (v13)
  {
    if (!os_log_GKGeneral)
    {
      id v15 = GKOSLoggers();
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = v14;
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v6 = v6;
      v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v6;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_debug_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_DEBUG, "%@: set bits:%lX cred:%@ ", buf, 0x20u);
    }
    else
    {
      uint64_t v6 = v6;
    }
    id v16 = [NSNumber numberWithUnsignedInteger:v6];
    [v13 _gkSetProperty:v16 forKey:@"GKCredentialScope" environment:v11];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke;
    v20[3] = &unk_1E64707D0;
    v23 = a2;
    id v21 = v9;
    id v22 = v10;
    [a1 saveVerifiedAccount:v13 withCompletionHandler:v20];
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v17 = GKOSLoggers();
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore(GameCenter) _gkSetScope:forCredential:completionHandler:](v14, a2);
    }
  }
}

- (uint64_t)_gkAllCredentials
{
  return [a1 _gkMapAccountsWithBlock:&__block_literal_global_34];
}

- (id)_gkAccountForAppleID:()GameCenter
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ACAccountStore_GameCenter___gkAccountForAppleID___block_invoke;
  v12[3] = &unk_1E6470880;
  id v6 = v5;
  id v13 = v6;
  id v7 = [a1 _gkMapAccountsWithBlock:v12];
  if ([v7 count] && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    id v9 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore(GameCenter) _gkAccountForAppleID:](v9, a2);
    }
  }
  id v10 = [v7 firstObject];

  return v10;
}

- (void)_getAltDSIDFromIDMSForCredential:()GameCenter completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "ACAccount+GameCenter.m", 684, "-[ACAccountStore(GameCenter) _getAltDSIDFromIDMSForCredential:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke;
  v18[3] = &unk_1E646D9A0;
  v18[4] = a1;
  id v10 = v9;
  id v19 = v10;
  id v20 = v6;
  id v11 = v6;
  [v10 perform:v18];
  id v12 = dispatch_get_global_queue(21, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_104;
  v15[3] = &unk_1E646DC30;
  id v16 = v10;
  id v17 = v7;
  id v13 = v10;
  id v14 = v7;
  [v13 notifyOnQueue:v12 block:v15];
}

- (void)_gkRenewCredentialForUsername:()GameCenter completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "ACAccount+GameCenter.m", 730, "-[ACAccountStore(GameCenter) _gkRenewCredentialForUsername:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke;
  v20[3] = &unk_1E646D9A0;
  void v20[4] = a1;
  id v10 = v6;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v11 perform:v20];
  id v12 = dispatch_get_global_queue(21, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__ACAccountStore_GameCenter___gkRenewCredentialForUsername_completionHandler___block_invoke_3;
  v16[3] = &unk_1E646EA20;
  id v17 = v11;
  id v18 = v10;
  id v19 = v7;
  id v13 = v7;
  id v14 = v10;
  id v15 = v11;
  [v15 notifyOnQueue:v12 block:v16];
}

- (void)_gkSaveCredential:()GameCenter completionHandler:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v50 = a4;
  uint64_t v7 = [v6 environment];
  id v8 = [v6 accountName];
  unsigned int v9 = [v6 scope];
  id v10 = [a1 _gkAccountForAppleID:v8];
  id v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v12 = GKOSLoggers();
    id v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v58 = v10;
    __int16 v59 = 1024;
    *(_DWORD *)v60 = v7;
    *(_WORD *)&v60[4] = 2048;
    *(void *)&v60[6] = v9;
    _os_log_debug_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_DEBUG, "STORING ACCOUNT: account:%@ environment:%d scope:%lX", buf, 0x1Cu);
    if (v10) {
      goto LABEL_11;
    }
  }
  else if (v10)
  {
    goto LABEL_11;
  }
  if (v8)
  {
    id v13 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177B8]];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v13];
    [v10 setUsername:v8];
    id v14 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v15 = GKOSLoggers();
      id v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:]();
    }
  }
LABEL_11:
  id v16 = [NSNumber numberWithUnsignedInteger:v9];
  [v10 _gkSetProperty:v16 forKey:@"GKCredentialScope" environment:v7];

  id v17 = objc_msgSend(v10, "_aa_rawPassword");

  if (v17) {
    objc_msgSend(v10, "_aa_setRawPassword:", 0);
  }
  id v18 = [v6 authenticationToken];
  id v19 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v20 = GKOSLoggers();
    id v19 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:]();
  }
  [v10 _gkSetToken:v18 forEnvironment:v7];
  id v21 = [v6 playerInternal];
  id v22 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v23 = GKOSLoggers();
    id v22 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v58 = v10;
    __int16 v59 = 2112;
    *(void *)v60 = v21;
    *(_WORD *)&v60[8] = 2112;
    *(void *)&v60[10] = v18;
    _os_log_debug_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_DEBUG, "STORING ACCOUNT will save: account:%@ player:%@ token:%@", buf, 0x20u);
  }
  [v10 _gkSetPlayerInternal:v21];
  v24 = [NSNumber numberWithInteger:v7];
  [v10 setAccountProperty:v24 forKey:@"GKEnvironment"];

  uint64_t v25 = [v10 accountDescription];
  if (!v25) {
    goto LABEL_26;
  }
  __int16 v26 = (void *)v25;
  uint64_t v48 = v7;
  id v49 = v6;
  uint64_t v27 = v18;
  __int16 v28 = v8;
  id v29 = [v10 accountDescription];
  if (![v29 length])
  {

    id v8 = v28;
    id v18 = v27;
    uint64_t v7 = v48;
    goto LABEL_26;
  }
  uint64_t v30 = [v10 accountDescription];
  [v10 username];
  v31 = v21;
  v33 = v32 = a1;
  int v34 = [v30 isEqualToString:v33];

  a1 = v32;
  id v21 = v31;

  id v8 = v28;
  id v18 = v27;
  uint64_t v7 = v48;
  id v6 = v49;
  if (v34)
  {
LABEL_26:
    v35 = [v10 username];
    [v10 setAccountDescription:v35];
  }
  v36 = [v6 altDSID];
  [v10 _gkSetProperty:v36 forKey:@"altDSID" environment:v7];

  v37 = [v6 altDSID];
  [v10 setAccountProperty:v37 forKey:@"altDSID"];

  v38 = [v6 DSID];
  [v10 setAccountProperty:v38 forKey:@"dsid"];

  v39 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "ACAccount+GameCenter.m", 844, "-[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:]");
  v40 = +[GKDispatchGroup dispatchGroupWithName:v39];

  v41 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v42 = GKOSLoggers();
    v41 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:]();
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke;
  v54[3] = &unk_1E646D9A0;
  v54[4] = a1;
  id v55 = v10;
  id v43 = v40;
  id v56 = v43;
  id v44 = v10;
  [v43 perform:v54];
  v45 = dispatch_get_global_queue(21, 0);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_119;
  v51[3] = &unk_1E646DC30;
  id v52 = v43;
  id v53 = v50;
  id v46 = v43;
  id v47 = v50;
  [v46 notifyOnQueue:v45 block:v51];
}

- (void)_gkDeleteCredential:()GameCenter completionHandler:
{
  id v6 = a4;
  uint64_t v7 = [a3 accountName];
  id v8 = [a1 _gkAccountForAppleID:v7];
  unsigned int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "ACAccount+GameCenter.m", 869, "-[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  id v11 = os_log_GKGeneral;
  if (v8)
  {
    if (!os_log_GKGeneral)
    {
      id v12 = GKOSLoggers();
      id v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:]();
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke;
    v20[3] = &unk_1E646E5C8;
    void v20[4] = a1;
    id v21 = v8;
    id v22 = v10;
    id v23 = v7;
    [v22 perform:v20];
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      id v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:]();
    }
  }
  id v14 = dispatch_get_global_queue(21, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_120;
  v17[3] = &unk_1E646DC30;
  id v18 = v10;
  id v19 = v6;
  id v15 = v10;
  id v16 = v6;
  [v15 notifyOnQueue:v14 block:v17];
}

- (void)_gkSetScope:()GameCenter forCredential:completionHandler:.cold.1(void *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_DEBUG, "%@: No account for credential %@", v5, 0x16u);
}

- (void)_gkAccountForAppleID:()GameCenter .cold.1(void *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "%@: More than one existing account for username %@. Shouldn't be possible.", v5, 0x16u);
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "STORING ACCOUNT: SAVING ACCOUNT:%@", v2, v3, v4, v5, v6);
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_1(&dword_1C2D22000, v0, v1, "STORING ACCOUNT: SAVING TOKEN (if not nil):%@ environment:%d");
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "STORING ACCOUNT: account:%@ does not exist, creating", v2, v3, v4, v5, v6);
}

- (void)_gkDeleteCredential:()GameCenter completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "DELETE ACCOUNT: account %@ doesn't exist, ignoring", v2, v3, v4, v5, v6);
}

- (void)_gkDeleteCredential:()GameCenter completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "DELETE ACCOUNT: removing %@", v2, v3, v4, v5, v6);
}

@end