@interface LCSSessionURLBuilder
+ (id)_bundleRecordForBundleIdentifier:(id)a3;
+ (id)_containerBundleIdentifierForBundleProvider:(id)a3;
+ (id)_containerURLForBundleIdentifier:(id)a3;
+ (id)_libraryURLForCurrentApplication;
+ (void)_libraryURLForCurrentApplication;
- (LCSSessionURLBuilder)initWithTypeIdentifier:(id)a3;
- (NSString)typeIdentifier;
- (id)_finalizedSessionURLsInContainerDirectory:(id)a3;
- (id)_nonContainerizedLibraryURLForBundleIdentifier:(id)a3;
- (id)_nonContainerizedStagingContainerURLForBundleIdentifier:(id)a3;
- (id)finalizationStagingSessionURLForBundleProvider:(id)a3 fromTemporaryURL:(id)a4;
- (id)finalizedSessionURLForBundleProvider:(id)a3 fromSessionURL:(id)a4;
- (id)finalizedSessionURLsForBundleIdentifier:(id)a3;
- (id)finalizedSessionURLsForBundleProvider:(id)a3;
- (id)finalizedSessionURLsForCurrentApplication;
- (id)finalizedSessionsContainerURLForCurrentApplication;
- (id)temporarySessionURL;
@end

@implementation LCSSessionURLBuilder

+ (id)_containerBundleIdentifierForBundleProvider:(id)a3
{
  id v3 = a3;
  v4 = [v3 containerBundleIdentifier];
  if (!v4)
  {
    v5 = LCSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionURLBuilder _containerBundleIdentifierForBundleProvider:]();
    }
  }
  return v4;
}

+ (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  v4 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = LCSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[LCSCaptureApplicationMonitor _bundleRecordForBundleIdentifier:v6];
    }
  }
  return v4;
}

+ (id)_containerURLForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _bundleRecordForBundleIdentifier:v4];
  v6 = [v5 dataContainerURL];
  if (!v6)
  {
    v7 = LCSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionURLBuilder _containerURLForBundleIdentifier:]();
    }
  }
  return v6;
}

+ (id)_libraryURLForCurrentApplication
{
  if (sandbox_get_container_expected())
  {
    v2 = LCSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionURLBuilder _libraryURLForCurrentApplication]();
    }
  }
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v3 URLsForDirectory:5 inDomains:1];
  id v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = LCSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionURLBuilder _libraryURLForCurrentApplication]();
    }
  }
  return v5;
}

- (LCSSessionURLBuilder)initWithTypeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCSSessionURLBuilder;
  id v6 = [(LCSSessionURLBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_typeIdentifier, a3);
  }

  return v7;
}

- (id)temporarySessionURL
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v3 temporaryDirectory];

  id v5 = [(LCSSessionURLBuilder *)self typeIdentifier];
  id v6 = [v4 URLByAppendingPathComponent:v5];
  v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = [v7 UUIDString];
  objc_super v9 = [v6 URLByAppendingPathComponent:v8];

  v10 = LCSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_255087000, v10, OS_LOG_TYPE_INFO, "New session path: %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (id)finalizationStagingSessionURLForBundleProvider:(id)a3 fromTemporaryURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _containerBundleIdentifierForBundleProvider:v7];

  objc_super v9 = [(id)objc_opt_class() _containerURLForBundleIdentifier:v8];
  v10 = [v9 URLByAppendingPathComponent:@"tmp"];
  v11 = [(LCSSessionURLBuilder *)self typeIdentifier];
  int v12 = [v10 URLByAppendingPathComponent:v11];

  if (!v12)
  {
    int v12 = [(LCSSessionURLBuilder *)self _nonContainerizedStagingContainerURLForBundleIdentifier:v8];
  }
  v13 = [v6 lastPathComponent];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
  if (!v14)
  {
    v15 = LCSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:]();
    }

    uint64_t v14 = [MEMORY[0x263F08C38] UUID];
  }
  v16 = [v14 UUIDString];
  v17 = [v12 URLByAppendingPathComponent:v16];

  v18 = LCSLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:]();
  }

  return v17;
}

- (id)_nonContainerizedStagingContainerURLForBundleIdentifier:(id)a3
{
  id v4 = NSURL;
  id v5 = a3;
  id v6 = [v4 fileURLWithPath:@"/var/mobile/tmp"];
  id v7 = [v6 URLByAppendingPathComponent:v5];

  id v8 = [(LCSSessionURLBuilder *)self typeIdentifier];
  objc_super v9 = [v7 URLByAppendingPathComponent:v8];

  v10 = [MEMORY[0x263F08850] defaultManager];
  v11 = [v7 path];
  int v12 = [v10 isWritableFileAtPath:v11];

  if (v12) {
    v13 = v9;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)finalizedSessionURLForBundleProvider:(id)a3 fromSessionURL:(id)a4
{
  id v6 = a3;
  id v7 = [a4 lastPathComponent];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  if (!v8)
  {
    objc_super v9 = LCSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:]();
    }

    id v8 = [MEMORY[0x263F08C38] UUID];
  }
  v10 = [(id)objc_opt_class() _containerBundleIdentifierForBundleProvider:v6];

  v11 = [(id)objc_opt_class() _containerURLForBundleIdentifier:v10];
  int v12 = [v11 URLByAppendingPathComponent:@"Library"];
  if (!v12)
  {
    int v12 = [(LCSSessionURLBuilder *)self _nonContainerizedLibraryURLForBundleIdentifier:v10];
  }
  v13 = [(LCSSessionURLBuilder *)self typeIdentifier];
  id v14 = [v12 URLByAppendingPathComponent:v13];
  v15 = [v8 UUIDString];
  v16 = [v14 URLByAppendingPathComponent:v15];

  v17 = LCSLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[LCSSessionURLBuilder finalizedSessionURLForBundleProvider:fromSessionURL:]();
  }

  return v16;
}

