@interface TKSEPClientTokenObject
- (BOOL)deleteWithError:(id *)a3;
- (TKSEPClientTokenObject)initWithSession:(id)a3 key:(id)a4 error:(id *)a5;
- (TKSEPKey)key;
- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (id)withError:(id *)a3 invoke:(id)a4;
@end

@implementation TKSEPClientTokenObject

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = _os_activity_create(&dword_1BED55000, "SEPClientObject: operation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v16 = TK_LOG_client();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v13 lastObject];
    -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:](a3, v17, buf, v16);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke;
  v24[3] = &unk_1E63C8880;
  v24[4] = self;
  int64_t v28 = a3;
  id v18 = v13;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  v21 = [(TKSEPClientTokenObject *)self withError:a7 invoke:v24];
  if (!v21)
  {
    v22 = TK_LOG_client();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:](a3, (__CFString **)a7, v22);
    }
  }
  os_activity_scope_leave(&state);

  return v21;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  v6 = a4;
  v7 = (void (*)(void *, id *))v6[2];
  id v34 = 0;
  v8 = v7(v6, &v34);
  id v9 = v34;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    char v33 = 0;
    v10 = 0;
    int v11 = 17;
    while (1)
    {
      id v12 = [v9 domain];
      if (![v12 isEqualToString:@"CryptoTokenKit"]
        || [v9 code] != -9)
      {

LABEL_17:
        if (a3)
        {
          id v29 = v9;
          *a3 = v29;

          goto LABEL_23;
        }
LABEL_24:
        v8 = 0;
        goto LABEL_34;
      }
      id v13 = [(TKClientTokenObject *)self session];
      char v14 = [v13 authenticateWhenNeeded];

      if ((v14 & 1) == 0) {
        goto LABEL_17;
      }
      if (!--v11)
      {
        v30 = TK_LOG_client();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          -[TKSEPClientTokenObject withError:invoke:](self, (uint64_t)v10, v30);
        }

        if (a3)
        {
          *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];

LABEL_23:
          v8 = 0;
LABEL_30:
          if ((v33 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_35;
        }
        goto LABEL_24;
      }
      v15 = [v9 userInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"operation"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v17 = [(TKSEPClientTokenObject *)self key];
      id v18 = [v17 authContext];

      if (!v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F30B50]);
        id v20 = [(TKSEPClientTokenObject *)self key];
        [v20 setAuthContext:v19];

        char v33 = 1;
      }
      v21 = [(TKClientTokenObject *)self session];
      v22 = objc_msgSend(v21, "_testing_AuthContextUsed");

      if (v22)
      {
        v23 = [(TKSEPClientTokenObject *)self key];
        v24 = [v23 authContext];
        id v25 = [(TKClientTokenObject *)self session];
        objc_msgSend(v25, "set_testing_AuthContextUsed:", v24);
      }
      id v26 = [(TKSEPClientTokenObject *)self key];
      id v27 = [v26 authContext];
      int64_t v28 = [(TKClientTokenObject *)self accessControlRef];
      v8 = [v27 evaluateAccessControl:v28 aksOperation:v16 options:MEMORY[0x1E4F1CC08] error:a3];

      if (!v8) {
        goto LABEL_29;
      }
      id v34 = 0;
      v8 = ((void (*)(void *, id *))v6[2])(v6, &v34);
      id v9 = v34;
      v10 = (void *)v16;
      if (v8) {
        goto LABEL_33;
      }
    }
    uint64_t v31 = TK_LOG_client();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[TKSEPClientTokenObject withError:invoke:]((uint64_t)v9, v31);
    }

    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];

      v8 = 0;
LABEL_29:
      v10 = (void *)v16;
      goto LABEL_30;
    }
    v8 = 0;
LABEL_33:
    v10 = (void *)v16;
LABEL_34:

    if ((v33 & 1) == 0) {
      goto LABEL_37;
    }
LABEL_35:
    id v9 = [(TKSEPClientTokenObject *)self key];
    [v9 setAuthContext:0];
  }

LABEL_37:

  return v8;
}

