@interface MCMMetadata
- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10;
- (BOOL)_persisted;
- (BOOL)_writeFileURL:(id)a3 dictionary:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)verifyWithError:(id *)a3;
- (BOOL)writeMetadataToDiskWithError:(id *)a3;
- (BOOL)writeMetadataToFileURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MCMFSNode)fsNode;
- (MCMMetadata)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6;
- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 creator:(id)a9 userIdentityCache:(id)a10;
- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 fsNode:(id)a9 creator:(id)a10 userIdentityCache:(id)a11;
- (NSDictionary)info;
- (NSString)creator;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)userManagedAssetsDirName;
- (NSURL)fileURL;
- (container_object_s)createLibsystemContainerWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8;
- (id)metadataByChangingDataProtectionClass:(int)a3;
- (id)metadataBySettingCreator:(id)a3;
- (id)metadataBySettingInfoValue:(id)a3 forKey:(id)a4;
- (id)metadataBySettingUserManagedAssetsDirName:(id)a3;
- (int)dataProtectionClass;
- (void)_clearPersistedStatus;
@end

@implementation MCMMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MCMMetadata;
  v4 = [(MCMMetadataMinimal *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_userManagedAssetsDirName);
    objc_storeStrong(v5 + 6, self->_info);
    *((_DWORD *)v5 + 10) = self->_dataProtectionClass;
    objc_storeStrong(v5 + 8, self->_fsNode);
    objc_storeStrong(v5 + 10, self->_creator);
  }
  return v5;
}

- (void)_clearPersistedStatus
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MCMMetadata;
  [(MCMMetadataMinimal *)&v7 _clearPersistedStatus];
  fsNode = self->_fsNode;
  self->_fsNode = 0;

  v4 = [(MCMMetadataMinimal *)self containerPath];
  v5 = [v4 metadataURL];
  fileURL = self->_fileURL;
  self->_fileURL = v5;
}

- (NSString)userManagedAssetsDirName
{
  return self->_userManagedAssetsDirName;
}

- (container_object_s)createLibsystemContainerWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 1;
  v5 = [(MCMMetadataMinimal *)self containerIdentity];
  v6 = [(MCMMetadataMinimal *)self containerPath];
  objc_super v7 = [v6 containerPathIdentifier];
  uint64_t v8 = (container_object_s *)objc_msgSend(v5, "createLibsystemContainerWithContainerPathIdentifier:existed:error:", v7, -[MCMMetadataMinimal existed](self, "existed"), v11);

  if (a3 && v11[0] != 1 && !v8)
  {
    v9 = [MCMError alloc];
    *a3 = [(MCMError *)v9 initWithErrorType:v11[0]];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsDirName, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

- (NSString)creator
{
  return self->_creator;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)_writeFileURL:(id)a3 dictionary:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  v12 = [(MCMMetadataMinimal *)self userIdentityCache];
  v13 = [(MCMMetadataMinimal *)self userIdentity];
  v14 = [v12 libraryRepairForUserIdentity:v13];

  v15 = [(MCMMetadataMinimal *)self containerPath];
  v16 = [(MCMMetadataMinimal *)self identifier];
  v24[0] = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke;
  v21[3] = &unk_1E6A80068;
  id v17 = v10;
  id v22 = v17;
  unint64_t v23 = a5;
  char v18 = [v14 fixAndRetryIfPermissionsErrorWithURL:v11 containerPath:v15 containerIdentifier:v16 error:v24 duringBlock:v21];

  id v19 = v24[0];
  if (a6 && (v18 & 1) == 0) {
    *a6 = v19;
  }

  return v18;
}

uint64_t __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return objc_msgSend(v4, "MCM_writeToURL:withOptions:error:", a2, v5, a3);
}

