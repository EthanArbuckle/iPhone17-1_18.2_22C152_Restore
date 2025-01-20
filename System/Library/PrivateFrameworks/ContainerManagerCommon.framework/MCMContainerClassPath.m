@interface MCMContainerClassPath
+ (BOOL)_inLibraryRepairBlock_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8;
+ (id)_baseURLForUserIdentity:(id)a3;
+ (id)_baseURLForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)_categoryComponentForContainerClass:(unint64_t)a3;
+ (id)_classComponentForContainerClass:(unint64_t)a3;
+ (id)containerPathForContainerIdentity:(id)a3;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)containerPathTypeClasses;
+ (id)posixOwnerForContainerClass:(unint64_t)a3 user:(id)a4;
+ (unsigned)_modeForContainerClass:(unint64_t)a3;
- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 error:(id *)a7;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)createIfNecessaryWithError:(id *)a3;
- (BOOL)exists;
- (BOOL)isCaseSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerClassPath:(id)a3;
- (BOOL)supportsDataProtection;
- (MCMContainerClassPath)initWithBaseURL:(id)a3 categoryComponent:(id)a4 classComponent:(id)a5 containerClass:(unint64_t)a6 POSIXOwner:(id)a7 POSIXMode:(unsigned __int16)a8 userIdentity:(id)a9;
- (MCMPOSIXUser)posixOwner;
- (MCMUserIdentity)userIdentity;
- (NSString)categoryComponent;
- (NSString)classComponent;
- (NSString)description;
- (NSURL)baseURL;
- (NSURL)categoryURL;
- (NSURL)classURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)posixMode;
- (void)setExists:(BOOL)a3;
@end

@implementation MCMContainerClassPath

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSURL)classURL
{
  return self->_classURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (BOOL)isEqualToContainerClassPath:(id)a3
{
  v4 = a3;
  BOOL v5 = [(MCMContainerClassPath *)self _obj1:self->_baseURL isEqualToObj2:v4[4]]
    && [(MCMContainerClassPath *)self _obj1:self->_categoryComponent isEqualToObj2:v4[10]]
    && [(MCMContainerClassPath *)self _obj1:self->_classComponent isEqualToObj2:v4[11]]
    && [(MCMContainerClassPath *)self _obj1:self->_categoryURL isEqualToObj2:v4[5]]
    && [(MCMContainerClassPath *)self _obj1:self->_classURL isEqualToObj2:v4[6]]
    && [(MCMContainerClassPath *)self _obj1:self->_userIdentity isEqualToObj2:v4[8]];

  return v5;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = [a3 isEqual:a4];
  }
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    return 1;
  }
  return result;
}

- (BOOL)isCaseSensitive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_classURLCreated)
  {
    v3 = container_log_handle_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[MCMContainerClassPath isCaseSensitive]";
      _os_log_fault_impl(&dword_1D7739000, v3, OS_LOG_TYPE_FAULT, "%{public}s called before createIfNecessaryWithError:, result may not be valid", buf, 0xCu);
    }
  }
  if (!self->_caseSensitiveDetermined)
  {
    v4 = +[MCMFileManager defaultManager];
    BOOL v5 = [(MCMContainerClassPath *)self classURL];
    id v10 = 0;
    int v6 = [v4 checkFileSystemAtURL:v5 isCaseSensitive:&self->_caseSensitive canAtomicSwap:0 error:&v10];
    v7 = (char *)v10;

    if (v6)
    {
      self->_caseSensitiveDetermined = 1;
    }
    else
    {
      v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Could not determine case sensitivity: %@", buf, 0xCu);
      }
    }
  }
  return self->_caseSensitive;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMContainerClassPath *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MCMContainerClassPath *)self isEqualToContainerClassPath:v5];

  return v6;
}

id __36__MCMContainerClassPath_description__block_invoke(uint64_t a1, int a2)
{
  v21 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v4);
  BOOL v5 = *(void **)(a1 + 32);
  BOOL v6 = [v5 userIdentity];
  v7 = [v6 personaUniqueString];
  v8 = [*(id *)(a1 + 32) baseURL];
  v9 = [v8 path];
  id v10 = v9;
  v11 = v9;
  if (a2)
  {
    v11 = [v9 redactedDescription];
  }
  v12 = [*(id *)(a1 + 32) categoryComponent];
  uint64_t v13 = [*(id *)(a1 + 32) classComponent];
  v14 = (void *)v13;
  v15 = *(unsigned char **)(a1 + 32);
  v16 = " created";
  v17 = "";
  if (!v15[12]) {
    v16 = "";
  }
  if (v15[9])
  {
    if (v15[8]) {
      v17 = " case-sensitive";
    }
    else {
      v17 = " case-insensitive";
    }
  }
  if (v15[11])
  {
    if (v15[10]) {
      v18 = " dp-enabled";
    }
    else {
      v18 = " dp-disabled";
    }
  }
  else
  {
    v18 = "";
  }
  objc_msgSend(v21, "stringWithFormat:", @"<%@: %p; persona [%@]; [%@]/[%@]/[%@]%s%s%s>",
    v22,
    v5,
    v7,
    v11,
    v12,
    v13,
    v16,
    v17,
  v19 = v18);

  if (a2) {

  }
  return v19;
}

