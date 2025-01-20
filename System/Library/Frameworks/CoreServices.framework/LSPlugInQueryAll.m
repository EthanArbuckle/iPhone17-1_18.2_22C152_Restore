@interface LSPlugInQueryAll
- (BOOL)_remoteResolutionIsExpensive;
- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4;
@end

@implementation LSPlugInQueryAll

- (BOOL)_remoteResolutionIsExpensive
{
  return 1;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  v4 = 0;
  id v5 = 0;
  int v6 = 0;
  unint64_t v7 = 0x1EC08D000uLL;
  do
  {
    if (v5)
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v5;
        _os_log_error_impl(&dword_182959000, v8, OS_LOG_TYPE_ERROR, "failed batch fetch of all plugins, retrying: %@", buf, 0xCu);
      }
    }
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = (void *)[objc_alloc((Class)(v7 + 2280)) _init];
    v11 = [v9 setWithObject:v10];
    id v53 = 0;
    v12 = [v50 _resolveQueries:v11 XPCConnection:0 error:&v53];
    id v5 = v53;

    v13 = [v12 allValues];
    v14 = [v13 firstObject];
    v15 = [v14 firstObject];

    v16 = [v15 pluginUnits];
    v49 = v15;
    uint64_t v17 = [v15 dbUUID];
    v51 = (void *)v17;
    if (v16) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      v46 = v12;
      int v47 = v6;
      v48 = v4;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v16 count])
      {
        uint64_t v20 = 0;
        unsigned int v21 = 50;
        while (1)
        {
          v22 = (void *)MEMORY[0x18530F680]();
          uint64_t v23 = [v16 count];
          uint64_t v24 = (unint64_t)(v23 - v20) >= 0x32 ? 50 : v23 - v20;
          v25 = objc_msgSend(v16, "subarrayWithRange:", v20, v24);
          id v52 = 0;
          v26 = (void *)MEMORY[0x1E4F1CAD0];
          id v27 = v50;
          id v28 = v25;
          id v29 = v51;
          v30 = [[LSPlugInQueryWithUnits alloc] initWithPlugInUnits:v28 forDatabaseWithUUID:v29];

          v31 = [v26 setWithObject:v30];
          v32 = [v27 _resolveQueries:v31 XPCConnection:0 error:&v52];

          if (v32)
          {
            v33 = [v32 allValues];
            uint64_t v34 = [v33 firstObject];
            v35 = (void *)v34;
            v36 = (void *)MEMORY[0x1E4F1CBF0];
            if (v34) {
              v36 = (void *)v34;
            }
            id v37 = v36;
          }
          else
          {
            id v37 = 0;
          }

          id v38 = v52;
          if (!v37) {
            break;
          }
          [v19 addObjectsFromArray:v37];

          uint64_t v20 = v21;
          BOOL v39 = [v16 count] > (unint64_t)v21;
          v21 += 50;
          id v5 = v38;
          if (!v39) {
            goto LABEL_24;
          }
        }

        v4 = v48;
      }
      else
      {
        id v38 = v5;
LABEL_24:
        v4 = (void *)[v19 copy];
      }
      id v5 = v38;
      int v6 = v47;
      unint64_t v7 = 0x1EC08D000;
      v12 = v46;
    }
    if (v4)
    {
      char v40 = 1;
    }
    else if (_LSNSErrorIsXPCConnectionInterrupted(v5))
    {
      char v40 = 0;
    }
    else
    {
      v41 = [v5 domain];
      if ([v41 isEqual:@"LSApplicationWorkspaceErrorDomain"]) {
        BOOL v42 = [v5 code] == 114;
      }
      else {
        BOOL v42 = 0;
      }
      char v40 = !v42;
    }
    if (v40) {
      break;
    }
    ++v6;
  }
  while (v6 != 10);
  if (!v4)
  {
    v43 = _LSDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQueryAll resolveExpensiveQueryRemotelyUsingResolver:error:]((uint64_t)v5, v43);
    }

    if (a4) {
      *a4 = v5;
    }
  }

  return v4;
}

- (void)resolveExpensiveQueryRemotelyUsingResolver:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "failed batch fetch of all plugins, giving up: %@", (uint8_t *)&v2, 0xCu);
}

@end