@interface _LAKeyStoreBackendFake
- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4;
- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4;
- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4;
- (_LAKeyStoreBackendFake)init;
- (id)fetchItemWithQuery:(id)a3 error:(id *)a4;
- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4;
@end

@implementation _LAKeyStoreBackendFake

- (_LAKeyStoreBackendFake)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LAKeyStoreBackendFake;
  v2 = [(_LAKeyStoreBackendFake *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v4 = [MEMORY[0x1E4F1CC08] mutableCopy];
    keys = v2->_keys;
    v2->_keys = (NSMutableDictionary *)v4;

    uint64_t v6 = [v3 mutableCopy];
    genps = v2->_genps;
    v2->_genps = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFErrorRef error = 0;
  uint64_t v7 = *MEMORY[0x1E4F3BC18];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3BC18]];
  uint64_t v9 = *MEMORY[0x1E4F3B5E0];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3B5E0]];

  v11 = [v6 objectForKeyedSubscript:v7];
  uint64_t v12 = *MEMORY[0x1E4F3B548];
  v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke;
  v33[3] = &unk_1E63C4DB8;
  id v14 = v6;
  id v34 = v14;
  __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke((uint64_t)v33);
  CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v16 = SecKeyCreateRandomKey(v15, &error);
  CFErrorRef v17 = error;
  if (!error)
  {
    v29 = self;
    CFDictionaryRef v19 = SecKeyCopyAttributes(v16);
    v20 = (void *)[(__CFDictionary *)v19 mutableCopy];

    if (v20 && [v20 count])
    {
      uint64_t v21 = *MEMORY[0x1E4F3B788];
      v22 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
      [v20 setObject:v22 forKeyedSubscript:v21];

      [v20 setObject:v10 forKeyedSubscript:v9];
      [v20 setObject:v13 forKeyedSubscript:v12];
      [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];

      v23 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2;
      v30[3] = &unk_1E63C4DE0;
      v30[4] = v29;
      id v31 = v23;
      id v32 = v20;
      id v24 = v23;
      v25 = __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2(v30);
      [(NSMutableDictionary *)v29->_keys setObject:v25 forKeyedSubscript:v24];

      BOOL v18 = 1;
    }
    else
    {
      if (v16) {
        CFRelease(v16);
      }
      v26 = [NSString stringWithFormat:@"Key creation failed for query %@", v14];
      v27 = +[LAAuthorizationError genericErrorWithMessage:v26];

      BOOL v18 = 0;
      if (!a4 || !v27) {
        goto LABEL_16;
      }
      id v24 = [NSString stringWithFormat:@"Key creation failed for query %@", v14];
      +[LAAuthorizationError genericErrorWithMessage:v24];
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    goto LABEL_17;
  }
  if (v16)
  {
    CFRelease(v16);
    CFErrorRef v17 = error;
  }
  BOOL v18 = 0;
  if (a4 && v17)
  {
    BOOL v18 = 0;
    *a4 = v17;
  }
LABEL_17:

  return v18;
}

- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke;
  v11[3] = &unk_1E63C4DE0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke(v11);
  [(NSMutableDictionary *)self->_genps setObject:v9 forKeyedSubscript:v8];

  return 1;
}

