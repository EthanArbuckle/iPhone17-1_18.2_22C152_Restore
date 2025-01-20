@interface CNAccessAuthorization
+ (BOOL)canSetContactProperty:(id)a3;
+ (id)allAuthorizationKeys;
+ (id)allAuthorizationKeysVector;
+ (id)new;
+ (id)unauthorizedKeysVectorWithAuthorizer:(id)a3;
+ (id)unauthorizedKeysWithAuthorizer:(id)a3;
+ (void)removeUnavailableKeysFromContactKeyVector:(id)a3;
- (BOOL)authorizeFetchRequest:(id)a3 accessError:(id *)a4;
- (CNAccessAuthorization)init;
- (CNAccessAuthorization)initWithAuditToken:(id)a3;
- (CNAccessAuthorization)initWithAuditToken:(id)a3 assumedIdentity:(id)a4;
- (CNAccessAuthorization)initWithAuthorizer:(id)a3;
- (CNAuthorizationContext)authorizer;
- (id)authorizedKeysForContactKeys:(id)a3;
- (id)unauthorizedKeysVector;
- (void)performWork:(id)a3 authorizingFetchRequest:(id)a4 failureHandler:(id)a5;
- (void)resetUnauthorizedKeysForFetchRequest:(id)a3;
@end

@implementation CNAccessAuthorization

+ (id)allAuthorizationKeysVector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CNAccessAuthorization_allAuthorizationKeysVector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allAuthorizationKeysVector_cn_once_token_0 != -1) {
    dispatch_once(&allAuthorizationKeysVector_cn_once_token_0, block);
  }
  v2 = (void *)allAuthorizationKeysVector_cn_once_object_0;

  return v2;
}

+ (void)removeUnavailableKeysFromContactKeyVector:(id)a3
{
  id v7 = a3;
  v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v5 = [v4 authorizationContext];
  v6 = [a1 unauthorizedKeysVectorWithAuthorizer:v5];

  if (v6) {
    [v7 minusKeyVector:v6];
  }
}

+ (id)unauthorizedKeysVectorWithAuthorizer:(id)a3
{
  v3 = [a1 unauthorizedKeysWithAuthorizer:a3];
  v4 = +[CNContactKeyVector keyVectorWithKeys:v3];

  v5 = +[CNContactKeyVector keyVector];
  char v6 = [v4 isEqualToKeyVector:v5];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }

  return v7;
}

+ (id)unauthorizedKeysWithAuthorizer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([v3 isNotesAccessGranted] & 1) == 0) {
    [v4 addObject:@"note"];
  }
  if (([v3 isAddressingGrammarAccessGranted] & 1) == 0) {
    [v4 addObject:@"addressingGrammars"];
  }

  return v4;
}

void __51__CNAccessAuthorization_allAuthorizationKeysVector__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allAuthorizationKeys];
  v1 = +[CNContactKeyVector keyVectorWithKeys:v4];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)allAuthorizationKeysVector_cn_once_object_0;
  allAuthorizationKeysVector_cn_once_object_0 = v2;
}

+ (id)allAuthorizationKeys
{
  if (allAuthorizationKeys_cn_once_token_1 != -1) {
    dispatch_once(&allAuthorizationKeys_cn_once_token_1, &__block_literal_global_74);
  }
  uint64_t v2 = (void *)allAuthorizationKeys_cn_once_object_1;

  return v2;
}

- (CNAccessAuthorization)initWithAuditToken:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F5A350];
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithAuditToken:v5 assumedIdentity:0];

  id v7 = [(CNAccessAuthorization *)self initWithAuthorizer:v6];
  return v7;
}

- (CNAccessAuthorization)initWithAuthorizer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAccessAuthorization;
  char v6 = [(CNAccessAuthorization *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizer, a3);
    v8 = v7;
  }

  return v7;
}

- (void)performWork:(id)a3 authorizingFetchRequest:(id)a4 failureHandler:(id)a5
{
  v8 = (void (**)(void))a3;
  v9 = (void (**)(id, id))a5;
  id v11 = 0;
  LODWORD(self) = [(CNAccessAuthorization *)self authorizeFetchRequest:a4 accessError:&v11];
  id v10 = v11;
  if (self) {
    v8[2](v8);
  }
  else {
    v9[2](v9, v10);
  }
}

