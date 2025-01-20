@interface TKExtensionClientTokenSession
- (BOOL)ensureSessionWithClient:(id)a3 connectionIdentifier:(int64_t)a4 error:(id *)a5;
- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5;
- (BOOL)isValidWithError:(id *)a3;
- (NSNumber)sessionID;
- (TKExtensionClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)advertisedItems;
- (id)certificates;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)identities;
- (id)itemsOfClass:(id)a3;
- (id)keys;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
- (id)slotName;
- (id)withError:(id *)a3 accessControl:(__SecAccessControl *)a4 invoke:(id)a5;
- (void)dealloc;
- (void)terminate;
@end

@implementation TKExtensionClientTokenSession

- (TKExtensionClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TKExtensionClientTokenSession;
  return (TKExtensionClientTokenSession *)[(TKClientTokenSession *)&v7 _initWithToken:a3 LAContext:a4 parameters:a5 error:a6];
}

- (void)terminate
{
  v3 = [(TKExtensionClientTokenSession *)self sessionID];

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__TKExtensionClientTokenSession_terminate__block_invoke;
    v5[3] = &unk_1E63C91C0;
    v5[4] = self;
    id v4 = [(TKExtensionClientTokenSession *)self withError:0 accessControl:0 invoke:v5];
  }
}

uint64_t __42__TKExtensionClientTokenSession_terminate__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sessionID];
  [v3 endSession:v4 reply:&__block_literal_global_144];

  return MEMORY[0x1E4F1CC38];
}

- (BOOL)isValidWithError:(id *)a3
{
  id v3 = [(TKExtensionClientTokenSession *)self withError:a3 accessControl:0 invoke:&__block_literal_global_146];
  char v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __50__TKExtensionClientTokenSession_isValidWithError___block_invoke()
{
  return MEMORY[0x1E4F1CC38];
}

- (BOOL)ensureSessionWithClient:(id)a3 connectionIdentifier:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (self->_connectionIdentifier == a4) {
    goto LABEL_7;
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v9 = [(TKClientTokenSession *)self LAContext];
  v10 = [(TKClientTokenSession *)self parameters];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke;
  v14[3] = &unk_1E63C9208;
  v14[4] = self;
  v14[5] = &v15;
  [v8 startSessionWithLAContext:v9 parameters:v10 reply:v14];

  sessionID = self->_sessionID;
  if (sessionID)
  {
    self->_connectionIdentifier = a4;
  }
  else if (a5)
  {
    *a5 = (id) v16[5];
  }
  _Block_object_dispose(&v15, 8);

  if (sessionID) {
LABEL_7:
  }
    BOOL v12 = 1;
  else {
    BOOL v12 = 0;
  }

  return v12;
}

void __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)withError:(id *)a3 accessControl:(__SecAccessControl *)a4 invoke:(id)a5
{
  id v8 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
  id v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v9 = [(TKClientTokenSession *)self token];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke;
  v14[3] = &unk_1E63C9230;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  v16 = &v23;
  uint64_t v17 = &v19;
  v18 = a4;
  id v11 = [v9 withError:a3 invoke:v14];
  BOOL v12 = (void *)v24[5];
  if (v12)
  {
    if (([v12 isEqual:self->_sessionID] & 1) == 0)
    {
      [(TKExtensionClientTokenSession *)self terminate];
      objc_storeStrong((id *)&self->_sessionID, (id)v24[5]);
      self->_connectionIdentifier = v20[3];
    }
    [(TKClientTokenSession *)self setLAContext:0];
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

id __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = 0;
  v30 = @"CryptoTokenKit";
  int v9 = 16;
  do
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "ensureSessionWithClient:connectionIdentifier:error:", v7, a3, a4, v30))
    {
      id v10 = 0;
      goto LABEL_31;
    }
    id v10 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v11 = 0;
    BOOL v12 = v11;
    if (v10) {
      goto LABEL_23;
    }
    v13 = [v11 domain];
    if (![v13 isEqualToString:v30]
      || [v12 code] != -9
      || !*(void *)(a1 + 64))
    {

LABEL_21:
      if (a4) {
        *a4 = v12;
      }
LABEL_23:
      id v24 = v10;
LABEL_30:

      goto LABEL_31;
    }
    char v14 = [*(id *)(a1 + 32) authenticateWhenNeeded];

    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
    id v15 = [*(id *)(a1 + 32) LAContext];

    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      [*(id *)(a1 + 32) setLAContext:v16];

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 80);
      *(void *)(*(void *)(a1 + 32) + 80) = 0;
      if (![*(id *)(a1 + 32) ensureSessionWithClient:v7 connectionIdentifier:a3 error:a4])goto LABEL_30; {
    }
      }
    uint64_t v17 = [v12 userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"operation"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = TK_LOG_client_1();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[TKSEPClientTokenObject withError:invoke:]((uint64_t)v12, v25);
      }

      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:v30 code:-5 userInfo:0];
      }
