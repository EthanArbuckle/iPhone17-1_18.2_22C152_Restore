@interface TKTokenSession
+ (id)_localizedString:(id)a3 value:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)creatorAuditToken;
- (BOOL)checkOperation:(int64_t)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6;
- (LAContext)LAContext;
- (NSDictionary)parameters;
- (NSNumber)callerPID;
- (NSString)name;
- (NSXPCConnection)caller;
- (OS_dispatch_queue)queue;
- (TKToken)token;
- (TKTokenSession)initWithToken:(TKToken *)token;
- (id)delegate;
- (id)errorWithResult:(id)a3 operation:(id)a4 forError:(id)a5;
- (id)keepAlive;
- (void)attestKey:(id)a3 usingKey:(id)a4 nonce:(id)a5 reply:(id)a6;
- (void)beginAuthForOperation:(int64_t)a3 constraint:(id)a4 reply:(id)a5;
- (void)bumpKey:(id)a3 reply:(id)a4;
- (void)commitKey:(id)a3 reply:(id)a4;
- (void)createObjectWithAttributes:(id)a3 reply:(id)a4;
- (void)decapsulateSharedKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6;
- (void)decryptData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
- (void)deleteObject:(id)a3 reply:(id)a4;
- (void)evaluateAccessControl:(id)a3 forOperation:(id)a4 reply:(id)a5;
- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 reply:(id)a5;
- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 retry:(BOOL)a5 reply:(id)a6;
- (void)finalizeAuthOperation:(id)a3 evaluatedAuthOperation:(id)a4 reply:(id)a5;
- (void)getAdvertisedItemsWithReply:(id)a3;
- (void)getAttributesOfObject:(id)a3 isCertificate:(BOOL)a4 reply:(id)a5;
- (void)objectID:(id)a3 operation:(int64_t)a4 inputData:(id)a5 algorithms:(id)a6 parameters:(id)a7 reply:(id)a8;
- (void)performKeyExchangeWithPublicKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
- (void)setCaller:(id)a3;
- (void)setCallerPID:(id)a3;
- (void)setCreatorAuditToken:(id *)a3;
- (void)setDelegate:(id)delegate;
- (void)setKeepAlive:(id)a3;
- (void)setLAContext:(id)a3;
- (void)setParameters:(id)a3;
- (void)signData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6;
- (void)terminate;
@end

@implementation TKTokenSession

- (TKTokenSession)initWithToken:(TKToken *)token
{
  v5 = token;
  v14.receiver = self;
  v14.super_class = (Class)TKTokenSession;
  v6 = [(TKTokenSession *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, token);
    if ([(TKTokenSession *)v7 conformsToProtocol:&unk_1F1A01DA8]) {
      objc_storeWeak((id *)&v7->_delegate, v7);
    }
    v8 = NSString;
    v9 = [(TKToken *)v5 tokenID];
    id v10 = [v8 stringWithFormat:@"session:%@", v9];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

+ (id)_localizedString:(id)a3 value:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleWithIdentifier:@"com.apple.CryptoTokenKit"];
  v9 = [v8 localizedStringForKey:v7 value:v6 table:0];

  return v9;
}

- (void)setLAContext:(id)a3
{
}

- (void)setCaller:(id)a3
{
}