- (unint64_t)hash
{
  v3 = [(MCMContainerClassPath *)self baseURL];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(MCMContainerClassPath *)self categoryComponent];
  uint64_t v6 = [v5 hash];
  v7 = [(MCMContainerClassPath *)self classComponent];
  uint64_t v8 = [v7 hash];
  v9 = [(MCMContainerClassPath *)self userIdentity];
  id v10 = [v9 identifier];
  uint64_t v11 = [v10 hash];

  return v6 ^ v4 ^ v8 ^ v11;
}

- (NSString)classComponent
{
  return self->_classComponent;
}

- (NSString)categoryComponent
{
  return self->_categoryComponent;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setExists:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (a3)
  {
    char v4 = 1;
    BOOL v5 = obj;
  }
  else
  {
    char v4 = 0;
    BOOL v5 = obj;
    obj->_caseSensitiveDetermined = 0;
    obj->_supportsDataProtectionDetermined = 0;
  }
  v5->_exists = v4;
  v5->_classURLCreated = v4;
  objc_sync_exit(v5);
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MCMContainerClassPath_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  char v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

+ (id)posixOwnerForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  if (a3 <= 0xE
    && ((1 << a3) & 0x412A) != 0
    && (id v6 = containermanager_copy_global_configuration(),
        char v7 = [v6 isUnsupportedBundleContainerWithContainerClass:a3],
        v6,
        (v7 & 1) == 0))
  {
    id v11 = containermanager_copy_global_configuration();
    uint64_t v12 = [v11 bundleContainerOwner];
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC
      || (id v8 = containermanager_copy_global_configuration(),
          char v9 = [v8 isUnsupportedSystemContainerWithContainerClass:a3],
          v8,
          (v9 & 1) != 0))
    {
      id v10 = v5;
      goto LABEL_10;
    }
    id v11 = containermanager_copy_global_configuration();
    uint64_t v12 = [v11 systemContainerOwner];
  }
  id v10 = (id)v12;

LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classComponent, 0);
  objc_storeStrong((id *)&self->_categoryComponent, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_posixOwner, 0);
  objc_storeStrong((id *)&self->_classURL, 0);
  objc_storeStrong((id *)&self->_categoryURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

- (unsigned)posixMode
{
  return self->_posixMode;
}

- (MCMPOSIXUser)posixOwner
{
  return self->_posixOwner;
}

- (NSURL)categoryURL
{
  return self->_categoryURL;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 error:(id *)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a3;
  v14 = +[MCMUserIdentitySharedCache sharedInstance];
  v15 = [v14 libraryRepairForUserIdentity:self->_userIdentity];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke;
  v18[3] = &unk_1E6A80890;
  unsigned __int16 v21 = a4;
  v18[4] = self;
  id v19 = v12;
  int v20 = a6;
  id v16 = v12;
  LOBYTE(a7) = [v15 fixAndRetryIfPermissionsErrorWithURL:v13 containerPath:0 containerIdentifier:0 error:a7 duringBlock:v18];

  return (char)a7;
}

uint64_t __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v5, *(unsigned __int16 *)(a1 + 52), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), 0, a3);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_baseURL);
    objc_storeStrong((id *)(v5 + 80), self->_categoryComponent);
    objc_storeStrong((id *)(v5 + 88), self->_classComponent);
    objc_storeStrong((id *)(v5 + 40), self->_categoryURL);
    objc_storeStrong((id *)(v5 + 48), self->_classURL);
    *(void *)(v5 + 72) = self->_containerClass;
    *(unsigned char *)(v5 + 8) = self->_caseSensitive;
    *(unsigned char *)(v5 + 10) = self->_supportsDataProtection;
    *(unsigned char *)(v5 + 24) = self->_exists;
    objc_storeStrong((id *)(v5 + 56), self->_posixOwner);
    *(_WORD *)(v5 + 26) = self->_posixMode;
    objc_storeStrong((id *)(v5 + 64), self->_userIdentity);
  }
  return (id)v5;
}

