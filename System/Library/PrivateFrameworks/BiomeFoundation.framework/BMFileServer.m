@interface BMFileServer
- (BMFileServer)initWithDirectory:(id)a3;
- (BOOL)entitledToAccessClientCompute:(id)a3 error:(id *)a4;
- (BOOL)entitledToAccessSharedSyncWithError:(id *)a3;
- (BOOL)entitledToAccessStream:(id)a3 withMode:(int)a4 error:(id *)a5;
- (BOOL)isBiomeSyncDaemon;
- (id)currentUseCase;
- (void)createDirectoryAtPath:(id)a3 reply:(id)a4;
- (void)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 reply:(id)a6;
- (void)removeDirectoryAtPath:(id)a3 reply:(id)a4;
- (void)removeFileAtPath:(id)a3 reply:(id)a4;
- (void)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 reply:(id)a6;
- (void)temporaryFileHandleWithProtection:(int)a3 reply:(id)a4;
@end

@implementation BMFileServer

- (id)currentUseCase
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  v3 = -[NSXPCConnection bm_accessControlPolicy](v2);
  v4 = [v3 useCase];

  return v4;
}

- (void)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 reply:(id)a6
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a6;
  v13 = BMFileServerValidateAndParsePath(v10);
  if (v13)
  {
    uint64_t v69 = [(NSString *)self->_directory stringByAppendingPathComponent:v10];
    v14 = __biome_log_for_category(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v88 = v10;
      _os_log_impl(&dword_1B30A0000, v14, OS_LOG_TYPE_INFO, "-replaceFileAtPath:withFileHandle:protection:reply: called with subpath: %{public}@", buf, 0xCu);
    }

    v15 = [v13 objectForKeyedSubscript:@"pathType"];
    int v16 = [v15 isEqual:@"streams"];

    if (v16)
    {
      v17 = [v13 objectForKeyedSubscript:@"subscriptions"];

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        v86 = @"Client processes not allowed read-write access to subscriptions substream";
        id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v20 = v18;
        uint64_t v21 = 5;
LABEL_38:
        v53 = [v20 errorWithDomain:@"BiomeStorageError" code:v21 userInfo:v19];
        v12[2](v12, 0, v53);

        goto LABEL_41;
      }
      int v68 = a5;
      v27 = [v13 objectForKeyedSubscript:@"stream"];
      v72 = 0;
      BOOL v28 = [(BMFileServer *)self entitledToAccessStream:v27 withMode:2 error:&v72];
      v29 = v72;
LABEL_20:
      id v19 = v29;

      if (v28) {
        goto LABEL_21;
      }
LABEL_26:
      v12[2](v12, 0, v19);
LABEL_41:
      v24 = (void *)v69;
      goto LABEL_42;
    }
    v25 = [v13 objectForKeyedSubscript:@"pathType"];
    int v26 = [v25 isEqual:@"compute"];

    if (v26)
    {
      int v68 = a5;
      v27 = [v13 objectForKeyedSubscript:@"clientIdentifier"];
      v71 = 0;
      BOOL v28 = [(BMFileServer *)self entitledToAccessClientCompute:v27 error:&v71];
      v29 = v71;
      goto LABEL_20;
    }
    v30 = [v13 objectForKeyedSubscript:@"pathType"];
    int v31 = [v30 isEqual:@"sharedSync"];

    if (!v31)
    {
      v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      v84 = @"Invalid request";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      v20 = v52;
      uint64_t v21 = 3;
      goto LABEL_38;
    }
    int v68 = a5;
    v32 = [v13 objectForKeyedSubscript:@"stream"];
    id v70 = 0;
    BOOL v33 = [(BMFileServer *)self entitledToAccessStream:v32 withMode:2 error:&v70];
    id v19 = v70;

    if (!v33) {
      goto LABEL_26;
    }
    v34 = [v13 objectForKeyedSubscript:@"deviceType"];
    v35 = +[BMStoreDirectory remoteDevices];
    if ([v34 isEqual:v35])
    {
      [v13 objectForKeyedSubscript:@"segment"];
      v36 = v66 = v34;

      if (v68 == 6 || !v36)
      {
LABEL_21:
        id v67 = v11;
        v37 = objc_msgSend(v13, "objectForKeyedSubscript:", @"streamType", v10);
        if ([v37 unsignedIntegerValue] == 1)
        {
          v38 = [v13 objectForKeyedSubscript:@"stream"];
          int64_t v39 = +[BMPublicStreamUtilities streamForStreamIdentifier:v38];

          if (!v39)
          {
            v40 = __biome_log_for_category(6);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
            }

            v41 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v81 = *MEMORY[0x1E4F28568];
            v82 = @"Invalid stream identifier";
            v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
            v43 = [v41 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v42];
            v12[2](v12, 0, v43);

            id v10 = v65;
            id v11 = v67;
            goto LABEL_41;
          }
        }
        else
        {
        }
        v44 = [v13 objectForKeyedSubscript:@"pathType"];
        id v10 = v65;
        if ([v44 isEqual:@"streams"])
        {
          v45 = [v13 objectForKeyedSubscript:@"metadata"];
          v46 = +[BMStoreDirectory metadata];
          if (![v45 isEqual:v46])
          {
            v59 = [v13 objectForKeyedSubscript:@"segment"];

            if (!v59)
            {
              v60 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v79 = *MEMORY[0x1E4F28568];
              v80 = @"Invalid file";
              v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
              v56 = v60;
              uint64_t v57 = 5;
              goto LABEL_40;
            }
LABEL_32:
            if ((v68 + 1) < 9)
            {
              fileManager = self->_fileManager;
              id v11 = v67;
              if (fileManager)
              {
                v24 = (void *)v69;
                uint64_t v48 = -[BMFileManager replaceFileAtPath:withFileHandle:protection:error:](fileManager, "replaceFileAtPath:withFileHandle:protection:error:", v69, v67);
                uint64_t v49 = (uint64_t)v19;

                if (!(v48 | v49))
                {
                  v50 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v73 = *MEMORY[0x1E4F28568];
                  v74 = @"Unspecified failure";
                  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                  id v11 = v67;
                  uint64_t v49 = [v50 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v51];
                }
                v12[2](v12, v48, (void *)v49);

                id v19 = (id)v49;
              }
              else
              {
                v61 = __biome_log_for_category(6);
                v24 = (void *)v69;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                  -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
                }

                v62 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v75 = *MEMORY[0x1E4F28568];
                v76 = @"Internal failure";
                v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
                v64 = [v62 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v63];
                v12[2](v12, 0, v64);

                id v11 = v67;
              }
              goto LABEL_42;
            }
            v54 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v77 = *MEMORY[0x1E4F28568];
            v78 = @"Invalid protection class";
            v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            v56 = v54;
            uint64_t v57 = 2;
LABEL_40:
            v58 = [v56 errorWithDomain:@"BiomeStorageError" code:v57 userInfo:v55];
            v12[2](v12, 0, v58);

            id v11 = v67;
            goto LABEL_41;
          }
        }
        goto LABEL_32;
      }
      v34 = __biome_log_for_category(6);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.4();
      }
    }
    else
    {
    }
    goto LABEL_21;
  }
  v22 = __biome_log_for_category(6);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[BMFileServer replaceFileAtPath:withFileHandle:protection:reply:]();
  }

  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v89 = *MEMORY[0x1E4F28568];
  v90[0] = @"Invalid path";
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
  id v19 = [v23 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v24];
  v12[2](v12, 0, v19);
