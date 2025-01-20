@interface MCMGlobalConfiguration
- (BOOL)handlesGlobalContainers;
- (BOOL)handlesUserContainers;
- (BOOL)isGlobalBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isGlobalContainerClass:(unint64_t)a3;
- (BOOL)isGlobalSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isInternalImage;
- (BOOL)isPerUserBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUnsupportedBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUnsupportedSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUserBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUserSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)kernelUpcallEnabled;
- (MCMContainerClassIterator)classIterator;
- (MCMContainerClassPathCache)classPathCache;
- (MCMGlobalConfiguration)initWithStaticConfig:(id)a3 runMode:(unsigned int)a4 userContainerMode:(unsigned int)a5 bundleContainerMode:(unsigned int)a6 bundleContainerOwner:(id)a7 systemContainerMode:(unsigned int)a8 systemContainerOwner:(id)a9 kernelUpcallEnabled:(BOOL)a10;
- (MCMLibraryRepair)libraryRepair;
- (MCMManagedPathRegistry)managedPathRegistry;
- (MCMPOSIXUser)bundleContainerOwner;
- (MCMPOSIXUser)currentUser;
- (MCMPOSIXUser)defaultUser;
- (MCMPOSIXUser)systemContainerOwner;
- (MCMStaticConfiguration)staticConfig;
- (NSArray)appUserDataItemNames;
- (NSArray)excludedFromAppUserData;
- (NSURL)sharedContainersDirectory;
- (unsigned)bundleContainerMode;
- (unsigned)dispositionForContainerClass:(unint64_t)a3;
- (unsigned)dispositionForContainerClass:(unint64_t)a3 forUser:(id)a4;
- (unsigned)runmode;
- (unsigned)systemContainerMode;
- (unsigned)userContainerMode;
- (void)setIsInternalImage:(BOOL)a3;
- (void)signpostFirstContainerClass:(unint64_t)a3;
@end

@implementation MCMGlobalConfiguration

- (MCMContainerClassPathCache)classPathCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classPathCache)
  {
    v3 = [MCMContainerClassPathCache alloc];
    v4 = +[MCMUserIdentitySharedCache sharedInstance];
    uint64_t v5 = [(MCMContainerClassPathCache *)v3 initWithUserIdentityCache:v4];
    classPathCache = v2->_classPathCache;
    v2->_classPathCache = (MCMContainerClassPathCache *)v5;
  }
  objc_sync_exit(v2);

  v7 = v2->_classPathCache;

  return v7;
}

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (unsigned)dispositionForContainerClass:(unint64_t)a3 forUser:(id)a4
{
  id v6 = a4;
  if (a3 <= 8 && ((1 << a3) & 0x12A) != 0)
  {
    id v7 = containermanager_copy_global_configuration();
    int v8 = [v7 bundleContainerMode];

    unsigned int v9 = v8 - 1;
  }
  else
  {
    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFFELL;
    id v12 = containermanager_copy_global_configuration();
    v13 = v12;
    if (v11 != 12)
    {
      int v15 = [v12 userContainerMode];

      if (v15 == 2
        || v15 == 1
        && (!v6
         || ([(MCMGlobalConfiguration *)self defaultUser],
             v16 = objc_claimAutoreleasedReturnValue(),
             int v17 = [v6 isEqual:v16],
             v16,
             v17)))
      {
        unsigned int v10 = 1;
        goto LABEL_14;
      }
LABEL_13:
      unsigned int v10 = 0;
      goto LABEL_14;
    }
    int v14 = [v12 systemContainerMode];

    unsigned int v9 = v14 - 1;
  }
  if (v9 >= 3) {
    goto LABEL_13;
  }
  unsigned int v10 = dword_1D7815A34[v9];
LABEL_14:

  return v10;
}

- (unsigned)userContainerMode
{
  return self->_userContainerMode;
}

- (unsigned)dispositionForContainerClass:(unint64_t)a3
{
  return [(MCMGlobalConfiguration *)self dispositionForContainerClass:a3 forUser:0];
}

- (unsigned)runmode
{
  return self->_runmode;
}

- (BOOL)isUnsupportedSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 0;

  return v4;
}

- (MCMPOSIXUser)currentUser
{
  return self->_currentUser;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (unsigned)systemContainerMode
{
  return self->_systemContainerMode;
}

- (BOOL)isGlobalSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 1;

  return v4;
}

- (BOOL)isGlobalBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 8 && ((1 << a3) & 0x12A) != 0)
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 bundleContainerMode] == 1;
  }
  return v3;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryRepair, 0);
  objc_storeStrong((id *)&self->_managedPathRegistry, 0);
  objc_storeStrong((id *)&self->_classPathCache, 0);
  objc_storeStrong((id *)&self->_systemContainerOwner, 0);
  objc_storeStrong((id *)&self->_bundleContainerOwner, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_defaultUser, 0);
  objc_storeStrong((id *)&self->_excludedFromAppUserData, 0);
  objc_storeStrong((id *)&self->_appUserDataItemNames, 0);
  objc_storeStrong((id *)&self->_sharedContainersDirectory, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_staticConfig, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);

  objc_storeStrong((id *)&self->_homeDirectory, 0);
}

