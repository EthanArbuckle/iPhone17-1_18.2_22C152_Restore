@interface TKExtensionClientToken
+ (id)builtinTokenIDs;
- (BOOL)ensureConnectionWithError:(id *)a3;
- (NSXPCConnection)serverConnection;
- (NSXPCConnection)tokenConnection;
- (TKExtensionClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5;
- (id)SEPKeyEndpoint;
- (id)configurationEndpoint;
- (id)endpoint;
- (id)watcherEndpoint;
- (id)withError:(id *)a3 getServerEndpoint:(id)a4;
- (id)withError:(id *)a3 invoke:(id)a4;
- (void)dealloc;
- (void)serverConnection;
@end

@implementation TKExtensionClientToken

- (id)SEPKeyEndpoint
{
  return [(TKExtensionClientToken *)self withError:0 getServerEndpoint:&__block_literal_global_70];
}

- (NSXPCConnection)serverConnection
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    goto LABEL_11;
  }
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
  {
    v5 = serverEndpoint;
  }
  else
  {
    provideEndpoint(2);
    v5 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (self->_targetUID)
      {
        v12 = TK_LOG_client_1();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          [(TKExtensionClientToken *)(id *)&self->_targetUID serverConnection];
        }
      }
      self->_namedConnection = 1;
      v13 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ctkd.token-client" options:0];
      v14 = self->_serverConnection;
      self->_serverConnection = v13;

      v5 = 0;
      goto LABEL_8;
    }
  }
  v6 = TK_LOG_client_1();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(TKExtensionClientToken *)&self->_serverEndpoint serverConnection];
  }

  v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
  v8 = self->_serverConnection;
  self->_serverConnection = v7;

LABEL_8:
  targetUID = self->_targetUID;
  if (targetUID) {
    [(NSXPCConnection *)self->_serverConnection _setTargetUserIdentifier:[(NSNumber *)targetUID integerValue]];
  }
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A01E08];
  [(NSXPCConnection *)self->_serverConnection setRemoteObjectInterface:v10];

  [(NSXPCConnection *)self->_serverConnection resume];
  serverConnection = self->_serverConnection;
LABEL_11:

  return serverConnection;
}

- (TKExtensionClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TKExtensionClientToken;
  v11 = [(TKClientToken *)&v14 _initWithTokenID:a3];
  v12 = (TKExtensionClientToken *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong((id *)&v12->_targetUID, a5);
  }

  return v12;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serverConnection invalidate];
  [(NSXPCConnection *)self->_tokenConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKExtensionClientToken;
  [(TKExtensionClientToken *)&v3 dealloc];
}

+ (id)builtinTokenIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)withError:(id *)a3 getServerEndpoint:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *, id *))a4;
  int v22 = 0;
  uint64_t v21 = *MEMORY[0x1E4F281F8];
  *(void *)&long long v7 = 67109120;
  long long v20 = v7;
  do
  {
    uint64_t v26 = 0;
    v27[0] = &v26;
    v27[1] = 0x3032000000;
    v27[2] = __Block_byref_object_copy__6;
    v27[3] = __Block_byref_object_dispose__6;
    id v28 = 0;
    v8 = [(TKExtensionClientToken *)self serverConnection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke;
    v25[3] = &unk_1E63C9088;
    v25[4] = &v26;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v25];

    id v24 = 0;
    id v10 = v6[2](v6, v9, &v24);
    id v11 = v24;
    v12 = *(void **)(v27[0] + 40);
    if (v12)
    {
      if ([v12 code] == 4097
        && (([*(id *)(v27[0] + 40) domain],
             v13 = objc_claimAutoreleasedReturnValue(),
             int v14 = [v13 isEqualToString:v21],
             v22 < 8)
          ? (int v15 = v14)
          : (int v15 = 0),
            v13,
            v15))
      {
        v16 = TK_LOG_client_1();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v20;
          int v32 = v22;
          _os_log_debug_impl(&dword_1BED55000, v16, OS_LOG_TYPE_DEBUG, "detected interruption on token-client connection, retrying %d", buf, 8u);
        }

        [MEMORY[0x1E4F29060] sleepForTimeInterval:(double)v22++ * 0.1];
        char v17 = 1;
      }
      else
      {
        if (a3) {
          *a3 = *(id *)(v27[0] + 40);
        }
        v18 = TK_LOG_client_1();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          [(TKExtensionClientToken *)v29 withError:&v30 getServerEndpoint:v18];
        }

        char v17 = 0;
        id v4 = 0;
      }
    }
    else
    {
      if (a3 && !v10) {
        *a3 = v11;
      }
      id v4 = v10;
      char v17 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }
  while ((v17 & 1) != 0);

  return v4;
}