- (MCMContainerClassPath)initWithBaseURL:(id)a3 categoryComponent:(id)a4 classComponent:(id)a5 containerClass:(unint64_t)a6 POSIXOwner:(id)a7 POSIXMode:(unsigned __int16)a8 userIdentity:(id)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a7;
  id v16 = a9;
  v42.receiver = self;
  v42.super_class = (Class)MCMContainerClassPath;
  v17 = [(MCMContainerClassPath *)&v42 init];
  v18 = v17;
  if (v17)
  {
    p_userIdentity = &v17->_userIdentity;
    *(_WORD *)&v17->_classURLCreated = 0;
    *(_DWORD *)&v17->_caseSensitive = 0;
    objc_storeStrong((id *)&v17->_userIdentity, a9);
    objc_storeStrong((id *)&v18->_baseURL, a3);
    objc_storeStrong((id *)&v18->_categoryComponent, a4);
    objc_storeStrong((id *)&v18->_classComponent, a5);
    v18->_containerClass = a6;
    objc_storeStrong((id *)&v18->_posixOwner, a7);
    v18->_posixMode = a8;
    if (v18->_baseURL)
    {
      if (*p_userIdentity)
      {
        id v20 = containermanager_copy_global_configuration();
        int v21 = objc_msgSend(v20, "isUnsupportedBundleContainerWithContainerClass:", a6, v38, v39, v40, v41);

        if (v21)
        {
          uint64_t v22 = container_log_handle_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            unint64_t v44 = a6;
            v23 = "Attempted to create a class path with an unsupported bundle class: %{public}llu";
LABEL_23:
            _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
          }
        }
        else
        {
          id v25 = containermanager_copy_global_configuration();
          int v26 = [v25 isUnsupportedSystemContainerWithContainerClass:a6];

          if (!v26)
          {
            p_categoryURL = (id *)&v18->_categoryURL;
            objc_storeStrong((id *)&v18->_categoryURL, v18->_baseURL);
            categoryComponent = v18->_categoryComponent;
            if (categoryComponent)
            {
              uint64_t v31 = [*p_categoryURL URLByAppendingPathComponent:categoryComponent isDirectory:1];
              id v32 = *p_categoryURL;
              id *p_categoryURL = (id)v31;
            }
            p_classURL = (id *)&v18->_classURL;
            objc_storeStrong((id *)&v18->_classURL, v18->_categoryURL);
            classComponent = v18->_classComponent;
            if (classComponent)
            {
              uint64_t v35 = [*p_classURL URLByAppendingPathComponent:classComponent isDirectory:1];
              id v36 = *p_classURL;
              id *p_classURL = (id)v35;
            }
            uint64_t v37 = [v16 homeDirectoryURL];
            homeDirectoryURL = v18->_homeDirectoryURL;
            v18->_homeDirectoryURL = (NSURL *)v37;
            goto LABEL_15;
          }
          uint64_t v22 = container_log_handle_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            unint64_t v44 = a6;
            v23 = "Attempted to create a class path with an unsupported system class: %{public}llu";
            goto LABEL_23;
          }
        }
LABEL_14:

        homeDirectoryURL = v18;
        v18 = 0;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v22 = container_log_handle_for_category();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v24 = "Attempted to create a class path with no userIdentity.";
    }
    else
    {
      uint64_t v22 = container_log_handle_for_category();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v24 = "Attempted to create a class path with no baseURL.";
    }
    _os_log_fault_impl(&dword_1D7739000, v22, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_14;
  }
LABEL_16:

  return v18;
}

- (BOOL)exists
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classURLCreated)
  {
    v3 = +[MCMFileManager defaultManager];
    uint64_t v4 = [(MCMContainerClassPath *)v2 classURL];
    v2->_BOOL exists = [v3 itemExistsAtURL:v4];
  }
  BOOL exists = v2->_exists;
  objc_sync_exit(v2);

  return exists;
}

- (BOOL)supportsDataProtection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_classURLCreated)
  {
    v3 = container_log_handle_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v12 = "-[MCMContainerClassPath supportsDataProtection]";
      _os_log_fault_impl(&dword_1D7739000, v3, OS_LOG_TYPE_FAULT, "%{public}s called before createIfNecessaryWithError:, result may not be valid", buf, 0xCu);
    }
  }
  if (!self->_supportsDataProtectionDetermined)
  {
    uint64_t v4 = +[MCMFileManager defaultManager];
    uint64_t v5 = [(MCMContainerClassPath *)self classURL];
    id v10 = 0;
    int v6 = [v4 checkFileSystemAtURL:v5 supportsPerFileKeys:&self->_supportsDataProtection error:&v10];
    char v7 = (char *)v10;

    if (v6)
    {
      self->_supportsDataProtectionDetermined = 1;
    }
    else
    {
      id v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Could not determine dp support: %@", buf, 0xCu);
      }
    }
  }
  return self->_supportsDataProtection;
}