- (void)getAttributesOfObject:(id)a3 isCertificate:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  id v10 = [(TKTokenSession *)self privateDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TKTokenSession *)self privateDelegate];
    id v51 = 0;
    v13 = [v12 tokenSession:self attributesOfObject:v8 error:&v51];
    id v14 = v51;
    v15 = (void *)[v13 mutableCopy];

    if (v15)
    {
      if (v6) {
        +[TKTokenID encodedCertificateID:v8];
      }
      else {
      v36 = +[TKTokenID encodedKeyID:v8];
      }
      [v15 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F3B8B0]];

      uint64_t v37 = *MEMORY[0x1E4F3B548];
      v38 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v39 = SecAccessControlCopyData();

          [v15 setObject:v39 forKeyedSubscript:v37];
          v38 = (void *)v39;
        }
      }
    }
    v9[2](v9, v15, v14);
  }
  else
  {
    v41 = self;
    v42 = v9;
    id v16 = v8;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v17 = [(TKTokenSession *)self token];
    v18 = [v17 configuration];
    id v14 = [v18 keychainItems];

    uint64_t v19 = [v14 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(v14);
          }
          v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v6) {
              continue;
            }
          }
          v24 = [v23 objectID];
          int v25 = [v24 isEqual:v16];

          if (v25)
          {
            v35 = [v23 keychainAttributes];
            v9 = v42;
            v42[2](v42, v35, 0);

            id v8 = v16;
            goto LABEL_36;
          }
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v8 = v16;
    if (!v6)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v26 = [(TKTokenSession *)v41 token];
      v27 = [v26 configuration];
      id v14 = [v27 keychainItems];

      uint64_t v28 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v44;
        while (2)
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v14);
            }
            v32 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = [v32 objectID];
              int v34 = [v33 isEqual:v8];

              if (v34)
              {
                v40 = [v32 keychainAttributes];
                v9 = v42;
                v42[2](v42, v40, 0);

                goto LABEL_36;
              }
            }
          }
          uint64_t v29 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:0];
    v9 = v42;
    v42[2](v42, 0, v14);
  }
LABEL_36:
}

- (void)beginAuthForOperation:(int64_t)a3 constraint:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  id v10 = [(TKTokenSession *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TKTokenSession *)self delegate];
    id v16 = 0;
    v13 = [v12 tokenSession:self beginAuthForOperation:a3 constraint:v8 error:&v16];
    id v14 = v16;

    v9[2](v9, v13, v14);
  }
  else
  {
    v15 = TK_LOG_token_4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TKTokenSession beginAuthForOperation:constraint:reply:](self, (uint64_t)v8, v15);
    }

    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];
    v9[2](v9, 0, v13);
  }
}

- (BOOL)checkOperation:(int64_t)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(TKTokenSession *)self privateDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(TKTokenSession *)self privateDelegate];
    char v16 = [v15 tokenSession:self supportsOperation:a3 usingKey:v10 algorithm:v11 parameters:v12];
  }
  else
  {
    v17 = [(TKTokenSession *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
    {
      BOOL v19 = 0;
      goto LABEL_7;
    }
    v15 = [(TKTokenSession *)self delegate];
    char v16 = [v15 tokenSession:self supportsOperation:a3 usingKey:v10 algorithm:v11];
  }
  BOOL v19 = v16;

LABEL_7:
  return v19;
}

- (void)signData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  char v14 = [(TKTokenSession *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(TKTokenSession *)self delegate];
    id v22 = 0;
    v17 = [v16 tokenSession:self signData:v10 usingKey:v11 algorithm:v12 error:&v22];
    id v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    BOOL v19 = TK_LOG_token_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(TKTokenSession *)self token];
      uint64_t v21 = [v20 tokenID];
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1BED55000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement sign", buf, 0xCu);
    }
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v13[2](v13, 0, v17);
  }
}

- (void)decryptData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = (void (**)(id, void *, id))a7;
  v17 = [(TKTokenSession *)self privateDelegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    BOOL v19 = [(TKTokenSession *)self privateDelegate];
    uint64_t v29 = 0;
    uint64_t v20 = [v19 tokenSession:self decryptData:v12 usingKey:v13 algorithm:v14 parameters:v15 error:&v29];
    uint64_t v21 = v29;
LABEL_5:
    id v24 = v21;

    v16[2](v16, v20, v24);
    goto LABEL_9;
  }
  id v22 = [(TKTokenSession *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    BOOL v19 = [(TKTokenSession *)self delegate];
    uint64_t v28 = 0;
    uint64_t v20 = [v19 tokenSession:self decryptData:v12 usingKey:v13 algorithm:v14 error:&v28];
    uint64_t v21 = v28;
    goto LABEL_5;
  }
  uint64_t v25 = TK_LOG_token_4();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [(TKTokenSession *)self token];
    v27 = [v26 tokenID];
    *(_DWORD *)buf = 138543362;
    v31 = v27;
    _os_log_impl(&dword_1BED55000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decrypt", buf, 0xCu);
  }
  uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  v16[2](v16, 0, v20);
LABEL_9:
}

- (void)performKeyExchangeWithPublicKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = (void (**)(id, void *, id))a7;
  v17 = [(TKTokenSession *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    BOOL v19 = [(TKTokenSession *)self delegate];
    id v25 = 0;
    uint64_t v20 = [v19 tokenSession:self performKeyExchangeWithPublicKey:v12 usingKey:v13 algorithm:v14 parameters:v15 error:&v25];
    id v21 = v25;

    v16[2](v16, v20, v21);
  }
  else
  {
    id v22 = TK_LOG_token_4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      char v23 = [(TKTokenSession *)self token];
      id v24 = [v23 tokenID];
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1BED55000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key exchange", buf, 0xCu);
    }
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v16[2](v16, 0, v20);
  }
}

- (void)decapsulateSharedKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, id))a6;
  id v14 = [(TKTokenSession *)self privateDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(TKTokenSession *)self privateDelegate];
    id v22 = 0;
    v17 = [v16 tokenSession:self decapsulateSharedKey:v10 usingKey:v11 algorithm:v12 error:&v22];
    id v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    BOOL v19 = TK_LOG_token_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(TKTokenSession *)self token];
      id v21 = [v20 tokenID];
      *(_DWORD *)buf = 138543362;
      id v24 = v21;
      _os_log_impl(&dword_1BED55000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decapsulate", buf, 0xCu);
    }
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v13[2](v13, 0, v17);
  }
}

- (void)attestKey:(id)a3 usingKey:(id)a4 nonce:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, id))a6;
  id v14 = [(TKTokenSession *)self privateDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(TKTokenSession *)self privateDelegate];
    id v22 = 0;
    v17 = [v16 tokenSession:self attestKey:v10 usingKey:v11 nonce:v12 error:&v22];
    id v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    BOOL v19 = TK_LOG_token_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(TKTokenSession *)self token];
      id v21 = [v20 tokenID];
      *(_DWORD *)buf = 138543362;
      id v24 = v21;
      _os_log_impl(&dword_1BED55000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement attestation", buf, 0xCu);
    }
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v13[2](v13, 0, v17);
  }
}

- (void)bumpKey:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = [(TKTokenSession *)self privateDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TKTokenSession *)self privateDelegate];
    id v17 = 0;
    uint64_t v11 = [v10 tokenSession:self bumpKey:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    id v13 = TK_LOG_token_4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(TKTokenSession *)self token];
      char v15 = [v14 tokenID];
      *(_DWORD *)buf = 138543362;
      BOOL v19 = v15;
      _os_log_impl(&dword_1BED55000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key bumping", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)commitKey:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = [(TKTokenSession *)self privateDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TKTokenSession *)self privateDelegate];
    id v17 = 0;
    uint64_t v11 = [v10 tokenSession:self commitKey:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    id v13 = TK_LOG_token_4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(TKTokenSession *)self token];
      char v15 = [v14 tokenID];
      *(_DWORD *)buf = 138543362;
      BOOL v19 = v15;
      _os_log_impl(&dword_1BED55000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key committing", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)createObjectWithAttributes:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = [(TKTokenSession *)self privateDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TKTokenSession *)self privateDelegate];
    id v16 = 0;
    uint64_t v11 = [v10 tokenSession:self createObjectWithAttributes:v6 error:&v16];
    id v12 = v16;

    v7[2](v7, v11, v12);
  }
  else
  {
    id v13 = TK_LOG_token_4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(TKTokenSession *)self token];
      char v15 = [v14 tokenID];
      *(_DWORD *)buf = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_1BED55000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0, v11);
  }
}

