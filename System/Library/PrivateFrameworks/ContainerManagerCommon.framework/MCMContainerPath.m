@interface MCMContainerPath
+ (Class)_containerClassPathClass;
+ (id)_posixOwnerForContainerSubdirectories:(unint64_t)a3 user:(id)a4;
+ (id)containerPathForContainerClassPath:(id)a3 containerPathIdentifier:(id)a4;
+ (id)containerPathForContainerIdentity:(id)a3 containerPathIdentifier:(id)a4;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 containerPathIdentifier:(id)a5;
+ (id)containerPathFromURL:(id)a3 containerClassPath:(id)a4 relativePath:(id *)a5;
+ (id)containerPathIdentifierForCodeSignIdentifier:(id)a3 containerClass:(unint64_t)a4;
- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)createDataURLIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4;
- (BOOL)createIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4;
- (BOOL)exists;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerPath:(id)a3;
- (BOOL)isRandomized;
- (BOOL)transient;
- (MCMContainerClassPath)containerClassPath;
- (MCMContainerPath)initWithContainerClassPath:(id)a3 containerPathIdentifier:(id)a4 containerRootComponent:(id)a5 containerDataComponent:(id)a6;
- (MCMPOSIXUser)dataPOSIXOwner;
- (MCMPOSIXUser)rootPOSIXOwner;
- (MCMPOSIXUser)schemaPOSIXOwner;
- (MCMUserIdentity)userIdentity;
- (NSString)containerDataComponent;
- (NSString)containerPathIdentifier;
- (NSString)containerRootComponent;
- (NSString)description;
- (NSURL)baseURL;
- (NSURL)categoryURL;
- (NSURL)classURL;
- (NSURL)containerDataURL;
- (NSURL)containerRootURL;
- (NSURL)metadataURL;
- (id)containerPathForRealPath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)dataPOSIXMode;
- (unsigned)rootPOSIXMode;
- (unsigned)schemaPOSIXMode;
- (void)setExists:(BOOL)a3;
@end

@implementation MCMContainerPath

- (MCMUserIdentity)userIdentity
{
  v2 = [(MCMContainerPath *)self containerClassPath];
  v3 = [v2 userIdentity];

  return (MCMUserIdentity *)v3;
}

- (unint64_t)containerClass
{
  v2 = [(MCMContainerPath *)self containerClassPath];
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (NSURL)containerRootURL
{
  unint64_t v3 = [(MCMContainerPath *)self containerClassPath];
  v4 = [v3 classURL];
  v5 = [(MCMContainerPath *)self containerRootComponent];
  v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];

  return (NSURL *)v6;
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

- (NSString)containerRootComponent
{
  return self->_containerRootComponent;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (BOOL)transient
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSURL)metadataURL
{
  v2 = [(MCMContainerPath *)self containerRootURL];
  unint64_t v3 = [v2 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)containerDataURL
{
  unint64_t v3 = [(MCMContainerPath *)self containerRootURL];
  v4 = [(MCMContainerPath *)self containerDataComponent];

  if (v4)
  {
    v5 = [(MCMContainerPath *)self containerDataComponent];
    uint64_t v6 = [v3 URLByAppendingPathComponent:v5 isDirectory:1];

    unint64_t v3 = (void *)v6;
  }

  return (NSURL *)v3;
}

- (NSString)containerDataComponent
{
  return self->_containerDataComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerDataComponent, 0);
  objc_storeStrong((id *)&self->_containerRootComponent, 0);
  objc_storeStrong((id *)&self->_schemaPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_dataPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_rootPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_containerClassPath, 0);

  objc_storeStrong((id *)&self->_containerPathIdentifier, 0);
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

- (BOOL)exists
{
  return self->_exists;
}

- (unsigned)schemaPOSIXMode
{
  return self->_schemaPOSIXMode;
}

- (MCMPOSIXUser)schemaPOSIXOwner
{
  return self->_schemaPOSIXOwner;
}

- (unsigned)dataPOSIXMode
{
  return self->_dataPOSIXMode;
}

- (MCMPOSIXUser)dataPOSIXOwner
{
  return self->_dataPOSIXOwner;
}

- (unsigned)rootPOSIXMode
{
  return self->_rootPOSIXMode;
}

- (MCMPOSIXUser)rootPOSIXOwner
{
  return self->_rootPOSIXOwner;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v15 = +[MCMUserIdentitySharedCache sharedInstance];
  v16 = [(MCMContainerPath *)self containerClassPath];
  v17 = [v16 userIdentity];
  v18 = [v15 libraryRepairForUserIdentity:v17];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke;
  v24[3] = &unk_1E6A80358;
  v24[4] = self;
  unsigned __int16 v28 = a4;
  id v19 = v14;
  int v27 = a6;
  id v25 = v19;
  v26 = &v29;
  char v20 = [v18 fixAndRetryIfPermissionsErrorWithURL:v13 containerPath:self containerIdentifier:0 error:a8 duringBlock:v24];
  char v21 = v20 ^ 1;
  if (!a7) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a7 = *((unsigned char *)v30 + 24);
  }

  _Block_object_dispose(&v29, 8);
  return v20;
}

uint64_t __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 containerClassPath];
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v6, *(unsigned __int16 *)(a1 + 60), *(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 8) + 24, a3);

  return v8;
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

