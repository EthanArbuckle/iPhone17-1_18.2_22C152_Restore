@interface GTURLAccessProvider
- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4;
- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProvider

- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)GTURLAccessProvider;
    v14 = [(GTURLAccessProvider *)&v22 init];
    if (v14)
    {
      os_log_t v15 = os_log_create("com.apple.gputools.transport", "URLAccessProvider");
      log = v14->_log;
      v14->_log = (OS_os_log *)v15;

      uint64_t v17 = objc_opt_new();
      registeredURLs = v14->_registeredURLs;
      v14->_registeredURLs = (NSMutableDictionary *)v17;

      uint64_t v19 = +[GTDeviceProperties uniqueDeviceID];
      deviceUDID = v14->_deviceUDID;
      v14->_deviceUDID = (NSString *)v19;

      objc_storeStrong((id *)&v14->_serviceProvider, a3);
      objc_storeStrong((id *)&v14->_connectionProvider, a4);
      objc_storeStrong((id *)&v14->_serviceVendor, a5);
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)urlForPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_registeredURLs;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      id v11 = [v10 path];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  char v9 = 0;
  if (v6 && v7)
  {
    if ([(NSString *)self->_deviceUDID isEqualToString:v6])
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [(GTServiceProvider *)self->_serviceProvider allServices];
      id v11 = filteredArrayByService(v10, (Protocol *)&unk_26EFB9690);
      char v12 = [v11 firstObject];

      serviceVendor = self->_serviceVendor;
      long long v14 = [v12 serviceProperties];
      long long v15 = [(GTServiceVendor *)serviceVendor getSimulatorDeviceBrowserService:v14];

      char v9 = [v15 isSimulatorDevice:v6];
    }
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  if (!v8) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  char v9 = [v8 scheme];
  int v10 = [v9 isEqualToString:@"gtsandboxid"];

  if (v10 && ([v8 host], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    char v12 = [v8 path];

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.6();
      }
      uint64_t v13 = [(NSMutableDictionary *)self->_registeredURLs objectForKeyedSubscript:v8];
      if (v13)
      {
        long long v14 = (void *)v13;
        long long v15 = [MEMORY[0x263F08850] defaultManager];
        long long v16 = [v14 path];
        int v17 = [v15 fileExistsAtPath:v16];

        log = self->_log;
        if (v17)
        {
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.4();
          }
          v7[2](v7, v14);
LABEL_37:

          goto LABEL_17;
        }
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.5();
        }

        [(NSMutableDictionary *)self->_registeredURLs removeObjectForKey:v8];
      }
      long long v14 = [v8 host];
      v27 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v14];
      v28 = v27;
      if (v27)
      {
        v29 = allServicesForDeviceUDID(v27, v14);
        v30 = filteredArrayByService(v29, (Protocol *)&unk_26EFBD7A0);
        v31 = [v30 firstObject];

        if (v31)
        {
          v32 = [GTURLAccessProviderXPCProxy alloc];
          v33 = [v31 serviceProperties];
          v34 = [(GTURLAccessProviderXPCProxy *)v32 initWithConnection:v28 remoteProperties:v33];

          if ([(GTURLAccessProvider *)self _sharesFileSystemWith:v14 remoteConnection:v28])
          {
            v54[0] = MEMORY[0x263EF8330];
            v54[1] = 3221225472;
            v54[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke;
            v54[3] = &unk_264E28A98;
            v54[4] = self;
            v35 = &v55;
            id v36 = v8;
            id v55 = v36;
            v37 = (id *)&v56;
            v56 = v7;
            [(GTURLAccessProviderXPCProxy *)v34 securityScopedURLFromSandboxID:v36 completionHandler:v54];
          }
          else
          {
            char v46 = objc_opt_respondsToSelector();
            deviceUDID = self->_deviceUDID;
            if (v46)
            {
              v51[0] = MEMORY[0x263EF8330];
              v51[1] = 3221225472;
              v51[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2;
              v51[3] = &unk_264E28AC0;
              v51[4] = self;
              v35 = (id *)&v53;
              v53 = v7;
              v37 = &v52;
              id v52 = v8;
              [(GTURLAccessProviderXPCProxy *)v34 copyIdentifier:v52 toDevice:deviceUDID completionHandler:v51];
            }
            else
            {
              v48[0] = MEMORY[0x263EF8330];
              v48[1] = 3221225472;
              v48[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_39;
              v48[3] = &unk_264E28AE8;
              v48[4] = self;
              v35 = (id *)&v50;
              v50 = v7;
              v37 = &v49;
              id v49 = v8;
              [(GTURLAccessProviderXPCProxy *)v34 transferIdentifier:v49 toDevice:deviceUDID completionHandler:v48];
            }
          }
        }
        else
        {
          v38 = self->_log;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:](v38, v39, v40, v41, v42, v43, v44, v45);
          }
          v7[2](v7, 0);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:]();
        }
        v7[2](v7, 0);
      }

      goto LABEL_37;
    }
  }
  else
  {
LABEL_13:
  }
  uint64_t v19 = self->_log;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
  v7[2](v7, 0);