- (void)deleteObject:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = [(TKTokenSession *)self privateDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TKTokenSession *)self privateDelegate];
    id v17 = 0;
    uint64_t v11 = [v10 tokenSession:self deleteObject:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    id v13 = TK_LOG_token_4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(TKTokenSession *)self token];
      char v15 = [v14 tokenID];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1BED55000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 reply:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)[v10 baseClassForUI]);
  id v12 = v11;
  if (v11)
  {
    [v11 importOperation:v10];

    char v23 = &unk_1F19F8258;
    v24[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v10 = (id)[v13 mutableCopy];

    id v14 = [(TKTokenSession *)self callerPID];

    if (v14)
    {
      char v15 = [(TKTokenSession *)self callerPID];
      [v10 setObject:v15 forKeyedSubscript:&unk_1F19F8270];
    }
    if (a4 == 1)
    {
      uint64_t v16 = @"READ_DATA";
      id v17 = @"read data";
    }
    else if (a4 == 2)
    {
      uint64_t v16 = @"SIGN_DATA";
      id v17 = @"sign data";
    }
    else
    {
      if ((unint64_t)(a4 - 3) > 1)
      {
LABEL_12:
        uint64_t v19 = [(TKTokenSession *)self LAContext];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke;
        v20[3] = &unk_1E63C8F90;
        id v21 = v9;
        SEL v22 = a2;
        v20[4] = self;
        [v19 evaluatePolicy:1009 options:v10 reply:v20];

        goto LABEL_13;
      }
      uint64_t v16 = @"DECRYPT_DATA";
      id v17 = @"decrypt data";
    }
    id v18 = +[TKTokenSession _localizedString:v16 value:v17];
    [v10 setObject:v18 forKeyedSubscript:&unk_1F19F8288];

    goto LABEL_12;
  }
  (*((void (**)(id, id, void))v9 + 2))(v9, v10, 0);
LABEL_13:
}

void __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 objectForKeyedSubscript:&unk_1F19F82A0];
    if (!v5)
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a1[6] object:a1[4] file:@"TKTokenSession.m" lineNumber:366 description:@"LAPolicyTokenAuthentication did not fill in LAResultTKAuthOperation"];
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(a1[5] + 16);
    v3();
  }
}

- (void)finalizeAuthOperation:(id)a3 evaluatedAuthOperation:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  [v8 importOperation:a4];
  id v17 = 0;
  uint64_t v10 = [v8 finishWithError:&v17];
  id v11 = v17;
  id v12 = [(TKTokenSession *)self caller];
  id v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  [(TKTokenSession *)self auditAuthOperation:v8 auditToken:&v15 success:v10];

  if (v10)
  {
    v9[2](v9, 1, 0);
  }
  else
  {
    if (!v11)
    {
      id v14 = TK_LOG_token_4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[TKTokenSession finalizeAuthOperation:evaluatedAuthOperation:reply:](v14);
      }

      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
    }
    objc_msgSend(v8, "setAuthenticationError:", v11, v15, v16);
    ((void (**)(id, uint64_t, id))v9)[2](v9, 0, v11);
  }
}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 retry:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke;
  v14[3] = &unk_1E63C8FE0;
  v14[4] = self;
  id v15 = v10;
  BOOL v18 = a5;
  id v16 = v11;
  int64_t v17 = a4;
  id v12 = v10;
  id v13 = v11;
  [(TKTokenSession *)self evaluateAuthOperation:v12 tokenOperation:a4 reply:v14];
}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2;
    v12[3] = &unk_1E63C8FB8;
    char v16 = *(unsigned char *)(a1 + 64);
    v12[4] = v6;
    id v8 = v7;
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v13 = v8;
    uint64_t v15 = v9;
    id v14 = v10;
    [v6 finalizeAuthOperation:v8 evaluatedAuthOperation:a2 reply:v12];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) queue];
    dispatch_resume(v11);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (!*(unsigned char *)(a1 + 64) || (a2 & 1) != 0) {
    goto LABEL_9;
  }
  id v6 = [v5 domain];
  if (([v6 isEqual:@"CryptoTokenKit"] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v7 = [v12 code];

  if (v7 != -5)
  {
LABEL_9:
    id v11 = [*(id *)(a1 + 32) queue];
    dispatch_resume(v11);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  id v8 = [v12 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"userSecretTriesLeft"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 integerValue];

    if (v10 < 1) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) evaluateAuthOperation:*(void *)(a1 + 40) tokenOperation:*(void *)(a1 + 56) retry:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
LABEL_10:
}

- (void)evaluateAccessControl:(id)a3 forOperation:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v23 = 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[TKTokenKeychainItem operationMap];
  id v12 = [v11 objectForKey:v9];
  uint64_t v13 = [v12 integerValue];

  id v14 = (void *)SecAccessControlCreateFromData();
  uint64_t v15 = SecAccessControlGetConstraint();

  if (v15 && ![v15 isEqual:MEMORY[0x1E4F1CC28]])
  {
    if ([v15 isEqual:MEMORY[0x1E4F1CC38]])
    {
      v8[2](v8, 1, 0);
      goto LABEL_4;
    }
    int64_t v17 = [(TKTokenSession *)self LAContext];

    if (v17)
    {
      BOOL v18 = [(TKTokenSession *)self queue];
      dispatch_suspend(v18);

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke;
      v20[3] = &unk_1E63C9008;
      v20[4] = self;
      id v21 = v8;
      uint64_t v22 = v13;
      [(TKTokenSession *)self beginAuthForOperation:v13 constraint:v15 reply:v20];

      goto LABEL_4;
    }
    uint64_t v19 = TK_LOG_token_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[TKTokenSession evaluateAccessControl:forOperation:reply:](v19);
    }
  }
  char v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v16);