- (BOOL)isRandomized
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  v4 = [(MCMContainerPath *)self containerPathIdentifier];
  v5 = (void *)[v3 initWithUUIDString:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 24), self->_containerClassPath);
    uint64_t v7 = [(NSString *)self->_containerRootComponent copyWithZone:a3];
    uint64_t v8 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v7;

    uint64_t v9 = [(NSString *)self->_containerDataComponent copyWithZone:a3];
    v10 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v9;

    uint64_t v11 = [(NSString *)self->_containerPathIdentifier copyWithZone:a3];
    v12 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v11;

    *(_WORD *)(v6 + 10) = self->_rootPOSIXMode;
    *(_WORD *)(v6 + 12) = self->_dataPOSIXMode;
    *(_WORD *)(v6 + 14) = self->_schemaPOSIXMode;
    objc_storeStrong((id *)(v6 + 32), self->_rootPOSIXOwner);
    objc_storeStrong((id *)(v6 + 40), self->_dataPOSIXOwner);
    objc_storeStrong((id *)(v6 + 48), self->_schemaPOSIXOwner);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMContainerPath *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMContainerPath *)self isEqualToContainerPath:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToContainerPath:(id)a3
{
  v4 = a3;
  BOOL v5 = [(MCMContainerPath *)self _obj1:self->_containerClassPath isEqualToObj2:v4[3]]
    && [(MCMContainerPath *)self _obj1:self->_containerRootComponent isEqualToObj2:v4[7]]
    && [(MCMContainerPath *)self _obj1:self->_containerDataComponent isEqualToObj2:v4[8]];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MCMContainerClassPath *)self->_containerClassPath hash];
  NSUInteger v4 = [(NSString *)self->_containerRootComponent hash];
  return v4 ^ v3 ^ [(NSString *)self->_containerDataComponent hash];
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MCMContainerPath_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  NSUInteger v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __31__MCMContainerPath_description__block_invoke(uint64_t a1, int a2)
{
  BOOL v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 containerClassPath];
  v10 = v9;
  if (a2)
  {
    uint64_t v11 = [v9 redactedDescription];
    v2 = [*(id *)(a1 + 32) containerRootComponent];
    v12 = [v2 redactedDescription];
  }
  else
  {
    v12 = [*(id *)(a1 + 32) containerRootComponent];
    uint64_t v11 = (uint64_t)v10;
  }
  id v13 = [*(id *)(a1 + 32) containerDataComponent];
  int v14 = [*(id *)(a1 + 32) exists];
  v15 = "";
  if (v14) {
    v15 = " exists";
  }
  v16 = [v5 stringWithFormat:@"<%@: %p; [%@]/[%@]/[%@]%s>", v7, v8, v11, v12, v13, v15];

  if (a2)
  {

    v12 = (void *)v11;
  }

  return v16;
}

