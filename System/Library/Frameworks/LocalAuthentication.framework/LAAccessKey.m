@interface LAAccessKey
- (BOOL)isEqual:(id)a3;
- (LAACL)acl;
- (LAAccessKey)initWithACL:(id)a3;
- (LAAccessKey)initWithKey:(id)a3;
- (NSString)identifier;
- (id)initWithACL:(void *)a3 key:;
- (void)armInContext:(id)a3 completion:(id)a4;
- (void)armInContext:(id)a3 options:(id)a4 completion:(id)a5;
- (void)unlockKey:(id)a3 inContext:(id)a4 userInfo:(id)a5 completion:(id)a6;
@end

@implementation LAAccessKey

- (LAAccessKey)initWithACL:(id)a3
{
  id v4 = a3;
  v5 = +[LAKeyStoreItemBuilder buildNullKey];
  v6 = (LAAccessKey *)-[LAAccessKey initWithACL:key:]((id *)&self->super.isa, v4, v5);

  return v6;
}

- (id)initWithACL:(void *)a3 key:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)LAAccessKey;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      uint64_t v9 = [v7 identifier];
      id v10 = a1[2];
      a1[2] = (id)v9;

      objc_storeStrong(a1 + 1, a3);
    }
  }

  return a1;
}

- (LAAccessKey)initWithKey:(id)a3
{
  id v4 = a3;
  v5 = [LAACL alloc];
  id v6 = [v4 acl];
  id v7 = [(LAACL *)v5 initWithData:v6];
  v8 = (LAAccessKey *)-[LAAccessKey initWithACL:key:]((id *)&self->super.isa, v7, v4);

  return v8;
}

- (void)armInContext:(id)a3 completion:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = &unk_1F19EC6A0;
  v11[0] = MEMORY[0x1E4F1CC38];
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(LAAccessKey *)self armInContext:v8 options:v9 completion:v7];
}

- (void)armInContext:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (void)unlockKey:(id)a3 inContext:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__LAAccessKey_unlockKey_inContext_userInfo_completion___block_invoke;
  v13[3] = &unk_1E63C4078;
  id v14 = v9;
  id v15 = v10;
  id v11 = v9;
  id v12 = v10;
  [(LAAccessKey *)self armInContext:a4 completion:v13];
}

void __55__LAAccessKey_unlockKey_inContext_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kLAAccessKeyNonce"];

    uint64_t v5 = *(void *)(a1 + 40);
    if (v4)
    {
      id v7 = +[LAAuthorizationError missingImplementation];
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    }
    else
    {
      id v6 = *(void (**)(uint64_t, void))(v5 + 16);
      v6(v5, 0);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    id v6 = (NSString *)v5[2];
    BOOL v8 = 0;
    if (v6 == self->_identifier || -[NSString isEqualToString:](v6, "isEqualToString:"))
    {
      id v7 = (LAACL *)v5[3];
      if (v7 == self->_acl || -[LAACL isEqual:](v7, "isEqual:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (LAACL)acl
{
  return self->_acl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end