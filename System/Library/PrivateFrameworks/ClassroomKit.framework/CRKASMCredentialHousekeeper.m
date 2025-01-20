@interface CRKASMCredentialHousekeeper
- (BOOL)isEntryValid:(id)a3 allowedUserIdentifiers:(id)a4;
- (CRKASMCredentialHousekeeper)initWithRoster:(id)a3 credentialStore:(id)a4;
- (CRKASMCredentialStore)credentialStore;
- (CRKASMRoster)roster;
- (id)entriesInManifest:(id)a3 forPersistentIDs:(id)a4;
- (id)knownTrustedUserIdentifiers;
- (id)knownUserIdentifiers;
- (void)housekeep;
- (void)housekeepTrustedUserCertificates;
- (void)housekeepUserIdentities;
- (void)removeAllUserIdentitiesInManifest:(id)a3;
- (void)removeTrustedUserCertificates:(id)a3 manifest:(id)a4;
- (void)removeUserIdentities:(id)a3 manifest:(id)a4;
@end

@implementation CRKASMCredentialHousekeeper

- (CRKASMCredentialHousekeeper)initWithRoster:(id)a3 credentialStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMCredentialHousekeeper;
  v9 = [(CRKASMCredentialHousekeeper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_roster, a3);
    objc_storeStrong((id *)&v10->_credentialStore, a4);
  }

  return v10;
}

- (void)housekeep
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = +[CRKExecutionTimer startedTimerWithDescription:@"Housekeep ASM credentials"];
  [(CRKASMCredentialHousekeeper *)self housekeepUserIdentities];
  [(CRKASMCredentialHousekeeper *)self housekeepTrustedUserCertificates];
  v4 = _CRKLogASM_18();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 stop];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)housekeepUserIdentities
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(CRKASMCredentialHousekeeper *)self credentialStore];
  v4 = [v3 identityManifest];

  v5 = [(CRKASMCredentialHousekeeper *)self roster];
  int v6 = [v5 courses];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [(CRKASMCredentialHousekeeper *)self knownUserIdentifiers];
  v9 = v8;
  if (v7 && [v8 count])
  {
    v10 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = objc_msgSend(v4, "persistentIDs", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v17 = [v4 entryForPersistentID:v16];
          if (!-[CRKASMCredentialHousekeeper isEntryValid:allowedUserIdentifiers:](self, "isEntryValid:allowedUserIdentifiers:", v17, v9))[v10 addObject:v16]; {
        }
          }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [(CRKASMCredentialHousekeeper *)self removeUserIdentities:v10 manifest:v4];
  }
  else
  {
    [(CRKASMCredentialHousekeeper *)self removeAllUserIdentitiesInManifest:v4];
  }
}

- (id)knownUserIdentifiers
{
  v2 = [(CRKASMCredentialHousekeeper *)self roster];
  v3 = [v2 user];
  v4 = [v3 identifier];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  int v6 = (void *)v5;

  return v6;
}

- (void)removeAllUserIdentitiesInManifest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 persistentIDs];
  [(CRKASMCredentialHousekeeper *)self removeUserIdentities:v5 manifest:v4];
}

- (void)removeUserIdentities:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(CRKASMCredentialHousekeeper *)self entriesInManifest:v7 forPersistentIDs:v6];
    v9 = _CRKLogASM_18();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCredentialHousekeeper removeUserIdentities:manifest:](v6);
    }

    v10 = [(CRKASMCredentialHousekeeper *)self credentialStore];
    [v10 removeIdentitiesWithPersistentIDs:v6];
  }
}

- (void)housekeepTrustedUserCertificates
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(CRKASMCredentialHousekeeper *)self knownTrustedUserIdentifiers];
  id v4 = objc_opt_new();
  id v5 = [(CRKASMCredentialHousekeeper *)self credentialStore];
  id v6 = [v5 certificateManifest];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = objc_msgSend(v6, "persistentIDs", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v13 = [v6 entryForPersistentID:v12];
        if (!-[CRKASMCredentialHousekeeper isEntryValid:allowedUserIdentifiers:](self, "isEntryValid:allowedUserIdentifiers:", v13, v3))[v4 addObject:v12]; {
      }
        }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(CRKASMCredentialHousekeeper *)self removeTrustedUserCertificates:v4 manifest:v6];
}

- (void)removeTrustedUserCertificates:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(CRKASMCredentialHousekeeper *)self entriesInManifest:v7 forPersistentIDs:v6];
    uint64_t v9 = _CRKLogASM_18();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCredentialHousekeeper removeTrustedUserCertificates:manifest:](v6);
    }

    uint64_t v10 = [(CRKASMCredentialHousekeeper *)self credentialStore];
    [v10 removeCertificatesWithPersistentIDs:v6];
  }
}

- (id)knownTrustedUserIdentifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(CRKASMCredentialHousekeeper *)self roster];
  id v5 = [v4 courses];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v11 = objc_msgSend(v10, "trustedUsers", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) identifier];
              [v3 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v17 = (void *)[v3 copy];

  return v17;
}

- (id)entriesInManifest:(id)a3 forPersistentIDs:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(v5, "entryForPersistentID:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        uint64_t v14 = [v13 stringValue];
        long long v15 = (void *)v14;
        if (v14) {
          long long v16 = (__CFString *)v14;
        }
        else {
          long long v16 = @"no_entry_found";
        }
        long long v17 = v16;

        [v7 addObject:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v7 copy];

  return v18;
}

- (BOOL)isEntryValid:(id)a3 allowedUserIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFullyPopulated])
  {
    uint64_t v7 = [v5 validityInterval];
    if (objc_msgSend(v7, "crk_containsCurrentDate"))
    {
      id v8 = [v5 userIdentifier];
      char v9 = [v6 containsObject:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialStore, 0);

  objc_storeStrong((id *)&self->_roster, 0);
}

- (void)removeUserIdentities:(void *)a1 manifest:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v1, v2, "Housekeeping %lu user identities. Manifest entries: %@", v3, v4, v5, v6, v7);
}

- (void)removeTrustedUserCertificates:(void *)a1 manifest:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v1, v2, "Housekeeping %lu trusted user certificates. Manifest entries: %@", v3, v4, v5, v6, v7);
}

@end