LABEL_42:
}

- (void)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v101[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void, void *))a6;
  v12 = BMFileServerValidateAndParsePath(v10);
  if (!v12)
  {
    v24 = __biome_log_for_category(6);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
    }

    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v100 = *MEMORY[0x1E4F28568];
    v101[0] = @"Invalid path";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:&v100 count:1];
    v17 = [v25 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v13];
    goto LABEL_15;
  }
  v13 = [(NSString *)self->_directory stringByAppendingPathComponent:v10];
  v14 = __biome_log_for_category(6);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v99 = v10;
    _os_log_impl(&dword_1B30A0000, v14, OS_LOG_TYPE_INFO, "-fileHandleForFileAtPath:flags:protection:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  if ((v8 & 0x9EEF7CFD) != 0 || (v8 & 0x40100000) == 0x40000000)
  {
    int v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v96 = *MEMORY[0x1E4F28568];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid flags: %#X", v8);
    v97 = v17;
    v27 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v28 = (__CFString **)&v97;
    v29 = &v96;
LABEL_17:
    v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    int v31 = v26;
    uint64_t v32 = 2;
LABEL_18:
    BOOL v33 = [v31 errorWithDomain:@"BiomeStorageError" code:v32 userInfo:v30];
    v11[2](v11, 0, v33);

    goto LABEL_59;
  }
  if ((v7 + 1) >= 9)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v94 = *MEMORY[0x1E4F28568];
    v95 = @"Invalid protection class";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    v35 = v34;
    uint64_t v36 = 2;
    goto LABEL_20;
  }
  unsigned int v72 = v8 & 0xDEFFFEFF | 0x21000000;
  v15 = [v12 objectForKeyedSubscript:@"pathType"];
  int v16 = [v15 isEqual:@"streams"];

  if (!v16)
  {
    v38 = [v12 objectForKeyedSubscript:@"pathType"];
    int v39 = [v38 isEqual:@"compute"];

    if (v39)
    {
      v40 = [v12 objectForKeyedSubscript:@"clientIdentifier"];
      id v76 = 0;
      BOOL v41 = [(BMFileServer *)self entitledToAccessClientCompute:v40 error:&v76];
      v17 = v76;

      if (v41) {
        goto LABEL_49;
      }
LABEL_15:
      v11[2](v11, 0, v17);
      goto LABEL_59;
    }
    v44 = [v12 objectForKeyedSubscript:@"pathType"];
    int v45 = [v44 isEqual:@"sharedSync"];

    if (v45)
    {
      v46 = [v12 objectForKeyedSubscript:@"stream"];

      if (v46)
      {
        v47 = [v12 objectForKeyedSubscript:@"stream"];
        id v75 = 0;
        BOOL v48 = [(BMFileServer *)self entitledToAccessStream:v47 withMode:v72 error:&v75];
        v17 = v75;

        if (!v48) {
          goto LABEL_15;
        }
LABEL_28:
        uint64_t v49 = [v12 objectForKeyedSubscript:@"deviceType"];
        v50 = +[BMStoreDirectory remoteDevices];
        if ([v49 isEqual:v50])
        {
          v51 = [v12 objectForKeyedSubscript:@"segment"];

          if (v7 == 6 || !v51) {
            goto LABEL_49;
          }
          uint64_t v49 = __biome_log_for_category(6);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.4();
          }
        }
        else
        {
        }
        goto LABEL_48;
      }
      v59 = [v12 objectForKeyedSubscript:@"generation"];

      if (!v59)
      {
        id v74 = 0;
        uint64_t v71 = [(BMFileServer *)self entitledToAccessSharedSyncWithError:&v74];
        v17 = v74;
        if ((v71 & 1) == 0) {
          goto LABEL_15;
        }
        goto LABEL_28;
      }
      if ([(BMFileServer *)self isBiomeSyncDaemon])
      {
        if ((v8 & 3) == 0)
        {
          v17 = 0;
          goto LABEL_28;
        }
        v55 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v88 = *MEMORY[0x1E4F28568];
        uint64_t v89 = @"Write access denied";
        v56 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v57 = &v89;
        v58 = &v88;
      }
      else
      {
        v55 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        v91 = @"Access denied";
        v56 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v57 = &v91;
        v58 = &v90;
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v87 = @"Invalid request";
      v56 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v57 = &v87;
      v58 = &v86;
    }
    v17 = [v56 dictionaryWithObjects:v57 forKeys:v58 count:1];
    v35 = v55;
    uint64_t v36 = 5;
LABEL_20:
    v37 = [v35 errorWithDomain:@"BiomeStorageError" code:v36 userInfo:v17];
    v11[2](v11, 0, v37);

    goto LABEL_59;
  }
  v17 = [v12 objectForKeyedSubscript:@"stream"];
  v18 = [v12 objectForKeyedSubscript:@"streamType"];
  uint64_t v19 = [v18 unsignedIntegerValue];

  if (self->_domain != BMServiceDomainForStream(v19, v17))
  {
    v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    v93 = @"Wrong domain";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    v43 = [v42 errorWithDomain:@"BiomeStorageError" code:3 userInfo:v22];
    v11[2](v11, 0, v43);

LABEL_42:
    goto LABEL_59;
  }
  v20 = [(BMFileServer *)self currentUseCase];
  if ([v20 isEqual:@"__writer__"])
  {
    id v79 = 0;
    BOOL v21 = [(BMFileServer *)self entitledToAccessStream:v17 withMode:2 error:&v79];
    v22 = v79;

    if (!v21)
    {
LABEL_41:
      v11[2](v11, 0, v22);
      goto LABEL_42;
    }
    v23 = v22;
  }
  else
  {

    v23 = 0;
  }
  v52 = [v12 objectForKeyedSubscript:@"subscriptions"];

  if (v52)
  {
    v78 = v23;
    LOBYTE(v53) = [(BMFileServer *)self entitledToAccessStream:v17 withMode:2 error:&v78];
    v54 = v78;
  }
  else
  {
    uint64_t v77 = v23;
    uint64_t v53 = [(BMFileServer *)self entitledToAccessStream:v17 withMode:v72 error:&v77];
    v54 = v77;
  }
  v22 = v54;

  if ((v53 & 1) == 0) {
    goto LABEL_41;
  }
  uint64_t v49 = v17;
  v17 = v22;
