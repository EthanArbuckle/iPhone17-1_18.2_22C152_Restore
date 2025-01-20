@interface CRKASMCredentialStore
- (CRKASMCredentialManifest)certificateManifest;
- (CRKASMCredentialManifest)identityManifest;
- (CRKASMCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 certificateManifestStorageKey:(id)a5 identityManifestStorageKey:(id)a6;
- (CRKAnnotatedCredentialStore)certificateAnnotatedStore;
- (CRKAnnotatedCredentialStore)identityAnnotatedStore;
- (CRKKeychain)keychain;
- (NSDictionary)debugInfo;
- (id)addCertificate:(id)a3 entry:(id)a4;
- (id)addCertificate:(id)a3 forUserIdentifier:(id)a4;
- (id)addCertificates:(id)a3 forUserIdentifier:(id)a4;
- (id)addEntriesByCertificate:(id)a3;
- (id)addIdentity:(id)a3 entry:(id)a4;
- (id)addIdentity:(id)a3 forUserIdentifier:(id)a4;
- (id)certificateWithPersistentID:(id)a3;
- (id)identityWithPersistentID:(id)a3;
- (id)makeCertificateWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4;
- (id)makeEntryWithCertificate:(id)a3 userIdentifier:(id)a4;
- (id)makeIdentityWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4;
- (void)clearCertificates;
- (void)clearIdentities;
- (void)forgetCertificatesWithPersistentIDs:(id)a3;
- (void)forgetIdentitiesWithPersistentIDs:(id)a3;
- (void)removeCertificatesWithPersistentIDs:(id)a3;
- (void)removeIdentitiesWithPersistentIDs:(id)a3;
@end

@implementation CRKASMCredentialStore

- (CRKASMCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 certificateManifestStorageKey:(id)a5 identityManifestStorageKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKASMCredentialStore;
  v15 = [(CRKASMCredentialStore *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keychain, a3);
    uint64_t v17 = +[CRKAnnotatedCredentialStore certificateStoreWithKeychain:v11 accessGroup:v12 manifestStorageKey:v13];
    certificateAnnotatedStore = v16->_certificateAnnotatedStore;
    v16->_certificateAnnotatedStore = (CRKAnnotatedCredentialStore *)v17;

    uint64_t v19 = +[CRKAnnotatedCredentialStore identityStoreWithKeychain:v11 accessGroup:v12 manifestStorageKey:v14];
    identityAnnotatedStore = v16->_identityAnnotatedStore;
    v16->_identityAnnotatedStore = (CRKAnnotatedCredentialStore *)v19;
  }
  return v16;
}

- (NSDictionary)debugInfo
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"Certificates";
  v3 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  v4 = [v3 debugInfo];
  v9[1] = @"Identities";
  v10[0] = v4;
  v5 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  v6 = [v5 debugInfo];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return (NSDictionary *)v7;
}

- (CRKASMCredentialManifest)certificateManifest
{
  v3 = [CRKASMCredentialManifest alloc];
  v4 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  v5 = [v4 manifest];
  v6 = [(CRKASMCredentialManifest *)v3 initWithAnnotatedManifest:v5];

  return v6;
}

- (id)certificateWithPersistentID:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  v6 = [v5 credentialWithPersistentID:v4];

  return v6;
}

- (void)removeCertificatesWithPersistentIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  [v5 removeCredentialsWithPersistentIDs:v4];
}

- (void)forgetCertificatesWithPersistentIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  [v5 forgetCredentialsWithPersistentIDs:v4];
}

- (id)makeCertificateWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4
{
  id v4 = [(CRKASMCredentialStore *)self makeIdentityWithCommonNamePrefix:a3 userIdentifier:a4];
  id v5 = [v4 certificate];

  return v5;
}

- (void)clearCertificates
{
  id v4 = [(CRKASMCredentialStore *)self certificateManifest];
  v3 = [v4 persistentIDs];
  [(CRKASMCredentialStore *)self removeCertificatesWithPersistentIDs:v3];
}

- (id)addCertificate:(id)a3 forUserIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 90, @"Invalid parameter not satisfying: %@", @"certificate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 91, @"Invalid parameter not satisfying: %@", @"userIdentifier" object file lineNumber description];

LABEL_3:
  v10 = [MEMORY[0x263EFFA08] setWithObject:v7];
  id v11 = [(CRKASMCredentialStore *)self addCertificates:v10 forUserIdentifier:v9];
  id v12 = [v11 objectForKey:v7];

  return v12;
}

- (id)addCertificates:(id)a3 forUserIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 98, @"Invalid parameter not satisfying: %@", @"userIdentifier" object file lineNumber description];
  }
  v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [(CRKASMCredentialStore *)self makeEntryWithCertificate:v15 userIdentifier:v8];
        if (v16) {
          [v9 setObject:v16 forKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [(CRKASMCredentialStore *)self addEntriesByCertificate:v9];

  return v17;
}

- (id)addCertificate:(id)a3 entry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 113, @"Invalid parameter not satisfying: %@", @"certificate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 114, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];

LABEL_3:
  id v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  [v10 setObject:v9 forKey:v7];
  uint64_t v11 = [(CRKASMCredentialStore *)self addEntriesByCertificate:v10];
  uint64_t v12 = [v11 objectForKey:v7];

  return v12;
}

