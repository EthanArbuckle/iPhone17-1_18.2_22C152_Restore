@interface ACDAuthenticationPluginManager
- (ACDAuthenticationPluginManager)init;
- (ACRateLimiter)renewalRateLimiter;
- (BOOL)_renewalRequestIsWithinLimitsForAccount:(id)a3 accountStore:(id)a4;
- (BOOL)isPushSupportedForAccount:(id)a3;
- (id)_authCapableParentAccountForAccount:(id)a3;
- (id)_authenticationTypeForAccount:(id)a3;
- (id)_descriptionForRenewalResult:(int64_t)a3;
- (id)_pluginForAuthenticationType:(id)a3;
- (id)_sanitizeError:(id)a3;
- (id)_unsanitizeOptionsDictionary:(id)a3;
- (unint64_t)renewalCredentialTimeout;
- (void)_handleDiscoveryCompletionResult:(id)a3 forAccount:(id)a4 discoveryID:(id)a5 accountStore:(id)a6 shouldSave:(BOOL)a7 error:(id)a8;
- (void)_handleRenewalCompletionResult:(int64_t)a3 forAccount:(id)a4 renewalID:(id)a5 accountStore:(id)a6 error:(id)a7;
- (void)_handleVerificationCompletionForAccount:(id)a3 verifiedAccount:(id)a4 error:(id)a5 store:(id)a6 shouldSave:(BOOL)a7;
- (void)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 handler:(id)a6;
- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)setRenewalRateLimiter:(id)a3;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 handler:(id)a6;
@end

@implementation ACDAuthenticationPluginManager

- (ACDAuthenticationPluginManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)ACDAuthenticationPluginManager;
  v2 = [(ACDAuthenticationPluginManager *)&v25 init];
  if (v2)
  {
    v3 = objc_alloc_init(ACDQueueDictionary);
    verificationHandlerQueues = v2->_verificationHandlerQueues;
    v2->_verificationHandlerQueues = v3;

    v5 = objc_alloc_init(ACDQueueDictionary);
    renewalHandlerQueues = v2->_renewalHandlerQueues;
    v2->_renewalHandlerQueues = v5;

    v7 = objc_alloc_init(ACDQueueDictionary);
    discoveryHandlerQueues = v2->_discoveryHandlerQueues;
    v2->_discoveryHandlerQueues = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFB270]) initWithMaximum:60 inTimeInterval:3600.0];
    renewalRateLimiter = v2->_renewalRateLimiter;
    v2->_renewalRateLimiter = (ACRateLimiter *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    keysForRateExceededBugSent = v2->_keysForRateExceededBugSent;
    v2->_keysForRateExceededBugSent = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("AuthenticationPluginQueue", v13);
    authenticationPluginQueue = v2->_authenticationPluginQueue;
    v2->_authenticationPluginQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    authenticationPluginsByType = v2->_authenticationPluginsByType;
    v2->_authenticationPluginsByType = v16;

    v18 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    verificationHandlersLock = v2->_verificationHandlersLock;
    v2->_verificationHandlersLock = v18;

    v20 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    renewalHandlersLock = v2->_renewalHandlersLock;
    v2->_renewalHandlersLock = v20;

    v22 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    discoveryHandlersLock = v2->_discoveryHandlersLock;
    v2->_discoveryHandlersLock = v22;
  }
  return v2;
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:]();
  }

  v6 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v4];
  v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:]();
  }

  v8 = [(ACDAuthenticationPluginManager *)self _pluginForAuthenticationType:v6];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [v8 isPushSupportedForAccount:v4];
  }
  else
  {
    v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"The plugin for account %@ does not implement isPushSupportedForAccount:\"", (uint8_t *)&v13, 0xCu);
    }

    char v9 = 0;
  }
  v11 = _ACDLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:](v9);
  }

  return v9;
}

- (void)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 handler:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void *, id))a6;
  id v14 = _ACDLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:]();
  }

  uint64_t v15 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v10];
  v16 = _ACDLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:]();
  }

  v17 = [(ACDAuthenticationPluginManager *)self _pluginForAuthenticationType:v15];
  if (!v17)
  {
    v20 = _ACDLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:](v10);
    }

    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263EFB070];
    uint64_t v23 = -101;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    v18 = [v17 credentialForAccount:v10 client:v11];
    id v19 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      v27 = 0;
      v18 = [v17 credentialForAccount:v10 client:v11 store:v12 error:&v27];
      v24 = v27;
      goto LABEL_16;
    }
    v26 = _ACDLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl(&dword_2183AD000, v26, OS_LOG_TYPE_DEFAULT, "\"The plugin for account %@ does not implement credentialForAccount\"", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263EFB070];
    uint64_t v23 = -102;
LABEL_11:
    id v19 = [v21 errorWithDomain:v22 code:v23 userInfo:0];
    v18 = 0;
    goto LABEL_17;
  }
  v28 = 0;
  v18 = [v17 credentialForAccount:v10 client:v11 error:&v28];
  v24 = v28;
LABEL_16:
  id v19 = v24;