- (BOOL)_persisted
{
  v2 = [(MCMMetadata *)self fsNode];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__MCMMetadata_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __26__MCMMetadata_description__block_invoke(uint64_t a1, int a2)
{
  v24 = NSString;
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = v4;
  v6 = v4;
  if (a2)
  {
    v6 = [v4 redactedDescription];
  }
  uint64_t v23 = [*(id *)(a1 + 32) containerClass];
  int v7 = [*(id *)(a1 + 32) transient];
  uint64_t v8 = "";
  if (v7) {
    uint64_t v8 = "T";
  }
  id v22 = v8;
  v25 = [*(id *)(a1 + 32) userIdentity];
  v9 = [v25 shortDescription];
  id v10 = v9;
  uint64_t v11 = (uint64_t)v9;
  if (a2)
  {
    uint64_t v11 = [v9 redactedDescription];
  }
  v12 = [*(id *)(a1 + 32) uuid];
  v13 = [*(id *)(a1 + 32) containerPath];
  v14 = [v13 containerPathIdentifier];
  uint64_t v15 = [*(id *)(a1 + 32) dataProtectionClass];
  v16 = [*(id *)(a1 + 32) userManagedAssetsDirName];
  id v17 = v16;
  if (a2)
  {
    [v16 redactedDescription];
    v19 = char v18 = v5;
    objc_msgSend(v24, "stringWithFormat:", @"<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>",
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
    v20 = v19);

    uint64_t v5 = v18;
    id v17 = v13;
    v14 = v12;
    v13 = (void *)v11;
    v12 = v10;
    id v10 = v25;
  }
  else
  {
    objc_msgSend(v24, "stringWithFormat:", @"<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>",
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
    v20 = v16);
    v6 = v25;
  }

  return v20;
}

- (NSString)shortDescription
{
  return [(MCMMetadata *)self description];
}

- (NSString)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MCMMetadata_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __31__MCMMetadata_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v28 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v27 = *(void **)(a1 + 32);
  v6 = [v27 userIdentity];
  int v7 = v6;
  uint64_t v8 = (uint64_t)v6;
  if (a2)
  {
    uint64_t v8 = [v6 redactedDescription];
  }
  v9 = [*(id *)(a1 + 32) uuid];
  uint64_t v26 = [*(id *)(a1 + 32) containerClass];
  uint64_t v10 = [*(id *)(a1 + 32) transient];
  uint64_t v11 = [*(id *)(a1 + 32) identifier];
  v12 = v11;
  if (a2)
  {
    v13 = [v11 redactedDescription];
    v24 = [*(id *)(a1 + 32) containerPath];
    v14 = [v24 redactedDescription];
    uint64_t v15 = v5;
    uint64_t v16 = [*(id *)(a1 + 32) dataProtectionClass];
    id v17 = [*(id *)(a1 + 32) userManagedAssetsDirName];
    [v17 redactedDescription];
    char v18 = v25 = v7;
    uint64_t v23 = v16;
    uint64_t v5 = v15;
    objc_msgSend(v28, "stringWithFormat:", @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>",
      v15,
      v27,
      v8,
      v9,
      v26,
      v10,
      v13,
      v14,
      v23,
    id v19 = v18);

    int v7 = v25;
    v20 = v12;
    v12 = v9;
    v9 = (void *)v8;
  }
  else
  {
    v20 = [*(id *)(a1 + 32) containerPath];
    uint64_t v21 = [*(id *)(a1 + 32) dataProtectionClass];
    v13 = [*(id *)(a1 + 32) userManagedAssetsDirName];
    objc_msgSend(v28, "stringWithFormat:", @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>",
      v5,
      v27,
      v8,
      v9,
      v26,
      v10,
      v12,
      v20,
      v21,
    id v19 = v13);
  }

  return v19;
}

- (id)metadataBySettingCreator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(MCMMetadata *)self copy];
  v6 = (void *)v5[10];
  v5[10] = v4;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)metadataBySettingUserManagedAssetsDirName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(MCMMetadata *)self copy];
  v6 = (void *)v5[7];
  v5[7] = v4;

  [v5 _clearPersistedStatus];

  return v5;
}

