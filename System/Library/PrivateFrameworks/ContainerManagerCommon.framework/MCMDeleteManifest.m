@interface MCMDeleteManifest
+ (id)_deleteManifestsForManagedPath:(id)a3 userIdentityCache:(id)a4;
+ (id)_deleteManifestsFromFileURLs:(id)a3 userIdentityCache:(id)a4;
+ (id)_deleteManifestsFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)_materializeContainerIdentityFromManifestPlist:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)_materializeContainerIdentityFromManifestPlistV1:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)deleteManifestsForGlobalContainersWithUserIdentityCache:(id)a3;
+ (id)deleteManifestsForUserContainersForPOSIXUser:(id)a3 userIdentityCache:(id)a4;
+ (id)deleteManifestsForUserContainersWithUserIdentityCache:(id)a3;
+ (id)managedPathForGlobalContainers;
+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3;
+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3 forPOSIXUser:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeleteManifest:(id)a3;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (MCMDeleteManifest)initWithConcreteContainerIdentity:(id)a3 userIdentityCache:(id)a4;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)description;
- (NSURL)readURL;
- (NSURL)writeURL;
- (id)_stableFileNameForDeleteOperationPlistWithContainerIdentity:(id)a3;
- (id)_urlForDeleteManifestWithContainerIdentity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deleteManifestAfterRemovingUsingLibraryRepairForUser:(id)a3 error:(id *)a4;
- (id)deleteManifestAfterWritingUsingLibraryRepairForUser:(id)a3 error:(id *)a4;
- (id)fullDescription;
- (id)initFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)setReadURL:(id)a3;
@end

@implementation MCMDeleteManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
  objc_storeStrong((id *)&self->_readURL, 0);

  objc_storeStrong((id *)&self->_writeURL, 0);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void)setReadURL:(id)a3
{
  p_readURL = &self->_readURL;

  objc_storeStrong((id *)p_readURL, a3);
}

- (NSURL)readURL
{
  return self->_readURL;
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (id)_stableFileNameForDeleteOperationPlistWithContainerIdentity:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = NSString;
  v5 = [v3 containerConfig];
  uint64_t v6 = [v5 containerClass];
  v7 = [v3 identifier];
  unsigned int v8 = [v3 transient];
  v9 = [v3 userIdentity];
  v10 = [v9 identifier];
  v11 = [v3 uuid];
  v12 = [v4 stringWithFormat:@"%llu-%@-%d-%@-%@", v6, v7, v8, v10, v11];

  *(_OWORD *)md = 0u;
  long long v25 = 0u;
  id v13 = v12;
  v14 = (const char *)[v13 UTF8String];
  CC_LONG v15 = strlen(v14);
  CC_SHA256(v14, v15, md);
  uint64_t v16 = 0;
  char v23 = 0;
  v17 = (char *)v22 + 1;
  memset(v22, 0, sizeof(v22));
  do
  {
    unint64_t v18 = md[v16];
    *(v17 - 1) = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v18 >> 4];
    unsigned char *v17 = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v18 & 0xF];
    v17 += 2;
    ++v16;
  }
  while (v16 != 32);
  v19 = (void *)[[NSString alloc] initWithUTF8String:v22];
  v20 = [v19 stringByAppendingPathExtension:@"plist"];

  return v20;
}

