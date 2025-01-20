@interface MCMContainerCacheEntry
+ (id)UUIDForFileHandle:(id)a3;
+ (id)UUIDForURL:(id)a3;
+ (id)_fileHandleForURL:(id)a3 writeable:(BOOL)a4;
+ (id)identifierForFileHandle:(id)a3;
+ (id)identifierForURL:(id)a3;
+ (id)schemaVersionForFileHandle:(id)a3;
+ (id)schemaVersionForURL:(id)a3;
+ (timespec)birthtimeForFileHandle:(id)a3;
+ (timespec)birthtimeForURL:(id)a3;
+ (void)clearAttributesForFileHandle:(id)a3;
+ (void)clearAttributesForURL:(id)a3;
+ (void)setBirthtime:(timespec)a3 forFileHandle:(id)a4;
+ (void)setBirthtime:(timespec)a3 forURL:(id)a4;
+ (void)setIdentifier:(id)a3 forFileHandle:(id)a4;
+ (void)setIdentifier:(id)a3 forURL:(id)a4;
+ (void)setSchemaVersion:(id)a3 forFileHandle:(id)a4;
+ (void)setSchemaVersion:(id)a3 forURL:(id)a4;
+ (void)setUUID:(id)a3 forFileHandle:(id)a4;
+ (void)setUUID:(id)a3 forURL:(id)a4;
- (BOOL)corrupt;
- (BOOL)ignore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerCacheEntry:(id)a3;
- (BOOL)verify;
- (MCMContainerCacheEntry)initWithIdentifier:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 uuid:(id)a6 metadata:(id)a7 userIdentityCache:(id)a8;
- (MCMContainerCacheEntry)initWithMetadata:(id)a3 userIdentityCache:(id)a4;
- (MCMContainerCacheEntry_Internal)next;
- (MCMContainerCacheUpdatable)cache;
- (MCMContainerPath)containerPath;
- (MCMFSNode)fsNode;
- (MCMFileManagerResolvesPaths)fmForNode;
- (MCMMetadata)metadata;
- (MCMUserIdentityCache)userIdentityCache;
- (NSNumber)schemaVersion;
- (NSString)description;
- (NSString)identifier;
- (NSUUID)uuid;
- (id)_fabricateMetadataForContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)_findUserManagedAssetsDirectoryAtContainerRootURL:(id)a3;
- (id)_identifierForContainerPath:(id)a3;
- (id)_metadataFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)_readMetadataForIdentifier:(id)a3 containerPath:(id)a4 error:(id *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fsNodeWithError:(id *)a3;
- (id)fullDescription;
- (id)initFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)metadataMinimal;
- (id)metadataWithError:(id *)a3;
- (timespec)birthtimeWithError:(id *)a3;
- (unint64_t)hash;
- (void)setCache:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setCorrupt:(BOOL)a3;
- (void)setFsNode:(id)a3;
- (void)setIgnore:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setNext:(id)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setUuid:(id)a3;
- (void)setXattrs;
- (void)setXattrsWithFileHandle:(id)a3;
@end

@implementation MCMContainerCacheEntry

