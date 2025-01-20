@interface BMAccessServer
- (BMAccessDelegate)delegate;
- (BMAccessServer)initWithListener:(id)a3;
- (BOOL)_createDirectoryAtPath:(id)a3;
- (BOOL)_hasDirectoryAtPath:(id)a3;
- (BOOL)_removeDirectoryAtPath:(id)a3;
- (void)removeResource:(id)a3 reply:(id)a4;
- (void)requestAccessToResource:(id)a3 withMode:(unint64_t)a4 reply:(id)a5;
- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4;
- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation BMAccessServer

- (void)requestAccessToResource:(id)a3 withMode:(unint64_t)a4 reply:(id)a5
{
  v100[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F29268] currentConnection];
  v11 = -[NSXPCConnection bm_accessControlPolicy](v10);

  v12 = __biome_log_for_category(6);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v31 = [v11 process];
    v32 = [v31 identifier];
    v33 = BMAccessModePrintableDescription(a4);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v8;
    _os_log_debug_impl(&dword_1B30A0000, v12, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@ request for %{public}@ access to %{public}@", buf, 0x20u);
  }
  if (v8)
  {
    if ((a4 | 2) == 3)
    {
      if ([v11 allowsAccessToResource:v8 withMode:a4])
      {
        v13 = +[BMResourceContainerManager sharedInstance];
        id v78 = 0;
        v14 = [v13 openContainerForResource:v8 mode:a4 error:&v78];
        id v15 = v78;

        if (v14)
        {
          id v76 = +[BMPaths pathForResource:v8 inContainer:v14];
          if (![v76 length])
          {
            v34 = __biome_log_for_category(6);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[BMAccessServer requestAccessToResource:withMode:reply:]();
            }

            v35 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v91 = *MEMORY[0x1E4F28568];
            v92 = @"Failed to determine path for resource";
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            v37 = [v35 errorWithDomain:@"BMAccessErrorDomain" code:10 userInfo:v36];
            (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v37);

            goto LABEL_56;
          }
          if ([v8 type] != 1) {
            goto LABEL_15;
          }
          if (a4 == 1)
          {
            *(void *)&long long v79 = 0;
            *((void *)&v79 + 1) = &v79;
            *(void *)&long long v80 = 0x2020000000;
            v16 = (void (*)(void))getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1;
            *((void *)&v80 + 1) = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1;
            if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_1;
              *(void *)&buf[24] = &unk_1E60229E8;
              *(void *)&buf[32] = &v79;
              __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_1((uint64_t)buf);
              v16 = *(void (**)(void))(*((void *)&v79 + 1) + 24);
            }
            _Block_object_dispose(&v79, 8);
            if (!v16) {
              -[BMAccessServer requestAccessToResource:withMode:reply:]();
            }
            v17 = v16();
            v18 = [v8 name];
            v19 = [v17 streamWithIdentifier:v18 error:0];

            if (v19)
            {

LABEL_15:
              v20 = [(BMAccessServer *)self delegate];
              if (v20)
              {
                v21 = [(BMAccessServer *)self delegate];
                if (v21)
                {
                  v22 = [(BMAccessServer *)self delegate];
                  char v74 = [v22 handlesDirectoryCreationForResource:v8 inContainer:v14];

                  char v23 = v74 ^ 1;
                }
                else
                {
                  char v23 = 0;
                }
              }
              else
              {
                char v23 = 1;
              }

              char v41 = v23 ^ 1;
              if (!v76) {
                char v41 = 1;
              }
              if ((v41 & 1) == 0 && ![(BMAccessServer *)self _hasDirectoryAtPath:v76]) {
                [(BMAccessServer *)self _createDirectoryAtPath:v76];
              }
              v42 = [(BMAccessServer *)self delegate];

              if (v42
                && ([(BMAccessServer *)self delegate],
                    v43 = objc_claimAutoreleasedReturnValue(),
                    char v44 = [v43 prepareResource:v8 withMode:a4 inContainer:v14],
                    v43,
                    (v44 & 1) == 0))
              {
                v48 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v85 = *MEMORY[0x1E4F28568];
                v86 = @"Failed to prepare resource";
                v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
                v50 = [v48 errorWithDomain:@"BMAccessErrorDomain" code:11 userInfo:v49];
                (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v50);
              }
              else
              {
                if (a4 == 3) {
                  v45 = (uint64_t *)MEMORY[0x1E4F14008];
                }
                else {
                  v45 = (uint64_t *)MEMORY[0x1E4F14000];
                }
                id v76 = v76;
                uint64_t v75 = [v76 UTF8String];
                long long v79 = 0u;
                long long v80 = 0u;
                v46 = [v11 process];
                v47 = v46;
                if (v46)
                {
                  [v46 auditToken];
                }
                else
                {
                  long long v79 = 0u;
                  long long v80 = 0u;
                }

                uint64_t v51 = *v45;
                int v52 = *MEMORY[0x1E4F14120];
                *(_OWORD *)buf = v79;
                *(_OWORD *)&buf[16] = v80;
                v53 = (const char *)sandbox_extension_issue_file_to_process();
                v54 = __biome_log_for_category(6);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                {
                  if (v53)
                  {
                    v68 = "no error";
                  }
                  else
                  {
                    v67 = __error();
                    v68 = strerror(*v67);
                  }
                  *(_DWORD *)buf = 136447235;
                  *(void *)&buf[4] = v51;
                  *(_WORD *)&buf[12] = 2081;
                  *(void *)&buf[14] = v75;
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = v52;
                  *(_WORD *)&buf[28] = 2048;
                  *(void *)&buf[30] = v53;
                  *(_WORD *)&buf[38] = 2082;
                  v84 = v68;
                  _os_log_debug_impl(&dword_1B30A0000, v54, OS_LOG_TYPE_DEBUG, "sandbox_extension_issue_file_to_process(%{public}s, %{private}s, 0x%X, <audit token>) = %p, %{public}s", buf, 0x30u);
                }

                if (v53)
                {
                  v55 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v53 length:strlen(v53) + 1 freeWhenDone:1];
                  v56 = __biome_log_for_category(6);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    v69 = [v11 process];
                    v70 = [v69 identifier];
                    v71 = BMAccessModePrintableDescription(a4);
                    *(_DWORD *)buf = 138543875;
                    *(void *)&buf[4] = v70;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v71;
                    *(_WORD *)&buf[22] = 2113;
                    *(void *)&buf[24] = v8;
                    _os_log_debug_impl(&dword_1B30A0000, v56, OS_LOG_TYPE_DEBUG, "Granted %{public}@ request for %{public}@ access to %{private}@", buf, 0x20u);
                  }
                  (*((void (**)(id, void *, id, void *, void))v9 + 2))(v9, v14, v76, v55, 0);
                }
                else
                {
                  v57 = __biome_log_for_category(6);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    v72 = BMAccessModePrintableDescription(a4);
                    int v73 = *__error();
                    *(_DWORD *)buf = 138544131;
                    *(void *)&buf[4] = v72;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v8;
                    *(_WORD *)&buf[22] = 2113;
                    *(void *)&buf[24] = v76;
                    *(_WORD *)&buf[32] = 1026;
                    *(_DWORD *)&buf[34] = v73;
                    _os_log_error_impl(&dword_1B30A0000, v57, OS_LOG_TYPE_ERROR, "Unable to issue %{public}@ extension token to %{public}@ path %{private}@, error %{public, darwin.errno}d", buf, 0x26u);
                  }
                  id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v59 = *__error();
                  uint64_t v81 = *MEMORY[0x1E4F28568];
                  v60 = NSString;
                  v61 = __error();
                  v62 = [v60 stringWithUTF8String:strerror(*v61)];
                  v82 = v62;
                  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
                  v55 = (void *)[v58 initWithDomain:*MEMORY[0x1E4F28798] code:v59 userInfo:v63];

                  (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v55);
                }
              }
              goto LABEL_56;
            }
            v64 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v87 = *MEMORY[0x1E4F28568];
            v88 = @"Failed to look up stream resource";
            v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
            v66 = [v64 errorWithDomain:@"BMAccessErrorDomain" code:10 userInfo:v65];
            (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v66);
          }
          else
          {
            v38 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v89 = *MEMORY[0x1E4F28568];
            v90 = @"Invalid mode for stream resource";
            v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
            v40 = [v38 errorWithDomain:@"BMAccessErrorDomain" code:7 userInfo:v39];
            (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v40);
          }