- (id)metadataByChangingDataProtectionClass:(int)a3
{
  id v4 = (_DWORD *)[(MCMMetadata *)self copy];
  v4[10] = a3;
  [v4 _clearPersistedStatus];

  return v4;
}

- (id)metadataBySettingInfoValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v9 = [(MCMMetadata *)v8 info];
  uint64_t v10 = v9;
  if (v6)
  {
    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:v7];
      v12 = v11;
      if (v11 && ([v11 isEqual:v6] & 1) != 0) {
        goto LABEL_12;
      }
      v13 = (void *)[v10 mutableCopy];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    [v13 setValue:v6 forKey:v7];
LABEL_11:
    uint64_t v16 = (MCMMetadata *)[(MCMMetadata *)v8 copy];

    uint64_t v17 = [v13 copy];
    info = v16->_info;
    v16->_info = (NSDictionary *)v17;

    [(MCMMetadata *)v16 _clearPersistedStatus];
    v12 = v13;
    uint64_t v8 = v16;
LABEL_12:

    goto LABEL_13;
  }
  if (v9)
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:v7];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v13 = (void *)[v10 mutableCopy];
      [v13 removeObjectForKey:v7];

      goto LABEL_11;
    }
  }
LABEL_13:

  return v8;
}

- (BOOL)verifyWithError:(id *)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MCMMetadataMinimal *)self userIdentityCache];
  id v6 = [(MCMMetadataMinimal *)self userIdentity];
  id v7 = [v5 libraryRepairForUserIdentity:v6];

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2992;
  v56 = __Block_byref_object_dispose__2993;
  id v57 = 0;
  uint64_t v8 = [(MCMMetadata *)self fileURL];
  v9 = [(MCMMetadataMinimal *)self containerPath];
  uint64_t v10 = [(MCMMetadataMinimal *)self identifier];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __31__MCMMetadata_verifyWithError___block_invoke;
  v50[3] = &unk_1E6A7F900;
  v50[4] = &v62;
  v50[5] = &v58;
  v50[6] = &v52;
  id v51 = 0;
  char v11 = [v7 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v9 containerIdentifier:v10 error:&v51 duringBlock:v50];
  id v12 = v51;

  if ((v11 & 1) == 0)
  {
    char v18 = [v12 domain];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F28798]];

    if (v19)
    {
      v20 = [MCMError alloc];
      uint64_t v21 = [(MCMMetadata *)self fileURL];
      id v22 = [v21 path];
      uint64_t v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v20, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v22, [v12 code]);
    }
    else
    {
      uint64_t v23 = [v12 domain];
      int v24 = [v23 isEqualToString:@"MCMErrorDomain"];

      v25 = [MCMError alloc];
      if (v24) {
        uint64_t v26 = [v12 code];
      }
      else {
        uint64_t v26 = 12;
      }
      uint64_t v17 = [(MCMError *)v25 initWithErrorType:v26];
    }
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v43 = [(MCMMetadata *)self shortDescription];
      *(_DWORD *)buf = 138412546;
      v67 = v43;
      __int16 v68 = 2112;
      id v69 = v12;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Could not check existance of metadata for [%@]; error = %@",
        buf,
        0x16u);
    }
    goto LABEL_18;
  }
  if (!*((unsigned char *)v63 + 24))
  {
    v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v46 = [(MCMMetadata *)self fileURL];
      v47 = [v46 path];
      *(_DWORD *)buf = 138412290;
      v67 = v47;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Metadata failed verification, URL doesn't exist; URL = [%@]",
        buf,
        0xCu);
    }
    v28 = [MCMError alloc];
    uint64_t v15 = [(MCMMetadata *)self fileURL];
    v29 = [v15 path];
    uint64_t v17 = [(MCMError *)v28 initWithErrorType:127 category:1 path:v29 POSIXerrno:2];

    goto LABEL_18;
  }
  if (*((unsigned char *)v59 + 24))
  {
    v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v44 = [(MCMMetadata *)self fileURL];
      v45 = [v44 path];
      *(_DWORD *)buf = 138412290;
      v67 = v45;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Metadata failed verification, URL is a directory; URL = [%@]",
        buf,
        0xCu);
    }
    uint64_t v14 = [MCMError alloc];
    uint64_t v15 = [(MCMMetadata *)self fileURL];
    uint64_t v16 = [v15 path];
    uint64_t v17 = [(MCMError *)v14 initWithErrorType:127 category:1 path:v16 POSIXerrno:21];

    goto LABEL_18;
  }
  v32 = [(MCMMetadata *)self fsNode];

  if (!v32)
  {
LABEL_26:
    objc_storeStrong((id *)&self->_fsNode, (id)v53[5]);
    uint64_t v17 = 0;
    BOOL v30 = 1;
    goto LABEL_21;
  }
  v33 = [(MCMMetadata *)self fsNode];
  char v34 = [v33 isEqual:v53[5]];

  if (v34)
  {
    v35 = [(MCMMetadata *)self fsNode];
    uint64_t v36 = [v35 ctime];
    if (v36 == [(id)v53[5] ctime])
    {
      v37 = [(MCMMetadata *)self fsNode];
      [v37 ctime];
      uint64_t v39 = v38;
      [(id)v53[5] ctime];
      LOBYTE(v39) = v39 == v40;

      if (v39) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v48 = [(MCMMetadata *)self shortDescription];
      v49 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v48;
      __int16 v68 = 2112;
      id v69 = v49;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Metadata failed verification, ctime changed; cacheEntry = %@, current fsNode = %@",
        buf,
        0x16u);
    }
  }
  else
  {
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v41 = [(MCMMetadata *)self shortDescription];
      v42 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v41;
      __int16 v68 = 2112;
      id v69 = v42;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Metadata failed verification, fs node changed; metadata = %@, current fsNode = %@",
        buf,
        0x16u);
    }
  }
  uint64_t v17 = 0;