LABEL_17:
  objc_super v25 = _ACDLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v18;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_debug_impl(&dword_2183AD000, v25, OS_LOG_TYPE_DEBUG, "\"Returning credential %@ for account %@ to %@.\"", buf, 0x20u);
  }

  v13[2](v13, v18, v19);
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 handler:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v43 = a4;
  id aBlock = a6;
  id v11 = [(ACDAuthenticationPluginManager *)self _unsanitizeOptionsDictionary:a5];
  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFB3A0]];
  unsigned int v42 = [v12 BOOLValue];

  int v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFB318]];
  int v14 = [v13 BOOLValue];

  uint64_t v15 = _ACDLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v39 = [NSNumber numberWithBool:v42];
    v40 = [v43 client];
    *(_DWORD *)buf = 138412802;
    id v57 = v10;
    __int16 v58 = 2112;
    v59 = v39;
    __int16 v60 = 2112;
    v61 = v40;
    _os_log_debug_impl(&dword_2183AD000, v15, OS_LOG_TYPE_DEBUG, "\"verifyCredentialsForAccount %@ (should save? %@) was called for client %@...\"", buf, 0x20u);
  }
  if (v14)
  {
    v16 = [v10 accountType];
    v17 = [v16 identifier];
  }
  else
  {
    v17 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v10];
  }
  v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:]();
  }

  id v19 = [(ACDAuthenticationPluginManager *)self _pluginForAuthenticationType:v17];
  if (v19)
  {
    v20 = self;
    objc_sync_enter(v20);
    if (v14)
    {
      id v21 = v10;
    }
    else
    {
      id v21 = [(ACDAuthenticationPluginManager *)v20 _authCapableParentAccountForAccount:v10];
    }
    v29 = v21;
    [(NSLock *)v20->_verificationHandlersLock lock];
    verificationHandlerQueues = v20->_verificationHandlerQueues;
    __int16 v31 = [v29 identifier];
    int v32 = [(ACDQueueDictionary *)verificationHandlerQueues isQueueEmptyForKey:v31];
    if ((v32 & 1) == 0)
    {
      __int16 v33 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFB310]];
      char v34 = [v33 BOOLValue];

      if (v34)
      {
        int v32 = 1;
        goto LABEL_19;
      }
      __int16 v31 = _ACDLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:]();
      }
    }

LABEL_19:
    uint64_t v35 = v20->_verificationHandlerQueues;
    v36 = _Block_copy(aBlock);
    v37 = [v29 identifier];
    [(ACDQueueDictionary *)v35 addObject:v36 toQueueForKey:v37];

    [(NSLock *)v20->_verificationHandlersLock unlock];
    if (v32)
    {
      authenticationPluginQueue = v20->_authenticationPluginQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke;
      block[3] = &unk_264321698;
      id v46 = v10;
      id v47 = v29;
      SEL v52 = a2;
      id v48 = v19;
      v49 = v20;
      id v50 = v43;
      char v53 = v42;
      id v51 = v11;
      dispatch_async(authenticationPluginQueue, block);
    }
    objc_sync_exit(v20);
    goto LABEL_22;
  }
  uint64_t v22 = _ACDLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:](v10);
  }

  uint64_t v23 = NSString;
  v24 = [v10 accountType];
  objc_super v25 = [v24 identifier];
  v20 = [v23 stringWithFormat:@"No auth plugin to verify credentials for accounts of type %@", v25];

  v26 = (void *)MEMORY[0x263F087E8];
  uint64_t v54 = *MEMORY[0x263F08320];
  v55 = v20;
  v27 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v28 = [v26 errorWithDomain:*MEMORY[0x263EFB070] code:4 userInfo:v27];
  (*((void (**)(id, void, void *))aBlock + 2))(aBlock, 0, v28);

LABEL_22:
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFB268];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2;
  v7[3] = &unk_264321698;
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  char v15 = *(unsigned char *)(a1 + 88);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 32);
  [v2 performWithinPersonaForAccount:v3 withBlock:v7];
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2(uint64_t a1)
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_2();
  }

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_19;
  id v19 = &unk_264321670;
  id v3 = *(id *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  id v20 = v3;
  uint64_t v21 = v4;
  id v22 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 56);
  char v25 = *(unsigned char *)(a1 + 88);
  uint64_t v5 = _Block_copy(&v16);
  char v6 = objc_opt_respondsToSelector();
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
    [v7 verifyCredentialsForAccount:v8 accountStore:*(void *)(a1 + 56) options:*(void *)(a1 + 64) completion:v5];
  }
  else
  {
    char v9 = objc_opt_respondsToSelector();
    uint64_t v10 = *(void **)(a1 + 40);
    if (v9)
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
      [v10 verifyCredentialsForAccount:v8 accountStore:*(void *)(a1 + 56) completion:v5];
    }
    else if (objc_opt_respondsToSelector())
    {
      id v11 = *(void **)(a1 + 40);
      id v8 = objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
      id v12 = [*(id *)(a1 + 56) client];
      [v11 verifyCredentialsForAccount:v8 client:v12 withHandler:v5];
    }
    else
    {
      id v13 = _ACDLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_1();
      }

      id v8 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263EFB070], -102, 0, v16, v17, v18, v19, v20, v21, v22);
      uint64_t v14 = *(void **)(a1 + 48);
      char v15 = (void *)[*(id *)(a1 + 32) copy];
      [v14 _handleVerificationCompletionForAccount:v15 verifiedAccount:0 error:v8 store:*(void *)(a1 + 56) shouldSave:0];
    }
  }
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = a2 == 0;
  char v6 = *(void **)(a1 + 32);
  v7 = *(const char **)(a1 + 64);
  id v8 = a3;
  id v9 = a2;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  id v12 = [v9 accountByCleaningThirdPartyTransformations];

  uint64_t v10 = [*(id *)(a1 + 40) _sanitizeError:v8];

  id v11 = objc_msgSend(v10, "ac_secureCodingError");

  [*(id *)(a1 + 40) _handleVerificationCompletionForAccount:*(void *)(a1 + 48) verifiedAccount:v12 error:v11 store:*(void *)(a1 + 56) shouldSave:*(unsigned __int8 *)(a1 + 72)];
}

