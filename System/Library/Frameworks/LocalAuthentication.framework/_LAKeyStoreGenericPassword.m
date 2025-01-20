@interface _LAKeyStoreGenericPassword
+ (id)buildWithDictionary:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (_LAKeyStoreGenericPasswordCryptor)cryptor;
- (id)initWithIdentifier:(void *)a3 publicKeyHash:(void *)a4 wrappedData:;
- (void)fetchDataWithContext:(id)a3 completion:(id)a4;
- (void)setCryptor:(id)a3;
@end

@implementation _LAKeyStoreGenericPassword

+ (id)buildWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B788];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
  if (v7
    && (v8 = (void *)v7,
        [v5 objectForKeyedSubscript:v6],
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v10 = objc_opt_isKindOfClass(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = [v5 objectForKeyedSubscript:v6];
    uint64_t v12 = *MEMORY[0x1E4F3B688];
    uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B688]];
    if (v13
      && (v14 = (void *)v13,
          [v5 objectForKeyedSubscript:v12],
          v15 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v16 = objc_opt_isKindOfClass(),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = [v5 objectForKeyedSubscript:v12];
      uint64_t v18 = *MEMORY[0x1E4F3BD38];
      uint64_t v19 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
      if (v19
        && (v20 = (void *)v19,
            [v5 objectForKeyedSubscript:v18],
            v21 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v21,
            v20,
            (isKindOfClass & 1) != 0))
      {
        v23 = [v5 objectForKeyedSubscript:v18];
        v24 = -[_LAKeyStoreGenericPassword initWithIdentifier:publicKeyHash:wrappedData:]((id *)[_LAKeyStoreGenericPassword alloc], v11, v17, v23);
      }
      else
      {
        v27 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'r_Data'"];

        v24 = 0;
        if (a4 && v27)
        {
          +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'r_Data'"];
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      v26 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'gena'"];

      v24 = 0;
      if (a4 && v26)
      {
        +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'gena'"];
        v24 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v25 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'labl'"];

    v24 = 0;
    if (a4 && v25)
    {
      +[LAAuthorizationError genericErrorWithMessage:@"Failed to build 'genp' due to missing 'labl'"];
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v24;
}

- (id)initWithIdentifier:(void *)a3 publicKeyHash:(void *)a4 wrappedData:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_LAKeyStoreGenericPassword;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 2, a4);
    }
  }

  return a1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)fetchDataWithContext:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cryptor);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_cryptor);
    [v8 decryptData:self->_wrappedData publicKeyHash:self->_publicKeyHash context:v9 completion:v6];
  }
  else
  {
    id v8 = +[LAAuthorizationError genericErrorWithMessage:@"Could not load secret"];
    v6[2](v6, 0, v8);
  }
}

- (_LAKeyStoreGenericPasswordCryptor)cryptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cryptor);

  return (_LAKeyStoreGenericPasswordCryptor *)WeakRetained;
}

- (void)setCryptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cryptor);
  objc_storeStrong((id *)&self->_wrapperKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_wrappedData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end