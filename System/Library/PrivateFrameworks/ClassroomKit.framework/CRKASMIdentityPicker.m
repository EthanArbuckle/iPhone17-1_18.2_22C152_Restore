@interface CRKASMIdentityPicker
- (BOOL)isManifestEntryValid:(id)a3 manifest:(id)a4;
- (CRKASMCredentialStore)credentialStore;
- (CRKASMIdentityPicker)initWithCredentialStore:(id)a3 userIdentifier:(id)a4;
- (CRKIdentity)identity;
- (NSString)userIdentifier;
- (id)arrayBySortingPersistentIDs:(id)a3;
- (id)candidatePersistentIDsInManifest:(id)a3;
- (id)manifest;
- (id)pickIdentityFromCandidates:(id)a3 manifest:(id)a4;
- (id)pickIdentityFromOrderedCandidates:(id)a3 manifest:(id)a4;
@end

@implementation CRKASMIdentityPicker

- (CRKASMIdentityPicker)initWithCredentialStore:(id)a3 userIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMIdentityPicker;
  v9 = [(CRKASMIdentityPicker *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credentialStore, a3);
    uint64_t v11 = [v8 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = (NSString *)v11;
  }
  return v10;
}

- (CRKIdentity)identity
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(CRKASMIdentityPicker *)self manifest];
  v4 = +[CRKExecutionTimer startedTimerWithDescription:@"Process identity manifest contents"];
  v5 = [(CRKASMIdentityPicker *)self candidatePersistentIDsInManifest:v3];
  v6 = [(CRKASMIdentityPicker *)self pickIdentityFromCandidates:v5 manifest:v3];
  id v7 = _CRKLogASM_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 stop];
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);
  }

  return (CRKIdentity *)v6;
}

- (id)manifest
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[CRKExecutionTimer startedTimerWithDescription:@"Read identity manifest"];
  v4 = [(CRKASMIdentityPicker *)self credentialStore];
  v5 = [v4 identityManifest];

  v6 = _CRKLogASM_9();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 stop];
    int v9 = 138412290;
    int v10 = v7;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (id)candidatePersistentIDsInManifest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v4, "persistentIDs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v4 entryForPersistentID:v11];
        if ([(CRKASMIdentityPicker *)self isManifestEntryValid:v12 manifest:v4]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];

  return v13;
}

- (BOOL)isManifestEntryValid:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  if ([v6 isFullyPopulated])
  {
    uint64_t v7 = [v6 userIdentifier];
    if (v7
      || ([(CRKASMIdentityPicker *)self userIdentifier],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [v6 userIdentifier];
      uint64_t v9 = [(CRKASMIdentityPicker *)self userIdentifier];
      int v10 = [v8 isEqual:v9] ^ 1;

      if (v7)
      {
LABEL_11:

        v13 = [v6 validityInterval];
        char v14 = objc_msgSend(v13, "crk_containsCurrentDate");

        char v12 = v14 & ~(_BYTE)v10;
        goto LABEL_12;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }

    goto LABEL_11;
  }
  uint64_t v11 = _CRKLogASM_9();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CRKASMIdentityPicker isManifestEntryValid:manifest:](v11);
  }

  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)pickIdentityFromCandidates:(id)a3 manifest:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CRKASMIdentityPicker *)self arrayBySortingPersistentIDs:a3];
  uint64_t v8 = [(CRKASMIdentityPicker *)self pickIdentityFromOrderedCandidates:v7 manifest:v6];

  return v8;
}

- (id)pickIdentityFromOrderedCandidates:(id)a3 manifest:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = a4;
  v25 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v29;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x22A6208B0]();
        uint64_t v9 = [v26 entryForPersistentID:v7];
        int v10 = [(CRKASMIdentityPicker *)self credentialStore];
        uint64_t v11 = [v10 identityWithPersistentID:v7];

        if (v11)
        {
          char v12 = [v9 fingerprint];
          if (!v12)
          {
            v21 = [v11 certificate];
            uint64_t v20 = [v21 fingerprint];
            if (!v20)
            {

LABEL_19:
              goto LABEL_20;
            }
          }
          v13 = [v9 fingerprint];
          char v14 = [v11 certificate];
          long long v15 = [v14 fingerprint];
          char v16 = [v13 isEqual:v15];

          if (v12)
          {

            if (v16) {
              goto LABEL_19;
            }
          }
          else
          {

            if (v16) {
              goto LABEL_19;
            }
          }
        }
        long long v17 = _CRKLogASM_9();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(CRKASMIdentityPicker *)v32 pickIdentityFromOrderedCandidates:&v33 manifest:v17];
        }

        [v25 addObject:v7];
        ++v6;
      }
      while (v24 != v6);
      uint64_t v24 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_20:

  long long v18 = [(CRKASMIdentityPicker *)self credentialStore];
  [v18 forgetIdentitiesWithPersistentIDs:v25];

  return v11;
}

- (id)arrayBySortingPersistentIDs:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08B30];
  id v4 = a3;
  id v5 = [v3 sortDescriptorWithKey:@"crk_hexString" ascending:1];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialStore, 0);
}

- (void)isManifestEntryValid:(os_log_t)log manifest:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Found a partially populated identity manifest entry. Skipping it...", v1, 2u);
}

- (void)pickIdentityFromOrderedCandidates:(void *)a3 manifest:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 userIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_224C00000, a4, OS_LOG_TYPE_ERROR, "Found a repointed persistent ID for user identifier %@. Forgetting it...", a1, 0xCu);
}

@end