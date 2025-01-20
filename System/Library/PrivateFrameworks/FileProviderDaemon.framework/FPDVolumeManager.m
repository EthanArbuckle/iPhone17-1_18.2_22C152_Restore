@interface FPDVolumeManager
- (BOOL)loadEnterpriseVolumeWithError:(id *)a3;
- (BOOL)loadHomeVolume;
- (BOOL)loadVolumeWithURL:(id)a3 role:(unsigned int)a4 error:(id *)a5;
- (BOOL)shouldMountAdditionalVolume;
- (FPDServer)server;
- (FPDVolumeManager)init;
- (FPDVolumeManager)initWithServer:(id)a3;
- (id)createVolumeWithStatFS:(const statfs *)a3 role:(unsigned int)a4;
- (id)defaultVolumeForCurrentPersona;
- (id)getGenstoreVersionsRootURL:(id)a3 volumeIgnoringOwnership:(BOOL)a4;
- (id)libraryForVolume:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (id)loadSingleVolume:(const statfs *)a3 role:(unsigned int)a4;
- (statfs)getAllEligibleVolumesWithError:(id *)a3 count:(int *)a4;
- (void)defaultVolumeForCurrentPersona;
- (void)enumerateLibrariesForPersona:(id)a3 withBlock:(id)a4;
- (void)enumerateLibrariesWithBlock:(id)a3;
- (void)invalidateDevice:(int)a3 reason:(id)a4;
- (void)invalidateVolume:(id)a3 reason:(id)a4;
- (void)loadAdditionalVolumesWithCompletion:(id)a3;
- (void)loadHomeVolume;
- (void)registerVersionsFileCoordinatorForVolume:(id)a3 volumeIgnoringOwnership:(BOOL)a4;
- (void)setServer:(id)a3;
- (void)unregisterVersionsFileCoordinatorForVolume:(id)a3;
@end

@implementation FPDVolumeManager

- (FPDVolumeManager)init
{
  return [(FPDVolumeManager *)self initWithServer:0];
}

- (FPDVolumeManager)initWithServer:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPDVolumeManager;
  v5 = [(FPDVolumeManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    uint64_t v7 = objc_opt_new();
    volumes = v6->_volumes;
    v6->_volumes = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    versionsProvidersByVolumeID = v6->_versionsProvidersByVolumeID;
    v6->_versionsProvidersByVolumeID = (NSMutableDictionary *)v9;

    delegate = v6->_delegate;
    v6->_delegate = 0;

    os_log_t v12 = os_log_create("com.apple.FileProvider", "volumes");
    log = v6->_log;
    v6->_log = (OS_os_log *)v12;

    v15 = fpfs_adopt_log();
    __fp_pop_log();
  }
  return v6;
}

- (BOOL)shouldMountAdditionalVolume
{
  return 1;
}

- (statfs)getAllEligibleVolumesWithError:(id *)a3 count:(int *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    __fp_create_section();
    v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FPDVolumeManager getAllEligibleVolumesWithError:count:].cold.4();
    }

    int v9 = 2168 * v7;
    v10 = (statfs *)malloc_type_malloc(2168 * v7, 0x36199936uLL);
    v11 = v10;
    if (v10)
    {
      int v12 = getfsstat(v10, v9, 2);
      if ((v12 & 0x80000000) == 0)
      {
        *a4 = v12;
LABEL_21:
        __fp_leave_section_Error();
        return v11;
      }
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_super v16 = __error();
        v17 = strerror(*v16);
        -[FPDVolumeManager getAllEligibleVolumesWithError:count:]((uint64_t)v17, (uint64_t)v19, v15);
      }

      if (a3)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      free(v11);
    }
    else
    {
      v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[FPDVolumeManager getAllEligibleVolumesWithError:count:](v14);
      }

      if (a3)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 12);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    v11 = 0;
    goto LABEL_21;
  }
  v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[FPDVolumeManager getAllEligibleVolumesWithError:count:](v13);
  }

  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (id)loadSingleVolume:(const statfs *)a3 role:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v6 = self;
  objc_sync_enter(v6);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__FPDVolumeManager_loadSingleVolume_role___block_invoke;
  v23[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
  v23[4] = a3;
  int v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v23];
  v8 = [(NSMutableArray *)v6->_volumes filteredArrayUsingPredicate:v7];
  if (![v8 count])
  {
    id v9 = 0;
    goto LABEL_7;
  }
  id v9 = [v8 firstObject];
  v10 = [v9 root];
  v11 = [NSString stringWithUTF8String:a3->f_mntonname];
  int v12 = [v10 isEqualToString:v11];

  if (!v12)
  {
LABEL_7:
    int v14 = 1;
    goto LABEL_8;
  }
  v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v21 = [v9 root];
    objc_msgSend(v21, "fp_prettyPath");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v25 = v9;
    __int16 v26 = 2112;
    f_mntfromname = v22;
    _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Volume %@ already loaded at %@", buf, 0x16u);
  }
  id v9 = v9;
  int v14 = 0;