- (void)_handleVerificationCompletionForAccount:(id)a3 verifiedAccount:(id)a4 error:(id)a5 store:(id)a6 shouldSave:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = _ACDLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v41 = v12;
    __int16 v42 = 2112;
    id v43 = v13;
    __int16 v44 = 2112;
    id v45 = v14;
    _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleVerificationCompletion: plugin reports being done for account %@. Verified account is %@ and error is %@\"", buf, 0x20u);
  }

  if (v13)
  {
    [v13 setAuthenticated:1];
    uint64_t v17 = _ACDLogSystem();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v18) {
        -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:]();
      }

      id v38 = 0;
      uint64_t v19 = [v15 saveVerifiedAccount:v13 error:&v38];
      id v20 = v38;
      uint64_t v21 = _ACDLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        __int16 v33 = [NSNumber numberWithBool:v19];
        *(_DWORD *)buf = 138412802;
        id v41 = v13;
        __int16 v42 = 2112;
        id v43 = v33;
        __int16 v44 = 2112;
        id v45 = v20;
        _os_log_debug_impl(&dword_2183AD000, v21, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleVerificationCompletion: saving verified account %@ completed with result %@ and error %@\"", buf, 0x20u);
      }
      id v22 = [v15 client];
      int v23 = [v22 hasEntitlement:*MEMORY[0x263EFB2B0]];

      if (v23) {
        [v13 setCredential:0];
      }
    }
    else
    {
      if (v18) {
        -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:]();
      }

      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v24 = _ACDLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:]();
  }

  [(NSLock *)self->_verificationHandlersLock lock];
  verificationHandlerQueues = self->_verificationHandlerQueues;
  v26 = [v12 identifier];
  v27 = [(ACDQueueDictionary *)verificationHandlerQueues dequeueAllObjectsInQueueForKey:v26];

  [(NSLock *)self->_verificationHandlersLock unlock];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v28);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v34 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v34 + 1) + 8 * i));
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v30);
  }
}

- (unint64_t)renewalCredentialTimeout
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.accounts"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"renewalCredentialTimeout"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
    if ((unint64_t)(v5 - 1) >= 0xE0F) {
      unint64_t v6 = 3600;
    }
    else {
      unint64_t v6 = v5;
    }
  }
  else
  {
    unint64_t v6 = 3600;
  }

  return v6;
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v73 = a3;
  id val = a4;
  id aBlock = (void (**)(id, uint64_t, void))a6;
  v74 = [(ACDAuthenticationPluginManager *)self _unsanitizeOptionsDictionary:a5];
  uint64_t v10 = [MEMORY[0x263EFB240] sharedInstance];
  id v11 = [v10 valueForManagedDefault:*MEMORY[0x263EFB1E0]];
  int v12 = [v11 BOOLValue];

  id v13 = [v74 objectForKey:*MEMORY[0x263EFB390]];
  unsigned int v68 = [v13 BOOLValue];

  id v14 = [v74 objectForKey:*MEMORY[0x263EFB388]];
  uint64_t v15 = [v14 BOOLValue];

  uint64_t v16 = [v74 objectForKeyedSubscript:*MEMORY[0x263EFB318]];
  int v17 = [v16 BOOLValue];

  v69 = [v74 objectForKey:*MEMORY[0x263EFB378]];
  BOOL v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [val client];
    id v20 = [NSNumber numberWithBool:v68];
    uint64_t v21 = [NSNumber numberWithBool:v15];
    *(_DWORD *)buf = 138413314;
    id v101 = v73;
    __int16 v102 = 2114;
    id v103 = v19;
    __int16 v104 = 2112;
    v105 = v69;
    __int16 v106 = 2114;
    v107 = v20;
    __int16 v108 = 2114;
    v109 = v21;
    _os_log_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEFAULT, "\"renewCredentialsForAccount %@ was called by client %{public}@ with reason %@ shouldForce %{public}@ shouldAvoidUI %{public}@\"", buf, 0x34u);
  }
  if (v17)
  {
    id v22 = [v73 accountType];
    v71 = [v22 identifier];
  }
  else
  {
    v71 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v73];
  }
  int v23 = _ACDLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:]();
  }

  if (v12)
  {
    uint64_t v24 = _ACDLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:](v24);
    }

    aBlock[2](aBlock, 1, 0);
  }
  else
  {
    char v25 = [(ACDAuthenticationPluginManager *)self _pluginForAuthenticationType:v71];
    if (v25)
    {
      v26 = self;
      objc_sync_enter(v26);
      v75 = v26;
      if (v17)
      {
        id v66 = v73;
      }
      else
      {
        id v66 = [(ACDAuthenticationPluginManager *)v26 _authCapableParentAccountForAccount:v73];
      }
      if (objc_opt_respondsToSelector())
      {
        long long v35 = [v25 renewalIDsForAccount:v66 accountStore:val options:v74];
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v36 = [v25 renewalIDForAccount:v66];
        long long v37 = (void *)v36;
        if (v36)
        {
          uint64_t v97 = v36;
          long long v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
        }
        else
        {
          long long v35 = 0;
        }
      }
      else
      {
        long long v35 = 0;
      }
      if (![v35 count])
      {
        id v38 = [v66 identifier];
        v96 = v38;
        uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v96 count:1];

        long long v35 = (void *)v39;
      }
      v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v35, "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id obj = v35;
      uint64_t v41 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v91 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void *)(*((void *)&v90 + 1) + 8 * i);
            id v45 = NSString;
            uint64_t v46 = (objc_class *)objc_opt_class();
            id v47 = NSStringFromClass(v46);
            id v48 = [v45 stringWithFormat:@"%@.%@", v47, v44];

            [v40 addObject:v48];
          }
          uint64_t v41 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
        }
        while (v41);
      }

      [(NSLock *)v75->_renewalHandlersLock lock];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v49 = v40;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v94 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v87;
        uint64_t v52 = *MEMORY[0x263EFB310];