- (MCMContainerPath)initWithContainerClassPath:(id)a3 containerPathIdentifier:(id)a4 containerRootComponent:(id)a5 containerDataComponent:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)MCMContainerPath;
  v15 = [(MCMContainerPath *)&v29 init];
  v16 = v15;
  if (v15)
  {
    v15->_exists = 0;
    uint64_t v17 = [v11 containerClass];
    objc_storeStrong((id *)&v16->_containerClassPath, a3);
    objc_storeStrong((id *)&v16->_containerPathIdentifier, a4);
    objc_storeStrong((id *)&v16->_containerRootComponent, a5);
    objc_storeStrong((id *)&v16->_containerDataComponent, a6);
    if (v16->_containerClassPath && v16->_containerRootComponent)
    {
      v16->_rootPOSIXMode = [v11 posixMode];
      v16->_dataPOSIXMode = [v11 posixMode];
      v16->_schemaPOSIXMode = 493;
      if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        id v18 = containermanager_copy_global_configuration();
        int v19 = [v18 systemContainerMode];

        if (v19 == 1) {
          v16->_schemaPOSIXMode = 0;
        }
      }
      uint64_t v20 = [v11 posixOwner];
      rootPOSIXOwner = v16->_rootPOSIXOwner;
      v16->_rootPOSIXOwner = (MCMPOSIXUser *)v20;

      uint64_t v22 = [v11 posixOwner];
      dataPOSIXOwner = v16->_dataPOSIXOwner;
      v16->_dataPOSIXOwner = (MCMPOSIXUser *)v22;

      v24 = objc_opt_class();
      id v25 = [v11 posixOwner];
      uint64_t v26 = [v24 _posixOwnerForContainerSubdirectories:v17 user:v25];
      schemaPOSIXOwner = v16->_schemaPOSIXOwner;
      v16->_schemaPOSIXOwner = (MCMPOSIXUser *)v26;
    }
    else
    {
      id v25 = v16;
      v16 = 0;
    }
  }
  return v16;
}

- (NSURL)classURL
{
  v2 = [(MCMContainerPath *)self containerClassPath];
  unint64_t v3 = [v2 classURL];

  return (NSURL *)v3;
}

- (NSURL)categoryURL
{
  v2 = [(MCMContainerPath *)self containerClassPath];
  unint64_t v3 = [v2 categoryURL];

  return (NSURL *)v3;
}

- (NSURL)baseURL
{
  v2 = [(MCMContainerPath *)self containerClassPath];
  unint64_t v3 = [v2 baseURL];

  return (NSURL *)v3;
}

+ (id)_posixOwnerForContainerSubdirectories:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 <= 0xE && ((1 << a3) & 0x412A) != 0)
  {
    id v7 = containermanager_copy_global_configuration();
    uint64_t v8 = [v7 bundleContainerOwner];
LABEL_4:
    uint64_t v9 = (void *)v8;

    goto LABEL_5;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    id v11 = containermanager_copy_global_configuration();
    int v12 = [v11 systemContainerMode];

    if (v12 != 1)
    {
      id v7 = containermanager_copy_global_configuration();
      uint64_t v8 = [v7 systemContainerOwner];
      goto LABEL_4;
    }
    id v13 = +[MCMPOSIXUser nobody];
  }
  else
  {
    id v13 = v5;
  }
  uint64_t v9 = v13;
LABEL_5:

  return v9;
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

+ (id)containerPathFromURL:(id)a3 containerClassPath:(id)a4 relativePath:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 classURL];
  id v11 = [v10 path];

  int v12 = [v11 pathComponents];
  id v13 = [v9 path];

  id v14 = [v13 pathComponents];

  unint64_t v15 = [v12 count];
  if (v15 >= [v14 count])
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v16 = [v12 count];
    uint64_t v17 = [v14 count];
    uint64_t v18 = v17 - v16;
    int v19 = objc_msgSend(v14, "subarrayWithRange:", v16, v17 - v16);

    uint64_t v20 = [v19 firstObject];
    [v8 containerClass];
    if (container_class_supports_data_subdirectory()) {
      char v21 = @"Data";
    }
    else {
      char v21 = 0;
    }
    uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithContainerClassPath:v8 containerPathIdentifier:v20 containerRootComponent:v20 containerDataComponent:v21];
    if (a5)
    {
      id v14 = objc_msgSend(v19, "subarrayWithRange:", 1, v18 - 1);

      *a5 = [v14 componentsJoinedByString:@"/"];
    }
    else
    {
      id v14 = v19;
    }
  }
  id v23 = v22;

  return v23;
}

+ (id)containerPathIdentifierForCodeSignIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[MCMFileManager defaultManager];
  id v7 = [v6 fsSanitizedStringFromString:v5 allowSpaces:a4 == 7];

  return v7;
}