LABEL_48:

LABEL_49:
  v60 = [v12 objectForKeyedSubscript:@"streamType"];
  if ([v60 unsignedIntegerValue] == 1)
  {
    v61 = objc_msgSend(v12, "objectForKeyedSubscript:");
    int64_t v62 = +[BMPublicStreamUtilities streamForStreamIdentifier:v61];

    if (!v62)
    {
      v63 = __biome_log_for_category(6);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
      }

      int v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      uint64_t v85 = @"Invalid stream identifier";
      v27 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v28 = &v85;
      v29 = &v84;
      goto LABEL_17;
    }
  }
  else
  {
  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    uint64_t v69 = __biome_log_for_category(6);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
    }

    id v70 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28568];
    uint64_t v83 = @"Internal failure";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    int v31 = v70;
    uint64_t v32 = 0;
    goto LABEL_18;
  }
  uint64_t v73 = v17;
  uint64_t v65 = [(BMFileManager *)fileManager fileHandleForFileAtPath:v13 flags:v72 protection:v7 error:&v73];
  uint64_t v66 = v73;

  if (!(v65 | v66))
  {
    id v67 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = *MEMORY[0x1E4F28568];
    uint64_t v81 = @"Unspecified failure";
    int v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    uint64_t v66 = [v67 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v68];
  }
  v11[2](v11, v65, (void *)v66);

  v17 = v66;
