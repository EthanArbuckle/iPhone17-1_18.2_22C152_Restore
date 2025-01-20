@interface _LAKeyStore
- (_LAKeyStore)init;
- (void)decryptData:(id)a3 publicKeyHash:(id)a4 context:(id)a5 completion:(id)a6;
- (void)encryptData:(id)a3 publicKeyHash:(id)a4 completion:(id)a5;
- (void)fetchGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)fetchGenericPasswordsWithDomain:(id)a3 completion:(id)a4;
- (void)fetchItemsWithDomain:(id)a3 completion:(id)a4;
- (void)fetchKeyWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)fetchKeyWithPublicKeyHash:(id)a3 completion:(id)a4;
- (void)fetchKeysWithDomain:(id)a3 completion:(id)a4;
- (void)removeGenericPasswordsWithDomain:(id)a3 completion:(id)a4;
- (void)removeItemsWithCompletion:(id)a3;
- (void)removeItemsWithDomain:(id)a3 completion:(id)a4;
- (void)removeKeysWithDomain:(id)a3 completion:(id)a4;
- (void)storeGenericPassword:(id)a3 identifier:(id)a4 domain:(id)a5 protectedBy:(id)a6 completion:(id)a7;
- (void)storeKeyWithIdentifier:(id)a3 domain:(id)a4 protectedBy:(id)a5 completion:(id)a6;
@end

@implementation _LAKeyStore

- (_LAKeyStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)_LAKeyStore;
  v2 = [(_LAKeyStore *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[LAKeyStoreBackendBuilder buildBackend];
    backend = v2->_backend;
    v2->_backend = (LAKeyStoreBackend *)v3;

    v5 = objc_alloc_init(LAKeyStoreSecretCoder);
    coder = v2->_coder;
    v2->_coder = v5;
  }
  return v2;
}

- (void)storeKeyWithIdentifier:(id)a3 domain:(id)a4 protectedBy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68___LAKeyStore_storeKeyWithIdentifier_domain_protectedBy_completion___block_invoke;
  v18[3] = &unk_1E63C4478;
  objc_copyWeak(&v24, &location);
  id v14 = v13;
  id v23 = v14;
  id v15 = v10;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  v22 = self;
  [(_LAKeyStore *)self fetchKeyWithIdentifier:v15 domain:v16 completion:v18];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)fetchKeysWithDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  objc_super v8 = objc_opt_new();
  v9 = [v8 fetchQueryForKeysWithDomain:v6];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  backend = self->_backend;
  id obj = 0;
  id v11 = [(LAKeyStoreBackend *)backend fetchItemsWithQuery:v9 error:&obj];
  objc_storeStrong(&v24, obj);
  if (v20[5])
  {
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }
  else
  {
    id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46___LAKeyStore_fetchKeysWithDomain_completion___block_invoke;
    v15[3] = &unk_1E63C44A0;
    id v17 = &v19;
    id v12 = v13;
    id v16 = v12;
    [v11 enumerateObjectsUsingBlock:v15];
    if (v20[5]) {
      id v14 = 0;
    }
    else {
      id v14 = v12;
    }
    ((void (*)(void (**)(id, void, id), id))v7[2])(v7, v14);
  }
  _Block_object_dispose(&v19, 8);
}

- (void)fetchKeyWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  objc_super v8 = (void (**)(id, void, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [v11 fetchQueryForKeyWithIdentifier:v10 domain:v9];

  backend = self->_backend;
  id v19 = 0;
  id v14 = [(LAKeyStoreBackend *)backend fetchItemWithQuery:v12 error:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = v15;
    id v17 = +[LAAuthorizationError resourceNotFoundWithUnderylingError:v15];
    v8[2](v8, 0, v17);
  }
  else
  {
    id v18 = 0;
    id v17 = +[_LAKeyStoreKey buildWithDictionary:v14 error:&v18];
    id v16 = v18;
    ((void (**)(id, void *, void *))v8)[2](v8, v17, v16);
  }
}

- (void)fetchKeyWithPublicKeyHash:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  id v9 = [v8 fetchQueryForKeyWithPublicKeyHash:v7];

  backend = self->_backend;
  id v16 = 0;
  id v11 = [(LAKeyStoreBackend *)backend fetchItemWithQuery:v9 error:&v16];
  id v12 = v16;
  if (v12)
  {
    id v13 = v12;
    id v14 = +[LAAuthorizationError resourceNotFoundWithUnderylingError:v12];
    v6[2](v6, 0, v14);
  }
  else
  {
    id v15 = 0;
    id v14 = +[_LAKeyStoreKey buildWithDictionary:v11 error:&v15];
    id v13 = v15;
    ((void (**)(id, void *, void *))v6)[2](v6, v14, v13);
  }
}

