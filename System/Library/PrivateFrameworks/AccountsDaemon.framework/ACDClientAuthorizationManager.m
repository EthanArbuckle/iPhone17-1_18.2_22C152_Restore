@interface ACDClientAuthorizationManager
- (ACDClientAuthorizationManager)initWithDatabaseConnection:(id)a3;
- (id)_csvStringFromSet:(id)a3;
- (id)_setFromCSVString:(id)a3;
- (id)allAuthorizationsForAccountType:(id)a3;
- (id)allAuthorizationsForAccountTypeWithIdentifier:(id)a3;
- (id)authorizationForClient:(id)a3 accountType:(id)a4;
- (id)authorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4;
- (id)removeAllClientAuthorizationsForAccountType:(id)a3;
- (id)removeAllClientAuthorizationsForAccountTypeWithIdentifier:(id)a3;
- (id)removeAuthorizationForClient:(id)a3 accountType:(id)a4;
- (id)removeAuthorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4;
- (id)setAuthorization:(id)a3 forClient:(id)a4 onAccountType:(id)a5;
@end

@implementation ACDClientAuthorizationManager

- (ACDClientAuthorizationManager)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACDClientAuthorizationManager;
  v5 = [(ACDClientAuthorizationManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_databaseConnection, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)authorizationForClient:(id)a3 accountType:(id)a4
{
  id v6 = a3;
  v7 = [a4 identifier];
  objc_super v8 = [(ACDClientAuthorizationManager *)self authorizationForClient:v6 accountTypeWithIdentifier:v7];

  return v8;
}

- (id)authorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager authorizationForClient:accountTypeWithIdentifier:]();
  }

  v9 = [v6 bundleID];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"%@ has a nil bundle ID. Will not try to find ClientAuthorization.\"", buf, 0xCu);
    }

    id v15 = 0;
  }
  else
  {
    int v11 = +[ACDTCCUtilities TCCStateForClient:v6 accountTypeID:v7];
    int v12 = v11;
    if (v11)
    {
      BOOL v13 = v11 == 1;
    }
    else
    {
      v16 = _ACDLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "\"No TCC state found: %@, %@\"", buf, 0x16u);
      }

      BOOL v13 = 0;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__6;
    v29 = __Block_byref_object_dispose__6;
    id v30 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
    v18 = [WeakRetained managedObjectContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke;
    v20[3] = &unk_264321AE0;
    id v21 = v6;
    id v22 = v7;
    v23 = self;
    BOOL v25 = v12 != 0;
    v24 = buf;
    BOOL v26 = v13;
    [v18 performBlockAndWait:v20];

    id v15 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }

  return v15;
}

void __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [*(id *)(a1 + 32) bundleID];
  id v4 = [v2 predicateWithFormat:@"bundleID == %@ AND accountType.identifier == %@", v3, *(void *)(a1 + 40)];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  id v6 = [WeakRetained fetchObjectsForEntityNamed:@"Authorization" withPredicate:v4];

  id v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v6, v7);
  }

  objc_super v8 = [v6 lastObject];
  if (!v8 && !*(unsigned char *)(a1 + 64)) {
    goto LABEL_11;
  }
  id v9 = [[ACDClientAuthorization alloc] initForClient:*(void *)(a1 + 32)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  int v12 = *(void **)(a1 + 48);
  BOOL v13 = [v8 grantedPermissions];
  v14 = [v12 _setFromCSVString:v13];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setGrantedPermissions:v14];

  id v15 = [v8 options];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOptions:v15];

  if (!+[ACDTCCUtilities TCCSupportedForAccountTypeID:*(void *)(a1 + 40)])
  {
    v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v16 = 1;
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    [v18 deleteObject:v8];

    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    [v19 saveWithError:0];

LABEL_11:
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0;

    goto LABEL_12;
  }
  uint64_t v16 = *(unsigned __int8 *)(a1 + 65);
  v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