LABEL_59:
}

- (BOOL)entitledToAccessStream:(id)a3 withMode:(int)a4 error:(id *)a5
{
  __int16 v6 = a4;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F29268] currentConnection];
  id v10 = v9;
  if (!v9)
  {
    v12 = __biome_log_for_category(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v12, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    BOOL v13 = 0;
    goto LABEL_29;
  }
  if ((v6 & 1 | 2) == 2 || v6 < 0)
  {
    v12 = -[NSXPCConnection bm_accessControlPolicy](v9);
    if (v6 < 0 || (v6 & 3) == 0) {
      unint64_t v15 = 1;
    }
    else {
      unint64_t v15 = 3;
    }
    int v16 = [[BMResourceSpecifier alloc] initWithType:1 name:v8];
    if (v16)
    {
      if ([v12 allowsAccessToResource:v16 withMode:v15])
      {
        if (([v8 isEqual:@"GenerativeExperiences.TransparencyLog"] & 1) == 0
          && ![v8 isEqual:@"PrivateCloudCompute.RequestLog"])
        {
          goto LABEL_17;
        }
        v17 = [(BMFileServer *)self currentUseCase];
        char v18 = [v17 isEqual:@"__pruner__"];

        if (v18) {
          goto LABEL_17;
        }
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AppleIntelligenceReport"];
        uint64_t v29 = [v19 valueForKey:@"reportDuration"];
        v30 = (void *)v29;
        int v31 = &unk_1F0B42F10;
        if (v29) {
          int v31 = (void *)v29;
        }
        id v32 = v31;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v32 doubleValue];
          if (v33 != 0.0)
          {

LABEL_17:
            BOOL v13 = 1;
LABEL_28:

            goto LABEL_29;
          }
        }
        if (a5)
        {
          v34 = [NSString stringWithFormat:@"Stream '%@' is not enabled", v8];
          uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
          v38[0] = *MEMORY[0x1E4F28568];
          v38[1] = @"UserControlled";
          v39[0] = v34;
          v39[1] = MEMORY[0x1E4F1CC38];
          v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
          *a5 = [v36 errorWithDomain:@"BiomeStorageError" code:5 userInfo:v35];
        }
        goto LABEL_26;
      }
      if (a5)
      {
        v24 = NSString;
        v25 = [v12 descriptionOfProcessAndUseCase];
        int v26 = BMAccessModePrintableDescription(v15);
        uint64_t v19 = [v24 stringWithFormat:@"%@ is not entitled for '%@' access to '%@'", v25, v26, v8];

        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        BOOL v41 = v19;
        BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v22 = v27;
        uint64_t v23 = 5;
        goto LABEL_25;
      }
    }
    else if (a5)
    {
      uint64_t v19 = [NSString stringWithFormat:@"Invalid stream identifier '%@'", v8];
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = v19;
      BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v22 = v20;
      uint64_t v23 = 7;
LABEL_25:
      *a5 = [v22 errorWithDomain:@"BiomeStorageError" code:v23 userInfo:v21];

LABEL_26:
    }
    BOOL v13 = 0;
    goto LABEL_28;
  }
  if (!a5)
  {
    BOOL v13 = 0;
    goto LABEL_30;
  }
  id v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v44 = *MEMORY[0x1E4F28568];
  v45[0] = @"Invalid access mode";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  [v11 errorWithDomain:@"BiomeStorageError" code:7 userInfo:v12];
  BOOL v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_30:
  return v13;
}