LABEL_38:
        uint64_t v53 = 0;
        while (1)
        {
          if (*(void *)v87 != v51) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void **)(*((void *)&v86 + 1) + 8 * v53);
          if (![(ACDQueueDictionary *)v75->_renewalHandlerQueues isQueueEmptyForKey:v54])
          {
            v55 = [v74 objectForKeyedSubscript:v52];
            char v56 = [v55 BOOLValue];

            if ((v56 & 1) == 0) {
              break;
            }
          }
          if (v50 == ++v53)
          {
            uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v94 count:16];
            if (v50) {
              goto LABEL_38;
            }
            goto LABEL_45;
          }
        }
        id v57 = v54;

        if (!v57) {
          goto LABEL_50;
        }
        __int16 v58 = _ACDLogSystem();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v101 = v73;
          __int16 v102 = 2112;
          id v103 = v57;
          _os_log_impl(&dword_2183AD000, v58, OS_LOG_TYPE_DEFAULT, "\"It appears we are already renewing credentials for account %@ with renewal ID %@. We will enqueue the current request's completion handler and call it when done.\"", buf, 0x16u);
        }

        renewalHandlerQueues = v75->_renewalHandlerQueues;
        __int16 v60 = _Block_copy(aBlock);
        [(ACDQueueDictionary *)renewalHandlerQueues addObject:v60 toQueueForKey:v57];
        int v61 = 0;
        int v62 = 0;
      }
      else
      {
LABEL_45:

LABEL_50:
        if ((v68 & 1) != 0
          || [(ACDAuthenticationPluginManager *)v75 _renewalRequestIsWithinLimitsForAccount:v73 accountStore:val])
        {
          v63 = _ACDLogSystem();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v101 = v73;
            __int16 v102 = 2112;
            id v103 = 0;
            _os_log_impl(&dword_2183AD000, v63, OS_LOG_TYPE_DEFAULT, "\"Allow new renewal for account %@ with renewal ID %@.\"", buf, 0x16u);
          }

          id v57 = [v49 objectAtIndexedSubscript:0];
          v64 = v75->_renewalHandlerQueues;
          __int16 v60 = _Block_copy(aBlock);
          [(ACDQueueDictionary *)v64 addObject:v60 toQueueForKey:v57];
          int v62 = 0;
          int v61 = 1;
        }
        else
        {
          __int16 v60 = _ACDLogSystem();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v101 = v73;
            __int16 v102 = 2112;
            id v103 = 0;
            _os_log_impl(&dword_2183AD000, v60, OS_LOG_TYPE_DEFAULT, "\"Limit renewal for account %@ with renewal ID %@.\"", buf, 0x16u);
          }
          int v61 = 0;
          id v57 = 0;
          int v62 = 1;
        }
      }

      [(NSLock *)v75->_renewalHandlersLock unlock];
      if (v62)
      {
        aBlock[2](aBlock, 1, 0);
      }
      else if (v61)
      {
        objc_initWeak((id *)buf, val);
        authenticationPluginQueue = v75->_authenticationPluginQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke;
        block[3] = &unk_264321710;
        id v78 = v73;
        v79 = v75;
        id v80 = v25;
        v85[1] = (id)a2;
        objc_copyWeak(v85, (id *)buf);
        id v81 = v66;
        id v82 = v57;
        id v83 = v74;
        id v84 = v69;
        dispatch_async(authenticationPluginQueue, block);

        objc_destroyWeak(v85);
        objc_destroyWeak((id *)buf);
      }

      uint64_t v31 = v75;
      objc_sync_exit(v75);
    }
    else
    {
      v27 = _ACDLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:](v73);
      }

      id v28 = NSString;
      uint64_t v29 = [v73 accountType];
      uint64_t v30 = [v29 identifier];
      uint64_t v31 = [v28 stringWithFormat:@"No auth plugin to renew credentials for accounts of type %@", v30];

      int v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v98 = *MEMORY[0x263F08320];
      v99 = v31;
      __int16 v33 = [NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      long long v34 = [v32 errorWithDomain:*MEMORY[0x263EFB070] code:4 userInfo:v33];
      ((void (**)(id, uint64_t, void *))aBlock)[2](aBlock, 2, v34);
    }
  }
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFB268];
  id v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2;
  v9[3] = &unk_264321710;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v7 = v6;
  id v8 = *(void **)(a1 + 96);
  id v12 = v7;
  v17[1] = v8;
  objc_copyWeak(v17, (id *)(a1 + 88));
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 80);
  [v2 performWithinPersonaForAccount:v4 withBlock:v9];

  objc_destroyWeak(v17);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2(uint64_t a1)
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_3();
  }

  uint64_t v3 = [*(id *)(a1 + 40) renewalCredentialTimeout];
  id v4 = [MEMORY[0x263EFB280] expirerWithTimeout:v3];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_49;
  v29[3] = &unk_2643216C0;
  id v5 = v4;
  id v30 = v5;
  id v31 = *(id *)(a1 + 48);
  uint64_t v32 = v3;
  [v5 scheduleExpiration:v29];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_63;
  id v22 = &unk_2643216E8;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(void **)(a1 + 96);
  id v23 = v6;
  v28[1] = v7;
  id v8 = v5;
  uint64_t v9 = *(void *)(a1 + 40);
  id v24 = v8;
  uint64_t v25 = v9;
  objc_copyWeak(v28, (id *)(a1 + 88));
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 64);
  id v10 = _Block_copy(&v19);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(*(id *)(a1 + 48), "renewCredentialsForAccount:accountStore:options:completion:", *(void *)(a1 + 56), WeakRetained, *(void *)(a1 + 72), v10, v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_19;
    }
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(*(id *)(a1 + 48), "renewCredentialsForAccount:accountStore:reason:completion:", *(void *)(a1 + 56), WeakRetained, *(void *)(a1 + 80), v10, v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_19;
    }
    id v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_2();
    }
    uint64_t v13 = -102;
  }
  else
  {
    id v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_1(v12);
    }
    uint64_t v13 = 10002;
  }

  id v14 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263EFB070], v13, 0, v19, v20, v21, v22, v23, v24, v25, v26);
  [v8 cancelTimer];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(a1 + 40);
  int v17 = WeakRetained;
  uint64_t v18 = *(void *)(a1 + 64);
  if (!WeakRetained)
  {
    int v17 = [MEMORY[0x263EFB210] defaultStore];
  }
  [v16 _handleRenewalCompletionResult:2 forAccount:v15 renewalID:v18 accountStore:v17 error:v14];
  if (!WeakRetained) {

  }