- (BOOL)createIfNecessaryWithError:(id *)a3
{
  if (self->_classURLCreated) {
    return 1;
  }
  int v6 = [(MCMContainerClassPath *)self classURL];
  uint64_t v7 = [(MCMContainerClassPath *)self posixMode];
  id v8 = [(MCMContainerClassPath *)self posixOwner];
  self->_classURLCreated = [(MCMContainerClassPath *)self _createURLIfNecessary:v6 mode:v7 owner:v8 dataProtectionClass:0xFFFFFFFFLL error:a3];

  return self->_classURLCreated;
}

+ (id)_baseURLForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = containermanager_copy_global_configuration();
  int v8 = [v7 isGlobalContainerClass:a4];

  if (v8)
  {
    id v9 = containermanager_copy_global_configuration();
    id v10 = [v9 sharedContainersDirectory];
  }
  else if (v6)
  {
    id v10 = [a1 _baseURLForUserIdentity:v6];
  }
  else
  {
    id v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = a4;
      _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", (uint8_t *)&v13, 0xCu);
    }

    id v10 = 0;
  }

  return v10;
}

+ (id)_baseURLForUserIdentity:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 homeDirectoryURL];
  if (!v4)
  {
    uint64_t v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315394;
      id v9 = "+[MCMContainerClassPath _baseURLForUserIdentity:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_fault_impl(&dword_1D7739000, v5, OS_LOG_TYPE_FAULT, "%s: User identity has a nil home directory; userIdentity = %@",
        (uint8_t *)&v8,
        0x16u);
    }
  }
  id v6 = [v4 URLByAppendingPathComponent:@"Containers" isDirectory:1];

  return v6;
}

+ (id)_classComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_1E6A80940[a3 - 1];
  }
}

+ (id)_categoryComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD) {
    return 0;
  }
  else {
    return off_1E6A808D0[a3 - 1];
  }
}

+ (unsigned)_modeForContainerClass:(unint64_t)a3
{
  return 493;
}

+ (BOOL)_inLibraryRepairBlock_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  BOOL v27 = 0;
  uint64_t v15 = +[MCMFileManager defaultManager];
  id v26 = 0;
  char v16 = [v15 itemAtURL:v13 exists:&v27 error:&v26];
  id v17 = v26;

  if ((v16 & 1) == 0)
  {
    int v21 = container_log_handle_for_category();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v23 = [v13 path];
    *(_DWORD *)buf = 138412546;
    v29 = v23;
    __int16 v30 = 2112;
    id v31 = v17;
    v24 = "Failed to determine if dir at [%@] exists: %@";
    goto LABEL_15;
  }
  if (!v27)
  {

    v18 = +[MCMFileManager defaultManager];
    id v25 = 0;
    char v19 = [v18 createDirectoryAtURL:v13 withIntermediateDirectories:1 mode:v12 owner:v14 dataProtectionClass:v10 error:&v25];
    id v17 = v25;

    if ((v19 & 1) == 0)
    {
      int v21 = container_log_handle_for_category();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      v23 = [v13 path];
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v17;
      v24 = "Failed to create dir at [%@]: %@";
LABEL_15:
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

LABEL_8:
      if (a8)
      {
        id v17 = v17;
        BOOL v20 = 0;
        *a8 = v17;
      }
      else
      {
        BOOL v20 = 0;
      }
      goto LABEL_11;
    }
  }
  if (a7) {
    *a7 = v27;
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _baseURLForUserIdentity:v6 containerClass:a4];
  int v8 = [a1 _categoryComponentForContainerClass:a4];
  id v9 = [a1 _classComponentForContainerClass:a4];
  uint64_t v10 = [v6 posixUser];
  id v11 = [a1 posixOwnerForContainerClass:a4 user:v10];

  uint64_t v12 = objc_msgSend(objc_alloc((Class)a1), "initWithBaseURL:categoryComponent:classComponent:containerClass:POSIXOwner:POSIXMode:userIdentity:", v7, v8, v9, a4, v11, objc_msgSend(a1, "_modeForContainerClass:", a4), v6);

  return v12;
}

+ (id)containerPathForContainerIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userIdentity];
  uint64_t v6 = [v4 containerClass];

  id v7 = [a1 containerPathForUserIdentity:v5 containerClass:v6];

  return v7;
}

+ (id)containerPathTypeClasses
{
  if (containerPathTypeClasses_onceToken != -1) {
    dispatch_once(&containerPathTypeClasses_onceToken, &__block_literal_global_12812);
  }
  v2 = (void *)containerPathTypeClasses_typeClasses;

  return v2;
}

void __49__MCMContainerClassPath_containerPathTypeClasses__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)containerPathTypeClasses_typeClasses;
  containerPathTypeClasses_typeClasses = v0;
}

@end