LABEL_29:
      id v8 = (void *)v18;
      goto LABEL_30;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_testing_AuthenticateInternally"))
    {
      uint64_t v19 = (void *)SecAccessControlCopyData();
      char v20 = [*(id *)(a1 + 32) evaluateAccessControl:v19 forOperation:v18 error:a4];

      if ((v20 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v21 = [*(id *)(a1 + 32) LAContext];
      uint64_t v22 = [v21 evaluateAccessControl:*(void *)(a1 + 64) aksOperation:v18 options:MEMORY[0x1E4F1CC08] error:a4];

      if (!v22) {
        goto LABEL_29;
      }
    }

    id v8 = (void *)v18;
    --v9;
  }
  while (v9);
  uint64_t v23 = TK_LOG_client_1();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    v27 = [*(id *)(a1 + 32) token];
    id v28 = [v27 tokenID];
    uint64_t v29 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v32 = v28;
    __int16 v33 = 2114;
    uint64_t v34 = v29;
    __int16 v35 = 2114;
    uint64_t v36 = v18;
    _os_log_fault_impl(&dword_1BED55000, v23, OS_LOG_TYPE_FAULT, "authentication failed repeatedly: tkid=%{public}@, ac=%{public}@, op=%{public}@", buf, 0x20u);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:v30 code:-5 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  id v8 = (void *)v18;
LABEL_31:

  return v10;
}

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_1BED55000, "ExtClientObject: evaluateAccessControl", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke;
  v15[3] = &unk_1E63C9258;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v13 = [(TKExtensionClientTokenSession *)self withError:a5 accessControl:0 invoke:v15];
  LOBYTE(a5) = [v13 BOOLValue];

  os_activity_scope_leave(&state);
  return (char)a5;
}

id __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  uint64_t v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  id v6 = [*(id *)(a1 + 32) sessionID];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2;
  v12[3] = &unk_1E63C8C58;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 session:v6 evaluateAccessControl:v7 forOperation:v8 reply:v12];

  id v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    id v9 = (void *)v20[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    id v6 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1BED55000, "ExtClientObject: getObject", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke;
  id v16 = &unk_1E63C9198;
  id v17 = self;
  id v8 = v6;
  id v18 = v8;
  id v9 = [(TKExtensionClientTokenSession *)self withError:a4 accessControl:0 invoke:&v13];
  if (v9)
  {
    id v10 = [TKExtensionClientTokenObject alloc];
    id v11 = -[TKClientTokenObject initWithSession:objectID:attributes:](v10, "initWithSession:objectID:attributes:", self, v8, v9, v13, v14, v15, v16, v17);
  }
  else
  {
    id v11 = 0;
  }

  os_activity_scope_leave(&state);

  return v11;
}

id __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  id v6 = [*(id *)(a1 + 32) sessionID];
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2;
  v11[3] = &unk_1E63C8BB8;
  v11[4] = &v18;
  v11[5] = &v12;
  [v5 session:v6 getAttributesOfObjectID:v7 reply:v11];

  id v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    id v8 = (void *)v19[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

void __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1BED55000, "ExtClientObject: createObject", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  id v41 = 0;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke;
  id v17 = &unk_1E63C92A8;
  uint64_t v20 = v24;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  uint64_t v21 = &v36;
  uint64_t v22 = &v32;
  id v23 = &v26;
  uint64_t v9 = [(TKExtensionClientTokenSession *)self withError:a4 accessControl:0 invoke:&v14];
  id v10 = (void *)v37[5];
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqual:", self->_sessionID, v14, v15, v16, v17, v18) & 1) == 0)
    {
      [(TKExtensionClientTokenSession *)self terminate];
      objc_storeStrong((id *)&self->_sessionID, (id)v37[5]);
      self->_connectionIdentifier = v33[3];
    }
    [(TKClientTokenSession *)self setLAContext:0];
  }
  if (v27[5])
  {
    id v11 = [TKExtensionClientTokenObject alloc];
    uint64_t v12 = [(TKClientTokenObject *)v11 initWithSession:self objectID:v27[5] attributes:v9];
  }
  else
  {
    uint64_t v12 = 0;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  os_activity_scope_leave(&state);

  return v12;
}

id __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v31 = 0;
    uint64_t v8 = [v6 processObjectCreationAttributes:v7 authContext:&v31 error:a3];
    id v9 = v31;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_16;
    }
    uint64_t v12 = [*(id *)(a1 + 32) LAContext];

    if (!v12)
    {
      if (v9)
      {
        [*(id *)(a1 + 32) setLAContext:v9];
      }
      else
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F30B50]);
        [*(id *)(a1 + 32) setLAContext:v13];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 80);
      *(void *)(*(void *)(a1 + 32) + 80) = 0;
      if (![*(id *)(a1 + 32) ensureSessionWithClient:v5 connectionIdentifier:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) error:a3])
      {
LABEL_16:

        id v16 = 0;
        goto LABEL_13;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v14 = [*(id *)(a1 + 32) sessionID];
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2;
  v18[3] = &unk_1E63C9280;
  v18[4] = *(void *)(a1 + 72);
  v18[5] = &v25;
  v18[6] = &v19;
  [v5 session:v14 createObjectWithAttributes:v15 reply:v18];

  if (a3 && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    *a3 = (id) v20[5];
  }
  id v16 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
LABEL_13:

  return v16;
}