- (id)_nonContainerizedLibraryURLForBundleIdentifier:(id)a3
{
  id v3 = NSURL;
  id v4 = a3;
  id v5 = [v3 fileURLWithPath:@"/var/mobile/Library"];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [v6 path];
  int v9 = [v7 isWritableFileAtPath:v8];

  if (v9) {
    v10 = v6;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (id)finalizedSessionURLsForBundleProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _containerBundleIdentifierForBundleProvider:v4];

  id v6 = [(LCSSessionURLBuilder *)self finalizedSessionURLsForBundleIdentifier:v5];

  return v6;
}

- (id)finalizedSessionsContainerURLForCurrentApplication
{
  id v3 = [(id)objc_opt_class() _libraryURLForCurrentApplication];
  id v4 = [(LCSSessionURLBuilder *)self typeIdentifier];
  id v5 = [v3 URLByAppendingPathComponent:v4];

  return v5;
}

- (id)finalizedSessionURLsForCurrentApplication
{
  id v3 = [(id)objc_opt_class() _libraryURLForCurrentApplication];
  id v4 = [(LCSSessionURLBuilder *)self _finalizedSessionURLsInContainerDirectory:v3];

  return v4;
}

- (id)finalizedSessionURLsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _containerURLForBundleIdentifier:v4];

  if (v5)
  {
    id v6 = [v5 URLByAppendingPathComponent:@"Library"];
    id v7 = [(LCSSessionURLBuilder *)self _finalizedSessionURLsInContainerDirectory:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_finalizedSessionURLsInContainerDirectory:(id)a3
{
  v51[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(LCSSessionURLBuilder *)self typeIdentifier];
  uint64_t v6 = [v4 URLByAppendingPathComponent:v5];

  v34 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = *MEMORY[0x263EFF610];
  v51[0] = *MEMORY[0x263EFF6A8];
  uint64_t v8 = v51[0];
  v51[1] = v9;
  uint64_t v39 = v9;
  unint64_t v10 = 0x263EFF000uLL;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke;
  v45[3] = &unk_2653BEB90;
  id v32 = v4;
  v33 = (void *)v6;
  id v46 = v32;
  int v12 = [v7 enumeratorAtURL:v6 includingPropertiesForKeys:v11 options:7 errorHandler:v45];

  uint64_t v13 = v8;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    uint64_t v17 = *MEMORY[0x263EFF750];
    uint64_t v38 = *MEMORY[0x263EFF750];
    uint64_t v35 = *(void *)v42;
    do
    {
      uint64_t v18 = 0;
      uint64_t v36 = v15;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v41 + 1) + 8 * v18);
        v49[0] = v13;
        v49[1] = v17;
        v49[2] = v39;
        v20 = [*(id *)(v10 + 2240) arrayWithObjects:v49 count:3];
        id v40 = 0;
        v21 = [v19 resourceValuesForKeys:v20 error:&v40];
        id v22 = v40;

        if (v22)
        {
          v23 = LCSLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v22;
            _os_log_error_impl(&dword_255087000, v23, OS_LOG_TYPE_ERROR, "Error fetching resource values: %@", buf, 0xCu);
          }
        }
        else
        {
          unint64_t v24 = v10;
          uint64_t v25 = v13;
          v26 = [v21 objectForKeyedSubscript:v13];
          int v27 = [v26 BOOLValue];

          v23 = [v21 objectForKeyedSubscript:v17];
          v28 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v23];

          if (v27) {
            BOOL v29 = v28 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29) {
            [v34 addObject:v19];
          }
          uint64_t v13 = v25;
          unint64_t v10 = v24;
          uint64_t v16 = v35;
          uint64_t v15 = v36;
        }

        ++v18;
        uint64_t v17 = v38;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v15);
  }

  v30 = [v34 sortedArrayUsingComparator:&__block_literal_global_0];

  return v30;
}

uint64_t __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LCSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_error_impl(&dword_255087000, v7, OS_LOG_TYPE_ERROR, "Error enumerating directory %@, on URL %@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x263EFF610];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  uint64_t v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v6 compare:v9];
  return v7;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
}

+ (void)_containerBundleIdentifierForBundleProvider:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_255087000, v0, OS_LOG_TYPE_ERROR, "Unable to resolve container bundle identifier for %@", v1, 0xCu);
}

+ (void)_containerURLForBundleIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_255087000, v0, OS_LOG_TYPE_ERROR, "Unable to resolve data container URL for %@", v1, 0xCu);
}

+ (void)_libraryURLForCurrentApplication
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_255087000, v0, v1, "Error encountered while checking if container expected, assuming current process is containerized", v2, v3, v4, v5, v6);
}

- (void)finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_255087000, v0, OS_LOG_TYPE_DEBUG, "Finalization staging path:%@", v1, 0xCu);
}

- (void)finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_255087000, v0, v1, "Temporary path for finalizing does not have a UUID as its last path component, we'll just build a completely new path instead.", v2, v3, v4, v5, v6);
}

- (void)finalizedSessionURLForBundleProvider:fromSessionURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_255087000, v0, OS_LOG_TYPE_DEBUG, "Finalization Library path:%@", v1, 0xCu);
}

@end