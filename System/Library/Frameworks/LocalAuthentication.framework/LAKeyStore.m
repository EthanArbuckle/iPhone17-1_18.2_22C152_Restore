@interface LAKeyStore
@end

@implementation LAKeyStore

void __68___LAKeyStore_storeKeyWithIdentifier_domain_protectedBy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 64);
      v6 = [NSString stringWithFormat:@"Key with identifier '%@' is already present", *(void *)(a1 + 32)];
      v7 = +[LAAuthorizationError genericErrorWithMessage:v6];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v7);
    }
    else
    {
      v8 = objc_opt_new();
      v9 = [v8 createQueryForKeyWithIdentifier:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) acl:*(void *)(a1 + 48)];

      v10 = (void *)WeakRetained[1];
      id v12 = 0;
      [v10 createKeyWithQuery:v9 error:&v12];
      id v11 = v12;
      if (v11) {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else {
        [*(id *)(a1 + 56) fetchKeyWithIdentifier:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void __46___LAKeyStore_fetchKeysWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  v7 = +[_LAKeyStoreKey buildWithDictionary:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
  else {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __77___LAKeyStore_storeGenericPassword_identifier_domain_protectedBy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v8 = objc_opt_new();
      v9 = [v8 createQueryForGenericPasswordWithIdentifier:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) data:v5 protectedBy:*(void *)(a1 + 48)];

      v10 = (void *)WeakRetained[1];
      id v12 = 0;
      [v10 createGenericPasswordWithQuery:v9 error:&v12];
      id v11 = v12;
      if (v11) {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else {
        [WeakRetained fetchGenericPasswordWithIdentifier:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
      }
    }
  }
}

void __58___LAKeyStore_fetchGenericPasswordsWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  v7 = +[_LAKeyStoreGenericPassword buildWithDictionary:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    [v7 setCryptor:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    [*(id *)(a1 + 32) addObjectsFromArray:a2];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke_2;
      v7[3] = &unk_1E63C4518;
      uint64_t v6 = *(void *)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      id v8 = *(id *)(a1 + 32);
      [WeakRetained fetchKeysWithDomain:v6 completion:v7];
    }
  }
}

uint64_t __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [*(id *)(a1 + 32) addObjectsFromArray:a2];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke_2;
    v6[3] = &unk_1E63C4568;
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    [WeakRetained removeKeysWithDomain:v5 completion:v6];
  }
}

void __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 32) count])
  {
    v4 = [MEMORY[0x1E4F30B90] errorWithCode:-1008 withUnderlyingErrors:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v9 = (void *)*((void *)WeakRetained + 2);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_2;
      v11[3] = &unk_1E63C45E0;
      uint64_t v10 = *(void *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      id v12 = v5;
      [v9 wrapData:v10 completion:v11];
    }
  }
}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *MEMORY[0x1E4F3BA98];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3;
    v9[3] = &unk_1E63C45B8;
    id v10 = v5;
    id v12 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    [v7 encryptData:v10 secKeyAlgorithm:v8 completion:v9];
  }
}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) isEqualToData:v6]) {
    __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4F3BA98];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke_2;
      v11[3] = &unk_1E63C4630;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      id v13 = *(id *)(a1 + 48);
      id v12 = v5;
      [v12 decryptData:v9 secKeyAlgorithm:v8 context:v10 completion:v11];

      objc_destroyWeak(&v14);
    }
  }
}

void __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      [WeakRetained[2] unwrapData:v8 completion:*(void *)(a1 + 40)];
    }
  }
}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3_cold_1()
{
}

@end