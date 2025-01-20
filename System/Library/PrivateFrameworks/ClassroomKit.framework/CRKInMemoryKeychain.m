@interface CRKInMemoryKeychain
- (CRKInMemoryKeychain)init;
- (CRKInMemoryKeychainDelegate)delegate;
- (NSMutableDictionary)keychainItemsByPersistentID;
- (NSMutableDictionary)passwordDatasByService;
- (id)addItem:(id)a3 toAccessGroup:(id)a4;
- (id)certificateWithPersistentID:(id)a3;
- (id)existingPersistentIDForItem:(id)a3;
- (id)identityWithPersistentID:(id)a3;
- (id)itemWithPersistentID:(id)a3 expectedProtocol:(id)a4;
- (id)makeCertificateWithData:(id)a3;
- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4;
- (id)makeIdentityWithConfiguration:(id)a3;
- (id)makePrivateKeyWithData:(id)a3;
- (id)passwordForService:(id)a3;
- (id)privateKeyWithPersistentID:(id)a3;
- (id)validityDateIntervalForConfiguration:(id)a3;
- (void)enumerateKeychainUsingBlock:(id)a3;
- (void)removeItemWithPersistentID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5;
@end

@implementation CRKInMemoryKeychain

- (CRKInMemoryKeychain)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKInMemoryKeychain;
  v2 = [(CRKInMemoryKeychain *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keychainItemsByPersistentID = v2->_keychainItemsByPersistentID;
    v2->_keychainItemsByPersistentID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    passwordDatasByService = v2->_passwordDatasByService;
    v2->_passwordDatasByService = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CRKInMemoryKeychain *)self passwordDatasByService];
  [v9 setObject:v8 forKeyedSubscript:v7];
}

- (id)certificateWithPersistentID:(id)a3
{
  return [(CRKInMemoryKeychain *)self itemWithPersistentID:a3 expectedProtocol:&unk_26D836540];
}

- (id)identityWithPersistentID:(id)a3
{
  return [(CRKInMemoryKeychain *)self itemWithPersistentID:a3 expectedProtocol:&unk_26D834428];
}

- (id)privateKeyWithPersistentID:(id)a3
{
  return [(CRKInMemoryKeychain *)self itemWithPersistentID:a3 expectedProtocol:&unk_26D837708];
}

- (id)passwordForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKInMemoryKeychain *)self passwordDatasByService];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)enumerateKeychainUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  unsigned __int8 v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(CRKInMemoryKeychain *)self keychainItemsByPersistentID];
  v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      v12 = [(CRKInMemoryKeychain *)self itemWithPersistentID:v11 expectedProtocol:&unk_26D81B798];
      v4[2](v4, v11, v12, &v17);
      LODWORD(v11) = v17;

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)makeIdentityWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKInMemoryKeychain *)self validityDateIntervalForConfiguration:v4];
  v6 = +[CRKInMemoryIdentity identityWithConfiguration:v4 validityDateInterval:v5];

  return v6;
}

- (id)makeCertificateWithData:(id)a3
{
  return +[CRKInMemoryCertificate certificateWithData:a3];
}

- (void)removeItemWithPersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKInMemoryKeychain *)self keychainItemsByPersistentID];
  [v5 setObject:0 forKeyedSubscript:v4];
}

- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CRKInMemoryIdentity alloc] initWithCertificate:v6 privateKey:v5];

  return v7;
}

- (id)makePrivateKeyWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[CRKInMemoryPrivateKey alloc] initWithData:v3];

  return v4;
}

- (id)itemWithPersistentID:(id)a3 expectedProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRKInMemoryKeychain *)self keychainItemsByPersistentID];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [(CRKInMemoryKeychain *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(CRKInMemoryKeychain *)self delegate];
    uint64_t v13 = [v12 inMemoryKeychain:self overriddenItemForPersistentID:v6 originalItem:v9];

    uint64_t v9 = (void *)v13;
  }
  if (v9)
  {
    if ([v9 conformsToProtocol:v7]) {
      long long v14 = v9;
    }
    else {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)validityDateIntervalForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08798]);
  id v6 = objc_opt_new();
  id v7 = (void *)[v5 initWithStartDate:v6 duration:15768000.0 + 15768000.0];

  uint64_t v8 = [(CRKInMemoryKeychain *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(CRKInMemoryKeychain *)self delegate];
    uint64_t v11 = [v10 inMemoryKeychain:self validityDateIntervalForNewIdentityWithConfiguration:v4 defaultInterval:v7];

    id v7 = (void *)v11;
  }

  return v7;
}

- (id)addItem:(id)a3 toAccessGroup:(id)a4
{
  id v5 = a3;
  id v6 = [(CRKInMemoryKeychain *)self existingPersistentIDForItem:v5];
  if (!v6)
  {
    id v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];
    id v6 = [v8 dataUsingEncoding:4];

    char v9 = [(CRKInMemoryKeychain *)self keychainItemsByPersistentID];
    [v9 setObject:v5 forKeyedSubscript:v6];
  }
  id v10 = v6;

  return v10;
}

- (id)existingPersistentIDForItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__CRKInMemoryKeychain_existingPersistentIDForItem___block_invoke;
  v8[3] = &unk_2646F5060;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(CRKInMemoryKeychain *)self enumerateKeychainUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__CRKInMemoryKeychain_existingPersistentIDForItem___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (CRKInMemoryKeychainDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKInMemoryKeychainDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)keychainItemsByPersistentID
{
  return self->_keychainItemsByPersistentID;
}

- (NSMutableDictionary)passwordDatasByService
{
  return self->_passwordDatasByService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordDatasByService, 0);
  objc_storeStrong((id *)&self->_keychainItemsByPersistentID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end