- (id)addEntriesByCertificate:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v3 keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 dictionaryValue];
          id v14 = [[CRKAnnotatedCredential alloc] initWithCredential:v10 annotation:v13];
          [v4 addObject:v14];
        }
        else
        {
          uint64_t v13 = _CRKLogASM_6();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v10;
            _os_log_error_impl(&dword_224C00000, v13, OS_LOG_TYPE_ERROR, "No entry found for certificate %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [(CRKASMCredentialStore *)self certificateAnnotatedStore];
  v16 = [v15 addCredentials:v4];

  return v16;
}

- (CRKASMCredentialManifest)identityManifest
{
  id v3 = [CRKASMCredentialManifest alloc];
  id v4 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  id v5 = [v4 manifest];
  uint64_t v6 = [(CRKASMCredentialManifest *)v3 initWithAnnotatedManifest:v5];

  return v6;
}

- (id)identityWithPersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  uint64_t v6 = [v5 credentialWithPersistentID:v4];

  return v6;
}

- (void)removeIdentitiesWithPersistentIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  [v5 removeCredentialsWithPersistentIDs:v4];
}

- (void)forgetIdentitiesWithPersistentIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  [v5 forgetCredentialsWithPersistentIDs:v4];
}

- (id)makeIdentityWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[CRKASMCertificateCommonName alloc] initWithPrefix:v7 userIdentifier:v6];

  v9 = [CRKIdentityConfiguration alloc];
  uint64_t v10 = [(CRKASMCertificateCommonName *)v8 stringValue];
  uint64_t v11 = [(CRKIdentityConfiguration *)v9 initWithCommonName:v10];

  uint64_t v12 = [(CRKASMCredentialStore *)self keychain];
  uint64_t v13 = [v12 makeIdentityWithConfiguration:v11];

  return v13;
}

- (void)clearIdentities
{
  id v4 = [(CRKASMCredentialStore *)self identityManifest];
  id v3 = [v4 persistentIDs];
  [(CRKASMCredentialStore *)self removeIdentitiesWithPersistentIDs:v3];
}

- (id)addIdentity:(id)a3 forUserIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 169, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 170, @"Invalid parameter not satisfying: %@", @"userIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v7 certificate];
  uint64_t v11 = [(CRKASMCredentialStore *)self makeEntryWithCertificate:v10 userIdentifier:v9];

  if (v11)
  {
    uint64_t v12 = [(CRKASMCredentialStore *)self addIdentity:v7 entry:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)addIdentity:(id)a3 entry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 182, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"CRKASMCredentialStore.m", 183, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v9 dictionaryValue];
  uint64_t v11 = [[CRKAnnotatedCredential alloc] initWithCredential:v7 annotation:v10];
  uint64_t v12 = [(CRKASMCredentialStore *)self identityAnnotatedStore];
  uint64_t v13 = [MEMORY[0x263EFFA08] setWithObject:v11];
  id v14 = [v12 addCredentials:v13];
  uint64_t v15 = [v14 objectForKey:v7];

  return v15;
}

- (id)makeEntryWithCertificate:(id)a3 userIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = _CRKLogASM_6();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:]();
    }
    goto LABEL_13;
  }
  if (!v5)
  {
    id v7 = _CRKLogASM_6();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:]();
    }
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  id v7 = [v5 validityDateInterval];
  if (v7)
  {
    id v8 = [v5 fingerprint];
    if (!v8)
    {
      v9 = _CRKLogASM_6();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:].cold.4();
      }
    }
    uint64_t v10 = [[CRKASMCredentialManifestEntry alloc] initWithUserIdentifier:v6 validityInterval:v7 fingerprint:v8];
  }
  else
  {
    id v8 = _CRKLogASM_6();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:]();
    }
    uint64_t v10 = 0;
  }

LABEL_18:

  return v10;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (CRKAnnotatedCredentialStore)certificateAnnotatedStore
{
  return self->_certificateAnnotatedStore;
}

- (CRKAnnotatedCredentialStore)identityAnnotatedStore
{
  return self->_identityAnnotatedStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityAnnotatedStore, 0);
  objc_storeStrong((id *)&self->_certificateAnnotatedStore, 0);

  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_224C00000, v0, v1, "Could not create manifest entry: nil user identifier", v2, v3, v4, v5, v6);
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_224C00000, v0, v1, "Could not create manifest entry: nil certificate", v2, v3, v4, v5, v6);
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_224C00000, v0, v1, "Could not create manifest entry: nil certificate validity interval", v2, v3, v4, v5, v6);
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_224C00000, v0, v1, "Could not create manifest entry: nil certificate fingerprint", v2, v3, v4, v5, v6);
}

@end