- (BOOL)verify
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMContainerCacheEntry *)self containerPath];
  v58 = [(MCMContainerCacheEntry *)self identifier];
  v4 = [v3 containerClassPath];
  v57 = [v4 userIdentity];
  v5 = [(MCMContainerCacheEntry *)self userIdentityCache];
  v6 = [v5 libraryRepairForUserIdentity:v57];

  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__13729;
  v71 = __Block_byref_object_dispose__13730;
  id v72 = 0;
  uint64_t v7 = +[MCMFileManager defaultManager];
  v8 = [v3 metadataURL];
  id v66 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __32__MCMContainerCacheEntry_verify__block_invoke;
  v62[3] = &unk_1E6A80AE0;
  id v9 = (id)v7;
  id v63 = v9;
  v64 = &v73;
  v65 = &v67;
  LOBYTE(v7) = [v6 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v3 containerIdentifier:v58 error:&v66 duringBlock:v62];
  v56 = v66;

  if ((v7 & 1) == 0)
  {
    v41 = container_log_handle_for_category();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_29:
      v26 = 0;
      v32 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v56;
    v44 = "Cache entry failed verification, failed to check; cacheEntry = %@, error = %@";
LABEL_22:
    _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
    goto LABEL_29;
  }
  if (!*((unsigned char *)v74 + 24))
  {
    v41 = container_log_handle_for_category();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v45 = [v3 metadataURL];
      v46 = [v45 path];
      *(_DWORD *)buf = 138412546;
      v78 = self;
      __int16 v79 = 2112;
      v80 = v46;
      _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, metadata URL doesn't exist; cacheEntry = %@, metadataURL = [%@]",
        buf,
        0x16u);
    }
    goto LABEL_29;
  }
  v10 = [(MCMContainerCacheEntry *)self fsNode];

  if (!v10) {
    goto LABEL_7;
  }
  v11 = [(MCMContainerCacheEntry *)self fsNode];
  char v12 = [v11 isEqual:v68[5]];

  if ((v12 & 1) == 0)
  {
    v41 = container_log_handle_for_category();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v47 = v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v47;
    v44 = "Cache entry failed verification, fs node changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }
  v13 = [(MCMContainerCacheEntry *)self fsNode];
  uint64_t v14 = [v13 ctime];
  if (v14 != [(id)v68[5] ctime])
  {

    goto LABEL_28;
  }
  v15 = [(MCMContainerCacheEntry *)self fsNode];
  [v15 ctime];
  uint64_t v17 = v16;
  [(id)v68[5] ctime];
  LOBYTE(v17) = v17 == v18;

  if ((v17 & 1) == 0)
  {
LABEL_28:
    v41 = container_log_handle_for_category();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v50 = v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v50;
    v44 = "Cache entry failed verification, ctime changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }
LABEL_7:
  v19 = objc_opt_class();
  v20 = [(MCMContainerCacheEntry *)self containerPath];
  v21 = [v20 containerRootURL];
  v22 = [v19 identifierForURL:v21];

  if (v22
    && (objc_msgSend(v58, "MCM_isEqualToString:caseSensitive:", v22, objc_msgSend(v4, "isCaseSensitive")) & 1) == 0)
  {
    v41 = container_log_handle_for_category();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v78 = self;
      __int16 v79 = 2112;
      v80 = v22;
      _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, identifier doesn't match; cacheEntry = %@, current identifier = %@",
        buf,
        0x16u);
    }
    v26 = 0;
  }
  else
  {
    v23 = objc_opt_class();
    v24 = [(MCMContainerCacheEntry *)self containerPath];
    v25 = [v24 containerRootURL];
    v26 = [v23 UUIDForURL:v25];

    if (!v26
      || ([(MCMContainerCacheEntry *)self uuid],
          v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = [v27 isEqual:v26],
          v27,
          (v28 & 1) != 0))
    {
      v29 = objc_opt_class();
      v30 = [(MCMContainerCacheEntry *)self containerPath];
      v31 = [v30 containerRootURL];
      v32 = [v29 schemaVersionForURL:v31];

      if (v32)
      {
        v33 = [(MCMContainerCacheEntry *)self schemaVersion];
        char v34 = [v33 isEqual:v32];

        if ((v34 & 1) == 0)
        {
          v41 = container_log_handle_for_category();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            __int16 v79 = 2112;
            v80 = v32;
            _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, schemaVersion doesn't match; cacheEntry = %@, current schemaVersion = %@",
              buf,
              0x16u);
          }
          goto LABEL_30;
        }
      }
      v54 = [(MCMContainerCacheEntry *)self containerPath];
      v52 = [v54 containerRootURL];
      v35 = [(MCMContainerCacheEntry *)self containerPath];
      v36 = [v35 containerDataURL];
      char v51 = [v52 isEqual:v36];

      if ((v51 & 1) == 0)
      {
        char v61 = 0;
        v37 = [(MCMContainerCacheEntry *)self containerPath];
        uint64_t v38 = [v37 containerDataURL];
        id v59 = 0;
        id v60 = 0;
        char v53 = [v9 itemAtURL:v38 followSymlinks:0 exists:&v61 isDirectory:0 fsNode:&v60 error:&v59];
        v55 = v60;
        v39 = v59;
        v40 = (void *)v38;
        v41 = v39;

        if ((v53 & 1) == 0)
        {
          v42 = container_log_handle_for_category();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            __int16 v79 = 2112;
            v80 = v41;
            v43 = "Cache entry failed verification, could not stat Data subdirectory; cacheEntry = %@, error = [%@]";
            goto LABEL_46;
          }
LABEL_41:

          goto LABEL_30;
        }
        if (v61
          && (![v55 isDirectory]
           || [v55 isSymlink]))
        {
          v42 = container_log_handle_for_category();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            __int16 v79 = 2112;
            v80 = v55;
            v43 = "Cache entry failed verification, Data subdirectory doesn't target expectation; cacheEntry = %@, node = %@";
LABEL_46:
            _os_log_error_impl(&dword_1D7739000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
            goto LABEL_41;
          }
          goto LABEL_41;
        }
      }
      [(MCMContainerCacheEntry *)self setFsNode:v68[5]];
      BOOL v48 = 1;
      goto LABEL_31;
    }
    v41 = container_log_handle_for_category();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v78 = self;
      __int16 v79 = 2112;
      v80 = v26;
      _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, UUID doesn't match; cacheEntry = %@, current uuid = %@",
        buf,
        0x16u);
    }
  }
  v32 = 0;