- (id)_urlForDeleteManifestWithContainerIdentity:(id)a3
{
  id v4 = a3;
  v5 = [(MCMDeleteManifest *)self _stableFileNameForDeleteOperationPlistWithContainerIdentity:v4];
  id v6 = containermanager_copy_global_configuration();
  v7 = [v6 managedPathRegistry];
  unsigned int v8 = [v7 containermanagerDeleteOperations];

  id v9 = containermanager_copy_global_configuration();
  v10 = [v4 containerConfig];
  char v11 = objc_msgSend(v9, "isGlobalContainerClass:", objc_msgSend(v10, "containerClass"));

  if ((v11 & 1) == 0)
  {
    v12 = [(MCMDeleteManifest *)self userIdentityCache];
    id v13 = [v4 userIdentity];
    v14 = [v13 posixUser];
    CC_LONG v15 = [v12 userIdentityForPersonalPersonaWithPOSIXUser:v14];

    uint64_t v16 = [(MCMDeleteManifest *)self userIdentityCache];
    v17 = [v16 managedUserPathRegistryForUserIdentity:v15];

    uint64_t v18 = [v17 containermanagerUserDeleteOperations];

    unsigned int v8 = (void *)v18;
  }
  v19 = [v8 url];
  v20 = [v19 URLByAppendingPathComponent:v5 isDirectory:0];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_userIdentityCache);
    objc_storeStrong(v5 + 2, self->_readURL);
    objc_storeStrong(v5 + 1, self->_writeURL);
    objc_storeStrong(v5 + 3, self->_concreteContainerIdentity);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMDeleteManifest *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMDeleteManifest *)self isEqualToDeleteManifest:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToDeleteManifest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(MCMDeleteManifest *)self readURL];
    if (v6)
    {
      id v3 = [v5 readURL];
      if (!v3)
      {
        char v7 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    unsigned int v8 = [(MCMDeleteManifest *)self readURL];
    if (v8)
    {

      if (v6)
      {
      }
LABEL_12:
      id v6 = [(MCMDeleteManifest *)self concreteContainerIdentity];
      v10 = [v5 concreteContainerIdentity];
      if ([v6 isEqualToContainerIdentity:v10])
      {
        char v11 = [(MCMDeleteManifest *)self readURL];
        v12 = [v5 readURL];
        if ([v11 isEqual:v12])
        {
          id v13 = [(MCMDeleteManifest *)self writeURL];
          v14 = [v5 writeURL];
          char v7 = [v13 isEqual:v14];
        }
        else
        {
          char v7 = 0;
        }
      }
      else
      {
        char v7 = 0;
      }

      goto LABEL_19;
    }
    id v9 = [v5 readURL];

    if (v6)
    {
    }
    if (!v9) {
      goto LABEL_12;
    }
  }
  char v7 = 0;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(MCMDeleteManifest *)self concreteContainerIdentity];
  uint64_t v4 = [v3 hash];
  id v5 = [(MCMDeleteManifest *)self readURL];
  uint64_t v6 = [v5 hash];
  char v7 = [(MCMDeleteManifest *)self writeURL];
  uint64_t v8 = [v7 hash];

  return v6 ^ v4 ^ v8;
}

- (id)fullDescription
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MCMDeleteManifest *)self readURL];
  char v7 = [(MCMDeleteManifest *)self writeURL];
  uint64_t v8 = [(MCMDeleteManifest *)self concreteContainerIdentity];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; readURL = [%@], writeURL = [%@], concreteContainerIdentity = %@>",
    v5,
    self,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(MCMDeleteManifest *)self readURL];
  id v5 = [(MCMDeleteManifest *)self writeURL];
  uint64_t v6 = [(MCMDeleteManifest *)self concreteContainerIdentity];
  char v7 = [v3 stringWithFormat:@"(from:[%@], to:[%@], %@)", v4, v5, v6];

  return (NSString *)v7;
}

- (id)deleteManifestAfterRemovingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(MCMDeleteManifest *)self readURL];
  if (!v7)
  {
    v14 = self;
    v10 = 0;
    char v11 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v18[0] = 0;
  char v8 = [v6 fixAndRetryIfPermissionsErrorWithURL:v7 error:v18 duringBlock:&__block_literal_global_7070];
  id v9 = v18[0];
  v10 = v9;
  char v11 = 0;
  if ((v8 & 1) == 0)
  {
    v12 = [v9 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v13 = [v10 code];

      if (v13 == 2)
      {
        char v11 = 0;
        goto LABEL_10;
      }
    }
    else
    {
    }
    CC_LONG v15 = [MCMError alloc];
    uint64_t v16 = [v7 path];
    char v11 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v15, "initWithErrorType:category:path:POSIXerrno:", 122, 1, v16, [v10 code]);
  }