LABEL_9:
  [v17 setIsGranted:v16];
LABEL_12:
}

- (id)setAuthorization:(id)a3 forClient:(id)a4 onAccountType:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 identifier];
  int v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136381699;
    *(void *)&buf[4] = "-[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:]";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = 102;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v8;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v9;
    *(_WORD *)&buf[38] = 2112;
    id v42 = v11;
    _os_log_debug_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@, %@)", buf, 0x30u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&unsigned char buf[24] = __Block_byref_object_copy__6;
  *(void *)&buf[32] = __Block_byref_object_dispose__6;
  id v42 = 0;
  BOOL v13 = [v9 bundleID];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    BOOL v25 = _ACDLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:]();
    }

    id v24 = 0;
  }
  else
  {
    if (+[ACDTCCUtilities TCCSupportedForAccountTypeID:](ACDTCCUtilities, "TCCSupportedForAccountTypeID:", v11)&& !+[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:](ACDTCCUtilities, "setTCCStateForClient:accountTypeID:toGranted:", v9, v11, [v8 isGranted]))
    {
      id v15 = _ACDLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:]();
      }

      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      v40 = @"Setting TCC failed.";
      v17 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v18 = [v16 errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:v17];
      id v19 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v18;
    }
    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__6;
      v37[4] = __Block_byref_object_dispose__6;
      id v38 = [v8 options];
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__6;
      v35[4] = __Block_byref_object_dispose__6;
      uint64_t v20 = [v8 grantedPermissions];
      id v36 = [(ACDClientAuthorizationManager *)self _csvStringFromSet:v20];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
      id v22 = [WeakRetained managedObjectContext];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke;
      v27[3] = &unk_264321B08;
      id v28 = v9;
      id v29 = v11;
      id v30 = self;
      id v31 = v10;
      v32 = v35;
      v33 = v37;
      v34 = buf;
      [v22 performBlockAndWait:v27];

      _Block_object_dispose(v35, 8);
      _Block_object_dispose(v37, 8);
    }
    v23 = _ACDLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:]();
    }

    id v24 = *(id *)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);

  return v24;
}

void __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [*(id *)(a1 + 32) bundleID];
  id v4 = [v2 predicateWithFormat:@"bundleID == %@ AND accountType.identifier == %@", v3, *(void *)(a1 + 40)];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  id v6 = [WeakRetained fetchObjectsForEntityNamed:@"Authorization" withPredicate:v4];

  id v7 = [v6 lastObject];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  id v9 = [*(id *)(a1 + 56) objectID];
  id v10 = [v8 objectForObjectURI:v9];

  if (!v7)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    id v7 = [v11 insertNewObjectForEntityForName:@"Authorization"];

    [v7 setAccountType:v10];
    int v12 = [*(id *)(a1 + 32) bundleID];
    [v7 setBundleID:v12];
  }
  [v7 setGrantedPermissions:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    objc_msgSend(v7, "setOptions:");
  }
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v14 = a1 + 80;
  uint64_t v16 = *(void *)(v15 + 8);
  id obj = *(id *)(v16 + 40);
  [v13 saveWithError:&obj rollbackOnFailure:1];
  objc_storeStrong((id *)(v16 + 40), obj);

  if (*(void *)(*(void *)(*(void *)v14 + 8) + 40))
  {
    v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke_cold_1(v14);
    }
  }
}

- (id)removeAuthorizationForClient:(id)a3 accountType:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  id v8 = [(ACDClientAuthorizationManager *)self removeAuthorizationForClient:v6 accountTypeWithIdentifier:v7];

  return v8;
}