LABEL_30:

  [(MCMContainerCacheEntry *)self setCorrupt:1];
  BOOL v48 = 0;
LABEL_31:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v48;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (id)containerIdentity
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v20[0] = 1;
  id v3 = containermanager_copy_global_configuration();
  v4 = [v3 staticConfig];
  v5 = [(MCMContainerCacheEntry *)self containerPath];
  uint64_t v18 = objc_msgSend(v4, "configForContainerClass:", objc_msgSend(v5, "containerClass"));

  uint64_t v17 = [(MCMContainerCacheEntry *)self uuid];
  v19 = [(MCMContainerCacheEntry *)self containerPath];
  v6 = [v19 userIdentity];
  uint64_t v7 = [(MCMContainerCacheEntry *)self identifier];
  v8 = [(MCMContainerCacheEntry *)self containerPath];
  id v9 = [v8 containerPathIdentifier];
  v10 = [(MCMContainerCacheEntry *)self cache];
  v11 = [(MCMContainerCacheEntry *)self containerPath];
  char v12 = [v11 transient];
  v13 = [(MCMContainerCacheEntry *)self userIdentityCache];
  BYTE1(v16) = v12;
  LOBYTE(v16) = v10 != 0;
  uint64_t v14 = +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v17, v6, v7, v18, 0, v9, v16, v13, v20);

  return v14;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (MCMContainerCacheUpdatable)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);

  return (MCMContainerCacheUpdatable *)WeakRetained;
}

- (id)metadataMinimal
{
  id v3 = [(MCMContainerCacheEntry *)self containerIdentity];
  v4 = [MCMMetadataMinimal alloc];
  v5 = [(MCMContainerCacheEntry *)self containerPath];
  v6 = [(MCMContainerCacheEntry *)self schemaVersion];
  uint64_t v7 = [(MCMContainerCacheEntry *)self userIdentityCache];
  v8 = [(MCMMetadataMinimal *)v4 initWithContainerIdentity:v3 containerPath:v5 schemaVersion:v6 userIdentityCache:v7];

  return v8;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

uint64_t __32__MCMContainerCacheEntry_verify__block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[5] + 8) + 24;
  uint64_t v5 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v5 + 40);
  uint64_t v6 = [v3 itemAtURL:a2 followSymlinks:1 exists:v4 isDirectory:0 fsNode:obj error:a3];
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  return v6;
}

- (void)setFsNode:(id)a3
{
  p_fsNode = &self->_fsNode;

  objc_storeStrong((id *)p_fsNode, a3);
}

+ (id)schemaVersionForURL:(id)a3
{
  uint64_t v4 = [a1 _fileHandleForURL:a3 writeable:0];
  uint64_t v5 = [a1 schemaVersionForFileHandle:v4];

  return v5;
}

+ (id)schemaVersionForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = (void *)[a3 copyValueAsNumberFromXattr:@"com.apple.containermanager.schema-version" error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }
  }

  return v3;
}

+ (id)UUIDForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = (void *)[a3 copyValueAsUUIDFromXattr:@"com.apple.containermanager.uuid" error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr uuid; error = %@", buf, 0xCu);
    }
  }

  return v3;
}

+ (id)UUIDForURL:(id)a3
{
  id v4 = [a1 _fileHandleForURL:a3 writeable:0];
  uint64_t v5 = [a1 UUIDForFileHandle:v4];

  return v5;
}

+ (id)identifierForURL:(id)a3
{
  id v4 = [a1 _fileHandleForURL:a3 writeable:0];
  uint64_t v5 = [a1 identifierForFileHandle:v4];

  return v5;
}

+ (id)_fileHandleForURL:(id)a3 writeable:(BOOL)a4
{
  id v4 = a3;
  uint64_t v5 = [MCMFileHandle alloc];
  BOOL v6 = [v4 path];

  LOBYTE(v9) = 1;
  uint64_t v7 = [(MCMFileHandle *)v5 initWithPath:v6 relativeToFileHandle:0 direction:9 symlinks:0 createMode:0 createDPClass:0 openLazily:v9];

  return v7;
}