LABEL_10:
  v14 = (MCMDeleteManifest *)[(MCMDeleteManifest *)self copy];
  [(MCMDeleteManifest *)v14 setReadURL:0];
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v14) {
    *a4 = v11;
  }
LABEL_13:

  return v14;
}

uint64_t __80__MCMDeleteManifest_deleteManifestAfterRemovingUsingLibraryRepairForUser_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[MCMFileManager defaultManager];
  uint64_t v6 = [v5 removeItemAtURL:v4 error:a3];

  return v6;
}

- (id)deleteManifestAfterWritingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(MCMDeleteManifest *)self concreteContainerIdentity];
  char v8 = [v7 plist];

  v33[0] = @"version";
  v33[1] = @"identity";
  v34[0] = &unk_1F2F11C60;
  v34[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v10 = +[MCMFileManager defaultManager];
  uint64_t v11 = [(MCMDeleteManifest *)self writeURL];
  uint64_t v12 = [v10 dataWritingOptionsForFileAtURL:v11];

  uint64_t v13 = [(MCMDeleteManifest *)self writeURL];
  id v26 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke;
  v23[3] = &unk_1E6A80068;
  id v14 = v9;
  id v24 = v14;
  uint64_t v25 = v12;
  LOBYTE(v11) = [v6 fixAndRetryIfPermissionsErrorWithURL:v13 error:&v26 duringBlock:v23];

  id v15 = v26;
  if (v11)
  {
    uint64_t v16 = (void *)[(MCMDeleteManifest *)self copy];
    v17 = [(MCMDeleteManifest *)self writeURL];
    [v16 setReadURL:v17];
    uint64_t v18 = 0;
  }
  else
  {
    v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = [(MCMDeleteManifest *)self writeURL];
      *(_DWORD *)buf = 138412802;
      id v28 = v15;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to write delete manifest; error = %@, url = [%@], manifest = %@",
        buf,
        0x20u);
    }
    v20 = [MCMError alloc];
    v17 = [(MCMDeleteManifest *)self writeURL];
    uint64_t v18 = [(MCMError *)v20 initWithNSError:v15 url:v17 defaultErrorType:125];
    uint64_t v16 = 0;
  }

  if (a4 && !v16) {
    *a4 = v18;
  }

  return v16;
}

uint64_t __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return objc_msgSend(v4, "MCM_writeToURL:withOptions:error:", a2, v5, a3);
}

- (id)initFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v21 = 0;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v21);
  id v12 = v21;
  if (v11)
  {
    id v20 = 0;
    uint64_t v13 = +[MCMDeleteManifest _materializeContainerIdentityFromManifestPlist:v11 userIdentityCache:v10 error:&v20];
    id v14 = (MCMError *)v20;
    if (v13)
    {
      id v15 = [(MCMDeleteManifest *)self initWithConcreteContainerIdentity:v13 userIdentityCache:v10];
      objc_storeStrong((id *)&v15->_readURL, a3);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v16 = container_log_handle_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = [v9 path];
      *(_DWORD *)buf = 138412546;
      id v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to parse delete manifest; error = %@, path = [%@]",
        buf,
        0x16u);
    }
    id v14 = [[MCMError alloc] initWithNSError:v12 url:v9 defaultErrorType:123];
  }

  if (a5)
  {
    id v14 = v14;
    id v15 = 0;
    uint64_t v13 = 0;
    *a5 = v14;
  }
  else
  {
    id v15 = 0;
    uint64_t v13 = 0;
  }
LABEL_10:
  v17 = v15;

  return v17;
}