- (BOOL)entitledToAccessClientCompute:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = -[NSXPCConnection bm_accessControlPolicy](v6);
    char v9 = [v8 allowsAccessToClientCompute:v5];
    BOOL v10 = v9;
    if (a4 && (v9 & 1) == 0)
    {
      id v11 = NSString;
      v12 = -[NSXPCConnection bm_process](v7);
      BOOL v13 = [v12 executableName];
      v14 = [v11 stringWithFormat:@"'%@' is not entitled to access compute as '%@'", v13, v5];

      unint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = v14;
      int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a4 = [v15 errorWithDomain:@"BiomeStorageError" code:5 userInfo:v16];
    }
  }
  else
  {
    id v8 = __biome_log_for_category(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v8, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)temporaryFileHandleWithProtection:(int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  __int16 v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v7 = __biome_log_for_category(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B30A0000, v7, OS_LOG_TYPE_INFO, "-temporaryFileHandleWithProtection:reply: called", buf, 2u);
  }

  if ((v4 + 1) >= 9)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Invalid protection class";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v14 = v13;
    uint64_t v15 = 2;
LABEL_12:
    uint64_t v9 = [v14 errorWithDomain:@"BiomeStorageError" code:v15 userInfo:v10];
    v6[2](v6, 0, v9);
    goto LABEL_13;
  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    int v16 = __biome_log_for_category(6);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v23 = @"Internal failure";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v14 = v17;
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  id v18 = 0;
  uint64_t v9 = [(BMFileManager *)fileManager temporaryFileHandleWithProtection:v4 error:&v18];
  uint64_t v10 = (uint64_t)v18;
  if (!(v9 | v10))
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    BOOL v21 = @"Unspecified failure";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v10 = [v11 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v12];
  }
  v6[2](v6, v9, v10);
LABEL_13:
}

- (BMFileServer)initWithDirectory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMFileServer;
  id v5 = [(BMFileServer *)&v12 init];
  if (v5)
  {
    __int16 v6 = __biome_log_for_category(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1B30A0000, v6, OS_LOG_TYPE_DEFAULT, "BMFileServer in %@", buf, 0xCu);
    }

    uint64_t v7 = [v4 copy];
    directory = v5->_directory;
    v5->_directory = (NSString *)v7;

    uint64_t v9 = +[BMFileManager fileManagerWithDirectAccessToDirectory:v4 cachingOptions:0];
    fileManager = v5->_fileManager;
    v5->_fileManager = (BMFileManager *)v9;

    +[BMPaths getServiceDomain:&v5->_domain subpath:0 forPath:v4];
  }

  return v5;
}

- (BOOL)entitledToAccessSharedSyncWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F29268] currentConnection];
  id v5 = v4;
  if (!v4)
  {
    __int16 v6 = __biome_log_for_category(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v6, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    goto LABEL_12;
  }
  __int16 v6 = -[NSXPCConnection bm_accessControlPolicy](v4);
  uint64_t v7 = [v6 process];
  if ([v7 BOOLForEntitlement:@"com.apple.private.biome.sync"])
  {

    char v8 = 1;
    goto LABEL_13;
  }
  if (os_variant_allows_internal_security_policies())
  {
    uint64_t v9 = [v6 process];
    char v8 = [v9 BOOLForEntitlement:@"com.apple.internal.biome.sync"];
  }
  else
  {
    char v8 = 0;
  }

  if (a3 && (v8 & 1) == 0)
  {
    uint64_t v10 = NSString;
    id v11 = -[NSXPCConnection bm_process](v5);
    objc_super v12 = [v11 executableName];
    BOOL v13 = [v10 stringWithFormat:@"'%@' is missing entitlement 'com.apple.private.biome.sync'", v12];

    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a3 = [v14 errorWithDomain:@"BiomeStorageError" code:5 userInfo:v15];

LABEL_12:
    char v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)isBiomeSyncDaemon
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  v3 = v2;
  if (v2)
  {
    id v4 = -[NSXPCConnection bm_process](v2);
    BOOL v5 = [v4 processType] == 3;
  }
  else
  {
    __int16 v6 = __biome_log_for_category(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_1B30A0000, v6, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", v8, 2u);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (void)createDirectoryAtPath:(id)a3 reply:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  char v8 = BMFileServerValidateAndParsePath(v6);
  if (!v8)
  {
    int v16 = __biome_log_for_category(6);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer createDirectoryAtPath:reply:]();
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = @"Invalid path";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    id v18 = [v17 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v9];
LABEL_19:
    v7[2](v7, v18);
    goto LABEL_20;
  }
  uint64_t v9 = [(NSString *)self->_directory stringByAppendingPathComponent:v6];
  uint64_t v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v6;
    _os_log_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_INFO, "-createDirectoryAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  id v11 = [v8 objectForKeyedSubscript:@"pathType"];
  int v12 = [v11 isEqual:@"streams"];

  if (v12)
  {
    BOOL v13 = [v8 objectForKeyedSubscript:@"stream"];
    uint64_t v44 = 0;
    BOOL v14 = [(BMFileServer *)self entitledToAccessStream:v13 withMode:0 error:&v44];
    uint64_t v15 = v44;
  }
  else
  {
    uint64_t v19 = [v8 objectForKeyedSubscript:@"pathType"];
    int v20 = [v19 isEqual:@"compute"];

    if (v20)
    {
      BOOL v13 = [v8 objectForKeyedSubscript:@"clientIdentifier"];
      v43 = 0;
      BOOL v14 = [(BMFileServer *)self entitledToAccessClientCompute:v13 error:&v43];
      uint64_t v15 = v43;
    }
    else
    {
      BOOL v21 = [v8 objectForKeyedSubscript:@"pathType"];
      int v22 = [v21 isEqual:@"sharedSync"];

      if (!v22)
      {
        int v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        v52 = @"Invalid request";
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        uint64_t v40 = [v39 errorWithDomain:@"BiomeStorageError" code:3 userInfo:v18];
        v7[2](v7, v40);

        goto LABEL_20;
      }
      BOOL v13 = [v8 objectForKeyedSubscript:@"stream"];
      uint64_t v42 = 0;
      BOOL v14 = [(BMFileServer *)self entitledToAccessStream:v13 withMode:0 error:&v42];
      uint64_t v15 = v42;
    }
  }
  id v18 = v15;

  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v23 = [v8 objectForKeyedSubscript:@"streamType"];
  if ([v23 unsignedIntegerValue] == 1)
  {
    uint64_t v24 = [v8 objectForKeyedSubscript:@"stream"];
    int64_t v25 = +[BMPublicStreamUtilities streamForStreamIdentifier:v24];

    if (!v25)
    {
      int v26 = __biome_log_for_category(6);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
      }

      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50 = @"Invalid stream identifier";
      BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v29 = v27;
      uint64_t v30 = 2;
LABEL_30:
      v38 = [v29 errorWithDomain:@"BiomeStorageError" code:v30 userInfo:v28];
      v7[2](v7, v38);

      goto LABEL_20;
    }
  }
  else
  {
  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    uint64_t v36 = __biome_log_for_category(6);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
    }

    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    BOOL v48 = @"Internal failure";
    BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v29 = v37;
    uint64_t v30 = 0;
    goto LABEL_30;
  }
  id v41 = v18;
  BOOL v32 = [(BMFileManager *)fileManager createDirectoryAtPath:v9 error:&v41];
  id v33 = v41;

  if (!v32 && !v33)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46 = @"Unspecified failure";
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v33 = [v34 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v35];
  }
  v7[2](v7, v33);
  id v18 = v33;
LABEL_20:
}

