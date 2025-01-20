@interface _BMXPCFileManager
- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4;
- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6;
- (BOOL)supportsPathWithDomain:(unint64_t)a3;
- (_BMXPCFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4 useCase:(id)a5 domain:(unint64_t)a6 user:(unsigned int)a7;
- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6;
- (id)_newConnection;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6;
- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4;
@end

@implementation _BMXPCFileManager

- (_BMXPCFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4 useCase:(id)a5 domain:(unint64_t)a6 user:(unsigned int)a7
{
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BMXPCFileManager;
  v13 = [(BMFileManager *)&v17 initWithDirectory:a3 cachingOptions:a4];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    useCase = v13->_useCase;
    v13->_useCase = (NSString *)v14;

    v13->_domain = a6;
    v13->_user = a7;
  }

  return v13;
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (v11)
  {
    v13 = [(_BMXPCFileManager *)self temporaryFileHandleWithProtection:v7 error:a6];
    uint64_t v14 = v13;
    if (v13 && [v13 overwriteWithData:v12 error:a6])
    {
      v15 = [(_BMXPCFileManager *)self replaceFileAtPath:v11 withFileHandle:v14 protection:v7 error:a6];
      LOBYTE(a6) = v15 != 0;
    }
    else
    {
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_BMXPCFileManager.m", 301, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

    v18 = __biome_log_for_category(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a6)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"Invalid path";
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a6 = [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v20];

      LOBYTE(a6) = 0;
    }
  }

  return (char)a6;
}

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v12 = _os_activity_create(&dword_1B30A0000, "_BMXPCFileManager.temporaryFileHandleWithProtection:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);
  unint64_t v27 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  do
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke;
    v14[3] = &unk_1E6022E50;
    v14[4] = &v15;
    uint64_t v7 = [(_BMXPCFileManager *)self _synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke_2;
    v13[3] = &unk_1E6023310;
    v13[4] = &v21;
    v13[5] = &v15;
    [v7 temporaryFileHandleWithProtection:v4 reply:v13];
  }
  while ((BMShouldRetry((void *)v16[5], &v27, 2uLL, 1) & 1) != 0);
  v8 = (void *)v16[5];
  if (v8)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v9 = (id)v22[5];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v9;
}

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v27 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v24 = _os_activity_create(&dword_1B30A0000, "_BMXPCFileManager.replaceFileAtPath:withFileHandle:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v24, &state);
  uint64_t v23 = v10;
  if (v10)
  {
    id v43 = 0;
    uint64_t v44 = 0;
    BOOL v11 = +[BMPaths getServiceDomain:&v44 subpath:&v43 forPath:v10];
    id v26 = v43;
    if (v11 && [(_BMXPCFileManager *)self supportsPathWithDomain:v44])
    {
      unint64_t v42 = 0;
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      id v41 = 0;
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__2;
      v34 = __Block_byref_object_dispose__2;
      id v35 = 0;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      do
      {
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke;
        v29[3] = &unk_1E6022E50;
        v29[4] = &v36;
        v13 = [(_BMXPCFileManager *)self _synchronousRemoteObjectProxyWithErrorHandler:v29];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke_2;
        v28[3] = &unk_1E6023310;
        v28[4] = &v30;
        v28[5] = &v36;
        [v13 replaceFileAtPath:v26 withFileHandle:v27 protection:v6 reply:v28];
      }
      while ((BMShouldRetry((void *)v37[5], &v42, 2uLL, 1) & 1) != 0);
      uint64_t v14 = (void *)v37[5];
      if (v14)
      {
        id v15 = 0;
        if (a6) {
          *a6 = v14;
        }
      }
      else
      {
        id v15 = (id)v31[5];
      }
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(&v36, 8);
    }
    else
    {
      if (a6)
      {
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        v47 = @"Unsupported path";
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a6 = [v16 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v17];
      }
      id v15 = 0;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_BMXPCFileManager.m", 336, @"Invalid parameter not satisfying: %@", @"path", 0, v24 object file lineNumber description];

    id v20 = __biome_log_for_category(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a6)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49[0] = @"Invalid path";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      *a6 = [v21 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v22];
    }
    id v15 = 0;
  }
  os_activity_scope_leave(&state);

  return v15;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  v57[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v30 = _os_activity_create(&dword_1B30A0000, "_BMXPCFileManager._fileHandleForFileAtPath:flags:protection:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v30, &state);
  v29 = v9;
  if (v9)
  {
    id v49 = 0;
    uint64_t v50 = 0;
    BOOL v10 = +[BMPaths getServiceDomain:&v50 subpath:&v49 forPath:v9];
    id v33 = v49;
    if (v10 && [(_BMXPCFileManager *)self supportsPathWithDomain:v50])
    {
      unint64_t v48 = 0;
      uint64_t v42 = 0;
      id v43 = &v42;
      uint64_t v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__2;
      uint64_t v46 = __Block_byref_object_dispose__2;
      id v47 = 0;
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      id v41 = 0;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      do
      {
        v35[0] = v11;
        v35[1] = 3221225472;
        v35[2] = __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke;
        v35[3] = &unk_1E6022E50;
        v35[4] = &v36;
        uint64_t v12 = [(_BMXPCFileManager *)self _synchronousRemoteObjectProxyWithErrorHandler:v35];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke_2;
        v34[3] = &unk_1E6023310;
        v34[4] = &v42;
        v34[5] = &v36;
        [v12 fileHandleForFileAtPath:v33 flags:v7 protection:v6 reply:v34];
      }
      while ((BMShouldRetry((void *)v37[5], &v48, 2uLL, 1) & 1) != 0);
      if (!v37[5] && ([(id)v43[5] fd] & 0x80000000) != 0)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        int v14 = [(id)v43[5] error];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v15 = objc_msgSend(NSString, "stringWithUTF8String:", strerror(objc_msgSend((id)v43[5], "error")));
        v53 = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        uint64_t v17 = [v13 errorWithDomain:*MEMORY[0x1E4F28798] code:v14 userInfo:v16];
        v18 = (void *)v37[5];
        v37[5] = v17;

        v19 = (void *)v43[5];
        v43[5] = 0;
      }
      id v20 = (void *)v37[5];
      if (v20)
      {
        id v21 = 0;
        if (a6) {
          *a6 = v20;
        }
      }
      else
      {
        id v21 = (id)v43[5];
      }
      _Block_object_dispose(&v36, 8);

      _Block_object_dispose(&v42, 8);
    }
    else
    {
      if (a6)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v55 = @"Unsupported path";
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        *a6 = [v22 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v23];
      }
      id v21 = 0;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_BMXPCFileManager.m", 138, @"Invalid parameter not satisfying: %@", @"path", 0, v30 object file lineNumber description];

    id v26 = __biome_log_for_category(2);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a6)
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57[0] = @"Invalid path";
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      *a6 = [v27 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v28];
    }
    id v21 = 0;
  }
  os_activity_scope_leave(&state);

  return v21;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  p_connectionWrapper = &self->_connectionWrapper;
  uint64_t v6 = self->_connectionWrapper;
  if (![(BMXPCConnectionWrapper *)v6 isValid])
  {
    uint64_t v7 = [(_BMXPCFileManager *)self _newConnection];

    objc_storeStrong((id *)p_connectionWrapper, v7);
    uint64_t v6 = v7;
  }
  if (!v6)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Failed to get or create BMXPCConnectionWrapper";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    int v14 = [v15 errorWithDomain:@"BiomeStorageError" code:7 userInfo:v8];
    v4[2](v4, v14);
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  v8 = [(BMXPCConnectionWrapper *)v6 connection];
  if (!v8)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25 = @"Failed to get connection from BMXPCConnectionWrapper";
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"BiomeStorageError" code:7 userInfo:v14];
    v4[2](v4, v17);

    goto LABEL_10;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67___BMXPCFileManager__synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v19[3] = &unk_1E6022E28;
  id v20 = v6;
  id v9 = v4;
  id v21 = v9;
  BOOL v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v19];
  if (!v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v23 = @"Failed to create remote object proxy";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v13 = [v11 errorWithDomain:@"BiomeStorageError" code:7 userInfo:v12];
    v9[2](v9, v13);
  }
  int v14 = v20;
