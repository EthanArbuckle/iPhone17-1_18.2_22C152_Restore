@interface ASTAutomatedSession
+ (id)sessionWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6;
+ (id)sessionWithSerialNumber:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6;
+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5;
+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5;
- (ASTAuthInfoResult)authInfo;
- (ASTAutomatedSession)initWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6;
- (ASTIdentity)identity;
- (ASTProfileResult)profile;
- (ASTRemoteServerSession)session;
- (NSDictionary)tests;
- (id)authInfoHandler;
- (id)completion;
- (void)end;
- (void)executeWithCompletion:(id)a3;
- (void)session:(id)a3 didEndWithError:(id)a4;
- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4;
- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5;
- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6;
- (void)setAuthInfo:(id)a3;
- (void)setAuthInfoHandler:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSession:(id)a3;
- (void)setTests:(id)a3;
@end

@implementation ASTAutomatedSession

+ (id)sessionWithSerialNumber:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = +[ASTIdentity identityWithSerialNumber:a3];
  v14 = (void *)[objc_alloc((Class)a1) initWithIdentity:v13 profile:v12 tests:v11 authInfoHandler:v10];

  return v14;
}

- (ASTAutomatedSession)initWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASTAutomatedSession;
  v15 = [(ASTAutomatedSession *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identity, a3);
    uint64_t v17 = MEMORY[0x23ECF0530](v14);
    id authInfoHandler = v16->_authInfoHandler;
    v16->_id authInfoHandler = (id)v17;

    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_tests, a5);
  }

  return v16;
}

+ (id)sessionWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithIdentity:v13 profile:v12 tests:v11 authInfoHandler:v10];

  return v14;
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [a1 sessionExistsForIdentities:v11 ticketNumber:v9 completionHandler:v10];
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ASTAutomatedSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke;
  v9[3] = &unk_264E7D6D0;
  id v10 = v7;
  id v8 = v7;
  +[ASTSession sessionStatusForIdentities:a3 ticketNumber:a4 completionHandler:v9];
}

uint64_t __81__ASTAutomatedSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeWithCompletion:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  [(ASTAutomatedSession *)self setCompletion:v4];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = objc_opt_class();
  id v7 = [(ASTAutomatedSession *)self identity];
  v26[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __45__ASTAutomatedSession_executeWithCompletion___block_invoke;
  uint64_t v17 = &unk_264E7DB78;
  long long v19 = &v20;
  id v9 = v5;
  long long v18 = v9;
  [v6 sessionExistsForIdentities:v8 ticketNumber:0 completionHandler:&v14];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v21[5])
  {
    v4[2](v4);
  }
  else
  {
    id v10 = [(ASTAutomatedSession *)self identity];
    id v11 = +[ASTRemoteServerSession sessionWithIdentity:v10];
    [(ASTAutomatedSession *)self setSession:v11];

    id v12 = [(ASTAutomatedSession *)self session];
    [v12 setDelegate:self];

    uint64_t v13 = [(ASTAutomatedSession *)self session];
    [v13 start];
  }
  _Block_object_dispose(&v20, 8);
}

intptr_t __45__ASTAutomatedSession_executeWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1006 userInfo:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (void)end
{
  uint64_t v3 = [(ASTAutomatedSession *)self session];

  if (v3)
  {
    id v4 = [(ASTAutomatedSession *)self session];
    [v4 end];
  }
}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [(ASTAutomatedSession *)self tests];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    uint64_t v12 = [v11 files];
    if (v12
      && (uint64_t v13 = (void *)v12,
          [v11 files],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 count],
          v14,
          v13,
          v15))
    {
      uint64_t v16 = [v11 files];
      [v9 sealWithSealableFiles:v16];
    }
    else
    {
      uint64_t v16 = [v11 payload];
      uint64_t v17 = [v11 signature];
      [v9 sealWithPayload:v16 signature:v17];
    }
  }
  else
  {
    uint64_t v16 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ASTAutomatedSession session:startTest:parameters:testResult:]((uint64_t)v8, v16);
    }
  }

  long long v18 = [(ASTAutomatedSession *)self session];
  [v18 sendTestResult:v9 error:0];
}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v6 = a3;
  id v7 = [(ASTAutomatedSession *)self profile];
  [v6 sendProfileResult:v7 error:0];
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(ASTAutomatedSession *)self completion];
  ((void (**)(void, id))v6)[2](v6, v5);

  [(ASTAutomatedSession *)self setSession:0];

  [(ASTAutomatedSession *)self setCompletion:0];
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ASTAutomatedSession_session_generateAuthInfoWithNonce___block_invoke;
  block[3] = &unk_264E7D6A8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __57__ASTAutomatedSession_session_generateAuthInfoWithNonce___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) authInfoHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) authInfoHandler];
    v3[2](v3, *(void *)(a1 + 40));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  [*(id *)(a1 + 48) sendAuthInfoResult:v4 error:0];
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (ASTRemoteServerSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
}

- (ASTProfileResult)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (ASTAuthInfoResult)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
}

- (id)authInfoHandler
{
  return self->_authInfoHandler;
}

- (void)setAuthInfoHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authInfoHandler, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)session:(uint64_t)a1 startTest:(NSObject *)a2 parameters:testResult:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "No result available for requested testId [%@]", (uint8_t *)&v2, 0xCu);
}

@end