void __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (void)dealloc
{
  [(TKExtensionClientTokenSession *)self terminate];
  v3.receiver = self;
  v3.super_class = (Class)TKExtensionClientTokenSession;
  [(TKExtensionClientTokenSession *)&v3 dealloc];
}

- (id)advertisedItems
{
  advertisedItems = self->_advertisedItems;
  if (!advertisedItems)
  {
    char v4 = _os_activity_create(&dword_1BED55000, "ExtClientObject: advertisedItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke;
    v7[3] = &unk_1E63C91C0;
    v7[4] = self;
    id v5 = [(TKExtensionClientTokenSession *)self withError:0 accessControl:0 invoke:v7];
    os_activity_scope_leave(&state);

    advertisedItems = self->_advertisedItems;
  }

  return advertisedItems;
}

id __48__TKExtensionClientTokenSession_advertisedItems__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 sessionID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2;
  v7[3] = &unk_1E63C8640;
  v7[4] = *(void *)(a1 + 32);
  [v4 session:v5 getAdvertisedItemsWithReply:v7];

  return *(id *)(*(void *)(a1 + 32) + 88);
}

void __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)itemsOfClass:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self;
  id v6 = [(TKExtensionClientTokenSession *)self advertisedItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x1E4F3B978];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 objectForKeyedSubscript:v10];
        int v14 = [v13 isEqual:v4];

        if (v14)
        {
          uint64_t v15 = [[TKClientTokenAdvertisedItem alloc] initWithSession:v5 keychainAttributes:v12 secRef:0];
          [v18 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v16 = (void *)[v18 copy];

  return v16;
}

- (id)keys
{
  return [(TKExtensionClientTokenSession *)self itemsOfClass:*MEMORY[0x1E4F3B9A0]];
}

- (id)certificates
{
  return [(TKExtensionClientTokenSession *)self itemsOfClass:*MEMORY[0x1E4F3B980]];
}

- (id)identities
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v23 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = self;
  id obj = [(TKExtensionClientTokenSession *)self keys];
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v40;
    uint64_t v33 = *MEMORY[0x1E4F3B828];
    uint64_t v32 = *MEMORY[0x1E4F3B5D0];
    uint64_t v26 = *MEMORY[0x1E4F3B990];
    uint64_t v24 = *MEMORY[0x1E4F3B788];
    uint64_t v25 = *MEMORY[0x1E4F3B978];
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v4 = [(TKExtensionClientTokenSession *)v30 certificates];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v31 = i;
          uint64_t v7 = *(void *)v36;
LABEL_8:
          uint64_t v8 = 0;
          while (1)
          {
            if (*(void *)v36 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
            uint64_t v10 = [v9 keychainAttributes];
            id v11 = [v10 objectForKeyedSubscript:v33];
            uint64_t v12 = [v34 keychainAttributes];
            id v13 = [v12 objectForKeyedSubscript:v32];
            char v14 = [v11 isEqual:v13];

            if (v14) {
              break;
            }
            if (v6 == ++v8)
            {
              uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v6) {
                goto LABEL_8;
              }
              id v15 = v4;
              uint64_t i = v31;
              goto LABEL_23;
            }
          }
          id v15 = v9;

          uint64_t i = v31;
          if (!v15) {
            continue;
          }
          id v16 = [v34 keychainAttributes];
          id v17 = (void *)[v16 mutableCopy];

          [v17 setObject:v26 forKeyedSubscript:v25];
          uint64_t v18 = [v15 localizedName];
          [v17 setObject:v18 forKeyedSubscript:v24];

          if ([v34 keyRef] && objc_msgSend(v15, "certificateRef"))
          {
            [v15 certificateRef];
            [v34 keyRef];
            long long v19 = (void *)SecIdentityCreate();
            if (v19)
            {
              long long v20 = [[TKClientTokenAdvertisedItem alloc] initWithSession:v30 keychainAttributes:v17 secRef:v19];
              [v23 addObject:v20];
            }
          }
        }
        else
        {
          id v15 = v4;
        }
LABEL_23:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v29);
  }

  long long v21 = (void *)[v23 copy];

  return v21;
}

- (id)slotName
{
  slotName = self->_slotName;
  if (!slotName)
  {
    id v4 = _os_activity_create(&dword_1BED55000, "ExtClientObject: slotName", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke;
    v7[3] = &unk_1E63C91C0;
    v7[4] = self;
    id v5 = [(TKExtensionClientTokenSession *)self withError:0 accessControl:0 invoke:v7];
    os_activity_scope_leave(&state);

    slotName = self->_slotName;
  }

  return slotName;
}

id __41__TKExtensionClientTokenSession_slotName__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 sessionID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke_2;
  v7[3] = &unk_1E63C92D0;
  v7[4] = *(void *)(a1 + 32);
  [v4 session:v5 slotNameWithReply:v7];

  return *(id *)(*(void *)(a1 + 32) + 96);
}

void __41__TKExtensionClientTokenSession_slotName__block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_slotName, 0);

  objc_storeStrong((id *)&self->_advertisedItems, 0);
}

@end