void __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke(uint64_t a1, void *a2)
{
}

- (id)endpoint
{
  return [(TKExtensionClientToken *)self withError:0 getServerEndpoint:&__block_literal_global_18];
}

id __34__TKExtensionClientToken_endpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__TKExtensionClientToken_endpoint__block_invoke_2;
  v5[3] = &unk_1E63C90D0;
  v5[4] = &v6;
  [v2 getEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__TKExtensionClientToken_endpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)configurationEndpoint
{
  return [(TKExtensionClientToken *)self withError:0 getServerEndpoint:&__block_literal_global_66_0];
}

id __47__TKExtensionClientToken_configurationEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2;
  v5[3] = &unk_1E63C90D0;
  v5[4] = &v6;
  [v2 getConfigurationEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)watcherEndpoint
{
  return [(TKExtensionClientToken *)self withError:0 getServerEndpoint:&__block_literal_global_68];
}

id __41__TKExtensionClientToken_watcherEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2;
  v5[3] = &unk_1E63C90D0;
  v5[4] = &v6;
  [v2 getWatcherEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

id __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2;
  v5[3] = &unk_1E63C90D0;
  v5[4] = &v6;
  [v2 getSEPKeyEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)ensureConnectionWithError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (self->_tokenConnection)
  {
    char v3 = 1;
    return v3 & 1;
  }
  int v6 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  id v47 = 0;
  uint64_t v26 = *MEMORY[0x1E4F281F8];
  *(void *)&long long v4 = 67109120;
  long long v25 = v4;
  while (v6 <= 7)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    id v41 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    long long v7 = [(TKExtensionClientToken *)self serverConnection];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke;
    v31[3] = &unk_1E63C90F8;
    v31[4] = self;
    v31[5] = &v36;
    v31[6] = &v32;
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v31];
    id v9 = [(TKClientToken *)self tokenID];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_71;
    v30[3] = &unk_1E63C9120;
    v30[4] = &v42;
    v30[5] = &v36;
    [v8 getTokenEndpointForTokenID:v9 reply:v30];

    if (v43[5])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F29268]);
      id v11 = (NSXPCConnection *)[v10 initWithListenerEndpoint:v43[5]];
      tokenConnection = self->_tokenConnection;
      self->_tokenConnection = v11;

      v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FF8D8];
      [(NSXPCConnection *)self->_tokenConnection setRemoteObjectInterface:v13];

      ++self->_connectionIdentifier;
      [(NSXPCConnection *)self->_tokenConnection resume];
      char v14 = 0;
      char v3 = 1;
    }
    else
    {
      if ([(id)v37[5] code] == 4097
        && ([(id)v37[5] domain],
            int v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v15 isEqualToString:v26],
            v15,
            v16))
      {
        char v17 = TK_LOG_client_1();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v25;
          int v49 = v6;
          _os_log_debug_impl(&dword_1BED55000, v17, OS_LOG_TYPE_DEBUG, "reconnecting ctkd after interrupt, try %d", buf, 8u);
        }
      }
      else
      {
        if (objc_msgSend((id)v37[5], "code", v25) != 4099) {
          goto LABEL_21;
        }
        v18 = [(id)v37[5] domain];
        int v19 = [v18 isEqualToString:v26];

        if (!v19) {
          goto LABEL_21;
        }
        if (*((unsigned char *)v33 + 24) && self->_namedConnection
          || [(TKClientToken *)self _testing_noAutomaticReconnect])
        {
          long long v20 = TK_LOG_client_1();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            [(TKExtensionClientToken *)&v28 ensureConnectionWithError:v20];
          }

LABEL_21:
          char v14 = 0;
          char v3 = 0;
          if (a3) {
            *a3 = (id) v37[5];
          }
          goto LABEL_23;
        }
        uint64_t v21 = TK_LOG_client_1();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v25;
          int v49 = v6;
          _os_log_debug_impl(&dword_1BED55000, v21, OS_LOG_TYPE_DEBUG, "reconnecting ctkd after invalidate, try %d", buf, 8u);
        }

        [(NSXPCConnection *)self->_serverConnection invalidate];
        serverConnection = self->_serverConnection;
        self->_serverConnection = 0;

        [MEMORY[0x1E4F29060] sleepForTimeInterval:(double)v6++ * 0.1];
      }
      char v14 = 1;
    }