LABEL_11:

  return v10;
}

- (BOOL)supportsPathWithDomain:(unint64_t)a3
{
  return self->_domain == a3;
}

- (id)_newConnection
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_connectionWrapper, 0);
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v20 = _os_activity_create(&dword_1B30A0000, "_BMXPCFileManager._removeFileAtPath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v20, &state);
  if (v6)
  {
    id v31 = 0;
    uint64_t v32 = 0;
    BOOL v7 = +[BMPaths getServiceDomain:&v32 subpath:&v31 forPath:v6];
    id v8 = v31;
    if (v7 && [(_BMXPCFileManager *)self supportsPathWithDomain:v32])
    {
      id v29 = 0;
      unint64_t v30 = 0;
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      id v27 = __Block_byref_object_copy__2;
      v28 = __Block_byref_object_dispose__2;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      do
      {
        v23[0] = v9;
        v23[1] = 3221225472;
        v23[2] = __45___BMXPCFileManager__removeFileAtPath_error___block_invoke;
        v23[3] = &unk_1E6022E50;
        v23[4] = &v24;
        BOOL v10 = [(_BMXPCFileManager *)self _synchronousRemoteObjectProxyWithErrorHandler:v23];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __45___BMXPCFileManager__removeFileAtPath_error___block_invoke_2;
        v22[3] = &unk_1E6022E50;
        v22[4] = &v24;
        [v10 removeFileAtPath:v8 reply:v22];
      }
      while ((BMShouldRetry((void *)v25[5], &v30, 2uLL, 1) & 1) != 0);
      uint64_t v11 = (void *)v25[5];
      BOOL v12 = v11 == 0;
      if (a4 && v11) {
        *a4 = v11;
      }
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      if (a4)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v35 = @"Unsupported path";
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a4 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v14];
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_BMXPCFileManager.m", 189, @"Invalid parameter not satisfying: %@", @"path", v20 object file lineNumber description];

    uint64_t v17 = __biome_log_for_category(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"Invalid path";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a4 = [v18 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v19];
    }
    BOOL v12 = 0;
  }
  os_activity_scope_leave(&state);

  return v12;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v20 = _os_activity_create(&dword_1B30A0000, "_BMXPCFileManager._removeDirectoryAtPath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v20, &state);
  if (v6)
  {
    id v31 = 0;
    uint64_t v32 = 0;
    BOOL v7 = +[BMPaths getServiceDomain:&v32 subpath:&v31 forPath:v6];
    id v8 = v31;
    if (v7 && [(_BMXPCFileManager *)self supportsPathWithDomain:v32])
    {
      id v29 = 0;
      unint64_t v30 = 0;
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      id v27 = __Block_byref_object_copy__2;
      v28 = __Block_byref_object_dispose__2;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      do
      {
        v23[0] = v9;
        v23[1] = 3221225472;
        v23[2] = __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke;
        v23[3] = &unk_1E6022E50;
        v23[4] = &v24;
        BOOL v10 = [(_BMXPCFileManager *)self _synchronousRemoteObjectProxyWithErrorHandler:v23];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke_2;
        v22[3] = &unk_1E6022E50;
        v22[4] = &v24;
        [v10 removeDirectoryAtPath:v8 reply:v22];
      }
      while ((BMShouldRetry((void *)v25[5], &v30, 2uLL, 1) & 1) != 0);
      uint64_t v11 = (void *)v25[5];
      BOOL v12 = v11 == 0;
      if (a4 && v11) {
        *a4 = v11;
      }
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      if (a4)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v35 = @"Unsupported path";
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a4 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v14];
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_BMXPCFileManager.m", 233, @"Invalid parameter not satisfying: %@", @"path", v20 object file lineNumber description];

    uint64_t v17 = __biome_log_for_category(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"Invalid path";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a4 = [v18 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v19];
    }
    BOOL v12 = 0;
  }
  os_activity_scope_leave(&state);

  return v12;
}

@end