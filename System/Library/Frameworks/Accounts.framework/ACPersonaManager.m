@interface ACPersonaManager
+ (ACPersonaManager)sharedInstance;
+ (BOOL)performWithinPersona:(id)a3 withBlock:(id)a4;
+ (void)_changePersonaContextUsingPersonaID:(id)a3 withCompletion:(id)a4;
+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4;
+ (void)performWithinPersonaForAccountIdentifier:(id)a3 withBlock:(id)a4;
- (ACPersonaManager)init;
- (NSArray)dataSeparatedPersonasUIDs;
- (NSSet)guestPersonasUIDs;
- (NSString)enterprisePersonaUID;
- (NSString)personalPersonaUID;
- (id)_cacheURL;
- (id)store;
- (void)_lockedLoadCache;
- (void)_lockedSaveCurrentCache;
- (void)_lockedUpdatePersonasUIDsIfNeeded;
- (void)init;
- (void)updatePersonasUIDs;
@end

@implementation ACPersonaManager

+ (ACPersonaManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (ACPersonaManager *)v2;
}

uint64_t __34__ACPersonaManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ACPersonaManager);

  return MEMORY[0x1F41817F8]();
}

- (ACPersonaManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACPersonaManager;
  v2 = [(ACPersonaManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_personaStorageLock._os_unfair_lock_opaque = 0;
    v4 = _ACPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ACPersonaManager init](v4);
    }

    [(ACPersonaManager *)v3 _lockedLoadCache];
    [(ACPersonaManager *)v3 _lockedUpdatePersonasUIDsIfNeeded];
  }
  return v3;
}

- (void)updatePersonasUIDs
{
  p_personaStorageLock = &self->_personaStorageLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v5 = __38__ACPersonaManager_updatePersonasUIDs__block_invoke;
  objc_super v6 = &unk_1E5BCD220;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_personaStorageLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_personaStorageLock);
}

uint64_t __38__ACPersonaManager_updatePersonasUIDs__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockedUpdatePersonasUIDsIfNeeded];
}

- (void)_lockedUpdatePersonasUIDsIfNeeded
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"personaGenerationIdentifierWithError: %@\"", v2, v3, v4, v5, v6);
}

- (id)_cacheURL
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 URLsForDirectory:5 inDomains:1];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 URLByAppendingPathComponent:@"Accounts" isDirectory:1];
  uint8_t v6 = [v5 URLByAppendingPathComponent:@"persona.cache" isDirectory:0];

  return v6;
}

- (void)_lockedSaveCurrentCache
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v0, (uint64_t)v0, "\"ACPersonaManager: writing out %@ to %@\"", v1);
}

- (void)_lockedLoadCache
{
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_DEBUG, "\"Loading persona cache from dictionary\"", v1, 2u);
}

- (NSString)enterprisePersonaUID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __40__ACPersonaManager_enterprisePersonaUID__block_invoke;
  v4[3] = &unk_1E5BCE628;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v4);

  return (NSString *)v2;
}

id __40__ACPersonaManager_enterprisePersonaUID__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockedUpdatePersonasUIDsIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return v2;
}

- (NSString)personalPersonaUID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __38__ACPersonaManager_personalPersonaUID__block_invoke;
  v4[3] = &unk_1E5BCE628;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v4);

  return (NSString *)v2;
}

id __38__ACPersonaManager_personalPersonaUID__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockedUpdatePersonasUIDsIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);

  return v2;
}

- (NSSet)guestPersonasUIDs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __37__ACPersonaManager_guestPersonasUIDs__block_invoke;
  v4[3] = &unk_1E5BCE628;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v4);

  return (NSSet *)v2;
}

id __37__ACPersonaManager_guestPersonasUIDs__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockedUpdatePersonasUIDsIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return v2;
}

- (NSArray)dataSeparatedPersonasUIDs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __45__ACPersonaManager_dataSeparatedPersonasUIDs__block_invoke;
  v4[3] = &unk_1E5BCE628;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v4);

  return (NSArray *)v2;
}

id __45__ACPersonaManager_dataSeparatedPersonasUIDs__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockedUpdatePersonasUIDsIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);

  return v2;
}

- (id)store
{
  store = self->_store;
  if (!store)
  {
    uint64_t v4 = objc_alloc_init(ACAccountStore);
    uint64_t v5 = self->_store;
    self->_store = v4;

    store = self->_store;
  }

  return store;
}

+ (void)performWithinPersonaForAccountIdentifier:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[ACPersonaManager sharedInstance];
  v8 = [v7 store];
  id v9 = [v8 accountWithIdentifier:v6];

  +[ACPersonaManager performWithinPersonaForAccount:v9 withBlock:v5];
}

+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E4FB36F0];
    id v9 = (void (**)(id))a4;
    v11 = [v10 sharedManager];
    v12 = [v11 currentPersona];
    v7 = [v12 userPersonaNickName];

    v13 = _ACPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ACPersonaManager performWithinPersonaForAccount:withBlock:]();
    }

    v9[2](v9);
    goto LABEL_8;
  }
  id v6 = a4;
  v7 = [v5 personaIdentifier];
  char v8 = [(id)objc_opt_class() performWithinPersona:v7 withBlock:v6];

  if ((v8 & 1) == 0)
  {
    _ACPLogSystem();
    id v9 = (void (**)(id))objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      +[ACPersonaManager performWithinPersonaForAccount:withBlock:](v5, v9);
    }
LABEL_8:
  }
}

