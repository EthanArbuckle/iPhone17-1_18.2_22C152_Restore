@interface ACDKeychainCleanupActivity
+ (ACDKeychainCleanupActivity)sharedActivity;
- (ACDKeychainCleanupActivity)init;
- (BOOL)_removeExpiredCredentials;
- (void)_activityQueue_checkIn;
- (void)_activityQueue_configureXPCActivityWithCriteria:(id)a3;
- (void)_activityQueue_queueCredentialItemWithAccount:(id)a3 serviceName:(id)a4;
- (void)_activityQueue_registerXPCActivityWithCriteria:(id)a3;
- (void)_activityQueue_removeCredentialItem:(id)a3 withCompletionHandler:(id)a4;
- (void)_activityQueue_removeExpiredCredentials;
- (void)_activityQueue_unregisterActivity;
- (void)checkInIfNecessary;
- (void)queueNonPersistentCredentialRemoval:(id)a3;
@end

@implementation ACDKeychainCleanupActivity

+ (ACDKeychainCleanupActivity)sharedActivity
{
  if (sharedActivity_onceToken != -1) {
    dispatch_once(&sharedActivity_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedActivity_sharedCleanupActivity;

  return (ACDKeychainCleanupActivity *)v2;
}

uint64_t __44__ACDKeychainCleanupActivity_sharedActivity__block_invoke()
{
  sharedActivity_sharedCleanupActivity = objc_alloc_init(ACDKeychainCleanupActivity);

  return MEMORY[0x270F9A758]();
}

- (ACDKeychainCleanupActivity)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACDKeychainCleanupActivity;
  v2 = [(ACDKeychainCleanupActivity *)&v9 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.accounts.cleanup.activity", v5);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)checkInIfNecessary
{
  activityQueue = self->_activityQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke;
  block[3] = &unk_264320CF0;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

void __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allCredentialItems];
  v3 = [MEMORY[0x263EFB268] sharedInstance];
  v4 = [v3 dataSeparatedPersonasUIDs];

  if ([v2 count])
  {
    objc_msgSend(*(id *)(a1 + 32), "_activityQueue_checkIn");
  }
  else
  {
    uint64_t v5 = [v4 count];
    dispatch_queue_t v6 = _ACLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"Making sure we don't have to do cleanup for an enterprise or guest account.\"", buf, 2u);
      }

      dispatch_queue_t v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v15 = v4;
      id obj = v4;
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x263EFB268];
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke_5;
            v17[3] = &unk_264320D40;
            v17[4] = *(void *)(a1 + 32);
            v18 = v6;
            [v13 performWithinPersona:v12 withBlock:v17];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }

      if ([v6 count])
      {
        objc_msgSend(*(id *)(a1 + 32), "_activityQueue_checkIn");
      }
      else
      {
        v14 = _ACLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"No enterprise nor guest credentials items queued for deletion, will not start cleanup activity.\"", buf, 2u);
        }
      }
      v4 = v15;
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"No credentials items queued for deletion, will not start cleanup activity.\"", buf, 2u);
    }
  }
}

void __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) allCredentialItems];
  if ([v2 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v2];
  }
}

- (void)queueNonPersistentCredentialRemoval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFB200];
  dispatch_queue_t v6 = [v4 accountType];
  BOOL v7 = [v6 identifier];
  uint64_t v8 = [v4 credentialType];
  uint64_t v9 = [v5 nonPersistentKeysForAccountTypeIdentifier:v7 credentialType:v8];

  if ([v9 count])
  {
    activityQueue = self->_activityQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ACDKeychainCleanupActivity_queueNonPersistentCredentialRemoval___block_invoke;
    block[3] = &unk_264320E08;
    id v12 = v9;
    v13 = self;
    id v14 = v4;
    dispatch_async(activityQueue, block);
  }
}

uint64_t __66__ACDKeychainCleanupActivity_queueNonPersistentCredentialRemoval___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = a1[5];
        uint64_t v9 = objc_msgSend(a1[6], "copy", (void)v11);
        objc_msgSend(v8, "_activityQueue_queueCredentialItemWithAccount:serviceName:", v9, v7);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return objc_msgSend(a1[5], "_activityQueue_checkIn");
}