+ (id)identifierForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = (void *)[a3 copyValueAsStringFromXattr:@"com.apple.containermanager.identifier" maxLength:1024 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr identifier; error = %@",
        buf,
        0xCu);
    }
  }

  return v3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (MCMContainerCacheEntry_Internal)next
{
  return self->_next;
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (id)metadataWithError:(id *)a3
{
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  if (self->_metadata)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [(MCMContainerCacheEntry *)self identifier];
    v8 = [(MCMContainerCacheEntry *)self containerPath];
    v23[0] = 0;
    id v9 = [(MCMContainerCacheEntry *)self _readMetadataForIdentifier:v7 containerPath:v8 error:v23];
    id v6 = v23[0];
    metadata = self->_metadata;
    self->_metadata = v9;

    if (!self->_metadata && [v6 type] == 108)
    {
      v11 = [(MCMContainerCacheEntry *)self containerPath];
      uint64_t v12 = [(MCMContainerCacheEntry *)self containerIdentity];
      v13 = [v12 identifier];
      uint64_t v14 = [(MCMContainerCacheEntry *)self containerIdentity];
      v15 = [v14 uuid];
      uint64_t v16 = [(MCMContainerCacheEntry *)self userIdentityCache];
      uint64_t v17 = [(MCMContainerCacheEntry *)self _metadataFromContainerPath:v11 identifier:v13 uuid:v15 schemaVersion:0 userIdentityCache:v16];
      uint64_t v18 = self->_metadata;
      self->_metadata = v17;
    }
  }
  v19 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);
  if (a3 && !v19) {
    *a3 = v6;
  }
  v20 = [(MCMContainerCacheEntry *)self containerIdentity];
  v21 = [(MCMMetadataMinimal *)v19 metadataByChangingContainerIdentity:v20];

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmForNode, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MCMFileManagerResolvesPaths)fmForNode
{
  return self->_fmForNode;
}

- (void)setCache:(id)a3
{
  p_cache = &self->_cache;

  objc_storeWeak((id *)p_cache, a3);
}

- (void)setNext:(id)a3
{
  p_next = &self->_next;

  objc_storeStrong((id *)p_next, a3);
}

- (void)setIgnore:(BOOL)a3
{
  self->_ignore = a3;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (void)setUuid:(id)a3
{
  p_uuid = &self->_uuid;

  objc_storeStrong((id *)p_uuid, a3);
}

- (void)setSchemaVersion:(id)a3
{
  p_schemaVersion = &self->_schemaVersion;

  objc_storeStrong((id *)p_schemaVersion, a3);
}

- (void)setContainerPath:(id)a3
{
  p_containerPath = &self->_containerPath;

  objc_storeStrong((id *)p_containerPath, a3);
}

- (id)_metadataFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = [a3 containerPathForRealPath];
  uint64_t v17 = [(MCMContainerCacheEntry *)self _fabricateMetadataForContainerPath:v16 identifier:v15 uuid:v14 schemaVersion:v13 userIdentityCache:v12];

  return v17;
}

- (id)_findUserManagedAssetsDirectoryAtContainerRootURL:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[MCMFileManager defaultManager];
  id v24 = 0;
  v21 = v3;
  uint64_t v5 = [v4 urlsForItemsInDirectoryAtURL:v3 error:&v24];
  id v6 = v24;

  if (!v5)
  {
    uint64_t v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v20 = [v3 path];
      *(_DWORD *)buf = 138412546;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Couldn't read container contents when reconstructing metadata; path = [%@], error = %@",
        buf,
        0x16u);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);

        id v14 = [v13 lastPathComponent];
        if ([v14 hasPrefix:@"com.apple.UserManagedAssets."])
        {
          __int16 v23 = 0;
          id v15 = +[MCMFileManager defaultManager];
          id v22 = 0;
          char v16 = [v15 itemAtURL:v13 exists:&v23 isDirectory:(char *)&v23 + 1 error:&v22];
          id v6 = v22;

          if (v16)
          {
            if (HIBYTE(v23) && (_BYTE)v23) {
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v17 = container_log_handle_for_category();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = [v21 path];
              *(_DWORD *)buf = 138412546;
              v31 = v18;
              __int16 v32 = 2112;
              id v33 = v6;
              _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Couldn't stat container contents when reconstructing metadata; path = [%@], error = %@",
                buf,
                0x16u);
            }
          }
        }
        else
        {
          id v6 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v10);
  }
  id v14 = 0;
LABEL_22:

  return v14;
}