+ (id)containerPathForContainerClassPath:(id)a3 containerPathIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 containerClass];
  int v7 = container_class_supports_data_subdirectory();
  id v8 = (objc_class *)objc_opt_class();
  if ((objc_msgSend(v5, "isMemberOfClass:", +[MCMContainerStagingPath _containerClassPathClass](MCMContainerStagingPath, "_containerClassPathClass")) & 1) != 0|| objc_msgSend(v5, "isMemberOfClass:", +[MCMContainerTransientPath _containerClassPathClass](MCMContainerTransientPath, "_containerClassPathClass")))
  {
    id v8 = (objc_class *)objc_opt_class();
  }
  if (v7) {
    id v9 = @"Data";
  }
  else {
    id v9 = 0;
  }
  v10 = (void *)[[v8 alloc] initWithContainerClassPath:v5 containerPathIdentifier:v6 containerRootComponent:v6 containerDataComponent:v9];

  return v10;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 containerPathIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = containermanager_copy_global_configuration();
  id v11 = [v10 staticConfig];
  int v12 = [v11 configForContainerClass:a4];

  id v13 = containermanager_copy_global_configuration();
  id v14 = [v13 classPathCache];
  unint64_t v15 = objc_msgSend(v14, "containerClassPathForUserIdentity:containerConfig:typeClass:", v9, v12, objc_msgSend(a1, "_containerClassPathClass"));

  uint64_t v16 = [a1 containerPathForContainerClassPath:v15 containerPathIdentifier:v8];

  return v16;
}

+ (id)containerPathForContainerIdentity:(id)a3 containerPathIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 userIdentity];
  uint64_t v9 = [v7 containerClass];

  id v10 = [a1 containerPathForUserIdentity:v8 containerClass:v9 containerPathIdentifier:v6];

  return v10;
}

- (id)containerPathForRealPath
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[MCMFileManager defaultManager];
  NSUInteger v4 = [(MCMContainerPath *)self containerRootURL];
  id v15 = 0;
  id v5 = [v3 realPathForURL:v4 isDirectory:1 error:&v15];
  id v6 = v15;

  if (v5)
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    id v8 = [(MCMContainerPath *)self containerClassPath];
    uint64_t v9 = [v5 lastPathComponent];
    id v10 = [v5 lastPathComponent];
    id v11 = [(MCMContainerPath *)self containerDataComponent];
    int v12 = (void *)[v7 initWithContainerClassPath:v8 containerPathIdentifier:v9 containerRootComponent:v10 containerDataComponent:v11];
  }
  else
  {
    id v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v14 = [0 containerRootURL];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Could not get realpath for [%@]; error = %@",
        buf,
        0x16u);
    }
    int v12 = 0;
  }

  return v12;
}

- (BOOL)createDataURLIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v16[1] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = [(MCMContainerPath *)self containerRootURL];
  id v8 = [(MCMContainerPath *)self containerDataURL];
  char v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = 0;
    BOOL v11 = 1;
  }
  else
  {
    int v12 = [(MCMContainerPath *)self containerDataURL];
    uint64_t v13 = [(MCMContainerPath *)self dataPOSIXMode];
    id v14 = [(MCMContainerPath *)self dataPOSIXOwner];
    v16[0] = 0;
    BOOL v11 = [(MCMContainerPath *)self _createURLIfNecessary:v12 mode:v13 owner:v14 dataProtectionClass:v5 exists:0 error:v16];
    id v10 = v16[0];

    if (a4 && !v11)
    {
      id v10 = v10;
      BOOL v11 = 0;
      *a4 = v10;
    }
  }

  return v11;
}

- (BOOL)createIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v21 = 0;
  id v7 = [(MCMContainerPath *)self containerClassPath];
  id v20 = 0;
  int v8 = [v7 createIfNecessaryWithError:&v20];
  id v9 = v20;

  if (v8)
  {
    id v10 = [(MCMContainerPath *)self containerRootURL];
    uint64_t v11 = [(MCMContainerPath *)self rootPOSIXMode];
    int v12 = [(MCMContainerPath *)self rootPOSIXOwner];
    id v19 = v9;
    BOOL v13 = [(MCMContainerPath *)self _createURLIfNecessary:v10 mode:v11 owner:v12 dataProtectionClass:v5 exists:&v21 error:&v19];
    id v14 = v19;

    if (v13)
    {
      id v18 = v14;
      BOOL v15 = [(MCMContainerPath *)self createDataURLIfNecessaryWithDataProtectionClass:v5 error:&v18];
      id v9 = v18;

      if (v15)
      {
        [(MCMContainerPath *)self setExists:v21];
        BOOL v16 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      id v9 = v14;
    }
  }
  if (a4)
  {
    id v9 = v9;
    BOOL v16 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_9:

  return v16;
}

@end