LABEL_19:
  objc_destroyWeak(v28);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_49(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelTimer];
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_49_cold_1();
  }

  if (ACIsInternal())
  {
    uint64_t v3 = [NSString stringWithFormat:@"Slow Credential Renewal: %@", *(void *)(a1 + 40)];
    +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:@"Slow Credential Renewal" alertDescription:@"Accounts is tracking issues with slow or stuck credential renewals, please help us out by filing a radar via Tap-To-Radar" TTRTitle:v3 TTRDescription:@"I was informed of a slow or hung authentication plugin, please investigate."];
  }
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = a2 == 2;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(const char **)(a1 + 80);
  id v8 = a3;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  [*(id *)(a1 + 40) cancelTimer];
  uint64_t v9 = [*(id *)(a1 + 48) _sanitizeError:v8];

  objc_msgSend(v9, "ac_secureCodingError");
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v12 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  if (WeakRetained)
  {
    [v12 _handleRenewalCompletionResult:a2 forAccount:v11 renewalID:v13 accountStore:WeakRetained error:v15];
  }
  else
  {
    id v14 = [MEMORY[0x263EFB210] defaultStore];
    [v12 _handleRenewalCompletionResult:a2 forAccount:v11 renewalID:v13 accountStore:v14 error:v15];
  }
}

- (BOOL)_renewalRequestIsWithinLimitsForAccount:(id)a3 accountStore:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  uint64_t v9 = [v7 accountWithIdentifier:v8];

  id v10 = [v9 lastCredentialRenewalRejectionDate];
  if (v10
    && ([MEMORY[0x263EFF910] date],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 timeIntervalSinceDate:v10],
        double v13 = v12,
        v11,
        v13 < 86400.0))
  {
    id v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v6;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"The user has declined an identical request to renew credentials for %@ within the past 24 hours. Suppressing the password prompt and failing immediately.\"", buf, 0xCu);
    }
    char v15 = 0;
  }
  else
  {
    id v16 = NSString;
    int v17 = [v7 client];
    uint64_t v18 = [v17 bundleID];
    uint64_t v19 = [v6 identifier];
    int v20 = DMIsMigrationNeeded();
    uint64_t v21 = @"NO";
    if (v20) {
      uint64_t v21 = @"YES";
    }
    id v14 = [v16 stringWithFormat:@"%@.%@.%@", v18, v19, v21];

    char v15 = [(ACRateLimiter *)self->_renewalRateLimiter reservePerformActionForKey:v14];
    if ((v15 & 1) == 0)
    {
      id v22 = _ACDLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v34 = [v6 accountType];
        __int16 v33 = [v34 identifier];
        id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ACRateLimiter maximum](self->_renewalRateLimiter, "maximum"));
        id v28 = NSNumber;
        [(ACRateLimiter *)self->_renewalRateLimiter timeInterval];
        id v30 = [v28 numberWithDouble:v29 / 60.0];
        *(_DWORD *)buf = 138544130;
        uint64_t v36 = v14;
        __int16 v37 = 2114;
        id v38 = v33;
        __int16 v39 = 2114;
        v40 = v31;
        __int16 v41 = 2114;
        uint64_t v42 = v30;
        _os_log_error_impl(&dword_2183AD000, v22, OS_LOG_TYPE_ERROR, "\"%{public}@ (%{public}@) exceeded %{public}@ renewals per %{public}@ minutes -- rejecting\"", buf, 0x2Au);
      }
      if (([(NSMutableSet *)self->_keysForRateExceededBugSent containsObject:v14] & 1) == 0)
      {
        id v23 = [v6 accountType];
        id v24 = [v23 identifier];
        uint64_t v25 = [v7 client];
        [v25 bundleID];
        v26 = uint64_t v32 = self;
        +[ACDAutoBugCapture triggerAutoBugCaptureWithType:0x26C992EC0 subType:0x26C992F00 subtypeContext:v24 detectedProcess:v26];

        [(NSMutableSet *)v32->_keysForRateExceededBugSent addObject:v14];
      }
    }
  }

  return v15;
}

- (void)_handleRenewalCompletionResult:(int64_t)a3 forAccount:(id)a4 renewalID:(id)a5 accountStore:(id)a6 error:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = _ACDLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [(ACDAuthenticationPluginManager *)self _descriptionForRenewalResult:a3];
    *(_DWORD *)buf = 138412802;
    id v40 = v12;
    __int16 v41 = 2112;
    uint64_t v42 = v32;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleRenewalCompletion: plugin reports being done for account %@ with result %@ and error %@\"", buf, 0x20u);
  }
  id v17 = v15;
  uint64_t v18 = v17;
  if (a3 || v17)
  {
    id v19 = v17;
    if (a3 != 1) {
      goto LABEL_16;
    }
    int v20 = [MEMORY[0x263EFF910] date];
    [v12 setLastCredentialRenewalRejectionDate:v20];
  }
  else
  {
    [v12 setAuthenticated:1];
  }
  uint64_t v21 = _ACDLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:]();
  }

  id v37 = 0;
  char v22 = [v14 saveVerifiedAccount:v12 error:&v37];
  id v23 = v37;
  id v19 = v18;
  if ((v22 & 1) == 0)
  {
    id v24 = _ACDLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:]();
    }

    id v19 = v18;
    if (!v18) {
      id v19 = v23;
    }
  }