- (void)removeFileAtPath:(id)a3 reply:(id)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  char v8 = BMFileServerValidateAndParsePath(v6);
  if (!v8)
  {
    id v18 = __biome_log_for_category(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer removeFileAtPath:reply:]();
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v79 = *MEMORY[0x1E4F28568];
    v80[0] = @"Invalid path";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
    id v15 = [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v9];
LABEL_21:
    v7[2](v7, v15);
    goto LABEL_55;
  }
  uint64_t v9 = [(NSString *)self->_directory stringByAppendingPathComponent:v6];
  uint64_t v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v78 = v6;
    _os_log_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_INFO, "-removeFileAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  id v11 = [v8 objectForKeyedSubscript:@"pathType"];
  int v12 = [v11 isEqual:@"streams"];

  if (v12)
  {
    BOOL v13 = [v8 objectForKeyedSubscript:@"subscriptions"];

    if (v13)
    {
      BOOL v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      id v76 = @"Client processes not allowed read-write access to subscriptions substream";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      int v16 = v14;
      uint64_t v17 = 5;
LABEL_26:
      v38 = [v16 errorWithDomain:@"BiomeStorageError" code:v17 userInfo:v15];
      v7[2](v7, v38);

      goto LABEL_55;
    }
    int v22 = [v8 objectForKeyedSubscript:@"stream"];
    v64 = 0;
    BOOL v23 = [(BMFileServer *)self entitledToAccessStream:v22 withMode:2 error:&v64];
    uint64_t v24 = v64;
  }
  else
  {
    int v20 = [v8 objectForKeyedSubscript:@"pathType"];
    int v21 = [v20 isEqual:@"compute"];

    if (v21)
    {
      int v22 = [v8 objectForKeyedSubscript:@"clientIdentifier"];
      v63 = 0;
      BOOL v23 = [(BMFileServer *)self entitledToAccessClientCompute:v22 error:&v63];
      uint64_t v24 = v63;
    }
    else
    {
      int64_t v25 = [v8 objectForKeyedSubscript:@"pathType"];
      int v26 = [v25 isEqual:@"sharedSync"];

      if (!v26)
      {
        v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        id v74 = @"Invalid request";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        int v16 = v37;
        uint64_t v17 = 3;
        goto LABEL_26;
      }
      int v22 = [v8 objectForKeyedSubscript:@"stream"];
      int64_t v62 = 0;
      BOOL v23 = [(BMFileServer *)self entitledToAccessStream:v22 withMode:2 error:&v62];
      uint64_t v24 = v62;
    }
  }
  id v15 = v24;

  if (!v23) {
    goto LABEL_21;
  }
  v27 = [v8 objectForKeyedSubscript:@"streamType"];
  v60 = v9;
  if ([v27 unsignedIntegerValue] != 1)
  {

LABEL_23:
    v34 = [v8 objectForKeyedSubscript:@"pathType"];
    if ([v34 isEqual:@"streams"])
    {
      v35 = [v8 objectForKeyedSubscript:@"segment"];
      BOOL v36 = v35 != 0;
    }
    else
    {
      BOOL v36 = 0;
    }

    int v39 = [v8 objectForKeyedSubscript:@"pathType"];
    if ([v39 isEqual:@"compute"])
    {
      uint64_t v40 = [v8 objectForKeyedSubscript:@"sessionIdentifier"];
      if (v40)
      {
        id v41 = [v8 objectForKeyedSubscript:@"bookmarks"];
        if (v41)
        {
          uint64_t v42 = [v8 objectForKeyedSubscript:@"client"];
          if (v42)
          {
            id v59 = v42;
            v43 = [v8 objectForKeyedSubscript:@"clientIdentifier"];
            if (v43)
            {
              v58 = v43;
              uint64_t v44 = [v8 objectForKeyedSubscript:@"subscriptionIdentifier"];
              BOOL v45 = v44 != 0;

              v43 = v58;
            }
            else
            {
              BOOL v45 = 0;
            }

            uint64_t v42 = v59;
          }
          else
          {
            BOOL v45 = 0;
          }
        }
        else
        {
          BOOL v45 = 0;
        }
      }
      else
      {
        BOOL v45 = 0;
      }
    }
    else
    {
      BOOL v45 = 0;
    }

    if (v36 || v45)
    {
      fileManager = self->_fileManager;
      if (fileManager)
      {
        id v61 = v15;
        BOOL v47 = [(BMFileManager *)fileManager removeFileAtPath:v60 error:&v61];
        id v48 = v61;

        if (!v47 && !v48)
        {
          uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v65 = *MEMORY[0x1E4F28568];
          uint64_t v66 = @"Unspecified failure";
          v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          id v48 = [v49 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v50];
        }
        v7[2](v7, v48);
        id v15 = v48;
        goto LABEL_54;
      }
      uint64_t v55 = __biome_log_for_category(6);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
      }

      v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      int v68 = @"Internal failure";
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      uint64_t v53 = v56;
      uint64_t v54 = 0;
    }
    else
    {
      uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      id v70 = @"Invalid file";
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      uint64_t v53 = v51;
      uint64_t v54 = 5;
    }
    uint64_t v57 = [v53 errorWithDomain:@"BiomeStorageError" code:v54 userInfo:v52];
    v7[2](v7, v57);

LABEL_54:
    uint64_t v9 = v60;
    goto LABEL_55;
  }
  BOOL v28 = [v8 objectForKeyedSubscript:@"stream"];
  int64_t v29 = +[BMPublicStreamUtilities streamForStreamIdentifier:v28];

  if (v29) {
    goto LABEL_23;
  }
  uint64_t v30 = __biome_log_for_category(6);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
  }

  int v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  unsigned int v72 = @"Invalid stream identifier";
  BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  id v33 = [v31 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v32];
  v7[2](v7, v33);

  uint64_t v9 = v60;
LABEL_55:
}