- (void)_activityQueue_checkIn
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF8210]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263EF82A0], 1);
  [(ACDKeychainCleanupActivity *)self _activityQueue_configureXPCActivityWithCriteria:xdict];
}

- (void)_activityQueue_queueCredentialItemWithAccount:(id)a3 serviceName:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
  uint64_t v9 = [(ACAccountStore *)self->_accountStore credentialItemForAccount:v6 serviceName:v7];
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 setExpirationDate:v8];
    long long v11 = _ACLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2183AD000, v11, OS_LOG_TYPE_DEFAULT, "\"Extending credential item: %@ expiration date: %@\"", (uint8_t *)&v15, 0x16u);
    }

    [(ACAccountStore *)self->_accountStore saveCredentialItem:v10 withCompletionHandler:&__block_literal_global_10_0];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263EFB228]);
    long long v13 = [v6 identifier];
    uint64_t v10 = (void *)[v12 initWithAccountIdentifier:v13 serviceName:v7];

    [v10 setExpirationDate:v8];
    [v10 setPersistent:0];
    long long v14 = _ACLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Creating credential item: %@ expiration date: %@\"", (uint8_t *)&v15, 0x16u);
    }

    [(ACAccountStore *)self->_accountStore insertCredentialItem:v10 withCompletionHandler:&__block_literal_global_10_0];
  }
}

void __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)_activityQueue_configureXPCActivityWithCriteria:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    xpc_object_t v6 = xpc_activity_copy_criteria(xpcActivity);
    id v7 = v6;
    if (v6 && xpc_equal(v6, v4))
    {
      id v8 = _ACLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"XPC criteria not changed, ignoring criteria.\"", (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      uint64_t v9 = _ACLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_2183AD000, v9, OS_LOG_TYPE_DEFAULT, "\"Configuring keychain cleanup activity: %@\"", (uint8_t *)&v10, 0xCu);
      }

      xpc_activity_set_criteria(self->_xpcActivity, v4);
    }
  }
  else
  {
    [(ACDKeychainCleanupActivity *)self _activityQueue_registerXPCActivityWithCriteria:v4];
  }
}

- (void)_activityQueue_registerXPCActivityWithCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting up XPC activity...\"", buf, 2u);
  }

  xpc_object_t v6 = (void *)*MEMORY[0x263EF8188];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke;
  v8[3] = &unk_264321F08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  xpc_activity_register("com.apple.accounts.cleanup", v6, v8);
}

void __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v6 = [NSNumber numberWithLong:state];
    *(_DWORD *)buf = 138412290;
    int v15 = v6;
    _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"XPC Activity block invoked with state %@...\"", buf, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 24);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke_13;
  v10[3] = &unk_264320B88;
  v10[4] = v7;
  id v11 = v3;
  xpc_activity_state_t v13 = state;
  id v12 = *(id *)(a1 + 40);
  id v9 = v3;
  dispatch_async(v8, v10);
}

void __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke_13(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  if (*(void *)(a1 + 56) == 2)
  {
    id v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_activityQueue_removeExpiredCredentials");
  }
  else if (*(void *)(a1 + 48))
  {
    id v3 = _ACLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Setting cleanup activity criteria...\"", v4, 2u);
    }

    xpc_activity_set_criteria(*(xpc_activity_t *)(*(void *)(a1 + 32) + 16), *(xpc_object_t *)(a1 + 48));
  }
}