id __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke(uint64_t a1, void *a2)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) session];
  v5 = objc_msgSend(v4, "_testing_ForceAuthenticationNeeded");

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) session];
    objc_msgSend(v6, "set_testing_ForceAuthenticationNeeded:", 0);

    if (!a2)
    {
LABEL_51:
      id v23 = 0;
      goto LABEL_62;
    }
    v7 = 0;
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8 <= 3)
    {
      if (v8 == 2)
      {
        v51 = @"operation";
        v52[0] = @"osgn";
        id v9 = (void *)MEMORY[0x1E4F1C9E8];
        v10 = (__CFString **)v52;
        int v11 = &v51;
        goto LABEL_49;
      }
      if (v8 == 3)
      {
        v47 = @"operation";
        v48 = @"oecd";
        id v9 = (void *)MEMORY[0x1E4F1C9E8];
        v10 = &v48;
        int v11 = &v47;
        goto LABEL_49;
      }
    }
    else
    {
      switch(v8)
      {
        case 4:
          v49 = @"operation";
          v50 = @"ock";
          id v9 = (void *)MEMORY[0x1E4F1C9E8];
          v10 = &v50;
          int v11 = &v49;
          goto LABEL_49;
        case 1000:
          v43 = @"operation";
          v44 = @"oa";
          id v9 = (void *)MEMORY[0x1E4F1C9E8];
          v10 = &v44;
          int v11 = &v43;
          goto LABEL_49;
        case 1003:
          v45 = @"operation";
          v46 = @"okd";
          id v9 = (void *)MEMORY[0x1E4F1C9E8];
          v10 = &v46;
          int v11 = &v45;
LABEL_49:
          v7 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
          break;
      }
    }
    *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-9 userInfo:v7];

    goto LABEL_51;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12 > 999)
  {
    switch(v12)
    {
      case 1000:
        if (!*(void *)(a1 + 48)) {
          goto LABEL_57;
        }
        id v13 = [*(id *)(a1 + 32) session];
        char v14 = [v13 tokenID];
        v15 = [v14 decodedKeyID:*(void *)(a1 + 48) error:a2];

        if (v15)
        {
          uint64_t v16 = [TKSEPKey alloc];
          v17 = [*(id *)(a1 + 32) session];
          id v18 = [v17 LAContext];
          id v19 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"attesteeSystemSession"];
          id v20 = -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:](v16, "initWithObjectID:authContext:forceSystemSession:error:", v15, v18, [v19 BOOLValue], a2);

          if (v20)
          {
            v21 = [*(id *)(a1 + 32) key];
            v22 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"nonce"];
            id v23 = [v21 attestKey:v20 nonce:v22 error:a2];
          }
          else
          {
            id v23 = 0;
          }
        }
        else
        {
          id v23 = 0;
        }
        goto LABEL_56;
      case 1001:
        id v23 = (id)MEMORY[0x1E4F1CC38];
        if (!*(void *)(a1 + 48)) {
          goto LABEL_62;
        }
        id v25 = [*(id *)(a1 + 32) key];
        id v26 = v25;
        uint64_t v27 = 0;
        goto LABEL_35;
      case 1002:
        id v23 = (id)MEMORY[0x1E4F1CC38];
        if (!*(void *)(a1 + 48)) {
          goto LABEL_62;
        }
        id v25 = [*(id *)(a1 + 32) key];
        id v26 = v25;
        uint64_t v27 = 1;
LABEL_35:
        if ([v25 lifetimeControlWithType:v27 error:a2]) {
          char v33 = v23;
        }
        else {
          char v33 = 0;
        }
        id v23 = v33;

        goto LABEL_62;
      case 1003:
        int64_t v28 = [*(id *)(a1 + 40) lastObject];
        int v29 = [v28 isEqualToString:*MEMORY[0x1E4F3BAB0]];

        if (!v29) {
          goto LABEL_61;
        }
        if (!*(void *)(a1 + 48)) {
          goto LABEL_57;
        }
        v15 = [*(id *)(a1 + 32) key];
        uint64_t v30 = [v15 decapsulateKey:*(void *)(a1 + 48) error:a2];
        goto LABEL_55;
      default:
        goto LABEL_61;
    }
  }
  if (v12 == 2)
  {
    uint64_t v31 = [*(id *)(a1 + 40) lastObject];
    if (([v31 isEqualToString:*MEMORY[0x1E4F3BA20]] & 1) == 0)
    {
      v32 = [*(id *)(a1 + 40) lastObject];
      if (![v32 isEqualToString:*MEMORY[0x1E4F3BAA0]])
      {
        v40 = [*(id *)(a1 + 40) lastObject];
        char v41 = [v40 isEqualToString:*MEMORY[0x1E4F3BAA8]];

        if ((v41 & 1) == 0) {
          goto LABEL_61;
        }
        goto LABEL_31;
      }
    }
LABEL_31:
    if (*(void *)(a1 + 48))
    {
      v15 = [*(id *)(a1 + 32) key];
      uint64_t v30 = [v15 signDigest:*(void *)(a1 + 48) error:a2];
      goto LABEL_55;
    }
    goto LABEL_57;
  }
  if (v12 == 3)
  {
    id v34 = [*(id *)(a1 + 40) lastObject];
    char v35 = [v34 isEqualToString:*MEMORY[0x1E4F3BA98]];
    if ((v35 & 1) == 0)
    {
      v5 = [*(id *)(a1 + 40) lastObject];
      if (([v5 isEqualToString:*MEMORY[0x1E4F3BA90]] & 1) == 0)
      {

        goto LABEL_61;
      }
    }
    v36 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F3BB28]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0) {
    if ((isKindOfClass & 1) == 0)
    }
      goto LABEL_61;
    if (*(void *)(a1 + 48))
    {
      v15 = [*(id *)(a1 + 32) key];
      uint64_t v30 = [v15 recryptData:*(void *)(a1 + 48) attributes:*(void *)(a1 + 56) error:a2];
      goto LABEL_55;
    }