- (id)removeAuthorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:]();
  }

  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  id v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  if (+[ACDTCCUtilities TCCSupportedForAccountTypeID:](ACDTCCUtilities, "TCCSupportedForAccountTypeID:", v7)&& !+[ACDTCCUtilities clearTCCStateForClient:v6 accountTypeID:v7])
  {
    id v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:]();
    }

    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"Removing TCC state failed. God knows why.";
    id v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v12 = [v10 errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:v11];
    id v13 = (void *)v25[5];
    v25[5] = v12;
  }
  if (!v25[5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
    uint64_t v15 = [WeakRetained managedObjectContext];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke;
    v19[3] = &unk_264321120;
    id v20 = v6;
    id v21 = v7;
    id v22 = self;
    v23 = &v24;
    [v15 performBlockAndWait:v19];
  }
  uint64_t v16 = _ACDLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:]();
  }

  id v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [*(id *)(a1 + 32) bundleID];
  id v4 = [v2 predicateWithFormat:@"bundleID == %@ AND accountType.identifier == %@", v3, *(void *)(a1 + 40)];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  id v6 = [WeakRetained fetchObjectsForEntityNamed:@"Authorization" withPredicate:v4];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
        [v13 deleteObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v15 = a1 + 56;
  uint64_t v17 = *(void *)(v16 + 8);
  id obj = *(id *)(v17 + 40);
  [v14 saveWithError:&obj rollbackOnFailure:1];
  objc_storeStrong((id *)(v17 + 40), obj);

  if (*(void *)(*(void *)(*(void *)v15 + 8) + 40))
  {
    uint64_t v18 = _ACDLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v15);
    }
  }
}

- (id)allAuthorizationsForAccountType:(id)a3
{
  id v4 = [a3 identifier];
  v5 = [(ACDClientAuthorizationManager *)self allAuthorizationsForAccountTypeWithIdentifier:v4];

  return v5;
}

- (id)allAuthorizationsForAccountTypeWithIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:]();
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  id v25 = 0;
  id v7 = +[ACDTCCUtilities allTCCStatesForAccountTypeID:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
  uint64_t v9 = [WeakRetained managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__ACDClientAuthorizationManager_allAuthorizationsForAccountTypeWithIdentifier___block_invoke;
  v18[3] = &unk_264321B30;
  id v10 = v4;
  long long v23 = v24;
  id v19 = v10;
  long long v20 = self;
  id v11 = v7;
  id v21 = v11;
  id v12 = v6;
  id v22 = v12;
  [v9 performBlockAndWait:v18];

  id v13 = _ACDLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:](v14, buf, (uint64_t)v10, v13);
  }

  uint64_t v15 = v22;
  id v16 = v12;

  _Block_object_dispose(v24, 8);

  return v16;
}

void __79__ACDClientAuthorizationManager_allAuthorizationsForAccountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier == %@", *(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v24 = (void *)v2;
  uint64_t v4 = [WeakRetained fetchObjectsForEntityNamed:@"Authorization" withPredicate:v2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = [v11 bundleID];
        id v13 = [ACDClientAuthorization alloc];
        id v14 = +[ACDClient clientWithBundleID:v12];
        id v15 = [(ACDClientAuthorization *)v13 initForClient:v14];

        id v16 = [*(id *)(a1 + 48) objectForKey:v12];
        uint64_t v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 BOOLValue];
        }
        else
        {
          id v19 = _ACDLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v12;
            _os_log_debug_impl(&dword_2183AD000, v19, OS_LOG_TYPE_DEBUG, "\"No match found in TCC for bundleID: %@ - setting isGranted to TRUE\"", buf, 0xCu);
          }

          uint64_t v18 = 1;
        }
        [v15 setIsGranted:v18];
        long long v20 = *(void **)(a1 + 40);
        id v21 = [v11 grantedPermissions];
        id v22 = [v20 _setFromCSVString:v21];
        [v15 setGrantedPermissions:v22];

        long long v23 = [v11 options];
        [v15 setOptions:v23];

        [*(id *)(a1 + 56) addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }
}