LABEL_8:

  objc_sync_exit(v6);
  if (v14)
  {
    -[FPDVolumeManager invalidateDevice:reason:](v6, "invalidateDevice:reason:", [v9 dev], @"Volume description changed");
    v15 = [(FPDVolumeManager *)v6 createVolumeWithStatFS:a3 role:v4];

    if (v15)
    {
      if ([v15 role] == 3
        && ![(FPDVolumeManager *)v6 shouldMountAdditionalVolume])
      {
        v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[FPDVolumeManager loadSingleVolume:role:]();
        }

        id v9 = 0;
      }
      else
      {
        objc_super v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v15;
          __int16 v26 = 2082;
          f_mntfromname = a3->f_mntfromname;
          _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_INFO, "[INFO] Loaded volume %{public}@ with file system %{public}s", buf, 0x16u);
        }

        v17 = v6;
        objc_sync_enter(v17);
        [(NSMutableArray *)v6->_volumes addObject:v15];
        objc_sync_exit(v17);

        [(FPDVolumeManager *)v17 registerVersionsFileCoordinatorForVolume:v15 volumeIgnoringOwnership:(a3->f_flags >> 21) & 1];
        id v9 = v15;
        v15 = v9;
      }
    }
    else
    {
      v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[FPDVolumeManager loadSingleVolume:role:]();
      }

      id v9 = 0;
      v15 = 0;
    }
  }
  else
  {
    v15 = v9;
  }

  return v9;
}

BOOL __42__FPDVolumeManager_loadSingleVolume_role___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"[ASSERT] ‼️ Only FPDVolume are allowed to be evaluated."];
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[FPDVolumeManager loadSingleVolume:role:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolumeManager.m", 188, (const char *)[v9 UTF8String]);
  }
  BOOL v7 = [v5 dev] == *(_DWORD *)(*(void *)(a1 + 32) + 48);

  return v7;
}

- (id)createVolumeWithStatFS:(const statfs *)a3 role:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a4) {
    uint64_t v4 = +[FPDVolume volumeRoleForStatFS:a3];
  }
  if ((v4 - 1) < 2)
  {
    BOOL v7 = [FPDVolume alloc];
    v8 = a3;
    uint64_t v9 = v4;
LABEL_7:
    v10 = [(FPDExternalVolume *)v7 initWithStatFS:v8 knownRole:v9 volumeManager:self];
    goto LABEL_11;
  }
  if (v4 == 3)
  {
    BOOL v7 = [FPDExternalVolume alloc];
    v8 = a3;
    uint64_t v9 = 3;
    goto LABEL_7;
  }
  v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[FPDVolumeManager createVolumeWithStatFS:role:]((uint64_t)a3, v4, v11);
  }

  v10 = 0;
LABEL_11:
  return v10;
}

- (BOOL)loadVolumeWithURL:(id)a3 role:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v14[271] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  bzero(v14, 0x878uLL);
  id v9 = v8;
  [v9 fileSystemRepresentation];
  int v10 = FPStatVFS();
  if (v10 < 0)
  {
    int v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FPDVolumeManager loadVolumeWithURL:role:error:](v9, v12);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v11 = [(FPDVolumeManager *)self loadSingleVolume:v14 role:v6];
  }

  return v10 >= 0;
}

- (BOOL)loadEnterpriseVolumeWithError:(id *)a3
{
  v13 = fpfs_adopt_log();
  uint64_t section = __fp_create_section();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDVolumeManager loadEnterpriseVolumeWithError:]();
  }

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB36F8], "sharedManager", section);
  BOOL v7 = [v6 currentPersona];

  if (([v7 isEnterprisePersona] & 1) == 0)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[FPDVolumeManager loadEnterpriseVolumeWithError:](v8);
    }
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_personaSharedDirectory");
  BOOL v10 = [(FPDVolumeManager *)self loadVolumeWithURL:v9 role:2 error:a3];

  __fp_leave_section_Debug();
  __fp_pop_log();

  return v10;
}