LABEL_23:
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);

    if ((v14 & 1) == 0) {
      goto LABEL_33;
    }
  }
  v23 = TK_LOG_client_1();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    -[TKExtensionClientToken ensureConnectionWithError:]((uint64_t)self, v23);
  }

  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    char v3 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = 0;
  }
LABEL_33:
  _Block_object_dispose(&v42, 8);

  return v3 & 1;
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = TK_LOG_client_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void *, void, id *))a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = 0;
  uint64_t v34 = *MEMORY[0x1E4F281F8];
  double v10 = 0.0;
  *(void *)&long long v11 = 138543618;
  long long v33 = v11;
  while (-[TKExtensionClientToken ensureConnectionWithError:](v8, "ensureConnectionWithError:", a3, v33))
  {
    *(void *)v43 = 0;
    uint64_t v44 = v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__6;
    id v47 = __Block_byref_object_dispose__6;
    id v48 = 0;
    v12 = [(TKExtensionClientToken *)v8 tokenConnection];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __43__TKExtensionClientToken_withError_invoke___block_invoke;
    v38[3] = &unk_1E63C9088;
    v38[4] = v43;
    v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v38];

    int64_t connectionIdentifier = v8->_connectionIdentifier;
    id v37 = 0;
    int v15 = v7[2](v7, v13, connectionIdentifier, &v37);
    id v16 = v37;
    char v17 = (void *)*((void *)v44 + 5);
    if (!v17)
    {
      if (a3 && !v15)
      {
        if (!v16)
        {
          int v22 = TK_LOG_client_1();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            -[TKExtensionClientToken withError:invoke:](&v35, v36, v22);
          }

          id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
        }
        id v16 = v16;
        *a3 = v16;
      }