LABEL_56:

          goto LABEL_57;
        }
        v28 = __biome_log_for_category(6);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[BMAccessServer requestAccessToResource:withMode:reply:]();
        }

        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v93 = *MEMORY[0x1E4F28568];
        v94 = @"Failed to open container for resource";
        id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        v30 = [v29 errorWithDomain:@"BMAccessErrorDomain" code:13 userInfo:v77];
        (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v30);
      }
      else
      {
        v26 = __biome_log_for_category(6);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[BMAccessServer requestAccessToResource:withMode:reply:].cold.4();
        }

        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v96 = @"Not entitled";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        v14 = [v27 errorWithDomain:@"BMAccessErrorDomain" code:3 userInfo:v15];
        (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v14);
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v97 = *MEMORY[0x1E4F28568];
      v98 = @"Unsupported access mode";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      v14 = [v25 errorWithDomain:@"BMAccessErrorDomain" code:7 userInfo:v15];
      (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v14);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v99 = *MEMORY[0x1E4F28568];
    v100[0] = @"Nil resource specifier";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:&v99 count:1];
    v14 = [v24 errorWithDomain:@"BMAccessErrorDomain" code:7 userInfo:v15];
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v14);
  }
LABEL_57:
}

- (BMAccessDelegate)delegate
{
  return self->_delegate;
}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void, void *))a5;
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  id v9 = -[NSXPCConnection bm_accessControlPolicy](v8);

  if (([v9 allowsConnectionToWriteService] & 1) == 0
    && ([v9 allowsConnectionToSetStoreUpdateService] & 1) == 0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Not entitled";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v12 = v14;
    uint64_t v13 = 3;
    goto LABEL_8;
  }
  if ([(BMAccessServiceListener *)self->_listener domain] != a3)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Wrong domain";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v12 = v11;
    uint64_t v13 = 7;