- (BOOL)loadHomeVolume
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v10[1] = (id)__fp_create_section();
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[FPDVolumeManager loadHomeVolume]();
  }

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
  v10[0] = 0;
  BOOL v5 = [(FPDVolumeManager *)self loadVolumeWithURL:v4 role:1 error:v10];
  id v6 = v10[0];
  if (!v5)
  {
    BOOL v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = objc_msgSend(v6, "fp_prettyDescription");
      [(FPDVolumeManager *)v8 loadHomeVolume];
    }
  }
  __fp_leave_section_Debug();
  __fp_pop_log();

  return 1;
}

- (void)loadAdditionalVolumesWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  uint64_t v4 = fpfs_adopt_log();
  if ((FPFeatureFlagEbihilIsEnabled() & 1) == 0) {
    v3[2](v3, 0);
  }
  __fp_pop_log();
}

- (id)libraryForVolume:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __58__FPDVolumeManager_libraryForVolume_createIfNeeded_error___block_invoke;
  objc_super v16 = &unk_1E6A74820;
  id v8 = v7;
  id v17 = v8;
  v18 = &v19;
  [(FPDVolumeManager *)self enumerateLibrariesWithBlock:&v13];
  if (!v20[5])
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = objc_msgSend(v8, "fp_UUID", v13, v14, v15, v16);
      -[FPDVolumeManager libraryForVolume:createIfNeeded:error:](v10, (uint64_t)v25, v9);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 6);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __58__FPDVolumeManager_libraryForVolume_createIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v5 = [v4 uuid];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v6 ^ 1u;
}

- (void)enumerateLibrariesForPersona:(id)a3 withBlock:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v44 = (uint64_t (**)(id, void *))a4;
  v45 = v6;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];

    *(void *)buf = 0;
    id v9 = [v8 userPersonaUniqueString];
    BOOL v10 = v9;
    if (v9 == v6
      || (objc_msgSend(v9, "isEqualToString:") & 1) != 0
      || !voucher_process_can_use_arbitrary_personas())
    {
      v15 = 0;
    }
    else
    {
      id v53 = 0;
      uint64_t v11 = [v8 copyCurrentPersonaContextWithError:&v53];
      id v12 = v53;
      uint64_t v13 = *(void **)buf;
      *(void *)buf = v11;

      if (v12)
      {
        uint64_t v14 = fp_current_or_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[FPDProviderDescriptor initWithExtensionRecord:].cold.8();
        }
      }
      v15 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

      if (v15)
      {
        objc_super v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[FPDServer migrateLegacyFPFSLocations].cold.4();
        }
      }
    }
    id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
    v18 = [v17 currentPersona];

    int v19 = [v18 isEnterprisePersona];
    if (v19)
    {
      id v52 = 0;
      BOOL v20 = [(FPDVolumeManager *)self loadEnterpriseVolumeWithError:&v52];
      id v21 = v52;
      if (!v20)
      {
        v22 = fp_current_or_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_msgSend(v21, "fp_prettyDescription");
          [(FPDVolumeManager *)(uint64_t)v6 enumerateLibrariesForPersona:v58 withBlock:v22];
        }
      }
    }

    _FPRestorePersona();
  }
  else
  {
    int v19 = 0;
  }
  id v24 = self;
  objc_sync_enter(v24);
  id v25 = (void *)[(NSMutableArray *)v24->_volumes copy];
  objc_sync_exit(v24);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v27)
  {
    uint64_t v29 = *(void *)v49;
    *(void *)&long long v28 = 138412546;
    long long v43 = v28;
LABEL_24:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v49 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v48 + 1) + 8 * v30);
      if ((v19 ^ (objc_msgSend(v31, "role", v43) != 2)))
      {
        v32 = [MEMORY[0x1E4FB36F8] sharedManager];
        v33 = [v32 currentPersona];

        id v47 = 0;
        v34 = [v33 userPersonaUniqueString];
        v35 = v34;
        if (v34 == v45
          || (objc_msgSend(v34, "isEqualToString:") & 1) != 0
          || !voucher_process_can_use_arbitrary_personas())
        {
          v40 = 0;
        }
        else
        {
          id v46 = 0;
          v36 = (void *)[v33 copyCurrentPersonaContextWithError:&v46];
          id v37 = v46;
          id v38 = v47;
          id v47 = v36;

          if (v37)
          {
            v39 = fp_current_or_default_log();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v37;
              _os_log_error_impl(&dword_1D744C000, v39, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", buf, 0xCu);
            }
          }
          v40 = [v33 generateAndRestorePersonaContextWithPersonaUniqueString:v45];

          if (v40)
          {
            v41 = fp_current_or_default_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              *(void *)&uint8_t buf[4] = v45;
              __int16 v55 = 2112;
              v56 = v40;
              _os_log_error_impl(&dword_1D744C000, v41, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
            }
          }
        }
        int v42 = v44[2](v44, v31);

        _FPRestorePersona();
        if (!v42) {
          break;
        }
      }
      if (v27 == ++v30)
      {
        uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v27) {
          goto LABEL_24;
        }
        break;
      }
    }
  }
}