LABEL_4:
}

void __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [*(id *)(a1 + 32) LAContext];
    uint64_t v7 = [v6 isCredentialSet:-3] ^ 1;

    [*(id *)(a1 + 32) evaluateAuthOperation:v9 tokenOperation:*(void *)(a1 + 48) retry:v7 reply:*(void *)(a1 + 40)];
  }
  else
  {
    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
    }
    id v8 = [*(id *)(a1 + 32) queue];
    dispatch_resume(v8);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)errorWithResult:(id)a3 operation:(id)a4 forError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!a3)
  {
    id v10 = [v8 domain];
    if ([v10 isEqualToString:@"CryptoTokenKit"] && objc_msgSend(v9, "code") == -9)
    {
      id v11 = [v9 userInfo];
      id v12 = [v11 objectForKeyedSubscript:@"operation"];

      if (v12) {
        goto LABEL_7;
      }
      uint64_t v13 = [v9 userInfo];
      id v10 = (void *)[v13 mutableCopy];

      [v10 setObject:v7 forKeyedSubscript:@"operation"];
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = (void *)[v10 copy];
      uint64_t v16 = [v14 errorWithDomain:@"CryptoTokenKit" code:-9 userInfo:v15];

      id v9 = (void *)v16;
    }
  }
LABEL_7:

  return v9;
}