- (void)_activityQueue_removeExpiredCredentials
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = _os_activity_create(&dword_2183AD000, "accounts/keychain-cleanup-activity", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v4, OS_LOG_TYPE_DEFAULT, "\"Running cleanup activity credential removal...\"", buf, 2u);
  }

  *(void *)buf = 0;
  long long v22 = buf;
  uint64_t v23 = 0x2020000000;
  BOOL v24 = 0;
  BOOL v24 = [(ACDKeychainCleanupActivity *)self _removeExpiredCredentials];
  uint64_t v5 = [MEMORY[0x263EFB268] sharedInstance];
  xpc_object_t v6 = [v5 dataSeparatedPersonasUIDs];

  if ([v6 count])
  {
    uint64_t v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 count];
      *(_DWORD *)v27 = 134217984;
      uint64_t v28 = v8;
      _os_log_impl(&dword_2183AD000, v7, OS_LOG_TYPE_DEFAULT, "\"We have %ld enterprise or guest persona(s). Running cleanup within those personas as well.\"", v27, 0xCu);
    }

    long long v14 = v6;
    int v15 = v3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __69__ACDKeychainCleanupActivity__activityQueue_removeExpiredCredentials__block_invoke;
          v16[3] = &unk_264321030;
          v16[4] = self;
          v16[5] = buf;
          objc_msgSend(MEMORY[0x263EFB268], "performWithinPersona:withBlock:", v13, v16, v14, v15);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v10);
    }

    xpc_object_t v6 = v14;
    id v3 = v15;
  }
  if (v22[24]) {
    [(ACDKeychainCleanupActivity *)self _activityQueue_unregisterActivity];
  }

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

uint64_t __69__ACDKeychainCleanupActivity__activityQueue_removeExpiredCredentials__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) _removeExpiredCredentials];
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

- (BOOL)_removeExpiredCredentials
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(ACAccountStore *)self->_accountStore allCredentialItems];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  if ([v3 count])
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke;
    aBlock[3] = &unk_264321F30;
    long long v19 = &v20;
    uint64_t v5 = v4;
    long long v18 = v5;
    xpc_object_t v6 = _Block_copy(aBlock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          -[ACDKeychainCleanupActivity _activityQueue_removeCredentialItem:withCompletionHandler:](self, "_activityQueue_removeCredentialItem:withCompletionHandler:", *(void *)(*((void *)&v13 + 1) + 8 * i), v6, (void)v13);
          dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }
      while (v8);
    }
  }
  BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x263EFB070]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 23)
    {
      id v7 = _ACLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_2183AD000, v7, OS_LOG_TYPE_DEFAULT, "\"Credential item not yet expired, will remove later\"", v8, 2u);
      }
LABEL_9:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v4)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke_cold_1((uint64_t)v4, v7);
    }
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_activityQueue_removeCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to remove credential item (and keychain item) for %@\"", buf, 0xCu);
  }

  if (![v6 isExpired])
  {
    long long v14 = NSString;
    long long v15 = [v6 expirationDate];
    BOOL v11 = [v14 stringWithFormat:@"The credential item %@ is set to expire in the future, at %@", v6, v15];

    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263EFB070];
    uint64_t v20 = *MEMORY[0x263F08320];
    long long v21 = v11;
    id v12 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v13 = [v16 errorWithDomain:v17 code:23 userInfo:v12];
    goto LABEL_7;
  }
  accountStore = self->_accountStore;
  uint64_t v10 = [v6 accountIdentifier];
  BOOL v11 = [(ACAccountStore *)accountStore accountWithIdentifier:v10];

  if (v11)
  {
    id v12 = [v6 serviceName];
    id v19 = 0;
    +[ACDKeychainManager removeCredentialForAccount:v11 key:v12 error:&v19];
    id v13 = v19;
LABEL_7:
    long long v18 = v13;

    goto LABEL_8;
  }
  long long v18 = 0;
LABEL_8:

  if (v18) {
    v7[2](v7, 0, v18);
  }
  else {
    [(ACAccountStore *)self->_accountStore removeCredentialItem:v6 withCompletionHandler:v7];
  }
}

- (void)_activityQueue_unregisterActivity
{
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Stopping keychain cleanup activity...\"", v5, 2u);
  }

  xpc_activity_unregister("com.apple.accounts.cleanup");
  xpcActivity = self->_xpcActivity;
  self->_xpcActivity = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to save credential item: %@\"", (uint8_t *)&v2, 0xCu);
}

void __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to remove credential item: %@\"", (uint8_t *)&v2, 0xCu);
}

@end