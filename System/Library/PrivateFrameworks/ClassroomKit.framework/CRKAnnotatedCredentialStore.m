@interface CRKAnnotatedCredentialStore
+ (id)certificateStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5;
+ (id)identityStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5;
- (CRKAnnotatedCredentialManifest)manifest;
- (CRKAnnotatedCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5 addBlock:(id)a6 fetchBlock:(id)a7;
- (CRKKeychain)keychain;
- (NSDictionary)debugInfo;
- (NSString)accessGroup;
- (NSString)manifestStorageKey;
- (id)addBlock;
- (id)addCredential:(id)a3 manifest:(id)a4;
- (id)addCredentials:(id)a3;
- (id)credentialWithPersistentID:(id)a3;
- (id)dataForStorageKey:(id)a3;
- (id)fetchBlock;
- (id)storedManifest;
- (id)storedManifestData;
- (void)forgetCredentialsWithPersistentIDs:(id)a3;
- (void)removeCredentialsWithPersistentIDs:(id)a3;
- (void)removePersistentIDsFromKeychain:(id)a3;
- (void)setData:(id)a3 forStorageKey:(id)a4;
- (void)setStoredManifest:(id)a3;
- (void)setStoredManifestData:(id)a3;
- (void)storedManifest;
@end

@implementation CRKAnnotatedCredentialStore

+ (id)certificateStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5
{
  id v7 = a3;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke;
  v22[3] = &unk_2646F32D8;
  id v8 = v7;
  id v23 = v8;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)MEMORY[0x22A620AF0](v22);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2;
  v20 = &unk_2646F3300;
  id v21 = v8;
  id v12 = v8;
  v13 = (void *)MEMORY[0x22A620AF0](&v17);
  v14 = [CRKAnnotatedCredentialStore alloc];
  v15 = -[CRKAnnotatedCredentialStore initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:](v14, "initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:", v12, v10, v9, v11, v13, v17, v18, v19, v20);

  return v15;
}

uint64_t __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addCertificate:a2 toAccessGroup:a3];
}

uint64_t __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) certificateWithPersistentID:a2];
}

+ (id)identityStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5
{
  id v7 = a3;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke;
  v22[3] = &unk_2646F3328;
  id v8 = v7;
  id v23 = v8;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)MEMORY[0x22A620AF0](v22);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2;
  v20 = &unk_2646F3350;
  id v21 = v8;
  id v12 = v8;
  v13 = (void *)MEMORY[0x22A620AF0](&v17);
  v14 = [CRKAnnotatedCredentialStore alloc];
  v15 = -[CRKAnnotatedCredentialStore initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:](v14, "initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:", v12, v10, v9, v11, v13, v17, v18, v19, v20);

  return v15;
}

uint64_t __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addIdentity:a2 toAccessGroup:a3];
}

uint64_t __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) identityWithPersistentID:a2];
}

- (CRKAnnotatedCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5 addBlock:(id)a6 fetchBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CRKAnnotatedCredentialStore;
  uint64_t v18 = [(CRKAnnotatedCredentialStore *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_keychain, a3);
    uint64_t v20 = [v14 copy];
    accessGroup = v19->_accessGroup;
    v19->_accessGroup = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    manifestStorageKey = v19->_manifestStorageKey;
    v19->_manifestStorageKey = (NSString *)v22;

    uint64_t v24 = MEMORY[0x22A620AF0](v16);
    id addBlock = v19->_addBlock;
    v19->_id addBlock = (id)v24;

    uint64_t v26 = MEMORY[0x22A620AF0](v17);
    id fetchBlock = v19->_fetchBlock;
    v19->_id fetchBlock = (id)v26;
  }
  return v19;
}

- (NSDictionary)debugInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"Manifest";
  v2 = [(CRKAnnotatedCredentialStore *)self manifest];
  v3 = [v2 debugInfo];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (CRKAnnotatedCredentialManifest)manifest
{
  v2 = [(CRKAnnotatedCredentialStore *)self storedManifest];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return (CRKAnnotatedCredentialManifest *)v5;
}