- (void)objectID:(id)a3 operation:(int64_t)a4 inputData:(id)a5 algorithms:(id)a6 parameters:(id)a7 reply:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  BOOL v18 = (void (**)(id, void *, void))a8;
  id v19 = a6;
  uint64_t v20 = [[TKTokenKeyAlgorithm alloc] initWithAlgorithmsArray:v19];

  if (![(TKTokenSession *)self checkOperation:a4 usingKey:v15 algorithm:v20 parameters:v17])
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
    v18[2](v18, v26, 0);

    goto LABEL_23;
  }
  if (!v16)
  {
    v18[2](v18, (void *)MEMORY[0x1E4F1CC38], 0);
    goto LABEL_23;
  }
  if (a4 > 999)
  {
    switch(a4)
    {
      case 1000:
        id v21 = [(TKTokenSession *)self token];
        uint64_t v22 = [v21 tokenID];
        id v39 = 0;
        id v23 = [v22 decodedKeyID:v16 error:&v39];
        id v24 = v39;

        if (v23)
        {
          uint64_t v25 = [v17 objectForKeyedSubscript:@"nonce"];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5;
          v37[3] = &unk_1E63C9030;
          v37[4] = self;
          v38 = v18;
          [(TKTokenSession *)self attestKey:v23 usingKey:v15 nonce:v25 reply:v37];
        }
        else
        {
          ((void (**)(id, void *, id))v18)[2](v18, 0, v24);
        }

        goto LABEL_22;
      case 1001:
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6;
        v35[3] = &unk_1E63C9058;
        v35[4] = self;
        v36 = v18;
        [(TKTokenSession *)self bumpKey:v15 reply:v35];
        uint64_t v28 = v36;
        goto LABEL_18;
      case 1002:
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7;
        v33[3] = &unk_1E63C9058;
        v33[4] = self;
        int v34 = v18;
        [(TKTokenSession *)self commitKey:v15 reply:v33];
        uint64_t v28 = v34;
        goto LABEL_18;
      case 1003:
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4;
        v40[3] = &unk_1E63C9030;
        v40[4] = self;
        v41 = v18;
        [(TKTokenSession *)self decapsulateSharedKey:v16 usingKey:v15 algorithm:v20 reply:v40];
        uint64_t v28 = v41;
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
  switch(a4)
  {
    case 2:
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke;
      v46[3] = &unk_1E63C9030;
      v46[4] = self;
      long long v47 = v18;
      [(TKTokenSession *)self signData:v16 usingKey:v15 algorithm:v20 reply:v46];
      uint64_t v28 = v47;
LABEL_18:

      break;
    case 3:
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2;
      v44[3] = &unk_1E63C9030;
      v44[4] = self;
      long long v45 = v18;
      [(TKTokenSession *)self decryptData:v16 usingKey:v15 algorithm:v20 parameters:v17 reply:v44];
      uint64_t v28 = v45;
      goto LABEL_18;
    case 4:
      v27 = [[TKTokenKeyExchangeParameters alloc] initWithParameters:v17];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3;
      v42[3] = &unk_1E63C9030;
      v42[4] = self;
      long long v43 = v18;
      [(TKTokenSession *)self performKeyExchangeWithPublicKey:v16 usingKey:v15 algorithm:v20 parameters:v27 reply:v42];

      break;
    default:
LABEL_19:
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v29 = [(TKTokenSession *)self token];
      uint64_t v30 = [v29 tokenID];
      int64_t v31 = a4;
      id v24 = v32;
      [v32 handleFailureInMethod:a2, self, @"TKTokenSession.m", 534, @"invalid objectOperation %d on token %@", v31, v30 object file lineNumber description];

LABEL_22:
      break;
  }
LABEL_23:
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorWithResult:v6 operation:@"osgn" forError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorWithResult:v6 operation:@"od" forError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorWithResult:v6 operation:@"ock" forError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorWithResult:v6 operation:@"okd" forError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorWithResult:v6 operation:@"oa" forError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) errorWithResult:v5 operation:@"oko" forError:v8];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) errorWithResult:v5 operation:@"oko" forError:v8];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);
}

- (void)getAdvertisedItemsWithReply:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(TKTokenSession *)self token];
  id v7 = [v6 configuration];
  id v8 = [v7 keychainItems];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) keychainAttributes];
        [v5 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v4[2](v4, v5);
}

- (void)terminate
{
  v3 = [(TKTokenSession *)self token];
  uint64_t v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(TKTokenSession *)self token];
    uint64_t v6 = [v8 delegate];
    id v7 = [(TKTokenSession *)self token];
    [v6 token:v7 terminateSession:self];
  }
}

- (NSString)name
{
  return 0;
}

- (TKToken)token
{
  return (TKToken *)objc_getProperty(self, a2, 8, 1);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)creatorAuditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setCreatorAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_creatorAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_creatorAuditToken.val = v3;
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (NSNumber)callerPID
{
  return self->_callerPID;
}

- (void)setCallerPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerPID, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)beginAuthForOperation:(void *)a1 constraint:(uint64_t)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 token];
  uint64_t v6 = [v5 tokenID];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "%{public}@: does not support auth, failing constraint '%{public}@'", (uint8_t *)&v7, 0x16u);
}

- (void)finalizeAuthOperation:(os_log_t)log evaluatedAuthOperation:reply:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BED55000, log, OS_LOG_TYPE_FAULT, "finishWithError: failed but did not fill an error", v1, 2u);
}

- (void)evaluateAccessControl:(os_log_t)log forOperation:reply:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BED55000, log, OS_LOG_TYPE_FAULT, "Failing attempt to evaluate ACC without LAContext set", v1, 2u);
}

@end