LABEL_16:
  uint64_t v25 = _ACDLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:]();
  }

  [(NSLock *)self->_renewalHandlersLock lock];
  id v26 = [(ACDQueueDictionary *)self->_renewalHandlerQueues dequeueAllObjectsInQueueForKey:v13];
  [(NSLock *)self->_renewalHandlersLock unlock];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v33 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v33 + 1) + 8 * i));
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v29);
  }
}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  v60[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v47 = a4;
  id aBlock = a6;
  id v11 = a5;
  id v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:].cold.4((uint64_t)v10, v47);
  }

  id v13 = [(ACDAuthenticationPluginManager *)self _unsanitizeOptionsDictionary:v11];

  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB318]];
  int v15 = [v14 BOOLValue];

  uint64_t v16 = *MEMORY[0x263EFB340];
  id v17 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFB340]];
  if (v17)
  {
    uint64_t v18 = [v13 objectForKeyedSubscript:v16];
    char v45 = [v18 BOOLValue];
  }
  else
  {
    uint64_t v18 = [v10 objectID];
    char v45 = v18 != 0;
  }

  if (v15)
  {
    id v19 = [v10 accountType];
    int v20 = [v19 identifier];
  }
  else
  {
    int v20 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v10];
  }
  uint64_t v21 = _ACDLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:]();
  }

  char v22 = [(ACDAuthenticationPluginManager *)self _pluginForAuthenticationType:v20];
  if (v22)
  {
    id v23 = self;
    objc_sync_enter(v23);
    if (v15)
    {
      id v24 = v10;
    }
    else
    {
      id v24 = [(ACDAuthenticationPluginManager *)v23 _authCapableParentAccountForAccount:v10];
    }
    uint64_t v32 = v24;
    long long v33 = NSString;
    long long v34 = (objc_class *)objc_opt_class();
    long long v35 = NSStringFromClass(v34);
    long long v36 = [v32 identifier];
    id v37 = [v33 stringWithFormat:@"%@.%@", v35, v36];

    [(NSLock *)v23->_discoveryHandlersLock lock];
    if ([(ACDQueueDictionary *)v23->_discoveryHandlerQueues isQueueEmptyForKey:v37]
      || ([v13 objectForKeyedSubscript:*MEMORY[0x263EFB310]],
          id v38 = objc_claimAutoreleasedReturnValue(),
          char v39 = [v38 BOOLValue],
          v38,
          (v39 & 1) != 0))
    {
      int v40 = 1;
    }
    else
    {
      __int16 v41 = _ACDLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:]();
      }

      int v40 = 0;
    }
    discoveryHandlerQueues = v23->_discoveryHandlerQueues;
    __int16 v43 = _Block_copy(aBlock);
    [(ACDQueueDictionary *)discoveryHandlerQueues addObject:v43 toQueueForKey:v37];

    [(NSLock *)v23->_discoveryHandlersLock unlock];
    if (v40)
    {
      authenticationPluginQueue = v23->_authenticationPluginQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke;
      block[3] = &unk_264321760;
      id v50 = v10;
      id v51 = v32;
      SEL v57 = a2;
      id v52 = v22;
      uint64_t v53 = v23;
      id v54 = v37;
      id v55 = v47;
      char v58 = v45;
      id v56 = v13;
      dispatch_async(authenticationPluginQueue, block);
    }
    objc_sync_exit(v23);
  }
  else
  {
    uint64_t v25 = _ACDLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:](v10);
    }

    id v26 = NSString;
    id v27 = [v10 accountType];
    uint64_t v28 = [v27 identifier];
    id v23 = [v26 stringWithFormat:@"No auth plugin to discover properties for accounts of type %@", v28];

    uint64_t v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60[0] = v23;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
    id v31 = [v29 errorWithDomain:*MEMORY[0x263EFB070] code:4 userInfo:v30];
    (*((void (**)(id, void, void *))aBlock + 2))(aBlock, 0, v31);
  }
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFB268];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2;
  v7[3] = &unk_264321698;
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 64);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 72);
  char v15 = *(unsigned char *)(a1 + 96);
  id v13 = *(id *)(a1 + 80);
  [v2 performWithinPersonaForAccount:v3 withBlock:v7];
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2(uint64_t a1)
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_2();
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_84;
  aBlock[3] = &unk_264321738;
  id v3 = *(id *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v4;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  char v16 = *(unsigned char *)(a1 + 88);
  id v6 = _Block_copy(aBlock);
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 40) discoverPropertiesForAccount:*(void *)(a1 + 32) accountStore:*(void *)(a1 + 64) options:*(void *)(a1 + 72) completion:v6];
  }
  else
  {
    id v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_1();
    }

    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:-102 userInfo:0];
    [*(id *)(a1 + 48) _handleDiscoveryCompletionResult:0 forAccount:*(void *)(a1 + 32) discoveryID:*(void *)(a1 + 56) accountStore:*(void *)(a1 + 64) shouldSave:*(unsigned __int8 *)(a1 + 88) error:v8];
  }
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = a2 == 0;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(const char **)(a1 + 72);
  id v8 = a3;
  id v9 = a2;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  id v10 = [*(id *)(a1 + 40) _sanitizeError:v8];

  objc_msgSend(v10, "ac_secureCodingError");
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) _handleDiscoveryCompletionResult:v9 forAccount:*(void *)(a1 + 48) discoveryID:*(void *)(a1 + 56) accountStore:*(void *)(a1 + 64) shouldSave:*(unsigned __int8 *)(a1 + 80) error:v11];
}

- (void)_handleDiscoveryCompletionResult:(id)a3 forAccount:(id)a4 discoveryID:(id)a5 accountStore:(id)a6 shouldSave:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = _ACDLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:]();
  }

  id v20 = v18;
  if (!v18)
  {
    id v20 = 0;
    if (v9)
    {
      uint64_t v21 = _ACDLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:]();
      }

      id v35 = 0;
      char v22 = [v17 saveVerifiedAccount:v15 error:&v35];
      id v23 = v35;
      id v20 = 0;
      if ((v22 & 1) == 0)
      {
        id v24 = _ACDLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:]();
        }

        id v20 = v23;
      }
    }
  }
  [(NSLock *)self->_discoveryHandlersLock lock];
  uint64_t v25 = [(ACDQueueDictionary *)self->_discoveryHandlerQueues dequeueAllObjectsInQueueForKey:v16];
  [(NSLock *)self->_discoveryHandlersLock unlock];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * v30) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * v30));
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v28);
  }
}