- (BOOL)authorizeFetchRequest:(id)a3 accessError:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  -[CNAccessAuthorization resetUnauthorizedKeysForFetchRequest:](self, "resetUnauthorizedKeysForFetchRequest:");
  id v5 = [(CNAccessAuthorization *)self unauthorizedKeysVector];
  if (v5)
  {
    objc_opt_class();
    id v6 = v36;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    id v33 = v6;

    v35 = v8;
    if (v8)
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__19;
      v61 = __Block_byref_object_dispose__19;
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      char v56 = 1;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v9 = [v8 keysToFetch];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v66 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (_CNIsObject_CNKeyDescriptorPrivate(v13))
            {
              char v14 = objc_opt_respondsToSelector();
              uint64_t v43 = 0;
              v44 = &v43;
              uint64_t v45 = 0x3032000000;
              v46 = __Block_byref_object_copy__19;
              v47 = __Block_byref_object_dispose__19;
              v48 = objc_alloc_init(CNMutableContactKeyVector);
              v15 = objc_msgSend(v13, "_cn_requiredKeys");
              int v16 = [v15 intersectsKeyVector:v5];

              if (v16)
              {
                v17 = (void *)v44[5];
                v18 = objc_msgSend(v13, "_cn_requiredKeys");
                [v17 unionKeyVector:v18];

                [(id)v44[5] intersectKeyVector:v5];
                if ((v14 & 1) == 0) {
                  *((unsigned char *)v54 + 24) = 0;
                }
              }
              v19 = objc_msgSend(v13, "_cn_optionalKeys", v33);
              v20 = +[CNContactKeyVector keyVector];
              char v21 = [v19 isEqualToKeyVector:v20];

              if ((v21 & 1) == 0)
              {
                v38[0] = MEMORY[0x1E4F143A8];
                v38[1] = 3221225472;
                v38[2] = __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke;
                v38[3] = &unk_1E56B7290;
                id v39 = v5;
                v40 = &v43;
                BOOL v42 = (v14 & 1) == 0;
                v41 = &v53;
                objc_msgSend(v13, "_cn_executeGetterForRepresentedKeys:", v38);
              }
              v22 = (void *)v44[5];
              if (v14)
              {
                v23 = +[CNContactKeyVector keyVector];
                char v24 = [v22 isEqualToKeyVector:v23];

                if ((v24 & 1) == 0)
                {
                  v25 = (void *)[(id)v44[5] copy];
                  objc_msgSend(v13, "_cn_setUnauthorizedKeys:", v25);
                }
              }
              else
              {
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke_2;
                v37[3] = &unk_1E56B72B8;
                v37[4] = &v57;
                [v22 enumeratePropertiesUsingBlock:v37];
              }
              _Block_object_dispose(&v43, 8);
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v66 count:16];
        }
        while (v10);
      }

      int v26 = *((unsigned __int8 *)v54 + 24);
      BOOL v27 = *((unsigned char *)v54 + 24) != 0;
      v65[0] = v58[5];
      v64[0] = @"CNKeyPaths";
      v64[1] = @"CNInvalidRecords";
      id v63 = v33;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      v65[1] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
      v30 = +[CNErrorFactory errorWithCode:102 userInfo:v29];
      v31 = v30;
      if (a4 && !v26) {
        *a4 = v30;
      }

      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (id)unauthorizedKeysVector
{
  id v3 = objc_opt_class();
  id v4 = [(CNAccessAuthorization *)self authorizer];
  id v5 = [v3 unauthorizedKeysVectorWithAuthorizer:v4];

  return v5;
}

- (CNAuthorizationContext)authorizer
{
  return self->_authorizer;
}

- (void)resetUnauthorizedKeysForFetchRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = objc_msgSend(v6, "keysToFetch", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v12, "_cn_setUnauthorizedKeys:", 0);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

void __45__CNAccessAuthorization_allAuthorizationKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"note";
  v3[1] = @"addressingGrammars";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)allAuthorizationKeys_cn_once_object_1;
  allAuthorizationKeys_cn_once_object_1 = v1;
}

- (CNAccessAuthorization)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)new
{
  id v2 = a1;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNAccessAuthorization)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F5A350];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithAuditToken:v8 assumedIdentity:v7];

  uint64_t v10 = [(CNAccessAuthorization *)self initWithAuthorizer:v9];
  return v10;
}

uint64_t __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CNContactKeyVector keyVectorWithKey:v3];
  int v5 = [v4 intersectsKeyVector:*(void *)(a1 + 32)];

  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addKey:v3];
    if (*(unsigned char *)(a1 + 56)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }

  return 0;
}

void __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

- (id)authorizedKeysForContactKeys:(id)a3
{
  id v4 = a3;
  int v5 = [(CNAccessAuthorization *)self unauthorizedKeysVector];
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__CNAccessAuthorization_authorizedKeysForContactKeys___block_invoke;
    v9[3] = &unk_1E56B72E0;
    id v10 = v5;
    objc_msgSend(v4, "_cn_filter:", v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

uint64_t __54__CNAccessAuthorization_authorizedKeysForContactKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    id v4 = objc_msgSend(v3, "_cn_requiredKeys");
    uint64_t v5 = [v4 intersectsKeyVector:*(void *)(a1 + 32)] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

+ (BOOL)canSetContactProperty:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5A3D8];
  id v5 = a3;
  uint64_t v6 = [v4 currentEnvironment];
  id v7 = [(id)v6 authorizationContext];
  id v8 = [a1 unauthorizedKeysWithAuthorizer:v7];

  LOBYTE(v6) = [v8 containsObject:v5];
  return v6 ^ 1;
}

- (void).cxx_destruct
{
}

@end