- (id)fetchItemWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F3B988]];

  if (v9)
  {
    v55 = a4;
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
    id v58 = v6;
    v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v53 = self;
    v60 = (void *)v10;
    id v12 = [(NSMutableDictionary *)self->_genps objectForKeyedSubscript:v10];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v75;
      uint64_t v16 = *MEMORY[0x1E4F3B5C0];
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v75 != v15) {
            objc_enumerationMutation(v12);
          }
          BOOL v18 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          CFDictionaryRef v19 = [v18 objectForKeyedSubscript:v16];
          char v20 = [v19 isEqualToString:v11];

          if (v20)
          {
            id v35 = v18;

            id v6 = v58;
LABEL_45:

            goto LABEL_46;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v74 objects:v81 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    a4 = v55;
    id v6 = v58;
    self = v53;
  }
  uint64_t v21 = [v6 objectForKeyedSubscript:v7];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F3B9A0]];

  if (v22)
  {
    uint64_t v23 = *MEMORY[0x1E4F3B788];
    v60 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
    if (v60)
    {
      id v24 = [NSString alloc];
      v25 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B5E0]];
      v26 = (void *)[v24 initWithData:v25 encoding:4];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v27 = [(NSMutableDictionary *)self->_keys objectForKeyedSubscript:v26];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        v56 = a4;
        uint64_t v30 = *(void *)v71;
        while (2)
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v71 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            v33 = [v32 objectForKeyedSubscript:v23];
            char v34 = [v33 isEqualToString:v60];

            if (v34)
            {
              id v35 = v32;
              goto LABEL_44;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v29) {
            continue;
          }
          break;
        }
        a4 = v56;
      }
    }
    else
    {
      uint64_t v36 = *MEMORY[0x1E4F3B5D0];
      v26 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B5D0]];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v27 = [(NSMutableDictionary *)self->_keys allValues];
      uint64_t v52 = [v27 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (v52)
      {
        uint64_t v37 = *(void *)v67;
        v57 = a4;
        id v59 = v6;
        uint64_t v51 = *(void *)v67;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v67 != v37) {
              objc_enumerationMutation(v27);
            }
            uint64_t v54 = v38;
            v39 = *(void **)(*((void *)&v66 + 1) + 8 * v38);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v40 = v39;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v78 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v63;
              while (2)
              {
                for (uint64_t k = 0; k != v42; ++k)
                {
                  if (*(void *)v63 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  v45 = *(void **)(*((void *)&v62 + 1) + 8 * k);
                  v46 = [v45 objectForKeyedSubscript:v36];
                  char v47 = [v46 isEqualToData:v26];

                  if (v47)
                  {
                    id v35 = v45;

                    id v6 = v59;
LABEL_44:

                    goto LABEL_45;
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v62 objects:v78 count:16];
                if (v42) {
                  continue;
                }
                break;
              }
            }

            uint64_t v38 = v54 + 1;
            a4 = v57;
            id v6 = v59;
            uint64_t v37 = v51;
          }
          while (v54 + 1 != v52);
          uint64_t v52 = [v27 countByEnumeratingWithState:&v66 objects:v79 count:16];
        }
        while (v52);
      }
    }
  }
  v48 = [NSString stringWithFormat:@"No results for query %@", v6];
  v49 = +[LAAuthorizationError resourceNotFoundWithMessage:v48];

  id v35 = (id)MEMORY[0x1E4F1CC08];
  if (a4 && v49)
  {
    v61 = [NSString stringWithFormat:@"No results for query %@", v6];
    +[LAAuthorizationError resourceNotFoundWithMessage:](LAAuthorizationError, "resourceNotFoundWithMessage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_46:

  return v35;
}

- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F3B988]];

  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
    v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    genps = self->_genps;
    if (!v10)
    {
      uint64_t v13 = [(NSMutableDictionary *)genps allValues];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke;
      v27[3] = &unk_1E63C4E08;
      id v28 = v11;
      [v13 enumerateObjectsUsingBlock:v27];

      uint64_t v14 = v28;
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_8;
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:v7];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F3B9A0]];

  if (v16)
  {
    id v17 = [NSString alloc];
    BOOL v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B5E0]];
    uint64_t v10 = (void *)[v17 initWithData:v18 encoding:4];

    v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (!v10 || ![v10 length])
    {
      uint64_t v23 = [(NSMutableDictionary *)self->_keys allValues];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke_2;
      v25[3] = &unk_1E63C4E08;
      id v26 = v11;
      [v23 enumerateObjectsUsingBlock:v25];

      uint64_t v14 = v26;
      goto LABEL_13;
    }
    genps = self->_keys;
LABEL_8:
    CFDictionaryRef v19 = [(NSMutableDictionary *)genps objectForKeyedSubscript:v10];
    [v11 addObjectsFromArray:v19];

LABEL_14:
    goto LABEL_15;
  }
  char v20 = [NSString stringWithFormat:@"Invalid fetch query %@", v6];
  uint64_t v21 = +[LAAuthorizationError genericErrorWithMessage:v20];

  v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (a4 && v21)
  {
    int v22 = [NSString stringWithFormat:@"Invalid fetch query %@", v6];
    *a4 = +[LAAuthorizationError genericErrorWithMessage:v22];

    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_15:

  return v11;
}

- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F3B988]];

  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
    genps = self->_genps;
    if (!v10) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  id v12 = [v6 objectForKeyedSubscript:v7];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F3B9A0]];

  if (v13)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B5E0]];
    uint64_t v10 = (void *)[v14 initWithData:v15 encoding:4];

    if (!v10 || ![v10 length])
    {
      genps = self->_keys;
LABEL_13:
      [(NSMutableDictionary *)genps removeAllObjects];
      goto LABEL_14;
    }
    genps = self->_keys;
LABEL_8:
    int v16 = [(NSMutableDictionary *)genps objectForKeyedSubscript:v10];
    [v16 removeAllObjects];

LABEL_14:
    BOOL v19 = 1;
    goto LABEL_15;
  }
  id v17 = [NSString stringWithFormat:@"Invalid remove query %@", v6];
  BOOL v18 = +[LAAuthorizationError genericErrorWithMessage:v17];

  BOOL v19 = 0;
  if (a4 && v18)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid remove query %@", v6];
    +[LAAuthorizationError genericErrorWithMessage:v10];
    BOOL v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genps, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end