- (void)enumerateLibrariesWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableArray *)v5->_volumes copy];
  objc_sync_exit(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v7);
      }
      if ((v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10)) & 1) == 0) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)defaultVolumeForCurrentPersona
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v4 = [v3 currentPersona];

  char v5 = [v4 isEnterprisePersona];
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(FPDVolumeManager *)v5 defaultVolumeForCurrentPersona];
  }

  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__FPDVolumeManager_defaultVolumeForCurrentPersona__block_invoke;
  v9[3] = &unk_1E6A74848;
  char v10 = v5;
  v9[4] = &v11;
  [(FPDVolumeManager *)self enumerateLibrariesWithBlock:v9];
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __50__FPDVolumeManager_defaultVolumeForCurrentPersona__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v5 = v4;
  if (!*(unsigned char *)(a1 + 40))
  {
    if ([v4 role] == 1) {
      goto LABEL_5;
    }
    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_3;
    }
  }
  if ([v5 role] == 2)
  {
LABEL_5:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v6 = 0;
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

- (void)invalidateDevice:(int)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = v7->_volumes;
  id v9 = (id)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "dev", (void)v14) == a3)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v7);
  if (v9)
  {
    [(FPDVolumeManager *)v7 invalidateVolume:v9 reason:v6];
  }
  else
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = a3;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_INFO, "[INFO] No volume found for dev:%d", buf, 8u);
    }
  }
}

- (void)invalidateVolume:(id)a3 reason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  if (([(NSMutableArray *)v9->_volumes containsObject:v7] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, v9, @"FPDVolumeManager.m", 447, @"Trying to remove nonexistent volume %@ (existing volumes are %@)", v7, v9->_volumes object file lineNumber description];
  }
  [(NSMutableArray *)v9->_volumes removeObject:v7];
  objc_sync_exit(v9);

  uint64_t v10 = [(FPDVolumeManager *)v9 server];
  uint64_t v11 = [v10 extensionManager];
  [v11 updateProviderOnDisappearingVolume:v7 reason:v8];

  [(FPDVolumeManager *)v9 unregisterVersionsFileCoordinatorForVolume:v7];
  long long v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_INFO, "[INFO] Invalidated volume %{public}@ (reason: %{public}@)", buf, 0x16u);
  }
}

- (void)unregisterVersionsFileCoordinatorForVolume:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  versionsProvidersByVolumeID = v5->_versionsProvidersByVolumeID;
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "dev"));
  id v8 = [(NSMutableDictionary *)versionsProvidersByVolumeID objectForKeyedSubscript:v7];

  id v9 = v5->_versionsProvidersByVolumeID;
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "dev"));
  [(NSMutableDictionary *)v9 removeObjectForKey:v10];

  objc_sync_exit(v5);
  if (v8)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v4 root];
      int v13 = 138412546;
      long long v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      _os_log_impl(&dword_1D744C000, v11, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered versions provider %@ for volume %@", (uint8_t *)&v13, 0x16u);
    }
    [MEMORY[0x1E4F28CA0] _removeFileProvider:v8];
  }
}

- (void)registerVersionsFileCoordinatorForVolume:(id)a3 volumeIgnoringOwnership:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  if (!v7->_delegate)
  {
    id v8 = [FPDVersionsFileCoordinationProviderDelegate alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    uint64_t v10 = [WeakRetained extensionManager];
    uint64_t v11 = [(FPDVersionsFileCoordinationProviderDelegate *)v8 initWithExtensionManager:v10];
    delegate = v7->_delegate;
    v7->_delegate = (FPDVersionsFileCoordinationProviderDelegate *)v11;
  }
  versionsProvidersByVolumeID = v7->_versionsProvidersByVolumeID;
  long long v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "dev"));
  __int16 v15 = [(NSMutableDictionary *)versionsProvidersByVolumeID objectForKeyedSubscript:v14];

  if (v15)
  {
    __int16 v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = [v6 root];
    __int16 v16 = [(FPDVolumeManager *)v7 getGenstoreVersionsRootURL:v18 volumeIgnoringOwnership:v4];

    uint64_t v17 = [[FPDFileCoordinationProvider alloc] initWithRootURL:v16];
    [(FPDFileCoordinationProvider *)v17 setDelegate:v7->_delegate];
    int v19 = v7->_versionsProvidersByVolumeID;
    BOOL v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "dev"));
    [(NSMutableDictionary *)v19 setObject:v17 forKeyedSubscript:v20];
  }
  objc_sync_exit(v7);

  if (v17)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28CA0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__FPDVolumeManager_registerVersionsFileCoordinatorForVolume_volumeIgnoringOwnership___block_invoke;
    v22[3] = &unk_1E6A736C0;
    v23 = v17;
    id v24 = v16;
    [v21 _addFileProvider:v23 completionHandler:v22];
  }
}