LABEL_18:

  if (a3)
  {
    uint64_t v17 = v17;
    BOOL v30 = 0;
    *a3 = v17;
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_21:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v30;
}

uint64_t __31__MCMMetadata_verifyWithError___block_invoke(void *a1, void *a2, uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = *(void *)(a1[4] + 8) + 24;
  uint64_t v8 = *(void *)(a1[5] + 8) + 24;
  uint64_t v9 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v9 + 40);
  uint64_t v10 = [v6 itemAtURL:v5 followSymlinks:1 exists:v7 isDirectory:v8 fsNode:obj error:a3];

  objc_storeStrong((id *)(v9 + 40), obj[0]);
  return v10;
}

- (BOOL)writeMetadataToFileURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  LOBYTE(self) = [(MCMMetadata *)v9 _persisted];
  objc_sync_exit(v9);

  if (self)
  {
    uint64_t v10 = 0;
LABEL_24:
    id v40 = 0;
    BOOL v42 = 1;
    goto LABEL_25;
  }
  char v11 = (void *)MEMORY[0x1D9478DF0]();
  id v12 = objc_opt_new();
  v13 = [(MCMMetadata *)v9 info];

  if (v13)
  {
    uint64_t v14 = [(MCMMetadata *)v9 info];
    [v12 setValue:v14 forKey:@"MCMMetadataInfo"];
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MCMMetadataMinimal containerClass](v9, "containerClass"));
  [v12 setValue:v15 forKey:@"MCMMetadataContentClass"];

  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:[(MCMMetadataMinimal *)v9 containerClass]])
  {
    uint64_t v16 = [(MCMMetadataMinimal *)v9 userIdentity];
    uint64_t v17 = [v16 plist];
    [v12 setValue:v17 forKey:@"MCMMetadataUserIdentity"];
  }
  char v18 = [(MCMMetadataMinimal *)v9 identifier];
  [v12 setValue:v18 forKey:@"MCMMetadataIdentifier"];

  int v19 = [(MCMMetadataMinimal *)v9 uuid];
  v20 = [v19 UUIDString];
  [v12 setValue:v20 forKey:@"MCMMetadataUUID"];

  [v12 setValue:&unk_1F2F119F0 forKey:@"MCMMetadataVersion"];
  uint64_t v21 = [(MCMMetadataMinimal *)v9 schemaVersion];
  [v12 setValue:v21 forKey:@"MCMMetadataSchemaVersion"];

  id v22 = objc_msgSend(NSNumber, "numberWithInt:", -[MCMMetadata dataProtectionClass](v9, "dataProtectionClass"));
  [v12 setValue:v22 forKey:@"MCMMetadataActiveDPClass"];

  uint64_t v23 = [(MCMMetadata *)v9 userManagedAssetsDirName];

  if (v23)
  {
    int v24 = [(MCMMetadata *)v9 userManagedAssetsDirName];
    [v12 setValue:v24 forKey:@"MCMMetadataUserManagedAssetsDirName"];
  }
  v25 = [(MCMMetadata *)v9 creator];

  if (v25)
  {
    uint64_t v26 = [(MCMMetadata *)v9 creator];
    [v12 setValue:v26 forKey:@"MCMMetadataCreator"];
  }
  v27 = v9;
  objc_sync_enter(v27);
  id v65 = 0;
  BOOL v28 = [(MCMMetadata *)v27 _writeFileURL:v8 dictionary:v12 options:a4 error:&v65];
  id v29 = v65;
  uint64_t v10 = v29;
  if (v28)
  {
    BOOL v30 = +[MCMFileManager defaultManager];
    id v64 = 0;
    v31 = [v30 fsNodeOfURL:v8 followSymlinks:0 error:&v64];
    id v32 = v64;

    if (v31)
    {
      v33 = v31;
      p_super = &v27->_fsNode->super;
      v27->_fsNode = v33;
    }
    else
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        char v61 = [(MCMMetadataMinimal *)v27 uuid];
        v63 = [(MCMMetadataMinimal *)v27 containerPath];
        v59 = [v63 containerPathIdentifier];
        id v57 = [(MCMMetadataMinimal *)v27 identifier];
        uint64_t v53 = [(MCMMetadataMinimal *)v27 containerClass];
        int v55 = [(MCMMetadata *)v27 conformsToProtocol:&unk_1F2F1ADA0];
        if (v55)
        {
          id v51 = [(MCMMetadata *)v27 fsNode];
          uint64_t v49 = [v51 inode];
        }
        else
        {
          uint64_t v49 = 0;
        }
        v50 = [v8 path];
        *(_DWORD *)buf = 138544898;
        v67 = v61;
        __int16 v68 = 2114;
        id v69 = v59;
        __int16 v70 = 2112;
        v71 = v57;
        __int16 v72 = 2050;
        uint64_t v73 = v53;
        __int16 v74 = 2048;
        uint64_t v75 = v49;
        __int16 v76 = 2112;
        v77 = v50;
        __int16 v78 = 2114;
        id v79 = v32;
        _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not fetch fsNode for [%@]: %{public}@", buf, 0x48u);

        if (v55) {
      }
        }
    }

    objc_sync_exit(v27);
    v43 = container_log_handle_for_category();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v60 = [(MCMMetadataMinimal *)v27 uuid];
      uint64_t v62 = [(MCMMetadataMinimal *)v27 containerPath];
      v56 = [v62 containerPathIdentifier];
      uint64_t v54 = [(MCMMetadataMinimal *)v27 identifier];
      uint64_t v52 = [(MCMMetadataMinimal *)v27 containerClass];
      int v58 = [(MCMMetadata *)v27 conformsToProtocol:&unk_1F2F1ADA0];
      if (v58)
      {
        id v51 = [(MCMMetadata *)v27 fsNode];
        uint64_t v46 = [v51 inode];
      }
      else
      {
        uint64_t v46 = 0;
      }
      v47 = [v8 path];
      v48 = [(MCMMetadata *)v27 shortDescription];
      *(_DWORD *)buf = 138544898;
      v67 = v60;
      __int16 v68 = 2114;
      id v69 = v56;
      __int16 v70 = 2112;
      v71 = v54;
      __int16 v72 = 2050;
      uint64_t v73 = v52;
      __int16 v74 = 2048;
      uint64_t v75 = v46;
      __int16 v76 = 2112;
      v77 = v47;
      __int16 v78 = 2112;
      id v79 = v48;
      _os_log_debug_impl(&dword_1D7739000, v43, OS_LOG_TYPE_DEBUG, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Wrote metadata to [%@]: %@", buf, 0x48u);

      if (v58) {
    }
      }

    goto LABEL_24;
  }
  v35 = [v29 domain];
  int v36 = [v35 isEqualToString:*MEMORY[0x1E4F28798]];

  v37 = [MCMError alloc];
  [v8 path];
  if (v36) {
    uint64_t v38 = {;
  }
    uint64_t v39 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v37, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v38, [v10 code]);
  }
  else {
    uint64_t v38 = {;
  }
    uint64_t v39 = [(MCMError *)v37 initWithErrorType:34 category:5 path:v38 POSIXerrno:0];
  }
  id v40 = (id)v39;

  v41 = container_log_handle_for_category();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v45 = [v8 path];
    *(_DWORD *)buf = 138412546;
    v67 = v45;
    __int16 v68 = 2112;
    id v69 = v10;
    _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Failed to write metadata dictionary to URL %@: %@", buf, 0x16u);
  }
  objc_sync_exit(v27);

  if (a5)
  {
    id v40 = v40;
    BOOL v42 = 0;
    *a5 = v40;
  }
  else
  {
    BOOL v42 = 0;
  }