- (id)removeAllClientAuthorizationsForAccountType:(id)a3
{
  uint64_t v4 = [a3 identifier];
  uint64_t v5 = [(ACDClientAuthorizationManager *)self removeAllClientAuthorizationsForAccountTypeWithIdentifier:v4];

  return v5;
}

- (id)removeAllClientAuthorizationsForAccountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager removeAllClientAuthorizationsForAccountTypeWithIdentifier:]();
  }

  +[ACDTCCUtilities clearAllTCCStatesForAccountTypeID:v4];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  long long v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
  uint64_t v7 = [WeakRetained managedObjectContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__ACDClientAuthorizationManager_removeAllClientAuthorizationsForAccountTypeWithIdentifier___block_invoke;
  v12[3] = &unk_264320CA0;
  id v8 = v4;
  id v13 = v8;
  id v14 = self;
  id v15 = &v16;
  [v7 performBlockAndWait:v12];

  uint64_t v9 = _ACDLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACDClientAuthorizationManager removeAllClientAuthorizationsForAccountTypeWithIdentifier:]();
  }

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __91__ACDClientAuthorizationManager_removeAllClientAuthorizationsForAccountTypeWithIdentifier___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier == %@", a1[4]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  id v4 = [WeakRetained fetchObjectsForEntityNamed:@"Authorization" withPredicate:v2];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = objc_loadWeakRetained((id *)(a1[5] + 8));
        [v11 deleteObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v12 = objc_loadWeakRetained((id *)(a1[5] + 8));
  uint64_t v14 = a1[6];
  uint64_t v13 = (uint64_t)(a1 + 6);
  uint64_t v15 = *(void *)(v14 + 8);
  id obj = *(id *)(v15 + 40);
  [v12 saveWithError:&obj rollbackOnFailure:1];
  objc_storeStrong((id *)(v15 + 40), obj);

  if (*(void *)(*(void *)(*(void *)v13 + 8) + 40))
  {
    uint64_t v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v13);
    }
  }
}

- (id)_csvStringFromSet:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 allObjects];
    id v5 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    id v5 = &stru_26C990120;
  }

  return v5;
}

- (id)_setFromCSVString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [v3 componentsSeparatedByString:@","];
    id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
  }

  return v5;
}

- (void)authorizationForClient:accountTypeWithIdentifier:.cold.1()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

void __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "\"Found %@ Authorization entities in DB. Taking the last one.\"", v4, 0xCu);
}

- (void)setAuthorization:forClient:onAccountType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"Client (%@) with no bundle ID passed to setAccessGranted! Ignoring...\"", v1, 0xCu);
}

- (void)setAuthorization:forClient:onAccountType:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Exiting - setAuthorizationForClient: %@\"", v2, v3, v4, v5, v6);
}

- (void)setAuthorization:forClient:onAccountType:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"Failed to set TCC state for: %@\"", v1, 0xCu);
}

void __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_4_1(a1) localizedDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_20(&dword_2183AD000, v2, v3, "\"Could not save new Authorization entity: %@\"", v4, v5, v6, v7, v8);
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Exiting - removeAuthorizationForClient: %@\"", v2, v3, v4, v5, v6);
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Failed to clear TCC state for %@\"", v2, v3, v4, v5, v6);
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.3()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

void __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [(id)OUTLINED_FUNCTION_4_1(a1) localizedDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_20(&dword_2183AD000, v2, v3, "\"Could not delete Authorization entities: %@\"", v4, v5, v6, v7, v8);
}

- (void)allAuthorizationsForAccountTypeWithIdentifier:(uint64_t)a3 .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Exiting - allAuthorizationsForAccountType: %@ found %@ results.\"", buf, 0x16u);
}

- (void)allAuthorizationsForAccountTypeWithIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

- (void)removeAllClientAuthorizationsForAccountTypeWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Exiting - removeAllClientAuthorizationsForAccountType: %@\"", v2, v3, v4, v5, v6);
}

- (void)removeAllClientAuthorizationsForAccountTypeWithIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

@end