@interface _LSLocalQueryResolver
- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5;
@end

@implementation _LSLocalQueryResolver

- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
  int v11 = v10;
  if (v7) {
    int v12 = v10;
  }
  else {
    int v12 = 0;
  }
  if (v12 != 1) {
    goto LABEL_15;
  }
  v13 = (void *)MEMORY[0x18530F680]();
  id v42 = 0;
  v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v42];
  id v15 = v42;
  if (!v14)
  {
    v18 = _LSDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]((uint64_t)v15, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_13;
  }
  id v41 = v15;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28DC0], "ls_unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v41);
  id v17 = v41;

  if (!v16)
  {
    v18 = _LSDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]((uint64_t)v17, v18, v25, v26, v27, v28, v29, v30);
    }
    id v7 = 0;
    id v15 = v17;
LABEL_13:

    goto LABEL_14;
  }
  id v15 = v17;
  id v7 = (id)v16;
LABEL_14:

LABEL_15:
  if (!v7 || ![v7 _requiresDatabaseMappingEntitlement]) {
    goto LABEL_27;
  }
  if (v8)
  {
    v31 = [v8 _xpcConnection];
    BOOL v32 = _LSXPCConnectionMayMapDatabase(v31) == 0;
  }
  else
  {
    BOOL v32 = 0;
  }
  if (((v32 | v11 ^ 1) & 1) == 0) {
    BOOL v32 = +[_LSQueryContext simulateLimitedMappingForXCTests];
  }
  if (!v32) {
    goto LABEL_27;
  }
  if ([v7 isLegacy])
  {
    v33 = _LSDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = [v8 processIdentifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v34;
      _os_log_impl(&dword_182959000, v33, OS_LOG_TYPE_DEFAULT, "Unentitled query %{public}@ issued from pid %i. Allowing due to legacy SPI.", buf, 0x12u);
    }

LABEL_27:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v46 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke;
    v38[3] = &unk_1E52304B0;
    v40 = buf;
    id v39 = v9;
    [v7 _enumerateWithXPCConnection:v8 block:v38];
    v35 = v39;
    goto LABEL_28;
  }
  v36 = _LSDefaultLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]((uint64_t)v7, v47, [v8 processIdentifier], v36);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v46 = 0;
  uint64_t v43 = *MEMORY[0x1E4F28228];
  v44 = @"Query not allowed";
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v35 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]", 308, v37);

  (*((void (**)(id, void, void *, uint64_t))v9 + 2))(v9, 0, v35, *(void *)&buf[8] + 24);
LABEL_28:

  _Block_object_dispose(buf, 8);
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    id v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v7);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v17 = *(void *)v35;
    id v16 = 0;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * v9);
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__44;
      BOOL v32 = __Block_byref_object_dispose__44;
      id v33 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3032000000;
      uint64_t v25 = __Block_byref_object_copy__44;
      uint64_t v26 = __Block_byref_object_dispose__44;
      id v27 = 0;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke;
      v21[3] = &unk_1E5230488;
      v21[4] = &v28;
      v21[5] = &v22;
      [(_LSLocalQueryResolver *)self _enumerateResolvedResultsOfQuery:v10 XPCConnection:v19 withBlock:v21];
      uint64_t v11 = v29[5];
      if (v11)
      {
        [v20 setObject:v29[5] forKeyedSubscript:v10];
      }
      else
      {

        id v12 = (id)v23[5];
        id v20 = 0;
        id v16 = v12;
      }
      _Block_object_dispose(&v22, 8);

      _Block_object_dispose(&v28, 8);
      if (!v11) {
        break;
      }
      if (v8 == ++v9)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  if (a5 && !v20) {
    *a5 = v16;
  }

  return v20;
}

- (void)_enumerateResolvedResultsOfQuery:(int)a3 XPCConnection:(os_log_t)log withBlock:.cold.1(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Unentitled query %{public}@ issued from pid %i. Disallowing and yielding an error.", buf, 0x12u);
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a3 XPCConnection:(uint64_t)a4 withBlock:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a3 XPCConnection:(uint64_t)a4 withBlock:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end