LABEL_22:
      id v4 = v15;
      char v20 = 0;
      int v21 = 0;
      goto LABEL_23;
    }
    if ([v17 code] == 4099 || objc_msgSend(*((id *)v44 + 5), "code") == 4097)
    {
      v18 = [*((id *)v44 + 5) domain];
      if ([v18 isEqualToString:v34])
      {
        BOOL v19 = [(TKClientToken *)v8 _testing_noAutomaticReconnect];

        if (!v19)
        {
          if (v10 <= 30.0)
          {
            id v24 = TK_LOG_client_1();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v29 = [(TKClientToken *)v8 tokenID];
              *(_DWORD *)buf = v33;
              v40 = v29;
              __int16 v41 = 1024;
              LODWORD(v42) = v9;
              _os_log_debug_impl(&dword_1BED55000, v24, OS_LOG_TYPE_DEBUG, "reconnecting connection to %{public}@, try %d", buf, 0x12u);
            }
            [(NSXPCConnection *)v8->_tokenConnection invalidate];
            tokenConnection = v8->_tokenConnection;
            v8->_tokenConnection = 0;

            if ((double)v9 * 0.1 <= 1.0) {
              double v26 = (double)v9 * 0.1;
            }
            else {
              double v26 = 1.0;
            }
            [MEMORY[0x1E4F29060] sleepForTimeInterval:v26];
            int v21 = 0;
            double v10 = v10 + v26;
            char v20 = 1;
          }
          else
          {
            char v20 = 0;
            int v21 = 1;
          }
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    v23 = TK_LOG_client_1();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v27 = [(TKClientToken *)v8 tokenID];
      uint64_t v28 = *((void *)v44 + 5);
      *(_DWORD *)buf = v33;
      v40 = v27;
      __int16 v41 = 2114;
      uint64_t v42 = v28;
      _os_log_error_impl(&dword_1BED55000, v23, OS_LOG_TYPE_ERROR, "Failed to send request to token %{public}@, error: %{public}@", buf, 0x16u);
    }
    if (!a3) {
      goto LABEL_22;
    }
    char v20 = 0;
    int v21 = 0;
    id v4 = 0;
    *a3 = *((id *)v44 + 5);
LABEL_23:

    _Block_object_dispose(v43, 8);
    ++v9;
    if ((v20 & 1) == 0)
    {
      if (!v21) {
        goto LABEL_37;
      }
      uint64_t v30 = TK_LOG_client_1();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v31 = [(TKClientToken *)v8 tokenID];
        -[TKExtensionClientToken withError:invoke:](v31, v43, v30);
      }

      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
        id v4 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      break;
    }
  }
  id v4 = 0;
LABEL_37:
  objc_sync_exit(v8);

  return v4;
}

void __43__TKExtensionClientToken_withError_invoke___block_invoke(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenConnection, 0);
  objc_storeStrong((id *)&self->_targetUID, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_storeStrong((id *)&self->_serverEndpoint, 0);
}

- (void)serverConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*a1) {
    id v5 = "external";
  }
  else {
    id v5 = "EP-provided";
  }
  uint64_t v6 = *(void *)(a2 + 80);
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (targetUID=%d)", objc_msgSend(*(id *)(a2 + 80), "integerValue"));
    id v3 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (const char *)[v3 UTF8String];
  }
  else
  {
    uint64_t v7 = "";
  }
  *(_DWORD *)buf = 136446466;
  int v9 = v5;
  __int16 v10 = 2082;
  long long v11 = v7;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "creating connection to %{public}s endpoint%{public}s", buf, 0x16u);
  if (v6) {
}
  }

- (void)withError:(void *)a3 getServerEndpoint:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138543362;
  *a3 = v4;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "get*Endpoint on token-client connection failed with connection error %{public}@", buf, 0xCu);
}

- (void)ensureConnectionWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1BED55000, a2, OS_LOG_TYPE_FAULT, "Unable to connect to tokenServer even after retries. (ep=%{public}@, uid=%@)", (uint8_t *)&v4, 0x16u);
}

- (void)ensureConnectionWithError:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "failed to connect to named ctkd port, aborting (probably system shutdown in progress)", buf, 2u);
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) tokenID];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "Failed to get connection for tokenID=%{public}@ (error %{public}@)", (uint8_t *)&v6, 0x16u);
}

- (void)withError:(os_log_t)log invoke:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1BED55000, log, OS_LOG_TYPE_FAULT, "Unable to connect to %{public}@ even after retries.", buf, 0xCu);
}

- (void)withError:(os_log_t)log invoke:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1BED55000, log, OS_LOG_TYPE_FAULT, "TKClientToken operation failed but did not fill any error, substituting TKErrorCodeCommunicationError", buf, 2u);
}

@end