- (BOOL)kernelUpcallEnabled
{
  return self->_kernelUpcallEnabled;
}

- (MCMLibraryRepair)libraryRepair
{
  return self->_libraryRepair;
}

- (MCMManagedPathRegistry)managedPathRegistry
{
  return self->_managedPathRegistry;
}

- (MCMPOSIXUser)systemContainerOwner
{
  return self->_systemContainerOwner;
}

- (MCMPOSIXUser)bundleContainerOwner
{
  return self->_bundleContainerOwner;
}

- (unsigned)bundleContainerMode
{
  return self->_bundleContainerMode;
}

- (void)setIsInternalImage:(BOOL)a3
{
  self->_isInternalImage = a3;
}

- (BOOL)handlesUserContainers
{
  id v2 = containermanager_copy_global_configuration();
  if ([v2 userContainerMode])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = containermanager_copy_global_configuration();
    if ([v4 bundleContainerMode] == 2)
    {
      BOOL v3 = 1;
    }
    else
    {
      id v5 = containermanager_copy_global_configuration();
      BOOL v3 = [v5 systemContainerMode] == 2;
    }
  }

  return v3;
}

- (BOOL)handlesGlobalContainers
{
  id v2 = containermanager_copy_global_configuration();
  if ([v2 bundleContainerMode] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 systemContainerMode] == 1;
  }
  return v3;
}

- (BOOL)isGlobalContainerClass:(unint64_t)a3
{
  if (a3 - 2 < 0xD && ((0x13B5u >> (a3 - 2)) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else if ([(MCMGlobalConfiguration *)self isGlobalSystemContainerWithContainerClass:a3]|| (BOOL v5 = [(MCMGlobalConfiguration *)self isGlobalBundleContainerWithContainerClass:a3]))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isUnsupportedBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 0xE && ((1 << a3) & 0x412A) != 0)
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 bundleContainerMode] == 0;
  }
  return v3;
}

- (BOOL)isUserBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x12A) != 0)
    {
      id v4 = containermanager_copy_global_configuration();
      BOOL v3 = [v4 bundleContainerMode] == 2;
    }
    else
    {
      if (a3 != 14) {
        return v3;
      }
      id v4 = containermanager_copy_global_configuration();
      BOOL v3 = [v4 bundleContainerMode] != 0;
    }
  }
  return v3;
}

- (BOOL)isPerUserBundleContainerWithContainerClass:(unint64_t)a3
{
  if (a3 != 14) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 bundleContainerMode] != 0;

  return v4;
}

- (BOOL)isUserSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 2;

  return v4;
}

- (BOOL)isInternalImage
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__MCMGlobalConfiguration_isInternalImage__block_invoke;
  v4[3] = &unk_1E6A80730;
  v4[4] = self;
  if (isInternalImage_onceToken != -1) {
    dispatch_once(&isInternalImage_onceToken, v4);
  }
  return self->_isInternalImage;
}

uint64_t __41__MCMGlobalConfiguration_isInternalImage__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_has_internal_content();
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (NSArray)excludedFromAppUserData
{
  return (NSArray *)&unk_1F2F12440;
}

- (NSArray)appUserDataItemNames
{
  return (NSArray *)&unk_1F2F12428;
}

- (NSURL)sharedContainersDirectory
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(MCMGlobalConfiguration *)self currentUser];
  int v4 = [v3 isRoot];

  if (v4)
  {
    BOOL v5 = self;
    objc_sync_enter(v5);
    if (!v5->_sharedContainersDirectory)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/containers" isDirectory:1];
      sharedContainersDirectory = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = (NSURL *)v6;
    }
    int v8 = +[MCMFileManager defaultManager];
    unsigned int v9 = v5->_sharedContainersDirectory;
    id v17 = 0;
    char v10 = [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 mode:493 error:&v17];
    id v11 = v17;

    if ((v10 & 1) == 0)
    {
      id v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = [(NSURL *)v5->_sharedContainersDirectory path];
        *(_DWORD *)buf = 138412546;
        v19 = v16;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Failed to create shared container dir at \"%@\": %@", buf, 0x16u);
      }
      v13 = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = 0;
    }
    objc_sync_exit(v5);
  }
  int v14 = self->_sharedContainersDirectory;

  return v14;
}