LABEL_25:

  return v42;
}

- (BOOL)writeMetadataToDiskWithError:(id *)a3
{
  id v5 = +[MCMFileManager defaultManager];
  id v6 = [(MCMMetadata *)self fileURL];
  uint64_t v7 = [v5 dataWritingOptionsForFileAtURL:v6];

  id v8 = [(MCMMetadata *)self fileURL];
  LOBYTE(a3) = [(MCMMetadata *)self writeMetadataToFileURL:v8 options:v7 error:a3];

  return (char)a3;
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v55.receiver = self;
  v55.super_class = (Class)MCMMetadata;
  id v56 = 0;
  LODWORD(a5) = [(MCMMetadataMinimal *)&v55 _initFromMetadataInDictionary:v16 containerPath:v17 userIdentity:a5 containerClass:a6 fsNode:v18 fileURL:v19 userIdentityCache:a9 error:&v56];
  id v20 = v56;
  if (!a5) {
    goto LABEL_33;
  }
  objc_storeStrong((id *)&self->_fsNode, a7);
  uint64_t v21 = [v16 objectForKeyedSubscript:@"MCMMetadataUserManagedAssetsDirName"];
  userManagedAssetsDirName = self->_userManagedAssetsDirName;
  self->_userManagedAssetsDirName = v21;

  uint64_t v23 = self->_userManagedAssetsDirName;
  if (v23)
  {
    objc_opt_class();
    int v24 = v23;
    v25 = (objc_opt_isKindOfClass() & 1) != 0 ? v24 : 0;

    if (!v25)
    {
      int v36 = [MCMError alloc];
      v37 = [v19 path];
      uint64_t v38 = [(MCMError *)v36 initWithErrorType:29 category:5 path:v37 POSIXerrno:0];

      uint64_t v39 = container_log_handle_for_category();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      id v40 = self->_userManagedAssetsDirName;
      *(_DWORD *)buf = 138412290;
      int v58 = v40;
      v41 = "Invalid metadata User Managed Dir Name String: %@";
LABEL_31:
      _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
      goto LABEL_32;
    }
  }
  uint64_t v26 = [v16 objectForKeyedSubscript:@"MCMMetadataCreator"];
  creator = self->_creator;
  self->_creator = v26;

  BOOL v28 = self->_creator;
  if (v28)
  {
    objc_opt_class();
    id v29 = v28;
    BOOL v30 = (objc_opt_isKindOfClass() & 1) != 0 ? v29 : 0;

    if (!v30)
    {
      v45 = [MCMError alloc];
      uint64_t v46 = [v19 path];
      uint64_t v38 = [(MCMError *)v45 initWithErrorType:29 category:5 path:v46 POSIXerrno:0];

      uint64_t v39 = container_log_handle_for_category();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      v47 = self->_creator;
      *(_DWORD *)buf = 138412290;
      int v58 = v47;
      v41 = "Invalid metadata Creator String: %@";
      goto LABEL_31;
    }
  }
  v31 = [v16 objectForKeyedSubscript:@"MCMMetadataInfo"];
  info = self->_info;
  self->_info = v31;

  v33 = self->_info;
  if (v33)
  {
    objc_opt_class();
    char v34 = v33;
    v35 = (objc_opt_isKindOfClass() & 1) != 0 ? v34 : 0;

    if (!v35)
    {
      id v51 = [MCMError alloc];
      uint64_t v52 = [v19 path];
      uint64_t v38 = [(MCMError *)v51 initWithErrorType:29 category:5 path:v52 POSIXerrno:0];

      uint64_t v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v53 = self->_info;
        *(_DWORD *)buf = 138412290;
        int v58 = v53;
        v41 = "Invalid metadata Info: %@";
        goto LABEL_31;
      }
LABEL_32:

      id v20 = (id)v38;
LABEL_33:
      if (a10)
      {
        id v20 = v20;
        BOOL v50 = 0;
        *a10 = v20;
      }
      else
      {
        BOOL v50 = 0;
      }
      goto LABEL_36;
    }
  }
  self->_dataProtectionClass = -1;
  BOOL v42 = [v16 objectForKeyedSubscript:@"MCMMetadataActiveDPClass"];
  objc_opt_class();
  id v43 = v42;
  if (objc_opt_isKindOfClass()) {
    id v44 = v43;
  }
  else {
    id v44 = 0;
  }

  if (v44)
  {
    self->_dataProtectionClass = [v44 intValue];
  }
  else
  {
    v48 = [v17 containerClassPath];
    int v49 = [v48 supportsDataProtection];

    if (v49) {
      self->_dataProtectionClass = 0;
    }
  }
  BOOL v50 = 1;