- (void)removeKeysWithDomain:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  id v9 = [v8 removeQueryForKeysWithDomain:v7];

  backend = self->_backend;
  id v12 = 0;
  [(LAKeyStoreBackend *)backend removeItemsWithQuery:v9 error:&v12];
  id v11 = v12;
  v6[2](v6, v11);
}

- (void)storeGenericPassword:(id)a3 identifier:(id)a4 domain:(id)a5 protectedBy:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77___LAKeyStore_storeGenericPassword_identifier_domain_protectedBy_completion___block_invoke;
  v21[3] = &unk_1E63C44C8;
  objc_copyWeak(&v26, &location);
  id v17 = v16;
  id v25 = v17;
  id v18 = v13;
  id v22 = v18;
  id v19 = v14;
  id v23 = v19;
  id v20 = v15;
  id v24 = v20;
  [(_LAKeyStore *)self encryptData:v12 publicKeyHash:v20 completion:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)fetchGenericPasswordsWithDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  objc_super v8 = objc_opt_new();
  id v9 = [v8 fetchQueryForGenericPasswordsWithDomain:v6];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  backend = self->_backend;
  id obj = 0;
  id v11 = [(LAKeyStoreBackend *)backend fetchItemsWithQuery:v9 error:&obj];
  objc_storeStrong(&v24, obj);
  if (v20[5])
  {
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }
  else
  {
    id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58___LAKeyStore_fetchGenericPasswordsWithDomain_completion___block_invoke;
    v15[3] = &unk_1E63C44F0;
    id v17 = &v19;
    void v15[4] = self;
    id v12 = v13;
    id v16 = v12;
    [v11 enumerateObjectsUsingBlock:v15];
    if (v20[5]) {
      id v14 = 0;
    }
    else {
      id v14 = v12;
    }
    ((void (*)(void (**)(id, void, id), id))v7[2])(v7, v14);
  }
  _Block_object_dispose(&v19, 8);
}

- (void)fetchGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  objc_super v8 = (void (**)(id, void, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [v11 fetchQueryForGenericPasswordWithIdentifier:v10 domain:v9];

  backend = self->_backend;
  id v19 = 0;
  id v14 = [(LAKeyStoreBackend *)backend fetchItemWithQuery:v12 error:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = v15;
    id v17 = +[LAAuthorizationError resourceNotFoundWithUnderylingError:v15];
    v8[2](v8, 0, v17);
  }
  else
  {
    id v18 = 0;
    id v17 = +[_LAKeyStoreGenericPassword buildWithDictionary:v14 error:&v18];
    id v16 = v18;
    [v17 setCryptor:self];
    ((void (**)(id, void *, void *))v8)[2](v8, v17, v16);
  }
}

- (void)removeGenericPasswordsWithDomain:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  id v9 = [v8 removeQueryForGenericPasswordsWithDomain:v7];

  backend = self->_backend;
  id v12 = 0;
  [(LAKeyStoreBackend *)backend removeItemsWithQuery:v9 error:&v12];
  id v11 = v12;
  v6[2](v6, v11);
}

- (void)fetchItemsWithDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke;
  v12[3] = &unk_1E63C4540;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v13 = v10;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  [(_LAKeyStore *)self fetchGenericPasswordsWithDomain:v11 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)removeItemsWithDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke;
  v12[3] = &unk_1E63C4590;
  id v9 = v8;
  id v13 = v9;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  [(_LAKeyStore *)self removeGenericPasswordsWithDomain:v10 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)removeItemsWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v6 = objc_alloc_init(LAKeyStoreBackendQueryBuilder);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(LAKeyStoreBackendQueryBuilder *)v6 removeQueryForKeys];
  v23[0] = v7;
  objc_super v8 = [(LAKeyStoreBackendQueryBuilder *)v6 removeQueryForGenericPasswords];
  v23[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        backend = self->_backend;
        id v18 = 0;
        [(LAKeyStoreBackend *)backend removeItemsWithQuery:v14 error:&v18];
        id v16 = v18;
        if (v16) {
          [v5 addObject:v16];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v5 count])
  {
    id v17 = [MEMORY[0x1E4F30B90] errorWithCode:-1008 withUnderlyingErrors:v5];
    v4[2](v4, v17);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)encryptData:(id)a3 publicKeyHash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke;
  v13[3] = &unk_1E63C4608;
  objc_copyWeak(&v16, &location);
  id v11 = v10;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [(_LAKeyStore *)self fetchKeyWithPublicKeyHash:v9 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)decryptData:(id)a3 publicKeyHash:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke;
  v17[3] = &unk_1E63C4658;
  objc_copyWeak(&v21, &location);
  id v14 = v13;
  id v20 = v14;
  id v15 = v10;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [(_LAKeyStore *)self fetchKeyWithPublicKeyHash:v11 completion:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coder, 0);

  objc_storeStrong((id *)&self->_backend, 0);
}

@end