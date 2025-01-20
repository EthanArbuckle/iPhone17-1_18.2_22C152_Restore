@interface ACAccount
@end

@implementation ACAccount

void __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[GKInternalRepresentation internalRepresentation];
  uint64_t v8 = [v5 integerValue];
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    BOOL v10 = v8 == v9;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v19 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v20 = GKOSLoggers();
      v19 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke_cold_1();
    }
    goto LABEL_31;
  }
  uint64_t v11 = v8;
  v12 = [*(id *)(a1 + 32) _gkPlayerInternal];
  if (!v12)
  {
    v12 = +[GKInternalRepresentation internalRepresentation];
    [v12 setPlayerID:*(void *)(a1 + 40)];
    v13 = [*(id *)(a1 + 32) username];
    [v12 setAccountName:v13];
  }
  [v7 setPlayerInternal:v12];
  v14 = [*(id *)(a1 + 32) username];
  [v7 setAccountName:v14];

  [v7 setEnvironment:v11];
  id v27 = v6;
  [v7 setAuthenticationToken:v6];
  v15 = [*(id *)(a1 + 32) _gkPropertyForKey:@"altDSID" environment:v11];
  if (v15) {
    [v7 setAltDSID:v15];
  }
  v16 = [*(id *)(a1 + 32) accountPropertyForKey:@"dsid"];
  if (v16) {
    [v7 setDSID:v16];
  }
  v17 = [*(id *)(a1 + 32) _gkPropertyForKey:@"GKCredentialScope" environment:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "intValue"));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = 0;
      goto LABEL_22;
    }
    id v18 = v17;
  }
  v21 = v18;
LABEL_22:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v21 unsignedIntegerValue];
    [v7 setScope:v22];
    uint64_t v23 = v22 & 4;
    if ((v22 & 2) != 0) {
      uint64_t v23 = v22 & 4 | 3;
    }
    [v12 setLoginStatus:v23 | v22 & 8];
  }
  v24 = [*(id *)(a1 + 32) _gkModifiedDateForProperty:@"GKCredentialScope" environment:v11];
  [v7 setScopeModificationDate:v24];

  [*(id *)(a1 + 48) addObject:v7];
  v25 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v26 = GKOSLoggers();
    v25 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v7;
    __int16 v30 = 2112;
    id v31 = v5;
    __int16 v32 = 2112;
    id v33 = v27;
    _os_log_debug_impl(&dword_1C2D22000, v25, OS_LOG_TYPE_DEBUG, "ACCOUNT:%@: auth token for environment:%@ authToken:%@", buf, 0x20u);
  }

  id v6 = v27;
LABEL_31:
}

void __53__ACAccount_GameCenter___gkCredentialForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = [v7 environment];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == v5 || v5 == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_1(&dword_1C2D22000, v0, v1, "ACCOUNT:%@: filtering environment:%@");
}

@end