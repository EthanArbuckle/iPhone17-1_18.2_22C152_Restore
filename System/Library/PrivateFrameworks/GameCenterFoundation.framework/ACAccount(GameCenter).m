@interface ACAccount(GameCenter)
- (id)_gkCredentialForEnvironment:()GameCenter;
- (id)_gkModifiedDateForProperty:()GameCenter environment:;
- (id)_gkPerEnvironmentTokens;
- (id)_gkPlayerInternal;
- (id)_gkPropertyForKey:()GameCenter environment:;
- (id)_gkTokenForEnvironment:()GameCenter;
- (uint64_t)_gkCredentials;
- (uint64_t)_gkCredentialsForEnvironment:()GameCenter;
- (uint64_t)_gkIsPrimaryForEnvironment:()GameCenter;
- (void)_gkPlayerInternal;
- (void)_gkSetPlayerInternal:()GameCenter;
- (void)_gkSetProperty:()GameCenter forKey:environment:;
- (void)_gkSetToken:()GameCenter forEnvironment:;
@end

@implementation ACAccount(GameCenter)

- (uint64_t)_gkIsPrimaryForEnvironment:()GameCenter
{
  v5 = [a1 accountPropertyForKey:@"playerID"];
  if (v5)
  {
    v6 = [a1 _gkCredentialsForEnvironment:a3];
    v7 = [v6 firstObject];
    uint64_t v8 = ([v7 scope] >> 2) & 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_gkTokenForEnvironment:()GameCenter
{
  if (a3 == 5)
  {
    v4 = [a1 credential];
    v5 = [v4 token];
    if ([v5 isEqualToString:@"<gone>"]) {
      id v6 = 0;
    }
    else {
      id v6 = v5;
    }
  }
  else
  {
    v4 = GKTokenKeyForEnvironment(a3);
    id v6 = [a1 accountPropertyForKey:v4];
  }

  return v6;
}

- (void)_gkSetToken:()GameCenter forEnvironment:
{
  id v6 = a3;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACAccount(GameCenter) _gkSetToken:forEnvironment:]();
  }
  if (a4 == 5)
  {
    id v9 = [a1 credential];
    if (!v9) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F179C0]);
    }
    if (![(__CFString *)v6 length])
    {

      id v6 = @"<gone>";
    }
    [v9 setToken:v6];
    [a1 setCredential:v9];
  }
  else
  {
    GKTokenKeyForEnvironment(a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [a1 setAccountProperty:v6 forKey:v9];
  }
}

- (id)_gkPerEnvironmentTokens
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = 0; i != 12; ++i)
  {
    v4 = [a1 _gkTokenForEnvironment:i];
    if ([v4 length])
    {
      v5 = [NSNumber numberWithInteger:i];
      [v2 setObject:v4 forKey:v5];
    }
  }

  return v2;
}

- (id)_gkPlayerInternal
{
  v2 = [a1 accountPropertyForKey:@"GKPlayerInternal"];
  if (!v2)
  {
LABEL_22:
    v15 = [a1 accountPropertyForKey:@"playerID"];
    if (v15)
    {
      v13 = +[GKInternalRepresentation internalRepresentation];
      [v13 setPlayerID:v15];
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_26;
  }
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v17 = 0;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v5 fromData:v2 error:&v17];
  id v7 = v17;
  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    id v9 = os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      [(ACAccount(GameCenter) *)(uint64_t)v7 _gkPlayerInternal];
    }
  }
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v11 = GKOSLoggers();
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(GameCenter) _gkPlayerInternal]();
    }
    id v12 = +[GKLocalPlayerInternal minimalInternalFromSourcePlayer:v6];
    goto LABEL_15;
  }
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v12 = v6;
LABEL_15:
    v13 = v12;
    goto LABEL_21;
  }
  if (!os_log_GKGeneral) {
    id v14 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
    -[ACAccount(GameCenter) _gkPlayerInternal]();
  }
  v13 = 0;
LABEL_21:

  if (!v13) {
    goto LABEL_22;
  }
LABEL_26:

  return v13;
}