LABEL_8:
    id v15 = (void *)[v12 initWithDomain:@"BMAccessErrorDomain" code:v13 userInfo:v10];
    v7[2](v7, 0, v15);

    goto LABEL_9;
  }
  v10 = [(BMAccessServiceListener *)self->_listener uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:v9];
  if (v10)
  {
    ((void (**)(id, void *, void *))v7)[2](v7, v10, 0);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20 = @"Failed to get endpoint";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v18 = (void *)[v16 initWithDomain:@"BMAccessErrorDomain" code:0 userInfo:v17];
    v7[2](v7, 0, v18);
  }
LABEL_9:
}

- (BMAccessServer)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessServer;
  v6 = [(BMAccessServer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listener, a3);
  }

  return v7;
}

- (BOOL)_createDirectoryAtPath:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = __biome_log_for_category(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BMAccessServer _createDirectoryAtPath:]();
    }
  }
  return v5;
}

- (BOOL)_removeDirectoryAtPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  listener = self->_listener;
  id v4 = a3;
  char v5 = +[BMPaths biomeTemporaryDirectoryForDomain:[(BMAccessServiceListener *)listener domain]];
  id v6 = NSString;
  v7 = objc_opt_new();
  id v8 = [v7 UUIDString];
  id v9 = [v6 stringWithFormat:@".tmp.%@", v8];
  v10 = [v5 stringByAppendingPathComponent:v9];

  id v11 = v10;
  v12 = (const char *)[v11 cStringUsingEncoding:4];
  id v13 = v4;
  id v14 = (const char *)[v13 cStringUsingEncoding:4];

  LODWORD(v8) = renamex_np(v14, v12, 4u);
  id v15 = __biome_log_for_category(17);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v16) {
      -[BMAccessServer _removeDirectoryAtPath:]();
    }
    char v17 = 0;
  }
  else
  {
    if (v16) {
      [(BMAccessServer *)(uint64_t)v12 _removeDirectoryAtPath:v15];
    }

    v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    char v17 = [v18 removeItemAtPath:v11 error:&v22];
    id v15 = v22;

    uint64_t v19 = __biome_log_for_category(6);
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_impl(&dword_1B30A0000, v20, OS_LOG_TYPE_DEFAULT, "Successfully removed folder at %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[BMAccessServer _removeDirectoryAtPath:]();
    }
  }
  return v17;
}