- (id)_identifierForContainerPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 containerClass];
  uint64_t v5 = [v3 containerRootURL];
  id v6 = +[MCMContainerCacheEntry identifierForURL:v5];

  if (!v6)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
    {
      id v6 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = [v3 containerPathIdentifier];
    id v8 = +[MCMEntitlementBypassList sharedBypassList];
    uint64_t v9 = v8;
    if (v4 == 13)
    {
      char v10 = [v8 systemGroupContainerIdIsWellknown:v7];

      if ((v10 & 1) == 0)
      {
LABEL_5:
        id v6 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      int v11 = [v8 systemContainerIdIsWellknown:v7];

      if (!v11) {
        goto LABEL_5;
      }
    }
    id v6 = v7;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)_fabricateMetadataForContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 containerClass];
  v46 = [v12 containerRootURL];
  v45 = [v12 containerPathIdentifier];
  v44 = [v12 userIdentity];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v19 = containermanager_copy_global_configuration();
  v20 = [v19 staticConfig];
  v43 = [v20 configForContainerClass:v17];

  v21 = container_log_handle_for_category();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v50 = v46;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v13;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v14;
    __int16 v55 = 2112;
    id v56 = v15;
    _os_log_impl(&dword_1D7739000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to recover from corrupt metadata for [%@]; identifier = %@, uuid = %@, schemaVersion = %@",
      buf,
      0x2Au);
  }

  v42 = v16;
  if (!v13)
  {
    id v13 = [(MCMContainerCacheEntry *)self _identifierForContainerPath:v12];
    if (!v13)
    {
      v41 = v15;
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v46;
        _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Unable to recover from corrupt metadata for [%@], no identifier", buf, 0xCu);
      }
      id v13 = 0;
      goto LABEL_25;
    }
  }
  if (v14)
  {
    if (v15) {
      goto LABEL_7;
    }
  }
  else
  {
    v30 = +[MCMContainerCacheEntry UUIDForURL:v46];
    v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      id v32 = [MEMORY[0x1E4F29128] UUID];
    }
    id v14 = v32;

    if (v15) {
      goto LABEL_7;
    }
  }
  uint64_t v37 = +[MCMContainerCacheEntry schemaVersionForURL:v46];
  uint64_t v38 = (void *)v37;
  v39 = &unk_1F2F123C8;
  if (v37) {
    v39 = (void *)v37;
  }
  id v15 = v39;

LABEL_7:
  uint64_t v48 = 1;
  BYTE1(v40) = isKindOfClass & 1;
  LOBYTE(v40) = 1;
  uint64_t v22 = +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v14, v44, v13, v43, 0, v45, v40, v16, &v48);
  v41 = v15;
  if (!v22)
  {
    p_super = container_log_handle_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 138412546;
      v50 = v46;
      __int16 v51 = 2080;
      uint64_t v52 = error_description;
      _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Unable to generate identity for [%@]: error = %s", buf, 0x16u);
    }
LABEL_25:
    __int16 v23 = 0;
    v25 = 0;
    long long v26 = 0;
    id v28 = 0;
    id v24 = v12;
    goto LABEL_26;
  }
  __int16 v23 = (void *)v22;
  id v24 = +[MCMContainerPath containerPathForContainerIdentity:v22 containerPathIdentifier:v45];

  if (v24)
  {
    v25 = [(MCMContainerCacheEntry *)self _findUserManagedAssetsDirectoryAtContainerRootURL:v46];
    long long v26 = [[MCMMetadata alloc] initWithContainerIdentity:v23 info:0 containerPath:v24 userManagedAssetsDirName:v25 schemaVersion:v41 dataProtectionClass:0xFFFFFFFFLL creator:0 userIdentityCache:v42];
    id v47 = 0;
    BOOL v27 = [(MCMMetadata *)v26 writeMetadataToDiskWithError:&v47];
    id v28 = v47;
    if (v27)
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v13;
        __int16 v53 = 2048;
        uint64_t v54 = v17;
        _os_log_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_DEFAULT, "Fabricated metadata for [%@:%@(%llu)]", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v34 = container_log_handle_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        __int16 v51 = 2048;
        uint64_t v52 = v17;
        __int16 v53 = 2112;
        uint64_t v54 = (uint64_t)v28;
        _os_log_impl(&dword_1D7739000, v34, OS_LOG_TYPE_DEFAULT, "Unable to write generated metadata for [%@(%llu)]: error = %@", buf, 0x20u);
      }

      p_super = &v26->super.super;
      long long v26 = 0;
    }
  }
  else
  {
    p_super = container_log_handle_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v23;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v45;
      _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Could not construct containerPath; identity = %@, containerPathIdentifier = %@",
        buf,
        0x16u);
    }
    v25 = 0;
    long long v26 = 0;
    id v28 = 0;
    id v24 = 0;
  }
LABEL_26:

  v35 = v26;
  return v35;
}