- (void)_gkSetPlayerInternal:()GameCenter
{
  id v4 = a3;
  v5 = [v4 contactsAssociationID];
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(v4, "contactsIntegrationConsent"));
  id v7 = [v4 serviceLastUpdatedTimestamp];
  id v8 = [v4 minimalInternal];

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(GameCenter) _gkSetPlayerInternal:]();
    }
    if ([v5 length]) {
      v10 = v5;
    }
    else {
      v10 = 0;
    }
    [a1 setAccountProperty:v10 forKey:@"GKContactsAssociationID"];
    [a1 setAccountProperty:v6 forKey:@"GKContactsSharingState"];
    [a1 setAccountProperty:v7 forKey:@"GKContactsLastUpdated"];
  }
  id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  [a1 setAccountProperty:v11 forKey:@"GKPlayerInternal"];
  uint64_t v12 = [v8 playerID];
  v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = &stru_1F1E47DF8;
  }
  [a1 setAccountProperty:v14 forKey:@"playerID"];
}

- (uint64_t)_gkCredentials
{
  return [a1 _gkCredentialsForEnvironment:0];
}

- (uint64_t)_gkCredentialsForEnvironment:()GameCenter
{
  v5 = [a1 credential];
  if (!v5)
  {
    v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v14 = GKOSLoggers();
      v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:]();
    }
    goto LABEL_14;
  }
  id v6 = [a1 accountPropertyForKey:@"playerID"];
  if (![v6 length])
  {
    v15 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v16 = GKOSLoggers();
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:]();
    }

LABEL_14:
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  id v7 = [a1 _gkPerEnvironmentTokens];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke;
    v20[3] = &unk_1E64706E0;
    uint64_t v23 = a3;
    v20[4] = a1;
    id v21 = v6;
    id v10 = v9;
    id v22 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:v20];
    id v11 = v22;
    uint64_t v12 = (uint64_t *)v10;
  }
  else
  {
    uint64_t v12 = &os_log_GKGeneral;
    id v17 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v18 = GKOSLoggers();
      id v17 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:]();
    }
  }

  if (!v8) {
    goto LABEL_15;
  }
LABEL_21:

  return v12;
}

- (id)_gkCredentialForEnvironment:()GameCenter
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__11;
  uint64_t v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  id v4 = [a1 _gkCredentials];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ACAccount_GameCenter___gkCredentialForEnvironment___block_invoke;
  v7[3] = &unk_1E6470708;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_gkModifiedDateForProperty:()GameCenter environment:
{
  id v5 = objc_msgSend(a3, "stringByAppendingFormat:", @"-%d-mod-date", a4);
  id v6 = [a1 accountPropertyForKey:v5];

  return v6;
}

- (id)_gkPropertyForKey:()GameCenter environment:
{
  id v5 = objc_msgSend(a3, "stringByAppendingFormat:", @"-%d", a4);
  id v6 = [a1 accountPropertyForKey:v5];

  return v6;
}

- (void)_gkSetProperty:()GameCenter forKey:environment:
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v8, "stringByAppendingFormat:", @"-%d", a5);
  [a1 setAccountProperty:v9 forKey:v10];

  objc_msgSend(v8, "stringByAppendingFormat:", @"-%d-mod-date", a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [a1 setAccountProperty:v11 forKey:v12];
}

- (void)_gkSetToken:()GameCenter forEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_1(&dword_1C2D22000, v0, v1, "setting token:%@ for environment:%d");
}

- (void)_gkPlayerInternal
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "error while decoding playerInternal archive:%@ and playerInternal:%@", (uint8_t *)&v3, 0x16u);
}

- (void)_gkSetPlayerInternal:()GameCenter .cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "Updating contacts assocationID", v1, 2u);
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "LOADING ACCOUNT:%@: no credential", v2, v3, v4, v5, v6);
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "LOADING ACCOUNT:%@: no player ID in this account", v2, v3, v4, v5, v6);
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "LOADING ACCOUNT:%@: No auth tokens", v2, v3, v4, v5, v6);
}

@end