- (BOOL)_hasDirectoryAtPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  char v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (void)removeResource:(id)a3 reply:(id)a4
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  id v9 = -[NSXPCConnection bm_accessControlPolicy](v8);

  v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BMAccessServer removeResource:reply:].cold.4(v9, (uint64_t)v6, v10);
  }

  if (!v6)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    v67[0] = @"Nil resource specifier";
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = (__CFString **)v67;
    id v24 = &v66;
LABEL_15:
    id v15 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    uint64_t v25 = v21;
    uint64_t v26 = 7;
    goto LABEL_16;
  }
  if ([v6 type] != 4)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    v65 = @"Invalid resource type";
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = &v65;
    id v24 = &v64;
    goto LABEL_15;
  }
  id v11 = [v9 process];
  uint64_t v12 = [v11 processType];

  if (v12 != 5)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v63 = @"Invalid process type";
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = &v63;
    id v24 = &v62;
    goto LABEL_15;
  }
  if ([v9 allowsAccessToResource:v6 withMode:2])
  {
    id v13 = +[BMResourceContainerManager sharedInstance];
    id v47 = 0;
    id v14 = [v13 openContainerForResource:v6 mode:3 error:&v47];
    id v15 = v47;

    if (!v14)
    {
      v29 = __biome_log_for_category(6);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[BMAccessServer requestAccessToResource:withMode:reply:]();
      }

      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      uint64_t v59 = @"Failed to open container for resource";
      BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      v31 = [v30 errorWithDomain:@"BMAccessErrorDomain" code:13 userInfo:v16];
      v7[2](v7, 0, v31);

      goto LABEL_43;
    }
    BOOL v16 = +[BMPaths pathForResource:v6 inContainer:v14];
    if ([v16 length])
    {
      char v17 = [(BMAccessServer *)self delegate];
      if (v17)
      {
        v18 = [(BMAccessServer *)self delegate];
        if (v18)
        {
          [(BMAccessServer *)self delegate];
          uint64_t v19 = v46 = v16;
          int v20 = [v19 handlesDirectoryRemovalForResource:v6 inContainer:v14] ^ 1;

          BOOL v16 = v46;
        }
        else
        {
          int v20 = 0;
        }
      }
      else
      {
        int v20 = 1;
      }

      if (v16
        && v20
        && [(BMAccessServer *)self _hasDirectoryAtPath:v16]
        && ![(BMAccessServer *)self _removeDirectoryAtPath:v16])
      {
        char v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v55 = @"Failed to clean up directory";
        v42 = (void *)MEMORY[0x1E4F1C9E8];
        v43 = &v55;
        char v44 = &v54;
      }
      else
      {
        v37 = [(BMAccessServer *)self delegate];

        if (!v37
          || ([(BMAccessServer *)self delegate],
              v38 = objc_claimAutoreleasedReturnValue(),
              char v39 = [v38 teardownResource:v6 inContainer:v14],
              v38,
              (v39 & 1) != 0))
        {
          v40 = __biome_log_for_category(6);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v49 = v16;
            __int16 v50 = 2112;
            id v51 = v6;
            _os_log_impl(&dword_1B30A0000, v40, OS_LOG_TYPE_DEFAULT, "Successfully removed path: %@ for resource: %@", buf, 0x16u);
          }

          v7[2](v7, 1, 0);
          goto LABEL_43;
        }
        char v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v53 = @"Failed to teardown resource";
        v42 = (void *)MEMORY[0x1E4F1C9E8];
        v43 = &v53;
        char v44 = &v52;
      }
      v34 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
      v35 = v41;
      uint64_t v36 = 0;
    }
    else
    {
      v32 = __biome_log_for_category(6);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[BMAccessServer removeResource:reply:]();
      }

      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57 = @"Failed to determine path for resource";
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v35 = v33;
      uint64_t v36 = 10;
    }
    v45 = [v35 errorWithDomain:@"BMAccessErrorDomain" code:v36 userInfo:v34];
    v7[2](v7, 0, v45);