- (id)_pluginForAuthenticationType:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = self->_authenticationPluginsByType;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_authenticationPluginsByType objectForKey:v4];
  objc_sync_exit(v5);

  if (!v6)
  {
    id v7 = +[ACDPluginLoader pluginForIdentifier:v4 subpath:@"Authentication"];
    id v18 = 0;
    [v7 loadAndReturnError:&v18];
    id v8 = v18;
    BOOL v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.5();
    }

    if (!v7)
    {
      _ACDLogSystem();
      id v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:]();
      }
      id v6 = 0;
      goto LABEL_23;
    }
    id v10 = self->_authenticationPluginsByType;
    objc_sync_enter(v10);
    id v6 = [(NSMutableDictionary *)self->_authenticationPluginsByType objectForKey:v4];
    if (!v6)
    {
      id v11 = (objc_class *)[v7 principalClass];
      id v12 = _ACDLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.4();
      }

      id v6 = objc_alloc_init(v11);
      id v13 = _ACDLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:]();
      }

      if (v6)
      {
        if ([v6 conformsToProtocol:&unk_26C9A8E10])
        {
          [(NSMutableDictionary *)self->_authenticationPluginsByType setObject:v6 forKey:v4];
          goto LABEL_22;
        }
        id v15 = _ACDLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = NSStringFromClass(v11);
          [(ACDAuthenticationPluginManager *)v16 _pluginForAuthenticationType:v15];
        }
      }
      else
      {
        id v6 = _ACDLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v14 = NSStringFromClass(v11);
          *(_DWORD *)buf = 138412802;
          id v20 = v14;
          __int16 v21 = 2112;
          id v22 = v4;
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_error_impl(&dword_2183AD000, v6, OS_LOG_TYPE_ERROR, "\"ACDAuthenticationPluginManager: an authentication plugin of class %@ for auth type %@ could not be instantiated! Load Error: %@\"", buf, 0x20u);
        }
      }

      id v6 = 0;
    }
LABEL_22:
    objc_sync_exit(v10);
LABEL_23:
  }

  return v6;
}

- (id)_authenticationTypeForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 authenticationType];
  uint64_t v6 = *MEMORY[0x263EFB3A8];
  if ([v5 isEqualToString:*MEMORY[0x263EFB3A8]])
  {
    id v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACDAuthenticationPluginManager _authenticationTypeForAccount:]();
    }

    id v8 = objc_alloc_init(MEMORY[0x263EFB210]);
    BOOL v9 = [v4 parentAccountIdentifier];
    id v10 = [v8 accountWithIdentifier:v9];

    id v11 = [v10 authenticationType];
    if ([v11 isEqualToString:v6])
    {
      id v12 = [(ACDAuthenticationPluginManager *)self _authenticationTypeForAccount:v10];
    }
    else
    {
      id v16 = _ACDLogSystem();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (!v11)
      {
        if (v17) {
          -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](v10);
        }

        id v19 = [v10 accountType];
        id v15 = [v19 identifier];

        goto LABEL_15;
      }
      if (v17) {
        -[ACDAuthenticationPluginManager _authenticationTypeForAccount:]();
      }

      id v12 = v11;
    }
    id v15 = v12;
LABEL_15:

LABEL_19:
    goto LABEL_20;
  }
  id v13 = _ACDLogSystem();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (!v5)
  {
    if (v14) {
      -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.4(v4);
    }

    id v8 = [v4 accountType];
    id v15 = [v8 identifier];
    goto LABEL_19;
  }
  if (v14) {
    -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.5();
  }

  id v15 = v5;
LABEL_20:

  return v15;
}

- (id)_authCapableParentAccountForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 authenticationType];
  uint64_t v5 = *MEMORY[0x263EFB3A8];
  int v6 = [v4 isEqualToString:*MEMORY[0x263EFB3A8]];

  id v7 = v3;
  if (v6)
  {
    id v8 = v3;
    do
    {
      id v7 = [v8 parentAccount];

      BOOL v9 = [v7 authenticationType];
      char v10 = [v9 isEqualToString:v5];

      id v8 = v7;
    }
    while ((v10 & 1) != 0);
  }

  return v7;
}

- (id)_descriptionForRenewalResult:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"UNKNOWN";
  }
  else {
    return off_264321780[a3];
  }
}

- (id)_sanitizeError:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = *MEMORY[0x263F08580];
  int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08580]];

  if (v6
    && (CFTypeID TypeID = SecTrustGetTypeID(), TypeID == CFGetTypeID(v6))
    && ([v3 domain],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = *MEMORY[0x263F08570],
        int v10 = [v8 isEqualToString:*MEMORY[0x263F08570]],
        v8,
        v10))
  {
    id v11 = [v3 userInfo];
    id v12 = (void *)[v11 mutableCopy];

    [v12 setObject:0 forKeyedSubscript:v5];
    id v13 = (void *)SecTrustSerialize();
    [v12 setObject:v13 forKeyedSubscript:@"NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"];

    uint64_t v14 = [v12 objectForKeyedSubscript:@"NSErrorPeerCertificateChainKey"];
    id v15 = (void *)v14;
    if (v14)
    {
      id v20 = @"c";
      v21[0] = v14;
      id v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      BOOL v17 = serializeSecCertificates();
      [v12 setObject:v17 forKeyedSubscript:@"NSErrorPeerCertificateChainKey"];
    }
    [v12 removeObjectForKey:*MEMORY[0x263F08608]];
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v9, objc_msgSend(v3, "code"), v12);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v3;
  }

  return v18;
}

- (id)_unsanitizeOptionsDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263EFB2A8];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFB2A8]];
  if (v5)
  {
    id v6 = (id)[v3 mutableCopy];
    id v7 = unserializeSecCertificates();
    [v6 setObject:v7 forKeyedSubscript:v4];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationPluginQueue, 0);
  objc_storeStrong((id *)&self->_authenticationPluginsByType, 0);
  objc_storeStrong((id *)&self->_discoveryHandlersLock, 0);
  objc_storeStrong((id *)&self->_renewalHandlersLock, 0);
  objc_storeStrong((id *)&self->_verificationHandlersLock, 0);
  objc_storeStrong((id *)&self->_keysForRateExceededBugSent, 0);
  objc_storeStrong((id *)&self->_renewalRateLimiter, 0);
  objc_storeStrong((id *)&self->_discoveryHandlerQueues, 0);
  objc_storeStrong((id *)&self->_renewalHandlerQueues, 0);

  objc_storeStrong((id *)&self->_verificationHandlerQueues, 0);
}

- (ACRateLimiter)renewalRateLimiter
{
  return self->_renewalRateLimiter;
}

- (void)setRenewalRateLimiter:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    uint64_t v5 = (ACRateLimiter *)v4;
  }
  else {
    uint64_t v5 = (ACRateLimiter *)[objc_alloc(MEMORY[0x263EFB270]) initWithMaximum:60 inTimeInterval:3600.0];
  }
  renewalRateLimiter = self->_renewalRateLimiter;
  self->_renewalRateLimiter = v5;
}