LABEL_17:
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1[4] + 16) setObject:v3 forKeyedSubscript:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 scheme];
    int v8 = [v7 isEqualToString:@"gtsandboxid"];

    if (v8) {
      [*(id *)(a1[4] + 16) objectForKeyedSubscript:v5];
    }
    else {
    int v10 = LocalArchiveURLFromRemoteURL(v5);
    }
    [*(id *)(a1[4] + 16) setObject:v10 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    char v9 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2_cold_1(v9, v6);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_39(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = LocalArchiveURLFromRemoteURL(v3);
    [*(id *)(a1[4] + 16) setObject:v5 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_39_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)makeURL:(id)a3
{
  ++makeURL__urlNumber;
  id v4 = a3;
  id v5 = [v4 path];
  id v6 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  uint64_t v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  uint64_t v8 = [NSString stringWithFormat:@"%@://%@/%@?id=%u", @"gtsandboxid", self->_deviceUDID, v7, makeURL__urlNumber];
  uint64_t v9 = [NSURL URLWithString:v8];
  [(NSMutableDictionary *)self->_registeredURLs setObject:v4 forKeyedSubscript:v9];

  return v9;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__GTURLAccessProvider_transferIdentifier_toDevice_completionHandler___block_invoke;
  v10[3] = &unk_264E28B10;
  id v11 = v8;
  id v9 = v8;
  [(GTURLAccessProvider *)self copyIdentifier:a3 toDevice:a4 allowLocalURL:0 completionHandler:v10];
}

uint64_t __69__GTURLAccessProvider_transferIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v70 = a5;
  v100[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v12 = v10;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.5();
  }
  long long v14 = [(NSMutableDictionary *)self->_registeredURLs objectForKeyedSubscript:v9];
  if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG)) {
    -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.4();
  }
  long long v15 = [(GTConnectionProvider *)v11->_connectionProvider connectionForDeviceUDID:v12];
  v71 = v15;
  if (v15)
  {
    long long v16 = v15;
    uint64_t v17 = FindRemoteGTFileWriterService(v15, v12, v11->_connectionProvider);
    v18 = v11;
    v67 = (void *)v17;
    v68 = v14;
    if (v17)
    {
      uint64_t v19 = (void *)v17;
      id v65 = v9;
      v66 = v18;
      v63 = v13;
      id v64 = v12;
      uint64_t v20 = [GTFileWriterServiceXPCProxy alloc];
      uint64_t v21 = [v19 serviceProperties];
      v69 = [(GTFileWriterServiceXPCProxy *)v20 initWithConnection:v16 remoteProperties:v21];

      if (([v14 startAccessingSecurityScopedResource] & 1) == 0
        && os_log_type_enabled((os_log_t)v66->_log, OS_LOG_TYPE_DEBUG))
      {
        -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:]();
      }
      id v22 = v14;
      uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v24 = *MEMORY[0x263EFF6A8];
      uint64_t v25 = *MEMORY[0x263EFF688];
      v100[0] = *MEMORY[0x263EFF6A8];
      v100[1] = v25;
      uint64_t v73 = v25;
      uint64_t v75 = *MEMORY[0x263EFF700];
      v100[2] = *MEMORY[0x263EFF700];
      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:3];
      v27 = [v23 enumeratorAtURL:v22 includingPropertiesForKeys:v26 options:0 errorHandler:&__block_literal_global];

      id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id obj = v27;
      uint64_t v28 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v92;
        uint64_t v72 = v24;
        uint64_t v74 = *(void *)v92;
        do
        {
          uint64_t v31 = 0;
          uint64_t v77 = v29;
          do
          {
            if (*(void *)v92 != v30) {
              objc_enumerationMutation(obj);
            }
            v32 = *(void **)(*((void *)&v91 + 1) + 8 * v31);
            v33 = (void *)MEMORY[0x23ECD9F60]();
            id v89 = 0;
            id v90 = 0;
            [v32 getResourceValue:&v90 forKey:v24 error:&v89];
            id v34 = v90;
            id v35 = v89;
            if (([v34 BOOLValue] & 1) == 0)
            {
              id v87 = 0;
              id v88 = 0;
              [v32 getResourceValue:&v88 forKey:v75 error:&v87];
              id v36 = v88;
              id v79 = v87;

              v37 = GetPathRelativeToBase(v32, v22);
              if ([v36 BOOLValue])
              {
                id v38 = [v32 URLByResolvingSymlinksInPath];
                GetPathRelativeToBase(v38, v22);
                uint64_t v39 = (GTFileEntry *)objc_claimAutoreleasedReturnValue();
                uint64_t v40 = [[GTFileEntry alloc] initWithLink:v37 destination:v39];
                [v76 addObject:v40];
              }
              else
              {
                id v85 = 0;
                v86 = 0;
                [v32 getResourceValue:&v86 forKey:v73 error:&v85];
                id v41 = v22;
                uint64_t v42 = v86;
                id v38 = v85;
                id v43 = v42;
                uint64_t v44 = [GTFileEntry alloc];
                uint64_t v45 = [v43 unsignedIntegerValue];

                uint64_t v46 = v45;
                id v22 = v41;
                uint64_t v24 = v72;
                uint64_t v39 = [(GTFileEntry *)v44 initWithPath:v37 fileSize:v46];
                [v76 addObject:v39];
              }

              id v35 = v79;
              uint64_t v29 = v77;
              uint64_t v30 = v74;
            }

            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
        }
        while (v29);
      }

      v47 = (void *)[v76 copy];
      [v22 stopAccessingSecurityScopedResource];
      v48 = objc_opt_new();
      if (v70 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v49 = [v22 path];
        deviceUDID = v66->_deviceUDID;
        v83[0] = MEMORY[0x263EF8330];
        v83[1] = 3221225472;
        v83[2] = __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke;
        v83[3] = &unk_264E28B10;
        v51 = &v84;
        id v13 = v63;
        id v84 = v63;
        [(GTFileWriterServiceXPCProxy *)v69 startTransfer:v47 basePath:v49 fromDevice:deviceUDID options:v48 completionHandler:v83];
      }
      else
      {
        v57 = [v22 path];
        v58 = v66->_deviceUDID;
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke_2;
        v80[3] = &unk_264E28B38;
        v51 = &v82;
        id v13 = v63;
        id v82 = v63;
        id v81 = v22;
        [(GTFileWriterServiceXPCProxy *)v69 initiateTransfer:v47 basePath:v57 fromDevice:v58 options:v48 completionHandler:v80];

        id v49 = v81;
      }

      id v12 = v64;
      id v9 = v65;
      v59 = v69;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR)) {
        -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:]();
      }
      v60 = (void *)MEMORY[0x263F087E8];
      uint64_t v95 = *MEMORY[0x263F08320];
      v61 = [NSString stringWithFormat:@"Missing file writer service for device: %@", v12];
      v96 = v61;
      v62 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      v59 = [v60 errorWithDomain:@"com.apple.gputools.urlaccessprovider" code:1 userInfo:v62];

      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v59);
    }

    v56 = v67;
    id v52 = v68;
  }
  else
  {
    id v52 = v14;
    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR)) {
      -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:]();
    }
    v53 = (void *)MEMORY[0x263F087E8];
    uint64_t v97 = *MEMORY[0x263F08320];
    v54 = [NSString stringWithFormat:@"Missing connection for device: %@", v12];
    v98 = v54;
    id v55 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    v56 = [v53 errorWithDomain:@"com.apple.gputools.urlaccessprovider" code:0 userInfo:v55];

    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v56);
  }
}

uint64_t __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_registeredURLs, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)securityScopedURLFromSandboxID:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_23C048000, v0, v1, "Missing remote connection for %@", v2, v3, v4, v5, v6);
}

- (void)securityScopedURLFromSandboxID:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_23C048000, v0, v1, "File found locally %@", v2, v3, v4, v5, v6);
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_23C048000, v0, v1, "File should exist locally at %@ but can't be found on disk", v2, v3, v4, v5, v6);
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_23C048000, v0, v1, "securityScopedURLFromSandboxID %@", v2, v3, v4, v5, v6);
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_23C048000, v3, OS_LOG_TYPE_ERROR, "Failed to transfer archive, %@", v5, 0xCu);
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_39_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_23C048000, v0, v1, "No remote connection for device %@", v2, v3, v4, v5, v6);
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_23C048000, v0, v1, "Failed to find remote file writer service for device %@", v2, v3, v4, v5, v6);
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_23C048000, v0, v1, "Failed to consume sandbox extension for URL %@", v2, v3, v4, v5, v6);
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_23C048000, v0, v1, "currentURL %@", v2, v3, v4, v5, v6);
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_23C048000, v1, OS_LOG_TYPE_DEBUG, "transferIdentifier %@ to device %@", v2, 0x16u);
}

@end