LABEL_43:
    goto LABEL_17;
  }
  v27 = __biome_log_for_category(6);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[BMAccessServer removeResource:reply:]();
  }

  v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v60 = *MEMORY[0x1E4F28568];
  v61 = @"Not entitled";
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  uint64_t v25 = v28;
  uint64_t v26 = 3;
LABEL_16:
  id v14 = [v25 errorWithDomain:@"BMAccessErrorDomain" code:v26 userInfo:v15];
  v7[2](v7, 0, v14);
LABEL_17:
}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  v7 = [MEMORY[0x1E4F29268] currentConnection];
  id v8 = -[NSXPCConnection bm_accessControlPolicy](v7);

  if (([v8 allowsProxyingBiomeEndpoint] & 1) == 0)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Not entitled";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v11 = v10;
    uint64_t v12 = 3;
LABEL_7:
    id v14 = (void *)[v11 initWithDomain:@"BMAccessErrorDomain" code:v12 userInfo:v9];
    v6[2](v6, 0, v14);

    goto LABEL_8;
  }
  if (((([(BMAccessServiceListener *)self->_listener domain] != 1) ^ v4) & 1) == 0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = @"Wrong domain";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v11 = v13;
    uint64_t v12 = 7;
    goto LABEL_7;
  }
  id v9 = [(BMAccessServiceListener *)self->_listener endpointForCoreDuetUseCases];
  if (v9)
  {
    ((void (**)(id, void *, void *))v6)[2](v6, v9, 0);
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"Failed to get endpoint";
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    char v17 = (void *)[v15 initWithDomain:@"BMAccessErrorDomain" code:0 userInfo:v16];
    v6[2](v6, 0, v17);
  }
LABEL_8:
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_createDirectoryAtPath:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  [MEMORY[0x1E4F93B10] isUnlocked];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_2(&dword_1B30A0000, v0, v1, "Can't create folder at %@ with error %@, isUnlocked: %hhd", v2, v3, v4, v5, v6);
}

- (void)_removeDirectoryAtPath:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  [MEMORY[0x1E4F93B10] isUnlocked];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_2(&dword_1B30A0000, v0, v1, "Can't remove folder at %@ with error %@, isUnlocked: %hhd", v2, v3, v4, v5, v6);
}

- (void)_removeDirectoryAtPath:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "Successfully renamed directory at path %s into %s", (uint8_t *)&v3, 0x16u);
}

- (void)_removeDirectoryAtPath:.cold.3()
{
  OUTLINED_FUNCTION_4_2();
  __error();
  OUTLINED_FUNCTION_2_2(&dword_1B30A0000, v0, v1, "Could not rename directory at path %s into %s with error: %d", v2, v3, v4, v5, 2u);
}

- (void)requestAccessToResource:withMode:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed to open container, path is therefore not known and we cannot issue sandbox extension", v2, v3, v4, v5, v6);
}

- (void)requestAccessToResource:withMode:reply:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed to determine path, will not issue sandbox extension", v2, v3, v4, v5, v6);
}

- (void)requestAccessToResource:withMode:reply:.cold.3()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAccessServer.m", 30, @"%s", dlerror());

  __break(1u);
}

- (void)requestAccessToResource:withMode:reply:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed entitlement check, will not issue sandbox extension", v2, v3, v4, v5, v6);
}

- (void)removeResource:reply:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed to determine path, will not perform deletion", v2, v3, v4, v5, v6);
}

- (void)removeResource:reply:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed entitlement check, will not perform deletion", v2, v3, v4, v5, v6);
}

- (void)removeResource:(NSObject *)a3 reply:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 process];
  uint8_t v6 = [v5 identifier];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@ request for removal of %{public}@", (uint8_t *)&v7, 0x16u);
}

@end