LABEL_36:

  return v50;
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  v21[1] = *(id *)MEMORY[0x1E4F143B8];
  id v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMMetadata;
  v21[0] = 0;
  id v16 = [(MCMMetadataMinimal *)&v20 initByReadingAndValidatingMetadataAtFileURL:v15 containerPath:a4 userIdentity:a5 containerClass:a6 userIdentityCache:a7 error:v21];
  id v17 = v21[0];
  id v18 = v17;
  if (v16)
  {
    objc_storeStrong(v16 + 9, a3);
  }
  else if (a8)
  {
    *a8 = v17;
  }

  return v16;
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 fsNode:(id)a9 creator:(id)a10 userIdentityCache:(id)a11
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v17 = a5;
  id v26 = a6;
  id v25 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)MCMMetadata;
  id v19 = [(MCMMetadataMinimal *)&v28 initWithContainerIdentity:a3 containerPath:v17 schemaVersion:a7 userIdentityCache:a11];
  objc_super v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_info, a4);
    objc_storeStrong((id *)&v20->_userManagedAssetsDirName, a6);
    v20->_dataProtectionClass = a8;
    objc_storeStrong((id *)&v20->_fsNode, a9);
    objc_storeStrong((id *)&v20->_creator, a10);
    uint64_t v21 = [v17 metadataURL];
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v21;
  }
  return v20;
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 creator:(id)a9 userIdentityCache:(id)a10
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:](self, "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:", a3, a4, a5, a6, a7, *(void *)&a8, 0, a9, a10, *MEMORY[0x1E4F143B8]);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:](self, "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:", a3, MEMORY[0x1E4F1CC08], a4, 0, a5, 0xFFFFFFFFLL, 0, 0, a6, *MEMORY[0x1E4F143B8]);
}

@end