- (MCMDeleteManifest)initWithConcreteContainerIdentity:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMDeleteManifest;
  id v9 = [(MCMDeleteManifest *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concreteContainerIdentity, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    readURL = v10->_readURL;
    v10->_readURL = 0;

    writeURL = v10->_writeURL;
    v10->_writeURL = 0;

    uint64_t v13 = [(MCMDeleteManifest *)v10 _urlForDeleteManifestWithContainerIdentity:v7];
    id v14 = v10->_writeURL;
    v10->_writeURL = (NSURL *)v13;
  }
  return v10;
}

+ (id)_deleteManifestsForManagedPath:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || ([v6 url],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [a1 _deleteManifestsFromURL:v8 userIdentityCache:v7 error:0],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v9;
}

+ (id)_deleteManifestsFromFileURLs:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  id v21 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        id v8 = [MCMDeleteManifest alloc];
        id v26 = 0;
        id v9 = [(MCMDeleteManifest *)v8 initFromURL:v7 userIdentityCache:v24 error:&v26];
        id v10 = v26;
        uint64_t v11 = v10;
        if (v9)
        {
          id v12 = [v9 concreteContainerIdentity];
          id v13 = containermanager_copy_global_configuration();
          id v14 = [v12 containerConfig];
          uint64_t v15 = [v14 containerClass];
          objc_super v16 = [v12 userIdentity];
          uint64_t v17 = [v16 posixUser];
          LODWORD(v15) = [v13 dispositionForContainerClass:v15 forUser:v17];

          if (v15 == 1)
          {
            uint64_t v18 = container_log_handle_for_category();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v28 = v7;
              __int16 v29 = 2112;
              id v30 = v9;
              _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "Recovering from failed delete using [%@]; queuing deletion of %@",
                buf,
                0x16u);
            }

            [v21 addObject:v9];
          }
        }
        else
        {
          if ([v10 type] == 74) {
            goto LABEL_15;
          }
          id v12 = container_log_handle_for_category();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = v11;
            __int16 v29 = 2112;
            id v30 = v7;
            _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Failed to materialize delete manifest; error = %@, url = [%@]",
              buf,
              0x16u);
          }
        }

LABEL_15:
        ++v6;
      }
      while (v25 != v6);
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v25);
  }

  v19 = (void *)[v21 copy];

  return v19;
}

+ (id)_deleteManifestsFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MCMFileManager defaultManager];
  id v20 = 0;
  uint64_t v11 = [v10 urlsForItemsInDirectoryAtURL:v8 error:&v20];
  id v12 = v20;

  if (v11)
  {
    id v13 = [a1 _deleteManifestsFromFileURLs:v11 userIdentityCache:v9];
    goto LABEL_3;
  }
  uint64_t v15 = [v12 domain];
  if ([v15 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v16 = [v12 code];

    if (v16 == 2)
    {
      id v13 = 0;
LABEL_3:
      id v14 = 0;
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v17 = container_log_handle_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = [v8 path];
    *(_DWORD *)buf = 138412546;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v19;
    _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Failed to get items at delete operations URL; error = %@, path = [%@]",
      buf,
      0x16u);
  }
  id v14 = [[MCMError alloc] initWithNSError:v12 url:v8 defaultErrorType:146];
  id v13 = 0;
  if (a5)
  {
LABEL_12:
    if (!v13) {
      *a5 = v14;
    }
  }
LABEL_14:

  return v13;
}