+ (BOOL)performWithinPersona:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB36F0] sharedManager];
  char v8 = [v7 currentPersona];

  if (v5)
  {
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v9 isEqualToString:v5];

    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      v15 = _ACPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ACPersonaManager performWithinPersona:withBlock:](v8, (uint64_t)v5, v15);
      }

      id v11 = v5;
    }
  }
  else if (([v8 isEnterprisePersona] & 1) != 0 || objc_msgSend(v8, "isGuestPersona"))
  {
    v12 = +[ACPersonaManager sharedInstance];
    id v11 = [v12 personalPersonaUID];

    v13 = _ACPLogSystem();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v14) {
        +[ACPersonaManager performWithinPersona:withBlock:]();
      }
    }
    else
    {
      if (v14) {
        +[ACPersonaManager performWithinPersona:withBlock:]();
      }
      id v11 = 0;
    }

    char v10 = 0;
  }
  else
  {
    id v11 = 0;
    char v10 = 1;
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke;
  v18[3] = &unk_1E5BCE650;
  id v19 = v6;
  id v16 = v6;
  +[ACPersonaManager _changePersonaContextUsingPersonaID:v11 withCompletion:v18];

  return v10;
}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB36F0] sharedManager];
    id v5 = [v4 currentPersona];

    id v6 = _ACPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_2(v5, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v7 = [MEMORY[0x1E4FB36F0] sharedManager];
    char v8 = [v7 currentPersona];

    id v9 = (id)[v8 restorePersonaWithSavedPersonaContext:v3];
    char v10 = _ACPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_1(v10);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)_changePersonaContextUsingPersonaID:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (v5)
  {
    char v8 = _ACPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.5();
    }

    id v9 = [MEMORY[0x1E4FB36F0] sharedManager];
    char v10 = [v9 currentPersona];

    id v21 = 0;
    id v11 = (void *)[v10 copyCurrentPersonaContextWithError:&v21];
    id v12 = v21;
    if (!v11)
    {
      v18 = _ACPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:]();
      }

      v7[2](v7, 0);
      goto LABEL_24;
    }
    v13 = [v10 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v5];

    if (!v13)
    {
      ((void (**)(void, void *))v7)[2](v7, v11);
LABEL_24:

      goto LABEL_25;
    }
    BOOL v14 = [v13 domain];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    if ([v14 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v16 = [v13 code];

      if (v16 == 1)
      {
        v17 = _ACPLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:]();
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    v17 = [v13 domain];
    if ([v17 isEqualToString:v15])
    {
      uint64_t v19 = [v13 code];

      if (v19 != 22)
      {
LABEL_21:
        v20 = _ACPLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:]();
        }

        v7[2](v7, 0);
        goto LABEL_24;
      }
      v17 = _ACPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.4();
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  (*((void (**)(id, void))v6 + 2))(v6, 0);
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_dataSeparatedPersonasUIDs, 0);
  objc_storeStrong((id *)&self->_guestPersonasUID, 0);
  objc_storeStrong((id *)&self->_personalPersonaUID, 0);

  objc_storeStrong((id *)&self->_enterprisePersonaUID, 0);
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = ACIsAccountsd();
  uint64_t v4 = @"shouldn't cache";
  if (v2) {
    uint64_t v4 = @"should cache";
  }
  int v5 = 138412290;
  id v6 = v4;
  OUTLINED_FUNCTION_3(&dword_1A57C5000, a1, v3, "\"ACPersonaManager init, %@\"", (uint8_t *)&v5);
}

+ (void)performWithinPersonaForAccount:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"No account found for scoping operation! Performing block within %@ persona.\"", v2, v3, v4, v5, v6);
}

+ (void)performWithinPersonaForAccount:(void *)a1 withBlock:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 accountType];
  uint64_t v5 = [v4 accountTypeDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_fault_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_FAULT, "Operation on account (%@) of type (%@) was not properly scoped.", (uint8_t *)&v6, 0x16u);
}

+ (void)performWithinPersona:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"We are currently running in the enterprise or guest persona and we're unable resolve the correct one for adoption!\"", v2, v3, v4, v5, v6);
}

+ (void)performWithinPersona:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"We are currently running in the Enterprise or Guest persona, but shouldn't be! Will set to %@.\"", v2, v3, v4, v5, v6);
}

+ (void)performWithinPersona:(NSObject *)a3 withBlock:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 userPersonaNickName];
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_4(&dword_1A57C5000, a3, v6, "\"Current persona (%@) does not match requested persona identifier (%@).\"", (uint8_t *)&v7);
}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FB36F0] sharedManager];
  uint64_t v3 = [v2 currentPersona];
  uint64_t v4 = [v3 userPersonaNickName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1A57C5000, a1, v5, "\"Back to the %@ persona.\"", v6);
}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 userPersonaNickName];
  uint64_t v5 = [a1 userPersonaUniqueString];
  int v7 = 138412546;
  __int16 v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_4(&dword_1A57C5000, a2, v6, "\"Performing block within persona nickname (%@) unique string (%@) \"", (uint8_t *)&v7);
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Could not get current persona context with error %@. Leaving current persona intact.\"", v2, v3, v4, v5, v6);
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_ERROR, "\"Failed to set persona ID (%@) with error %@\"", v1, 0x16u);
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"This process needs entitlement com.apple.usermanagerd.persona.background\"", v2, v3, v4, v5, v6);
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"This process is not permitted for the appropriate mach service lookup. Please file a radar to the owner of the current process.\"", v2, v3, v4, v5, v6);
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1A57C5000, v0, v1, "\"Changing persona to %@\"", v2);
}

@end