- (void)isPushSupportedForAccount:(char)a1 .cold.1(char a1)
{
  v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Returning isPushSupported == %@ for account %@.\"", v4, v5, v6, v7, 2u);
}

- (void)isPushSupportedForAccount:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"isPushSupportedForAccount: using authType: %@\"", v2, v3, v4, v5, v6);
}

- (void)isPushSupportedForAccount:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Entering isPushSupportedForAccount: for account %@...\"", v2, v3, v4, v5, v6);
}

- (void)credentialForAccount:(void *)a1 client:store:handler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v3, v4, "\"No auth plugin to fetch credentials for accounts of type %@, defaulting to ACDKeychain...\"", v5, v6, v7, v8, v9);
}

- (void)credentialForAccount:client:store:handler:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"credentialForAccount:client using authType: %@\"", v2, v3, v4, v5, v6);
}

- (void)credentialForAccount:client:store:handler:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Entering credentialForAccount:client: for account %@...\"", v2, v3, v4, v5, v6);
}

- (void)verifyCredentialsForAccount:(void *)a1 accountStore:options:handler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_1(&dword_2183AD000, v3, v4, "\"No auth plugin to verify credentials for accounts of type %@, bailing!\"", v5, v6, v7, v8, v9);
}

- (void)verifyCredentialsForAccount:accountStore:options:handler:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"It appears we are already verifying credentials for %@. We will enqueue the current request's completion handler and call it when done.\"", v2, v3, v4, v5, v6);
}

- (void)verifyCredentialsForAccount:accountStore:options:handler:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"verifyCredentials using authType: %@\"", v2, v3, v4, v5, v6);
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_2183AD000, v0, v1, "\"The plugin for account %@ does not implement verifyCredentials\"", v2);
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Plugin started on queue, will authenticate account %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is invoking all queued completion blocks for account %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is saving the verified account %@...\"", v2, v3, v4, v5, v6);
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is intentionally NOT saving the verified account %@\"", v2, v3, v4, v5, v6);
}

- (void)renewCredentialsForAccount:(os_log_t)log accountStore:options:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Password dialogs suppressed, force-rejecting renewal request.\"", v1, 2u);
}

- (void)renewCredentialsForAccount:(void *)a1 accountStore:options:completion:.cold.2(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_1(&dword_2183AD000, v3, v4, "\"No auth plugin to renew credentials for accounts of type %@, bailing!\"", v5, v6, v7, v8, v9);
}

- (void)renewCredentialsForAccount:accountStore:options:completion:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"renewCredentials using authType: %@\"", v2, v3, v4, v5, v6);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Our ACDAccountStore got dealloced before we could call renewCredentials - likely our client went away early.\"", v1, 2u);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_2183AD000, v0, v1, "\"The plugin for account %@ does not implement renewCredentials\"", v2);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Plugin started on queue, will renew credentials for %@\"", v2, v3, v4, v5, v6);
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_49_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2183AD000, v1, OS_LOG_TYPE_ERROR, "@\"Call to renewCredentialsForAccount:accountStore:options:completion: on %@ failed to complete in expected time %llu.\"", v2, 0x16u);
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion is invoking all queued completion blocks under renewal ID %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion failed to save account: %@ error: %@\"");
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion is saving account %@\"", v2, v3, v4, v5, v6);
}

- (void)discoverPropertiesForAccount:(void *)a1 accountStore:options:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_1(&dword_2183AD000, v3, v4, "\"No auth plugin to discover properties for accounts of type %@, bailing!\"", v5, v6, v7, v8, v9);
}

- (void)discoverPropertiesForAccount:accountStore:options:completion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"It appears we are already discovering settings for account %@. We will enqueue the current request's completion handler and call it when done.\"", v2, v3, v4, v5, v6);
}

- (void)discoverPropertiesForAccount:accountStore:options:completion:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"discoverPropertiesForAccount using authType: %@\"", v2, v3, v4, v5, v6);
}

- (void)discoverPropertiesForAccount:(uint64_t)a1 accountStore:(void *)a2 options:completion:.cold.4(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 client];
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"discoverPropertiesForAccount %@ was called by client %@\"", v4, v5, v6, v7, 2u);
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_2183AD000, v0, v1, "\"The plugin for account %@ does not implement discoverProperties\"", v2);
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Plugin started on queue, will discover settings for %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion failed to save account: %@ error: %@\"");
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion is saving account %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion: plugin reports being done for account %@ with error %@\"", v1, 0x16u);
}

- (void)_pluginForAuthenticationType:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager: no authentication bundle for auth type %@, nothing to do here...\"", v2, v3, v4, v5, v6);
}

- (void)_pluginForAuthenticationType:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_1(&dword_2183AD000, a3, (uint64_t)a3, "\"ACDAuthenticationPluginManager: authentication plugin of class %@ does not conform to ACDAccountAuthenticationPlugin protocol!\"", (uint8_t *)a2);
}

- (void)_pluginForAuthenticationType:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager: created plugin %@\"", v2, v3, v4, v5, v6);
}

- (void)_pluginForAuthenticationType:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager: got principalClass %@\"", v2, v3, v4, v5, v6);
}

- (void)_pluginForAuthenticationType:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"ACDAuthenticationPluginManager: got pluginBundle %@\"", v2, v3, v4, v5, v6);
}

- (void)_authenticationTypeForAccount:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v3, v4, "\"Returning a parent's account type as the authentication type: %@\"", v5, v6, v7, v8, v9);
}

- (void)_authenticationTypeForAccount:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Returning a parent's authenticationType: %@\"", v2, v3, v4, v5, v6);
}

- (void)_authenticationTypeForAccount:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account %@ depends on parent for Authentication\"", v2, v3, v4, v5, v6);
}

- (void)_authenticationTypeForAccount:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v3, v4, "\"Returning account's accountType as the authentication type: %@\"", v5, v6, v7, v8, v9);
}

- (void)_authenticationTypeForAccount:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Returning account's authenticationType: %@\"", v2, v3, v4, v5, v6);
}

@end