- (void)signpostFirstContainerClass:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 <= 0xD)
  {
    uint64_t v3 = container_class_normalized();
    os_unfair_lock_lock_with_options();
    os_signpost_id_t v4 = gSignpostedFirstContainerOfClass[v3];
    gSignpostedFirstContainerOfClass[v3] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&gSignpostedFirstContainerOfClassLock + v3);
    if (v4)
    {
      BOOL v5 = container_log_handle_for_category();
      uint64_t v6 = v5;
      if (v4 != -1 && os_signpost_enabled(v5))
      {
        int v7 = 134349056;
        uint64_t v8 = v3;
        _os_signpost_emit_with_name_impl(&dword_1D7739000, v6, OS_SIGNPOST_INTERVAL_END, v4, "VendFirstContainerOfClass", " class=%{public, signpost.description:attribute}llu ", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (MCMGlobalConfiguration)initWithStaticConfig:(id)a3 runMode:(unsigned int)a4 userContainerMode:(unsigned int)a5 bundleContainerMode:(unsigned int)a6 bundleContainerOwner:(id)a7 systemContainerMode:(unsigned int)a8 systemContainerOwner:(id)a9 kernelUpcallEnabled:(BOOL)a10
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a7;
  id v44 = a9;
  v45.receiver = self;
  v45.super_class = (Class)MCMGlobalConfiguration;
  v19 = [(MCMGlobalConfiguration *)&v45 init];
  if (!v19)
  {
LABEL_9:

    return v19;
  }
  container_class_for_each_normalized_class();
  objc_storeStrong((id *)&v19->_staticConfig, a3);
  __int16 v20 = [[MCMContainerClassIterator alloc] initWithStaticConfig:v17];
  classIterator = v19->_classIterator;
  v19->_classIterator = v20;

  v19->_runmode = a4;
  v19->_userContainerMode = a5;
  v19->_bundleContainerMode = a6;
  objc_storeStrong((id *)&v19->_bundleContainerOwner, a7);
  v19->_systemContainerMode = a8;
  objc_storeStrong((id *)&v19->_systemContainerOwner, a9);
  uint64_t v22 = [v17 defaultUser];
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    v24 = +[MCMPOSIXUser currentPOSIXUser];
  }
  defaultUser = v19->_defaultUser;
  v19->_defaultUser = v24;

  uint64_t v26 = +[MCMPOSIXUser currentPOSIXUser];
  currentUser = v19->_currentUser;
  v19->_currentUser = (MCMPOSIXUser *)v26;

  v19->_kernelUpcallEnabled = a10;
  uint64_t v28 = [(MCMPOSIXUser *)v19->_currentUser homeDirectoryURL];
  homeDirectory = v19->_homeDirectory;
  v19->_homeDirectory = (NSURL *)v28;

  if (v19->_homeDirectory)
  {
    v30 = [[MCMManagedPathRegistry alloc] initWithDaemonUser:v19->_currentUser privileged:a4 == 0];
    managedPathRegistry = v19->_managedPathRegistry;
    v19->_managedPathRegistry = v30;

    v32 = [MCMLibraryRepair alloc];
    v33 = v19->_managedPathRegistry;
    v34 = +[MCMFileManager defaultManager];
    uint64_t v35 = [(MCMLibraryRepair *)v32 initWithManagedPathRegistry:v33 fileManager:v34 classIterator:v19->_classIterator];
    libraryRepair = v19->_libraryRepair;
    v19->_libraryRepair = (MCMLibraryRepair *)v35;

    v37 = container_log_handle_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = v19->_defaultUser;
      v40 = v19->_currentUser;
      bundleContainerOwner = v19->_bundleContainerOwner;
      v42 = v19->_homeDirectory;
      *(_DWORD *)buf = 138413058;
      v47 = v39;
      __int16 v48 = 2112;
      v49 = v40;
      __int16 v50 = 2112;
      v51 = bundleContainerOwner;
      __int16 v52 = 2112;
      v53 = v42;
      _os_log_error_impl(&dword_1D7739000, v37, OS_LOG_TYPE_ERROR, "Default user: %@, current user: %@, bundle owner: %@, home dir: [%@]", buf, 0x2Au);
    }

    goto LABEL_9;
  }
  v43 = container_log_handle_for_category();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "could not get home directory...aborting\n", buf, 2u);
  }

  uint64_t result = (MCMGlobalConfiguration *)_os_crash();
  __break(1u);
  return result;
}

void __175__MCMGlobalConfiguration_initWithStaticConfig_runMode_userContainerMode_bundleContainerMode_bundleContainerOwner_systemContainerMode_systemContainerOwner_kernelUpcallEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = container_log_handle_for_category();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, &gSignpostedFirstContainerOfClass[a2]);

  BOOL v5 = container_log_handle_for_category();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VendFirstContainerOfClass", "", v7, 2u);
  }

  gSignpostedFirstContainerOfClass[a2] = v4;
  gSignpostedFirstContainerOfClassLock[a2] = 0;
}

@end