- (id)addCredentials:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  if ([v4 count])
  {
    v6 = [(CRKAnnotatedCredentialStore *)self manifest];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = -[CRKAnnotatedCredentialStore addCredential:manifest:](self, "addCredential:manifest:", v12, v6, (void)v16);
          if (v13)
          {
            id v14 = [v12 credential];
            [v5 setObject:v13 forKey:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 modified]) {
      [(CRKAnnotatedCredentialStore *)self setStoredManifest:v6];
    }
  }

  return v5;
}

- (id)credentialWithPersistentID:(id)a3
{
  id v4 = a3;
  v5 = [(CRKAnnotatedCredentialStore *)self fetchBlock];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (void)removeCredentialsWithPersistentIDs:(id)a3
{
  id v4 = a3;
  [(CRKAnnotatedCredentialStore *)self removePersistentIDsFromKeychain:v4];
  [(CRKAnnotatedCredentialStore *)self forgetCredentialsWithPersistentIDs:v4];
}

- (void)forgetCredentialsWithPersistentIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(CRKAnnotatedCredentialStore *)self storedManifest];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "removePersistentID:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    if ([v5 modified]) {
      [(CRKAnnotatedCredentialStore *)self setStoredManifest:v5];
    }
  }
}

- (id)addCredential:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRKAnnotatedCredentialStore *)self addBlock];
  uint64_t v9 = [v6 credential];
  uint64_t v10 = [(CRKAnnotatedCredentialStore *)self accessGroup];
  long long v11 = ((void (**)(void, void *, void *))v8)[2](v8, v9, v10);

  if (v11)
  {
    long long v12 = [v6 annotation];
    [v7 addPersistentID:v11 withAnnotation:v12];

    id v13 = v11;
  }

  return v11;
}

- (void)removePersistentIDsFromKeychain:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(CRKAnnotatedCredentialStore *)self keychain];
        [v10 removeItemWithPersistentID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)storedManifest
{
  v3 = [(CRKAnnotatedCredentialStore *)self storedManifestData];
  if (v3)
  {
    id v4 = +[CRKAnnotatedCredentialManifest manifestWithData:v3];
    if (!v4)
    {
      if (_CRKLogASM_onceToken != -1) {
        dispatch_once(&_CRKLogASM_onceToken, &__block_literal_global);
      }
      uint64_t v5 = _CRKLogASM_logObj;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj, OS_LOG_TYPE_ERROR)) {
        -[CRKAnnotatedCredentialStore storedManifest](v5);
      }
      [(CRKAnnotatedCredentialStore *)self setStoredManifestData:0];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setStoredManifest:(id)a3
{
  id v4 = [a3 dataRepresentation];
  [(CRKAnnotatedCredentialStore *)self setStoredManifestData:v4];
}

- (id)storedManifestData
{
  v3 = [(CRKAnnotatedCredentialStore *)self manifestStorageKey];
  id v4 = [(CRKAnnotatedCredentialStore *)self dataForStorageKey:v3];

  return v4;
}

- (void)setStoredManifestData:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKAnnotatedCredentialStore *)self manifestStorageKey];
  [(CRKAnnotatedCredentialStore *)self setData:v4 forStorageKey:v5];
}

- (void)setData:(id)a3 forStorageKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CRKAnnotatedCredentialStore *)self keychain];
  uint64_t v8 = [(CRKAnnotatedCredentialStore *)self accessGroup];
  [v9 setPassword:v7 forService:v6 accessGroup:v8];
}

- (id)dataForStorageKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKAnnotatedCredentialStore *)self keychain];
  id v6 = [v5 passwordForService:v4];

  return v6;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)manifestStorageKey
{
  return self->_manifestStorageKey;
}

- (id)addBlock
{
  return self->_addBlock;
}

- (id)fetchBlock
{
  return self->_fetchBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchBlock, 0);
  objc_storeStrong(&self->_addBlock, 0);
  objc_storeStrong((id *)&self->_manifestStorageKey, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)storedManifest
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize stored manifest data. Deleting stored data...", v1, 2u);
}

@end