- (id)_readMetadataForIdentifier:(id)a3 containerPath:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [v7 containerClassPath];
  uint64_t v9 = [v8 containerClass];
  char v10 = [v8 userIdentity];
  int v11 = [MCMMetadata alloc];
  id v12 = [(MCMContainerCacheEntry *)self userIdentityCache];
  id v17 = 0;
  id v13 = [(MCMMetadataMinimal *)v11 initByReadingAndValidatingMetadataAtContainerPath:v7 userIdentity:v10 containerClass:v9 userIdentityCache:v12 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    id v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Could not read metadata at [%@]: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v14;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = 0;
    objc_storeStrong((id *)(v4 + 80), self->_userIdentityCache);
    objc_storeStrong((id *)(v5 + 16), self->_identifier);
    objc_storeStrong((id *)(v5 + 24), self->_containerPath);
    objc_storeStrong((id *)(v5 + 40), self->_schemaVersion);
    objc_storeStrong((id *)(v5 + 48), self->_uuid);
    os_unfair_lock_lock(&self->_metadataLock);
    objc_storeStrong((id *)(v5 + 32), self->_metadata);
    os_unfair_lock_unlock(&self->_metadataLock);
    *(unsigned char *)(v5 + 12) = self->_corrupt;
    *(unsigned char *)(v5 + 13) = self->_ignore;
    objc_storeWeak((id *)(v5 + 64), 0);
    objc_storeStrong((id *)(v5 + 88), self->_fmForNode);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMContainerCacheEntry *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMContainerCacheEntry *)self isEqualToContainerCacheEntry:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToContainerCacheEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MCMContainerCacheEntry *)self metadata];
    id v7 = [v5 metadata];
    if ((v6 == 0) != (v7 != 0) && (!v6 || [v6 isEqual:v7]))
    {
      id v8 = [(MCMContainerCacheEntry *)self fsNode];
      if (!v8)
      {
        uint64_t v13 = [v5 fsNode];
        if (v13)
        {
          id v14 = (void *)v13;
          char v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      uint64_t v9 = [(MCMContainerCacheEntry *)self fsNode];
      if (v9)
      {
        char v10 = (void *)v9;
        int v11 = [v5 fsNode];

        if (v8) {
        if (!v11)
        }
          goto LABEL_22;
      }
      else if (v8)
      {
      }
      uint64_t v15 = [(MCMContainerCacheEntry *)self fsNode];
      if (!v15) {
        goto LABEL_18;
      }
      id v16 = (void *)v15;
      id v17 = [(MCMContainerCacheEntry *)self fsNode];
      uint64_t v18 = [v5 fsNode];
      int v19 = [v17 isEqual:v18];

      if (v19)
      {
LABEL_18:
        id v14 = [(MCMContainerCacheEntry *)self identifier];
        __int16 v20 = [v5 identifier];
        if ([v14 isEqualToString:v20])
        {
          id v21 = [(MCMContainerCacheEntry *)self containerPath];
          uint64_t v22 = [v5 containerPath];
          if ([v21 isEqual:v22]
            && (int v23 = [(MCMContainerCacheEntry *)self corrupt],
                v23 == [v5 corrupt]))
          {
            uint64_t v24 = [(MCMContainerCacheEntry *)self schemaVersion];
            uint64_t v25 = [v5 schemaVersion];
            v31 = (void *)v24;
            long long v26 = (void *)v24;
            BOOL v27 = (void *)v25;
            if ([v26 isEqualToNumber:v25])
            {
              v30 = [(MCMContainerCacheEntry *)self uuid];
              long long v29 = [v5 uuid];
              char v12 = [v30 isEqual:v29];
            }
            else
            {
              char v12 = 0;
            }
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }

        goto LABEL_30;
      }
    }
LABEL_22:
    char v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  char v12 = 0;
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(MCMContainerCacheEntry *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(MCMContainerCacheEntry *)self containerPath];
  id v6 = [v5 containerRootURL];
  uint64_t v7 = [v6 hash];

  return v7 ^ v4;
}

- (id)fullDescription
{
  id v17 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v3);
  uint64_t v4 = [(MCMContainerCacheEntry *)self identifier];
  id v5 = [(MCMContainerCacheEntry *)self containerPath];
  id v6 = [(MCMContainerCacheEntry *)self schemaVersion];
  uint64_t v7 = [(MCMContainerCacheEntry *)self uuid];
  id v8 = [(MCMContainerCacheEntry *)self fsNode];
  uint64_t v9 = [(MCMContainerCacheEntry *)self metadata];
  char v10 = [v9 shortDescription];
  if ([(MCMContainerCacheEntry *)self corrupt]) {
    int v11 = ", CORRUPT";
  }
  else {
    int v11 = "";
  }
  BOOL v12 = [(MCMContainerCacheEntry *)self ignore];
  uint64_t v13 = ", IGNORED";
  if (!v12) {
    uint64_t v13 = "";
  }
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; identifier = %@, containerPath = %@, schemaVersion = %@, uuid = %@, fsNode = %@, metadata = %@%s%s>",
    v16,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11,
  id v14 = v13);

  return v14;
}

- (NSString)description
{
  uint64_t v15 = NSString;
  id v3 = [(MCMContainerCacheEntry *)self identifier];
  uint64_t v4 = [(MCMContainerCacheEntry *)self containerPath];
  id v5 = [(MCMContainerCacheEntry *)self schemaVersion];
  id v6 = [(MCMContainerCacheEntry *)self uuid];
  uint64_t v7 = [(MCMContainerCacheEntry *)self fsNode];
  id v8 = [(MCMContainerCacheEntry *)self metadata];
  if (v8) {
    uint64_t v9 = "with";
  }
  else {
    uint64_t v9 = "without";
  }
  if ([(MCMContainerCacheEntry *)self corrupt]) {
    char v10 = "|CORRUPT";
  }
  else {
    char v10 = "";
  }
  BOOL v11 = [(MCMContainerCacheEntry *)self ignore];
  BOOL v12 = "|IGNORED";
  if (!v11) {
    BOOL v12 = "";
  }
  uint64_t v13 = [v15 stringWithFormat:@"(%@|%@|%@|%@|%@|%s metadata%s%s)", v3, v4, v5, v6, v7, v9, v10, v12];

  return (NSString *)v13;
}