+ (id)_materializeContainerIdentityFromManifestPlistV1:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 1;
  id v7 = a4;
  id v8 = [a3 objectForKeyedSubscript:@"identity"];
  id v9 = +[MCMConcreteContainerIdentity concreteContainerIdentityFromPlist:v8 userIdentityCache:v7 error:&v25];

  if (v9)
  {
    id v10 = [v9 containerConfig];
    unint64_t v11 = [v10 containerClass];
    if (v11 > 0xE || ((1 << v11) & 0x4ED4) == 0)
    {
    }
    else
    {
      id v13 = [v9 userIdentity];
      id v14 = [v13 posixUser];
      id v15 = containermanager_copy_global_configuration();
      uint64_t v16 = [v15 defaultUser];
      char v17 = [v14 isEqual:v16];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = container_log_handle_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = containermanager_copy_global_configuration();
          id v20 = [v19 defaultUser];
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          __int16 v28 = 2112;
          __int16 v29 = v9;
          _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring delete manifest because it references a different uid; current user = %@, identity = %@",
            buf,
            0x16u);
        }
        id v21 = [[MCMError alloc] initWithErrorType:74];
        goto LABEL_14;
      }
    }
    id v21 = 0;
    goto LABEL_14;
  }
  id v22 = [MCMError alloc];
  __int16 v23 = [(MCMError *)v22 initWithErrorType:v25];
  id v21 = v23;
  if (a5)
  {
    id v21 = v23;
    *a5 = v21;
  }
LABEL_14:

  return v9;
}

+ (id)_materializeContainerIdentityFromManifestPlist:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  v16[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    unint64_t v11 = [v10 objectForKeyedSubscript:@"version"];
    int v12 = [v11 isEqual:&unk_1F2F11C60];

    if (v12)
    {
      v16[0] = 0;
      id v13 = [a1 _materializeContainerIdentityFromManifestPlistV1:v10 userIdentityCache:v9 error:v16];
      id v14 = v16[0];
    }
    else
    {
      id v14 = 0;
      id v13 = 0;
    }

    if (!a5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }
  if (!v13) {
    *a5 = v14;
  }
LABEL_10:

  return v13;
}

+ (id)deleteManifestsForUserContainersForPOSIXUser:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a4;
  id v7 = [a1 managedPathForUserContainersWithUserIdentityCache:v6 forPOSIXUser:a3];
  id v8 = [a1 _deleteManifestsForManagedPath:v7 userIdentityCache:v6];

  return v8;
}

+ (id)deleteManifestsForUserContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  id v5 = [a1 managedPathForUserContainersWithUserIdentityCache:v4];
  id v6 = [a1 _deleteManifestsForManagedPath:v5 userIdentityCache:v4];

  return v6;
}

+ (id)deleteManifestsForGlobalContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  id v5 = [a1 managedPathForGlobalContainers];
  id v6 = [a1 _deleteManifestsForManagedPath:v5 userIdentityCache:v4];

  return v6;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3 forPOSIXUser:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = containermanager_copy_global_configuration();
  int v8 = [v7 handlesUserContainers];

  if (v8)
  {
    id v9 = [v5 userIdentityForPersonalPersonaWithPOSIXUser:v6];
    id v10 = [v5 managedUserPathRegistryForUserIdentity:v9];
    unint64_t v11 = [v10 containermanagerUserDeleteOperations];
    if (!v11)
    {
      int v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_fault_impl(&dword_1D7739000, v12, OS_LOG_TYPE_FAULT, "Failed to get user path for storing pending delete operations; posixUser = %@.",
          (uint8_t *)&v14,
          0xCu);
      }
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  id v5 = containermanager_copy_global_configuration();
  id v6 = [v5 defaultUser];
  id v7 = [a1 managedPathForUserContainersWithUserIdentityCache:v4 forPOSIXUser:v6];

  return v7;
}

+ (id)managedPathForGlobalContainers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = containermanager_copy_global_configuration();
  int v3 = [v2 handlesGlobalContainers];

  if (v3)
  {
    id v4 = containermanager_copy_global_configuration();
    id v5 = [v4 managedPathRegistry];
    id v6 = [v5 containermanagerDeleteOperations];

    if (v6) {
      goto LABEL_7;
    }
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_fault_impl(&dword_1D7739000, v7, OS_LOG_TYPE_FAULT, "Failed to get global path for storing pending delete operations.", v9, 2u);
    }
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

@end