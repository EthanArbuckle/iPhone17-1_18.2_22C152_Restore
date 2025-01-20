@interface AALoginContextManager
+ (AALoginContextManager)sharedManager;
+ (void)stashLoginResponseWithAuthenticationResults:(id)a3 cloudKitToken:(id)a4;
- (AALoginContextManager)init;
- (AAStorableLoginContext)stashedContext;
- (void)persistStashedContext;
- (void)setStashedContext:(id)a3;
@end

@implementation AALoginContextManager

+ (AALoginContextManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_153);
  }
  v2 = (void *)sharedManager_sharedManager_1;

  return (AALoginContextManager *)v2;
}

uint64_t __38__AALoginContextManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager_1 = objc_alloc_init(AALoginContextManager);

  return MEMORY[0x1F41817F8]();
}

- (AALoginContextManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AALoginContextManager;
  v2 = [(AALoginContextManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    stashedContext = v2->_stashedContext;
    v2->_stashedContext = 0;

    v3->_stashedContextLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (AAStorableLoginContext)stashedContext
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  p_stashedContextLock = &self->_stashedContextLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __39__AALoginContextManager_stashedContext__block_invoke;
  v8 = &unk_1E5A4B330;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_stashedContextLock);
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_stashedContextLock);
  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (AAStorableLoginContext *)v4;
}

void __39__AALoginContextManager_stashedContext__block_invoke(uint64_t a1)
{
}

- (void)setStashedContext:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AALoginContextManager_setStashedContext___block_invoke;
  v7[3] = &unk_1E5A488A8;
  p_stashedContextLock = &self->_stashedContextLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_stashedContextLock);
  __43__AALoginContextManager_setStashedContext___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_stashedContextLock);
}

void __43__AALoginContextManager_setStashedContext___block_invoke(uint64_t a1)
{
}

- (void)persistStashedContext
{
  p_stashedContextLock = &self->_stashedContextLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__AALoginContextManager_persistStashedContext__block_invoke;
  v3[3] = &unk_1E5A48358;
  v3[4] = self;
  os_unfair_lock_lock(&self->_stashedContextLock);
  __46__AALoginContextManager_persistStashedContext__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_stashedContextLock);
}

void __46__AALoginContextManager_persistStashedContext__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = +[AALoginContextTransientStorage sharedStorage];
    [v2 save:*(void *)(*(void *)(a1 + 32) + 8)];

    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;
  }
  else
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__AALoginContextManager_persistStashedContext__block_invoke_cold_1();
    }
  }
}

+ (void)stashLoginResponseWithAuthenticationResults:(id)a3 cloudKitToken:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.6();
  }

  uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  if (!v8)
  {
    v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.5();
    }
  }
  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  if (!v10)
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.4();
    }
  }
  v32 = (void *)v8;
  v12 = [[AAStorableLoginContext alloc] initWithAppleID:v8 altDSID:v10];
  uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
  v31 = (void *)v13;
  if (v13)
  {
    [(AAStorableLoginContext *)v12 setDSID:v13];
  }
  else
  {
    v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:]();
    }
  }
  v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  if (v15)
  {
    [(AAStorableLoginContext *)v12 setRawPassword:v15];
  }
  else
  {
    id v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:]();
    }
  }
  v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC8]];

  if (v17)
  {
    v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "AuthResult is indicating that we're dealing with a beneficiary account.", buf, 2u);
    }

    [(AAStorableLoginContext *)v12 setBeneficiaryLogin:1];
  }
  v19 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDB8]];
  if (v19) {
    [(AAStorableLoginContext *)v12 setFirstName:v19];
  }
  v20 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDD8]];
  if (v20) {
    [(AAStorableLoginContext *)v12 setLastName:v20];
  }
  if (v6)
  {
    [(AAStorableLoginContext *)v12 setCloudKitToken:v6];
  }
  else
  {
    v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:]();
    }
  }
  v33 = v6;
  v22 = [MEMORY[0x1E4F179C8] defaultStore];
  v23 = objc_msgSend(v22, "aa_authKitAccountForAltDSID:", v10);
  v24 = v23;
  if (v23)
  {
    v25 = [v23 credential];
    v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v24;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
    }

    v27 = [v25 credentialItemForKey:*MEMORY[0x1E4F178B0]];
    [(AAStorableLoginContext *)v12 setContinuationKey:v27];

    v28 = [v25 credentialItemForKey:*MEMORY[0x1E4F17948]];
    [(AAStorableLoginContext *)v12 setPasswordResetKey:v28];
  }
  else
  {
    v25 = _AALogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
    }
  }

  v29 = +[AALoginContextManager sharedManager];
  [v29 setStashedContext:v12];

  v30 = +[AALoginContextManager sharedManager];
  [v30 persistStashedContext];
}

- (void).cxx_destruct
{
}

void __46__AALoginContextManager_persistStashedContext__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Asked to persist stashedContext without a stashedContext", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Stash call missing cloudKitToken!", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Login response results missing rp!", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Login response results missing DSID!", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Login response results missing altDSID!", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Login response results missing username!", v2, v3, v4, v5, v6);
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.6()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_DEBUG, "Stashing login response because caller said so...", v1, 2u);
}

@end