void __85__FPDVolumeManager_registerVersionsFileCoordinatorForVolume_volumeIgnoringOwnership___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅿️ Registered versions provider %@ for path %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)getGenstoreVersionsRootURL:(id)a3 volumeIgnoringOwnership:(BOOL)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  if (a4)
  {
    v14[0] = a3;
    v14[1] = @".DocumentRevisions-V100/AllUIDs";
    int v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    __int16 v7 = [v5 arrayWithObjects:v14 count:2];
    uint64_t v8 = [v4 fileURLWithPathComponents:v7];
  }
  else
  {
    v13[0] = a3;
    uint64_t v9 = NSNumber;
    id v10 = a3;
    __int16 v7 = objc_msgSend(v9, "numberWithUnsignedInt:", getuid(), v13[0], @".DocumentRevisions-V100/PerUID");
    id v6 = [v7 stringValue];
    v13[2] = v6;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    uint64_t v8 = [v4 fileURLWithPathComponents:v11];
  }
  return v8;
}

- (FPDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (FPDServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_versionsProvidersByVolumeID, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
}

- (void)getAllEligibleVolumesWithError:(NSObject *)a1 count:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a1, v3, "[ERROR] Unable to count mount points: %s", v4);
}

- (void)getAllEligibleVolumesWithError:(os_log_t)log count:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Unable to allocate memory to load libraries", v1, 2u);
}

- (void)getAllEligibleVolumesWithError:(NSObject *)a3 count:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a3, (uint64_t)a3, "[ERROR] Unable to retrieve mount points: %s", (uint8_t *)a2);
}

- (void)getAllEligibleVolumesWithError:count:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_2(&dword_1D744C000, v0, v1, "[ERROR] ┏%llx Loading libraries from all eligible volumes %d mounted)", v2, v3);
}

- (void)loadSingleVolume:role:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Volume %{public}s not eligible to store FP library, skipping", v2, v3, v4, v5, v6);
}

- (void)loadSingleVolume:role:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Volume %{public}s not eligible because it is additional and we're not running in the foreground session", v2, v3, v4, v5, v6);
}

- (void)createVolumeWithStatFS:(NSObject *)a3 role:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2082;
  *(void *)((char *)&v4 + 2) = a1 + 1112;
  OUTLINED_FUNCTION_4_2(&dword_1D744C000, a2, a3, "[ERROR] Unknown / unsupported volume role %u on %{public}s", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

- (void)loadVolumeWithURL:(void *)a1 role:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_shortDescription");
  int v4 = *__error();
  int v5 = 138543618;
  uint8_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Unable to getattrlist for enterprise path '%{public}@': %{errno}d", (uint8_t *)&v5, 0x12u);
}

- (void)loadEnterpriseVolumeWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D744C000, log, OS_LOG_TYPE_FAULT, "[CRIT] EDS persona must be adopted to load an EDS volume", v1, 2u);
}

- (void)loadEnterpriseVolumeWithError:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx Loading EDS libraries", v2, v3, v4, v5, v6);
}

- (void)loadHomeVolume
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx Loading home libraries", v2, v3, v4, v5, v6);
}

- (void)libraryForVolume:(void *)a1 createIfNeeded:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a3, (uint64_t)a3, "[ERROR] Volume not found for UUID: %{public}@", (uint8_t *)a2);
}

- (void)enumerateLibrariesForPersona:(uint8_t *)buf withBlock:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Could not load EDS volume for %{public}@: %@", buf, 0x16u);
}

- (void)defaultVolumeForCurrentPersona
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[FPDVolumeManager defaultVolumeForCurrentPersona]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: eds:%d", (uint8_t *)&v2, 0x12u);
}

@end