- (void)setMetadata:(id)a3
{
  uint64_t v4 = (MCMMetadata *)a3;
  os_unfair_lock_lock(&self->_metadataLock);
  metadata = self->_metadata;
  self->_metadata = v4;

  os_unfair_lock_unlock(&self->_metadataLock);
}

- (MCMMetadata)metadata
{
  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  uint64_t v4 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);

  return v4;
}

- (timespec)birthtimeWithError:(id *)a3
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = [(MCMContainerCacheEntry *)self containerPath];
  id v6 = [v5 containerRootURL];

  uint64_t v7 = +[MCMContainerCacheEntry birthtimeForURL:v6];
  if (v7 | v8)
  {
    uint64_t v11 = v7;
    uint64_t v13 = v8;
    id v10 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  v17[0] = 0;
  uint64_t v9 = [(MCMContainerCacheEntry *)self fsNodeWithError:v17];
  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = [v9 birthtime];
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }

  if (a3)
  {
LABEL_8:
    if (v11) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v13 == 0;
    }
    if (v14) {
      *a3 = v10;
    }
  }
LABEL_14:

  __darwin_time_t v15 = v11;
  uint64_t v16 = v13;
  result.tv_nsec = v16;
  result.tv_sec = v15;
  return result;
}

- (id)fsNodeWithError:(id *)a3
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = [(MCMContainerCacheEntry *)self containerPath];
  id v6 = [v5 containerRootURL];

  uint64_t v7 = [(MCMContainerCacheEntry *)self fmForNode];
  v11[0] = 0;
  uint64_t v8 = [v7 fsNodeOfURL:v6 followSymlinks:0 error:v11];
  id v9 = v11[0];

  if (a3 && !v8) {
    *a3 = [[MCMError alloc] initWithNSError:v9 url:v6 defaultErrorType:127];
  }

  return v8;
}

- (id)initFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12 = a7;
  uint64_t v13 = [(MCMContainerCacheEntry *)self _metadataFromContainerPath:a3 identifier:a4 uuid:a5 schemaVersion:a6 userIdentityCache:v12];
  if (v13)
  {
    BOOL v14 = [(MCMContainerCacheEntry *)self initWithMetadata:v13 userIdentityCache:v12];
  }
  else
  {

    BOOL v14 = 0;
  }

  return v14;
}

- (MCMContainerCacheEntry)initWithIdentifier:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 uuid:(id)a6 metadata:(id)a7 userIdentityCache:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MCMContainerCacheEntry;
  uint64_t v18 = [(MCMContainerCacheEntry *)&v28 init];
  int v19 = v18;
  if (v18)
  {
    v18->_metadataLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_userIdentityCache, a8);
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_containerPath, a4);
    objc_storeStrong((id *)&v19->_schemaVersion, a5);
    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_metadata, a7);
    uint64_t v20 = objc_msgSend(v16, "fsNode", v25, v26, v27);
    fsNode = v19->_fsNode;
    v19->_fsNode = (MCMFSNode *)v20;

    objc_storeWeak((id *)&v19->_cache, 0);
    *(_WORD *)&v19->_corrupt = 0;
    uint64_t v22 = +[MCMFileManager defaultManager];
    fmForNode = v19->_fmForNode;
    v19->_fmForNode = (MCMFileManagerResolvesPaths *)v22;
  }
  return v19;
}

- (MCMContainerCacheEntry)initWithMetadata:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F2F1ADA0]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = [v6 identifier];
  id v10 = [v6 containerPath];
  uint64_t v11 = [v6 schemaVersion];
  id v12 = [v6 uuid];
  uint64_t v13 = [(MCMContainerCacheEntry *)self initWithIdentifier:v9 containerPath:v10 schemaVersion:v11 uuid:v12 metadata:v8 userIdentityCache:v7];

  return v13;
}

- (void)setXattrsWithFileHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(MCMContainerCacheEntry *)self identifier];
  [v5 setIdentifier:v6 forFileHandle:v4];

  id v7 = objc_opt_class();
  id v8 = [(MCMContainerCacheEntry *)self uuid];
  [v7 setUUID:v8 forFileHandle:v4];

  id v9 = objc_opt_class();
  id v10 = [(MCMContainerCacheEntry *)self schemaVersion];
  objc_msgSend(v9, "setSchemaVersion:forFileHandle:");
}