LABEL_57:
    id v23 = (id)MEMORY[0x1E4F1CC38];
    goto LABEL_62;
  }
  if (v12 != 4) {
    goto LABEL_61;
  }
  v24 = [*(id *)(a1 + 40) lastObject];
  if ([v24 isEqualToString:*MEMORY[0x1E4F3BA08]])
  {

    goto LABEL_53;
  }
  v38 = [*(id *)(a1 + 40) lastObject];
  int v39 = [v38 isEqualToString:*MEMORY[0x1E4F3BA00]];

  if (!v39)
  {
LABEL_61:
    id v23 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_62;
  }
LABEL_53:
  if (!*(void *)(a1 + 48)) {
    goto LABEL_57;
  }
  v15 = [*(id *)(a1 + 32) key];
  uint64_t v30 = [v15 computeSharedSecret:*(void *)(a1 + 48) error:a2];
LABEL_55:
  id v23 = (id)v30;
LABEL_56:

LABEL_62:

  return v23;
}

- (TKSEPKey)key
{
  return self->_key;
}

- (TKSEPClientTokenObject)initWithSession:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 publicKeyWithError:a5];
  if (v10)
  {
    int v11 = [v9 attributes];
    uint64_t v12 = (void *)[v11 mutableCopy];

    [v12 setObject:v10 forKeyedSubscript:@"pubk"];
    id v13 = [v9 objectID];
    char v14 = +[TKTokenID encodedKeyID:v13];
    v15 = (void *)[v12 copy];
    v19.receiver = self;
    v19.super_class = (Class)TKSEPClientTokenObject;
    uint64_t v16 = [(TKClientTokenObject *)&v19 initWithSession:v8 objectID:v14 attributes:v15];

    if (v16) {
      objc_storeStrong((id *)&v16->_key, a4);
    }
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)deleteWithError:(id *)a3
{
  v5 = _os_activity_create(&dword_1BED55000, "SEPClientObject: deleteKey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__TKSEPClientTokenObject_deleteWithError___block_invoke;
  v8[3] = &unk_1E63C8858;
  v8[4] = self;
  v6 = [(TKSEPClientTokenObject *)self withError:a3 invoke:v8];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&state);
  return (char)a3;
}

id __42__TKSEPClientTokenObject_deleteWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) key];
  if ([v3 deleteWithError:a2]) {
    v4 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

- (void)withError:(NSObject *)a3 invoke:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = [a1 session];
  v7 = [v6 token];
  id v8 = [v7 tokenID];
  id v9 = [a1 accessControl];
  int v10 = 138543874;
  int v11 = v8;
  __int16 v12 = 2114;
  id v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  _os_log_fault_impl(&dword_1BED55000, a3, OS_LOG_TYPE_FAULT, "authentication failed repeatedly: tkid=%{public}@, ac=%{public}@, op=%{public}@", (uint8_t *)&v10, 0x20u);
}

- (void)withError:(uint64_t)a1 invoke:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BED55000, a2, OS_LOG_TYPE_FAULT, "TKErrorCodeAuthenticationNeeded does not have operation set: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)operation:(os_log_t)log data:algorithms:parameters:error:.cold.1(int a1, __CFString **a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = *a2;
  }
  else {
    uint64_t v3 = &stru_1F19EDBB0;
  }
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2114;
  v6 = v3;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "operation:%d failed, error: %{public}@", (uint8_t *)v4, 0x12u);
}

- (void)operation:(uint8_t *)buf data:(os_log_t)log algorithms:parameters:error:.cold.2(int a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2114;
  *(void *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "operation:%d algo:%{public}@", buf, 0x12u);
}

@end