- (void)removeDirectoryAtPath:(id)a3 reply:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  char v8 = BMFileServerValidateAndParsePath(v6);
  if (!v8)
  {
    id v18 = __biome_log_for_category(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer removeDirectoryAtPath:reply:]();
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v62[0] = @"Invalid path";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v15 = [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v9];
LABEL_21:
    v7[2](v7, v15);
    goto LABEL_34;
  }
  uint64_t v9 = [(NSString *)self->_directory stringByAppendingPathComponent:v6];
  uint64_t v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v60 = v6;
    _os_log_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_INFO, "-removeDirectoryAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  id v11 = [v8 objectForKeyedSubscript:@"pathType"];
  int v12 = [v11 isEqual:@"streams"];

  if (v12)
  {
    BOOL v13 = [v8 objectForKeyedSubscript:@"subscriptions"];

    if (v13)
    {
      BOOL v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      v58 = @"Client processes not allowed read-write access to subscriptions substream";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      int v16 = v14;
      uint64_t v17 = 5;
LABEL_29:
      id v41 = [v16 errorWithDomain:@"BiomeStorageError" code:v17 userInfo:v15];
      v7[2](v7, v41);

      goto LABEL_34;
    }
    int v22 = [v8 objectForKeyedSubscript:@"stream"];
    id v48 = 0;
    BOOL v23 = [(BMFileServer *)self entitledToAccessStream:v22 withMode:2 error:&v48];
    uint64_t v24 = v48;
  }
  else
  {
    int v20 = [v8 objectForKeyedSubscript:@"pathType"];
    int v21 = [v20 isEqual:@"compute"];

    if (v21)
    {
      int v22 = [v8 objectForKeyedSubscript:@"clientIdentifier"];
      BOOL v47 = 0;
      BOOL v23 = [(BMFileServer *)self entitledToAccessClientCompute:v22 error:&v47];
      uint64_t v24 = v47;
    }
    else
    {
      int64_t v25 = [v8 objectForKeyedSubscript:@"pathType"];
      int v26 = [v25 isEqual:@"sharedSync"];

      if (!v26)
      {
        uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        v56 = @"Invalid request";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        int v16 = v40;
        uint64_t v17 = 3;
        goto LABEL_29;
      }
      int v22 = [v8 objectForKeyedSubscript:@"stream"];
      v46 = 0;
      BOOL v23 = [(BMFileServer *)self entitledToAccessStream:v22 withMode:2 error:&v46];
      uint64_t v24 = v46;
    }
  }
  id v15 = v24;

  if (!v23) {
    goto LABEL_21;
  }
  v27 = [v8 objectForKeyedSubscript:@"streamType"];
  if ([v27 unsignedIntegerValue] == 1)
  {
    BOOL v28 = [v8 objectForKeyedSubscript:@"stream"];
    int64_t v29 = +[BMPublicStreamUtilities streamForStreamIdentifier:v28];

    if (!v29)
    {
      uint64_t v30 = __biome_log_for_category(6);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
      }

      int v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      uint64_t v54 = @"Invalid stream identifier";
      BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v33 = v31;
      uint64_t v34 = 2;
LABEL_33:
      uint64_t v44 = [v33 errorWithDomain:@"BiomeStorageError" code:v34 userInfo:v32];
      v7[2](v7, v44);

      goto LABEL_34;
    }
  }
  else
  {
  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    uint64_t v42 = __biome_log_for_category(6);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:]();
    }

    v43 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52 = @"Internal failure";
    BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v33 = v43;
    uint64_t v34 = 0;
    goto LABEL_33;
  }
  id v45 = v15;
  BOOL v36 = [(BMFileManager *)fileManager removeDirectoryAtPath:v9 error:&v45];
  id v37 = v45;

  if (!v36 && !v37)
  {
    v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v50 = @"Unspecified failure";
    int v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v37 = [v38 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v39];
  }
  v7[2](v7, v37);
  id v15 = v37;
LABEL_34:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_1B30A0000, v0, v1, "-fileHandleForFileAtPath:flags:protection:reply: called with invalid path: %{private}@", v2);
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = objc_msgSend(v0, "objectForKeyedSubscript:");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_8(&dword_1B30A0000, v2, v3, "Invalid stream identifier %{public}@ type 'public'", v4, v5, v6, v7, v8);
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "File manager not set", v2, v3, v4, v5, v6);
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.4()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_7_0(&dword_1B30A0000, v0, v1, "Unexpected protection class specified for remote sharedSync file %{public}@ %d");
}

- (void)createDirectoryAtPath:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_1B30A0000, v0, v1, "-createDirectoryAtPath:reply: called with invalid path: %{private}@", v2);
}

- (void)removeFileAtPath:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_1B30A0000, v0, v1, "-removeFileAtPath:reply: called with invalid path: %{private}@", v2);
}

- (void)removeDirectoryAtPath:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_1B30A0000, v0, v1, "-removeDirectoryAtPath:reply: called with invalid path: %{private}@", v2);
}

- (void)replaceFileAtPath:withFileHandle:protection:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_1B30A0000, v0, v1, "-replaceFileAtPath:withFileHandle:protection:reply: called with invalid path: %{private}@", v2);
}

@end