- (void)setXattrs
{
  id v3 = objc_opt_class();
  id v4 = [(MCMContainerCacheEntry *)self containerPath];
  id v5 = [v4 containerRootURL];
  id v6 = [v3 _fileHandleForURL:v5 writeable:1];

  [(MCMContainerCacheEntry *)self setXattrsWithFileHandle:v6];
}

+ (void)clearAttributesForFileHandle:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v27[0] = @"com.apple.containermanager.identifier";
  v27[1] = @"com.apple.containermanager.schema-version";
  v27[2] = @"com.apple.containermanager.uuid";
  v27[3] = @"com.apple.containermanager.birthtime";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138412802;
    long long v14 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        id v15 = 0;
        char v11 = objc_msgSend(v3, "removeXattr:error:", v10, &v15, v14);
        id v12 = v15;
        if ((v11 & 1) == 0)
        {
          uint64_t v13 = container_log_handle_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            uint64_t v17 = v10;
            __int16 v18 = 2112;
            id v19 = v3;
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Could not clear xattr [%@] from [%@]; error = %@",
              buf,
              0x20u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v7);
  }
}

+ (void)clearAttributesForURL:(id)a3
{
  id v4 = [a1 _fileHandleForURL:a3 writeable:1];
  objc_msgSend(a1, "clearAttributesForFileHandle:");
}

+ (void)setBirthtime:(timespec)a3 forFileHandle:(id)a4
{
  uint64_t tv_nsec = a3.tv_nsec;
  __darwin_time_t tv_sec = a3.tv_sec;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v6 = NSString;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"%ld.%09ld", tv_sec, tv_nsec);
  id v12 = 0;
  LOBYTE(v6) = [v7 setXattr:@"com.apple.containermanager.birthtime" valueAsString:v8 error:&v12];

  id v9 = v12;
  uint64_t v10 = v9;
  if ((v6 & 1) == 0 && v9)
  {
    char v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v14 = v10;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to set xattr birthtime; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)setBirthtime:(timespec)a3 forURL:(id)a4
{
  uint64_t tv_nsec = a3.tv_nsec;
  __darwin_time_t tv_sec = a3.tv_sec;
  id v7 = [a1 _fileHandleForURL:a4 writeable:1];
  [a1 setBirthtime:tv_sec forFileHandle:tv_nsec];
}

+ (void)setUUID:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  char v4 = [a4 setXattr:@"com.apple.containermanager.uuid" valueAsUUID:a3 error:&v8];
  id v5 = v8;
  long long v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr uuid; error = %@", buf, 0xCu);
    }
  }
}

+ (void)setUUID:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _fileHandleForURL:a4 writeable:1];
  objc_msgSend(a1, "setUUID:forFileHandle:", v6);
}

+ (void)setSchemaVersion:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  char v4 = [a4 setXattr:@"com.apple.containermanager.schema-version" valueAsNumber:a3 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)setSchemaVersion:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _fileHandleForURL:a4 writeable:1];
  objc_msgSend(a1, "setSchemaVersion:forFileHandle:", v6);
}

+ (void)setIdentifier:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  char v4 = [a4 setXattr:@"com.apple.containermanager.identifier" valueAsString:a3 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr identifier; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)setIdentifier:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _fileHandleForURL:a4 writeable:1];
  objc_msgSend(a1, "setIdentifier:forFileHandle:", v6);
}

+ (timespec)birthtimeForFileHandle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v3 = (void *)[a3 copyValueAsStringFromXattr:@"com.apple.containermanager.birthtime" maxLength:1024 error:&v16];
  id v4 = v16;
  id v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = [v3 componentsSeparatedByString:@"."];
    id v8 = v7;
    if (!v7 || [v7 count] != 2)
    {
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    id v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = atol((const char *)[v9 UTF8String]);

    id v12 = [v8 objectAtIndexedSubscript:1];
    uint64_t v11 = atol((const char *)[v12 UTF8String]);
  }
  else
  {
    id v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v18 = v5;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Failed to get xattr birthtime; error = %@",
        buf,
        0xCu);
    }
    id v8 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }

LABEL_14:
  __darwin_time_t v14 = v10;
  uint64_t v15 = v11;
  result.uint64_t tv_nsec = v15;
  result.__darwin_time_t tv_sec = v14;
  return result;
}

+ (timespec)birthtimeForURL:(id)a3
{
  id v4 = [a1 _fileHandleForURL:a3 writeable:0];
  uint64_t v5 = [a1 birthtimeForFileHandle:v4];
  uint64_t v7 = v6;

  __darwin_time_t v8 = v5;
  uint64_t v9 = v7;
  result.uint64_t tv_nsec = v9;
  result.__darwin_time_t tv_sec = v8;
  return result;
}

@end