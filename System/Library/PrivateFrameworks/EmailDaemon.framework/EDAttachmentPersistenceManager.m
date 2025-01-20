@interface EDAttachmentPersistenceManager
+ (OS_os_log)log;
+ (id)_cleanedNameForName:(uint64_t)a1;
+ (id)attachmentDirectoryURLWithBasePath:(id)a3;
+ (id)createFilenameForAttachmentName:(id)a3;
+ (void)removeSynapseAttachmentAttributesForMessages:(id)a3;
- (BOOL)persistAttachment:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6;
- (BOOL)persistAttachmentMetadata:(id)a3;
- (BOOL)persistAttachmentWithURL:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6;
- (BOOL)removeFilesystemAttachmentsByAccountIdentifier:(BOOL)a1;
- (EDAttachmentFileWriter)_createAttachmentFileWriterForAttachmentMetadata:(void *)a3 basePath:(void *)a4 downloadDate:(void *)a5 queue:(void *)a6 compressionQueue:(void *)a7 completion:;
- (EDAttachmentMetadata)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:;
- (EDAttachmentPersistenceManager)initWithDatabase:(id)a3 messagePersistence:(id)a4;
- (id)_accountIdentifiersByAttachmentIDs:(uint64_t)a1;
- (id)_attachmentURLForAttachmentID:(void *)a3 nameOnDisk:(void *)a4 basePath:;
- (id)_attachmentURLForAttachmentMetadata:(void *)a3 basePath:;
- (id)_attachmentURLForAttachmentTableMetadata:(void *)a3 basePath:;
- (id)_attachmentURLWithBasePath:(void *)a3 attachmentID:(void *)a4 nameOnDisk:;
- (id)_attachmentURLsAndNamesForMetadata:(void *)a3 basePath:;
- (id)_createTemporaryURLForAttachmentMetadata:(void *)a3 basePath:;
- (id)_temporaryFileURLWithBasePath:(void *)a3 name:;
- (id)_updateAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:;
- (id)_updateFileWrapperNameToStaticFileName:(uint64_t)a1;
- (id)addSynapseAttributesToAttachmentWithURL:(id)a3 contentType:(id)a4 usingGenerator:(id)a5;
- (id)allAttachmentsInfoForGlobalMessageIDs:(id)a3 basePath:(id)a4;
- (id)attachmentDirectoryURLForMessageID:(int64_t)a3 basePath:(id)a4;
- (id)attachmentURLForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 basePath:(id)a5;
- (id)attachmentURLForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 basePath:(id)a5;
- (id)attachmentURLForMessageAttachmentID:(id)a3 basePath:(id)a4;
- (id)attachmentURLsForGlobalMessageIDs:(id)a3;
- (id)createAttachmentFileWriterForAttachmentMetadata:(id)a3 basePath:(id)a4 downloadDate:(id)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8;
- (uint64_t)_moveAttachmentAtURL:(void *)a3 toURL:(uint64_t)a4 outError:;
- (uint64_t)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(void *)a3 orURL:(void *)a4 attachmentMetadata:(void *)a5 basePath:(int)a6 shouldUpdateAttachmentID:;
- (uint64_t)_persistAttachmentWithWrapper:(id *)a1 orURL:(void *)a2 attachmentMetadata:(void *)a3 basePath:(void *)a4 error:(void *)a5;
- (uint64_t)_writeAttachment:(void *)a3 toDirectory:(void *)a4 outError:;
- (uint64_t)_writeFileWrapper:(void *)a3 toURL:(void *)a4 outError:;
- (uint64_t)removeDatabaseAttachments:(uint64_t)a1;
- (void)_createParentDirectoryForFile:(uint64_t)a1;
- (void)_didCompleteWritingAttachmentToFile:(void *)a3 basePath:(void *)a4 digest:(void *)a5 metadata:(void *)a6 downloadDate:;
- (void)_tempDirectoryForArchiveAttachmentsWithParentDirectory:(void *)a1;
- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4;
- (void)isDeletingMessages:(id)a3;
- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceWillDeleteMessages:(id)a3;
- (void)willDeleteAttachmentsForMessages:(id)a3;
@end

@implementation EDAttachmentPersistenceManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EDAttachmentPersistenceManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;

  return (OS_os_log *)v2;
}

void __37__EDAttachmentPersistenceManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

+ (id)attachmentDirectoryURLWithBasePath:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"AttachmentData" isDirectory:1];

  return v3;
}

- (EDAttachmentPersistenceManager)initWithDatabase:(id)a3 messagePersistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDAttachmentPersistenceManager;
  v8 = [(EDAttachmentPersistenceManager *)&v14 init];
  if (v8)
  {
    v9 = [[EDAttachmentPersistence alloc] initWithDatabase:v6];
    attachmentPersistence = v8->_attachmentPersistence;
    v8->_attachmentPersistence = v9;

    objc_storeStrong((id *)&v8->_messagePersistence, a4);
    uint64_t v11 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDAttachmentPersistenceManager" qualityOfService:17];
    synapseAttributesScheduler = v8->_synapseAttributesScheduler;
    v8->_synapseAttributesScheduler = (EFScheduler *)v11;
  }
  return v8;
}

- (id)_updateFileWrapperNameToStaticFileName:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 preferredFilename];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v4 filename];
    }
    v8 = v7;

    v9 = [v8 pathExtension];
    if (v9) {
      [NSString stringWithFormat:@"%@.%@", @"attachment", v9];
    }
    else {
    v10 = [NSString stringWithFormat:@"%@", @"attachment"];
    }
    uint64_t v11 = EDAttachmentsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v14 = v10;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Created new attachment filename %@", buf, 0xCu);
    }

    [v4 setPreferredFilename:v10];
    [v4 setFilename:v10];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(void *)a3 orURL:(void *)a4 attachmentMetadata:(void *)a5 basePath:(int)a6 shouldUpdateAttachmentID:
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v75 = a4;
  id v72 = a5;
  v73 = v12;
  if (!a1)
  {
    uint64_t v68 = 0;
    goto LABEL_88;
  }
  id v76 = *(id *)(a1 + 8);
  if (v11)
  {
    v74 = -[EDAttachmentPersistenceManager _updateFileWrapperNameToStaticFileName:](a1, v11);
    if ([v11 isDirectory])
    {
      if (!v12)
      {
        v77 = 0;
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    objc_super v14 = [v11 regularFileContents];
    v77 = +[EDAttachmentPersistence hashForAttachmentData:v14];
  }
  else
  {
    if (v12)
    {
      v13 = [v12 pathExtension];
      if (v13) {
        [NSString stringWithFormat:@"%@.%@", @"attachment", v13];
      }
      else {
      v74 = [NSString stringWithFormat:@"%@", @"attachment"];
      }

LABEL_13:
      objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v12];
      if (!v14)
      {
        v43 = EDAttachmentsLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:].cold.4((uint64_t)v12, v43);
        }

        v77 = 0;
        unsigned __int8 v82 = 0;
        goto LABEL_87;
      }
      v77 = +[EDAttachmentPersistence hashForAttachmentData:v14];
      goto LABEL_15;
    }
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:sel__persistAndUpdateAttachmentPersistenceTableFromFileWrapper_orURL_attachmentMetadata_basePath_shouldUpdateAttachmentID_ object:a1 file:@"EDAttachmentPersistenceManager.m" lineNumber:98 description:@"Need to have either a fileWrapper or a URL"];
    v74 = 0;
    v77 = 0;
  }
LABEL_15:

LABEL_16:
  uint64_t v15 = EDAttachmentsLog();
  int v70 = a6;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v75 globalMessageID];
    v17 = [v75 mimePartNumber];
    *(_DWORD *)buf = 138543874;
    uint64_t v86 = (uint64_t)v77;
    __int16 v87 = 2048;
    uint64_t v88 = v16;
    __int16 v89 = 2114;
    v90 = v17;
    _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Created hash %{public}@ for attachment for globalMessageID %lld MIME part %{public}@", buf, 0x20u);
  }
  if (v11)
  {
    v18 = [v11 fileAttributes];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
    v71 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
  }
  else
  {
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v21 = [v73 path];
    v18 = [v20 attributesOfItemAtPath:v21 error:0];

    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
    v71 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
    if (!v19 || !v71)
    {
      v44 = EDAttachmentsLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)v73, v44);
      }

      unsigned __int8 v82 = 0;
      goto LABEL_86;
    }
  }

  v22 = EDAttachmentsLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Checking if the attachment hash already exists in the attachments table", buf, 2u);
  }

  v23 = [v76 uniqueAttachmentDataForHash:v77];
  v18 = v23;
  uint64_t v24 = *MEMORY[0x1E4F5FCC8];
  if (!v23)
  {
    v27 = [[EDAttachmentMetadata alloc] initWithAttachmentHash:v77 nameOnDisk:v74 size:v19 downloadDate:v71];
    v37 = EDAttachmentsLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v37, OS_LOG_TYPE_DEFAULT, "No existing attachment found. Adding to the attachments table", buf, 2u);
    }

    uint64_t v38 = [v76 insertAttachmentMetadata:v27];
    if (v38 == v24)
    {
      id v36 = 0;
LABEL_61:
      v28 = EDAttachmentsLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        [v11 preferredFilename];
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]();
      }
      char v35 = 0;
      goto LABEL_64;
    }
    v45 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v38);
    v46 = [v72 URLByAppendingPathComponent:v45 isDirectory:1];

    v47 = EDAttachmentsLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [v11 preferredFilename];
      *(_DWORD *)buf = 134218498;
      uint64_t v86 = v38;
      __int16 v87 = 2112;
      uint64_t v88 = (uint64_t)v48;
      __int16 v89 = 2112;
      v90 = v46;
      _os_log_impl(&dword_1DB39C000, v47, OS_LOG_TYPE_DEFAULT, "Persisting attachment %lld %@ to disk at directory %@", buf, 0x20u);
    }
    if (v11)
    {
      id v81 = 0;
      char v49 = -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:](a1, v11, v46, &v81);
      id v36 = v81;

      if ((v49 & 1) == 0) {
        goto LABEL_61;
      }
    }
    else
    {
      v54 = [v46 URLByAppendingPathComponent:v74];
      id v80 = 0;
      int v55 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:](a1, v73, v54, (uint64_t)&v80);
      id v36 = v80;

      if (!v55) {
        goto LABEL_61;
      }
    }
    v28 = EDAttachmentsLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [v11 preferredFilename];
      *(_DWORD *)buf = 134218242;
      uint64_t v86 = v38;
      __int16 v87 = 2112;
      uint64_t v88 = (uint64_t)v50;
      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Persisted attachment %lld %@ to disk", buf, 0x16u);
    }
    char v35 = 1;
    goto LABEL_64;
  }
  v25 = NSString;
  v26 = [v23 attachmentID];
  v27 = [v25 stringWithFormat:@"%@", v26];

  v28 = [v72 URLByAppendingPathComponent:v27 isDirectory:1];
  v29 = [v28 URLByAppendingPathComponent:v74];
  v30 = [v29 relativePath];

  v31 = EDAttachmentsLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v86 = (uint64_t)v30;
    _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Found the attachment in the attachments table. Checking if it exists on disk at %@", buf, 0xCu);
  }

  v32 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v33 = [v32 fileExistsAtPath:v30];

  if ((v33 & 1) == 0)
  {
    v39 = EDAttachmentsLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [v11 preferredFilename];
      *(_DWORD *)buf = 138412290;
      uint64_t v86 = (uint64_t)v40;
      _os_log_impl(&dword_1DB39C000, v39, OS_LOG_TYPE_DEFAULT, "No existing attachment found on disk. Writing attachment %@ to disk", buf, 0xCu);
    }
    if (v11)
    {
      id v79 = 0;
      char v41 = -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:](a1, v11, v28, &v79);
      id v36 = v79;
      if (v41)
      {
LABEL_39:
        v34 = EDAttachmentsLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v42 = [v11 preferredFilename];
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = (uint64_t)v42;
          _os_log_impl(&dword_1DB39C000, v34, OS_LOG_TYPE_DEFAULT, "Persisted attachment %@ to disk with existing metadata", buf, 0xCu);
        }
        char v35 = 1;
        goto LABEL_59;
      }
    }
    else
    {
      v51 = [v28 URLByAppendingPathComponent:v74];
      id v78 = 0;
      int v52 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:](a1, v73, v51, (uint64_t)&v78);
      id v36 = v78;

      if (v52) {
        goto LABEL_39;
      }
    }
    v34 = EDAttachmentsLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v53 = [v11 preferredFilename];
      -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)v36, v53, (uint64_t)buf);
    }
    char v35 = 0;
    goto LABEL_59;
  }
  v34 = EDAttachmentsLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v34, OS_LOG_TYPE_DEFAULT, "Found the attachment on disk. No write needed", buf, 2u);
  }
  char v35 = 0;
  id v36 = 0;
LABEL_59:

  uint64_t v38 = v24;
LABEL_64:

  v56 = [v18 attachmentID];
  if (v56) {
    BOOL v57 = 0;
  }
  else {
    BOOL v57 = v38 == v24;
  }
  int v58 = !v57;

  if (v58)
  {
    v59 = [v18 attachmentID];
    v60 = v59;
    if (!v59)
    {
      v60 = [NSNumber numberWithLongLong:v38];
    }
    [v75 setAttachmentID:v60];
    if (!v59) {

    }
    v61 = EDAttachmentsLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = [v18 attachmentID];
      *(_DWORD *)v83 = 138412290;
      v84 = v62;
      _os_log_impl(&dword_1DB39C000, v61, OS_LOG_TYPE_DEFAULT, "Checking if we need to update or insert the attachment metadata in the message_attachments table for attachment: %@", v83, 0xCu);
    }
    if (v70)
    {
      v63 = EDAttachmentsLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = [v18 attachmentID];
        *(_DWORD *)v83 = 138412290;
        v84 = v64;
        _os_log_impl(&dword_1DB39C000, v63, OS_LOG_TYPE_DEFAULT, "Update the message_attachments table with the updated attachment ID: %@", v83, 0xCu);
      }
      char v65 = [v76 updateAttachmentIDForMessageAttachment:v75];
    }
    else
    {
      v66 = EDAttachmentsLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [v75 attachmentID];
        *(_DWORD *)v83 = 138412290;
        v84 = v67;
        _os_log_impl(&dword_1DB39C000, v66, OS_LOG_TYPE_DEFAULT, "Create a new entry into the message_attachments table with attachment ID: %@", v83, 0xCu);
      }
      char v65 = [v76 insertMessageAttachmentMetadata:v75];
    }
    char v35 = v65;
  }
  unsigned __int8 v82 = v35;

LABEL_86:
LABEL_87:

  uint64_t v68 = v82;
LABEL_88:

  return v68;
}

- (uint64_t)_writeAttachment:(void *)a3 toDirectory:(void *)a4 outError:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v23 = 0;
    goto LABEL_25;
  }
  int v9 = [v7 isDirectory];
  v10 = (void *)MEMORY[0x1E0190280]();
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  int v12 = [v11 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v13 = v29;

  if (v12)
  {
    objc_super v14 = [v7 preferredFilename];
    if (v14 || ([v7 filename], (objc_super v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v9) {
        [v8 URLByAppendingPathComponent:v14 isDirectory:1];
      }
      else {
      uint64_t v15 = [v8 URLByAppendingPathComponent:v14 isDirectory:0];
      }
      id v28 = v13;
      char v17 = [v15 checkResourceIsReachableAndReturnError:&v28];
      id v18 = v28;

      if (v17)
      {
        v19 = EDAttachmentsLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [v15 path];
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:]();
        }

        id v26 = v18;
        unsigned __int8 v16 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:](a1, v7, v15, &v26);
        id v13 = v26;

        goto LABEL_22;
      }
      v20 = [v18 domain];
      if ([v20 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        BOOL v21 = [v18 code] == 260;

        if (v21)
        {
          id v27 = v18;
          unsigned __int8 v16 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:](a1, v7, v15, &v27);
          id v13 = v27;

          goto LABEL_22;
        }
      }
      else
      {
      }
      v22 = EDAttachmentsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        [v15 path];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:]();
      }

      unsigned __int8 v16 = 0;
      id v13 = v18;
      goto LABEL_22;
    }
    objc_super v14 = EDAttachmentsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v25 = [v8 path];
      -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:]((uint64_t)v7, v25, (uint64_t)v31);
    }
  }
  else
  {
    objc_super v14 = EDAttachmentsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:].cold.4();
    }
  }
  uint64_t v15 = 0;
  unsigned __int8 v16 = 0;
LABEL_22:

  if (a4) {
    *a4 = v13;
  }
  unsigned __int8 v30 = v16;

  uint64_t v23 = v30;
LABEL_25:

  return v23;
}

- (uint64_t)_moveAttachmentAtURL:(void *)a3 toURL:(uint64_t)a4 outError:
{
  id v7 = a2;
  id v8 = a3;
  int v9 = v8;
  if (a1)
  {
    v10 = [v8 URLByDeletingLastPathComponent];
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v12 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a4];

    if (v12)
    {
      if ([v9 checkResourceIsReachableAndReturnError:0])
      {
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v13 removeItemAtURL:v7 error:0];
        uint64_t v14 = 1;
      }
      else
      {
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v14 = [v13 moveItemAtURL:v7 toURL:v9 error:a4];
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)persistAttachment:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6
{
  return -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]((id *)&self->super.isa, a3, 0, a4, a5);
}

- (uint64_t)_persistAttachmentWithWrapper:(id *)a1 orURL:(void *)a2 attachmentMetadata:(void *)a3 basePath:(void *)a4 error:(void *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v36 = a3;
  id v9 = a4;
  id v38 = a5;
  v44 = v9;
  if (!a1)
  {
    uint64_t v17 = 0;
    goto LABEL_49;
  }
  uint64_t v10 = [v9 globalMessageID];
  v40 = [v9 mimePartNumber];
  char v35 = [v9 remoteURL];
  id v39 = a1[1];
  id v11 = EDAttachmentsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if the attachment metadata already exists in the message_attachments table", buf, 2u);
  }

  char v50 = 0;
  if (v40)
  {
    int v43 = [v39 messageAttachmentExistsForGlobalMessageID:v10 mimePartNumber:v40 hasAttachmentEntry:&v50];
LABEL_8:
    if (v50 && v43)
    {
      int v12 = EDAttachmentsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Found both the attachment metadata and the attachment in the message_attachments and attachments table. No insertion needed.", buf, 2u);
      }

      id v13 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentMetadata:basePath:](a1, v44, v38);
      if (v41) {
        uint64_t v14 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:]((uint64_t)a1, v41, v13, 0);
      }
      else {
        uint64_t v14 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:]((uint64_t)a1, v36, v13, 0);
      }
      uint64_t v17 = v14;
    }
    else
    {
      if (v50)
      {
        uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:sel__persistAttachmentWithWrapper_orURL_attachmentMetadata_basePath_error_ object:a1 file:@"EDAttachmentPersistenceManager.m" lineNumber:374 description:@"We can't possibly have found an attachment entry without a message_attachment"];
      }
      v42 = +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:v38];
      v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v15 = [v41 isRegularFile] ^ 1;
      if (v36) {
        LOBYTE(v15) = 0;
      }
      if (v15)
      {
        id v18 = EDAttachmentsLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Persisting archive attachment", buf, 2u);
        }

        v19 = -[EDAttachmentPersistenceManager _tempDirectoryForArchiveAttachmentsWithParentDirectory:](a1, v42);
        -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:]((uint64_t)a1, v41, v19, 0);
        [v34 contentsOfDirectoryAtURL:v19 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:16 error:0];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
        if (v20)
        {
          LOBYTE(v17) = 0;
          uint64_t v22 = *(void *)v47;
          *(void *)&long long v21 = 138412290;
          long long v33 = v21;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v47 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "relativeString", v33);
              v25 = [v24 stringByRemovingPercentEncoding];
              id v26 = [v19 URLByAppendingPathComponent:v25];

              id v27 = objc_alloc(MEMORY[0x1E4F60D68]);
              id v45 = 0;
              id v28 = (void *)[v27 initWithURL:v26 options:1 error:&v45];
              id v29 = v45;
              if ([v28 isDirectory])
              {
                uint64_t v17 = EDAttachmentsLog();
                if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v33;
                  int v52 = v26;
                  _os_log_impl(&dword_1DB39C000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Persisting archive attachment from temp directory %@", buf, 0xCu);
                }

                LOBYTE(v17) = -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)a1, v28, 0, v44, v42, v43);
              }
              if ((v17 & 1) == 0)
              {
                unsigned __int8 v30 = EDAttachmentsLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  [v41 preferredFilename];
                  objc_claimAutoreleasedReturnValue();
                  -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]();
                }

                goto LABEL_45;
              }

              uint64_t v17 = 1;
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
        else
        {
LABEL_45:
          uint64_t v17 = 0;
        }

        [v34 removeItemAtURL:v19 error:0];
      }
      else
      {
        unsigned __int8 v16 = EDAttachmentsLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Persisting regular file attachment", buf, 2u);
        }

        uint64_t v17 = -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)a1, v41, v36, v44, v42, v43);
      }

      id v13 = v42;
    }
    goto LABEL_48;
  }
  if (v35)
  {
    int v43 = [v39 messageAttachmentExistsForGlobalMessageID:v10 remoteURL:v35 hasAttachmentEntry:&v50];
    goto LABEL_8;
  }
  id v13 = EDAttachmentsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v44, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]();
  }
  uint64_t v17 = 0;
LABEL_48:

LABEL_49:
  return v17;
}

- (BOOL)persistAttachmentWithURL:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6
{
  return -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]((id *)&self->super.isa, 0, a3, a4, a5);
}

- (id)createAttachmentFileWriterForAttachmentMetadata:(id)a3 basePath:(id)a4 downloadDate:(id)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v13 name];

  if (v19)
  {
    uint64_t v20 = (EDMessageAttachmentMetadata *)v13;
  }
  else
  {
    id v26 = [EDMessageAttachmentMetadata alloc];
    uint64_t v21 = [v13 globalMessageID];
    id v27 = [v13 mimePartNumber];
    uint64_t v22 = [v13 attachmentID];
    uint64_t v23 = [v13 remoteURL];
    uint64_t v20 = [(EDMessageAttachmentMetadata *)v26 initWithGlobalMessageID:v21 name:@"attachment" mimePart:v27 attachmentID:v22 remoteURL:v23];
  }
  uint64_t v24 = -[EDAttachmentPersistenceManager _createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:]((EDAttachmentFileWriter *)self, v20, v14, v15, v16, v17, v18);

  return v24;
}

- (EDAttachmentFileWriter)_createAttachmentFileWriterForAttachmentMetadata:(void *)a3 basePath:(void *)a4 downloadDate:(void *)a5 queue:(void *)a6 compressionQueue:(void *)a7 completion:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a1)
  {
    id v18 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentMetadata:basePath:](a1, v13, v14);
    if ([v18 checkResourceIsReachableAndReturnError:0])
    {
      v19 = EDAttachmentsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v13 globalMessageID];
        uint64_t v21 = [v13 mimePartNumber];
        *(_DWORD *)buf = 134218242;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        id v36 = v21;
        _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Attachment file for global ID %llu MIME part [%{public}@] already exists. Not creating file writer.", buf, 0x16u);
      }
      a1 = 0;
    }
    else
    {
      v19 = -[EDAttachmentPersistenceManager _createTemporaryURLForAttachmentMetadata:basePath:](a1, v13, v14);
      if (v19)
      {
        uint64_t v22 = [EDAttachmentFileWriter alloc];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke;
        v26[3] = &unk_1E6BFF5D8;
        id v27 = v13;
        id v28 = v19;
        id v29 = a1;
        id v30 = v14;
        id v31 = v15;
        id v32 = v17;
        a1 = [(EDAttachmentFileWriter *)v22 initWithFinalURL:v28 queue:v25 compressionQueue:v16 completion:v26];

        uint64_t v23 = v27;
      }
      else
      {
        uint64_t v23 = EDAttachmentsLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          [v13 globalMessageID];
          [v13 mimePartNumber];
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:]();
        }
        a1 = 0;
      }
    }
  }

  return a1;
}

- (id)_attachmentURLForAttachmentMetadata:(void *)a3 basePath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 mimePartNumber];

    if (v7)
    {
      uint64_t v8 = [v5 globalMessageID];
      id v9 = [v5 mimePartNumber];
      uint64_t v10 = [a1 attachmentURLForGlobalMessageID:v8 mimePartNumber:v9 basePath:v6];
LABEL_6:
      a1 = (void *)v10;

      goto LABEL_7;
    }
    id v11 = [v5 remoteURL];

    if (v11)
    {
      uint64_t v12 = [v5 globalMessageID];
      id v9 = [v5 remoteURL];
      uint64_t v10 = [a1 attachmentURLForGlobalMessageID:v12 remoteURL:v9 basePath:v6];
      goto LABEL_6;
    }
    a1 = 0;
  }
LABEL_7:

  return a1;
}

- (id)_createTemporaryURLForAttachmentMetadata:(void *)a3 basePath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 name];
    a1 = -[EDAttachmentPersistenceManager _temporaryFileURLWithBasePath:name:]((uint64_t)a1, v6, v7);
  }

  return a1;
}

void __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = EDAttachmentsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke_cold_1((uint64_t)&v16, [*(id *)(a1 + 32) globalMessageID]);
    }

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtURL:*(void *)(a1 + 40) error:0];
LABEL_5:

    goto LABEL_11;
  }
  uint64_t v8 = EDAttachmentsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) globalMessageID];
    uint64_t v10 = [*(id *)(a1 + 32) mimePartNumber];
    int v16 = 134218242;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Finished writing attachment file for global message ID %llu MIME part [%{public}@] to temporary URL", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void **)(a1 + 56);
  id v13 = *(void **)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v15 = *(void **)(a1 + 64);
  id v7 = v15;
  if (!v15)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  -[EDAttachmentPersistenceManager _didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:](v11, v14, v12, v5, v13, v7);
  if (!v15) {
    goto LABEL_5;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_didCompleteWritingAttachmentToFile:(void *)a3 basePath:(void *)a4 digest:(void *)a5 metadata:(void *)a6 downloadDate:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    int v16 = -[EDAttachmentPersistenceManager _updateAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:](a1, v11, v14, v12, v13, v15);
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v24 = 0;
      char v18 = [v17 moveItemAtURL:v11 toURL:v16 error:&v24];
      id v19 = v24;

      if (v18)
      {
        uint64_t v20 = EDAttachmentsLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [v14 globalMessageID];
          *(_DWORD *)buf = 134217984;
          uint64_t v26 = v21;
          _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Did move attachment to final location (global ID %llu).", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v23 = EDAttachmentsLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          [v14 globalMessageID];
          objc_msgSend(v19, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:]();
        }

        uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v20 removeItemAtURL:v11 error:0];
      }
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v22 removeItemAtURL:v11 error:0];
    }
  }
}

- (id)_temporaryFileURLWithBasePath:(void *)a3 name:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 URLByAppendingPathComponent:@"__temp"];
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];

    id v9 = [MEMORY[0x1E4F1CA58] dataWithLength:18];
    arc4random_buf((void *)[v9 mutableBytes], objc_msgSend(v9, "length"));
    uint64_t v10 = [v9 base64EncodedStringWithOptions:0];
    id v11 = [v10 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

    id v12 = +[EDAttachmentPersistenceManager createFilenameForAttachmentName:v6];
    id v13 = [v12 stringByAppendingPathExtension:v11];

    id v14 = [v7 URLByAppendingPathComponent:v13 isDirectory:0];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_updateAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    int v16 = -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:](a1, v11, v12, v13, v14, v15);
    uint64_t v17 = [v16 attachmentID];

    if (v17)
    {
      char v18 = [v12 attachmentID];

      if (v18)
      {
        id v19 = EDAttachmentsLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v16 attachmentID];
          int v28 = 138412546;
          id v29 = v20;
          __int16 v30 = 2048;
          uint64_t v31 = [v12 globalMessageID];
          _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Updated nil attachment ID to %@ for global message ID %llu", (uint8_t *)&v28, 0x16u);
        }
      }
      uint64_t v21 = [v16 attachmentID];
      [v12 setAttachmentID:v21];

      if (([*(id *)(a1 + 8) updateAttachmentIDForMessageAttachment:v12] & 1) != 0
        || ([*(id *)(a1 + 8) insertMessageAttachmentMetadata:v12] & 1) != 0)
      {
        uint64_t v22 = [v16 attachmentID];
        uint64_t v23 = [v16 nameOnDisk];
        id v24 = -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:](a1, v13, v22, v23);

        -[EDAttachmentPersistenceManager _createParentDirectoryForFile:](a1, v24);
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v26 = EDAttachmentsLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        [v12 attachmentID];
        objc_claimAutoreleasedReturnValue();
        [v12 globalMessageID];
        -[EDAttachmentPersistenceManager _updateAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:]();
      }
    }
    else
    {
      id v25 = EDAttachmentsLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentPersistenceManager _updateAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:]((uint64_t)&v28, [v12 globalMessageID]);
      }

      uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v26 removeItemAtURL:v11 error:0];
    }

    id v24 = 0;
    goto LABEL_14;
  }
  id v24 = 0;
LABEL_15:

  return v24;
}

- (EDAttachmentMetadata)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    if (v14)
    {
      if ([v14 length] == 32)
      {
        id v16 = *(id *)(a1 + 8);
        uint64_t v17 = objc_msgSend(v14, "ef_hexString");
        char v18 = [v16 uniqueAttachmentDataForHash:v17];

        id v19 = [(EDAttachmentMetadata *)v18 attachmentID];

        if (v19)
        {
          uint64_t v20 = EDAttachmentsLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v14 bytes];
            uint64_t v22 = [v12 globalMessageID];
            uint64_t v23 = [(EDAttachmentMetadata *)v18 attachmentID];
            *(_DWORD *)buf = 68158466;
            int v43 = 32;
            __int16 v44 = 2096;
            uint64_t v45 = v21;
            __int16 v46 = 2048;
            uint64_t v47 = v22;
            __int16 v48 = 2048;
            uint64_t v49 = [v23 unsignedLongLongValue];
            _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Found existing attachment with digest %.32P (global ID %llu): attachment ID: %llu", buf, 0x26u);
          }
        }
        else
        {

          id v41 = 0;
          uint64_t v25 = *MEMORY[0x1E4F1C5F8];
          id v40 = 0;
          char v26 = [v11 getResourceValue:&v41 forKey:v25 error:&v40];
          uint64_t v20 = v41;
          id v38 = v40;
          if ((v26 & 1) == 0)
          {
            uint64_t v27 = EDAttachmentsLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              [v12 globalMessageID];
              objc_msgSend(v38, "ef_publicDescription");
              objc_claimAutoreleasedReturnValue();
              -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:]();
            }
          }
          int v28 = [v12 name];
          id v39 = +[EDAttachmentPersistenceManager createFilenameForAttachmentName:v28];

          id v29 = [EDAttachmentMetadata alloc];
          __int16 v30 = objc_msgSend(v14, "ef_hexString");
          uint64_t v31 = [(EDAttachmentMetadata *)v29 initWithAttachmentHash:v30 nameOnDisk:v39 size:v20 downloadDate:v15];

          uint64_t v32 = [*(id *)(a1 + 8) insertAttachmentMetadata:v31];
          if (v32 == *MEMORY[0x1E4F5FCC8])
          {
            long long v33 = EDAttachmentsLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:]((uint64_t)buf, [v12 globalMessageID]);
            }

            char v18 = 0;
          }
          else
          {
            uint64_t v34 = EDAttachmentsLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v35 = [v14 bytes];
              uint64_t v36 = [v12 globalMessageID];
              *(_DWORD *)buf = 68158466;
              int v43 = 32;
              __int16 v44 = 2096;
              uint64_t v45 = v35;
              __int16 v46 = 2048;
              uint64_t v47 = v36;
              __int16 v48 = 2048;
              uint64_t v49 = v32;
              _os_log_impl(&dword_1DB39C000, v34, OS_LOG_TYPE_DEFAULT, "Did insert new attachment ID for digest %.32P (global ID %llu): attachment ID: %llu", buf, 0x26u);
            }

            uint64_t v37 = [NSNumber numberWithLongLong:v32];
            [(EDAttachmentMetadata *)v31 setAttachmentID:v37];

            char v18 = v31;
          }
        }
        goto LABEL_12;
      }
      uint64_t v20 = EDAttachmentsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:].cold.4((uint64_t)buf, [v12 globalMessageID]);
      }
    }
    else
    {
      uint64_t v20 = EDAttachmentsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:]((uint64_t)buf, [v12 globalMessageID]);
      }
    }
    char v18 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v18 = 0;
LABEL_13:

  return v18;
}

- (id)_attachmentURLWithBasePath:(void *)a3 attachmentID:(void *)a4 nameOnDisk:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  id v11 = 0;
  if (a1 && v7 && v8 && v9)
  {
    id v12 = +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:v7];
    id v13 = [v8 stringValue];
    id v14 = [v12 URLByAppendingPathComponent:v13 isDirectory:1];
    id v11 = [v14 URLByAppendingPathComponent:v10 isDirectory:0];
  }

  return v11;
}

- (void)_createParentDirectoryForFile:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    v4 = [v3 URLByDeletingLastPathComponent];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:0];

    id v3 = v6;
  }
}

- (uint64_t)_writeFileWrapper:(void *)a3 toURL:(void *)a4 outError:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v9 = 0;
    goto LABEL_22;
  }
  id v26 = 0;
  uint64_t v9 = [v7 writeToURL:v8 options:3 originalContentsURL:0 error:&v26];
  id v10 = v26;
  if (!v9)
  {
    uint64_t v17 = EDAttachmentsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v8 path];
      uint64_t v20 = objc_msgSend(v10, "ef_publicDescription");
      *(_DWORD *)buf = 138412802;
      id v28 = v7;
      __int16 v29 = 2114;
      __int16 v30 = v19;
      __int16 v31 = 2114;
      uint64_t v32 = v20;
      _os_log_error_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_ERROR, "Failed to write attachment file wrapper %@ to %{public}@, %{public}@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  id v11 = EDAttachmentsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 path];
    *(_DWORD *)buf = 138543362;
    id v28 = v12;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Persisting attachment to filesystem: %{public}@", buf, 0xCu);
  }
  [*(id *)(a1 + 16) setContentProtectionForAttachmentFile:v8];
  int v13 = [v7 isDirectory];
  id v14 = *(id *)(a1 + 16);
  id v15 = v14;
  if (v13)
  {
    id v25 = 0;
    char v16 = [v14 compressDirectory:v8 shouldCancel:0 error:&v25];
    uint64_t v17 = v25;

    if (v16) {
      goto LABEL_15;
    }
    char v18 = EDAttachmentsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      objc_claimAutoreleasedReturnValue();
      [v17 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:]();
    }
  }
  else
  {
    id v24 = 0;
    int v21 = [v14 compressFile:v8 error:&v24];
    uint64_t v17 = v24;

    if (v21) {
      goto LABEL_15;
    }
    char v18 = EDAttachmentsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      objc_claimAutoreleasedReturnValue();
      [v17 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:]();
    }
  }

LABEL_15:
  if (v17)
  {
    uint64_t v22 = EDAttachmentsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      objc_claimAutoreleasedReturnValue();
      [v17 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:]();
    }
  }
LABEL_19:

  if (a4) {
    *a4 = v10;
  }

LABEL_22:
  return v9;
}

- (void)_tempDirectoryForArchiveAttachmentsWithParentDirectory:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[3];
    if (!v4)
    {
      id v5 = NSString;
      id v6 = [MEMORY[0x1E4F29128] UUID];
      id v7 = [v5 stringWithFormat:@"__temp_%@", v6];

      uint64_t v8 = [v3 URLByAppendingPathComponent:v7];
      uint64_t v9 = (void *)a1[3];
      a1[3] = v8;

      v4 = (void *)a1[3];
    }
    a1 = v4;
  }

  return a1;
}

- (BOOL)persistAttachmentMetadata:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  id v6 = attachmentPersistence;
  if (![v4 globalMessageID])
  {
    uint64_t v9 = EDAttachmentsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_11;
  }
  id v7 = [v4 name];

  if (!v7)
  {
    uint64_t v9 = EDAttachmentsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:](v9, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_11;
  }
  uint64_t v8 = [v4 mimePartNumber];
  if (!v8)
  {
    id v25 = [v4 remoteURL];

    if (v25) {
      goto LABEL_13;
    }
    uint64_t v9 = EDAttachmentsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:](v9, v44, v45, v46, v47, v48, v49, v50);
    }
LABEL_11:
    char v24 = 0;
    goto LABEL_32;
  }

LABEL_13:
  id v26 = EDAttachmentsLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v4 globalMessageID];
    id v28 = [v4 mimePartNumber];
    *(_DWORD *)buf = 134218242;
    uint64_t v56 = v27;
    __int16 v57 = 2114;
    uint64_t v58 = (uint64_t)v28;
    _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Check the message_attachments table if attachment with message ID %lld MIME part %{public}@ exists", buf, 0x16u);
  }
  -[EDAttachmentPersistence messageAttachmentMetadataForMessageID:](v6, "messageAttachmentMetadataForMessageID:", [v4 globalMessageID]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v9 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v9);
        }
        uint64_t v32 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v33 = [v32 mimePartNumber];
        uint64_t v34 = [v4 mimePartNumber];
        if ([v33 isEqualToString:v34])
        {
          uint64_t v35 = [v32 globalMessageID];
          LODWORD(v35) = v35 == [v4 globalMessageID];

          if (v35)
          {
            id v38 = [v4 mimePartNumber];

            id v39 = EDAttachmentsLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              id v41 = [v4 attachmentID];
              uint64_t v42 = [v4 globalMessageID];
              *(_DWORD *)buf = 138412802;
              uint64_t v56 = (uint64_t)v41;
              __int16 v57 = 2048;
              uint64_t v58 = v42;
              __int16 v59 = 2114;
              v60 = v38;
              _os_log_impl(&dword_1DB39C000, v39, OS_LOG_TYPE_DEFAULT, "Attachment metadata with attachment ID %@ already exists in message_attachments table for globalMessageID: %lld mime part number: %{public}@", buf, 0x20u);
            }
            char v24 = 1;
            goto LABEL_32;
          }
        }
        else
        {
        }
      }
      uint64_t v29 = [v9 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  uint64_t v36 = EDAttachmentsLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = [v4 globalMessageID];
    *(_DWORD *)buf = 134218242;
    uint64_t v56 = v37;
    __int16 v57 = 2114;
    uint64_t v58 = 0;
    _os_log_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_DEFAULT, "Attachment metadata doesn't exist in message_attachments table for messageID: %lld mime part number: %{public}@. Persisting into the message_attachments table", buf, 0x16u);
  }

  char v24 = [(EDAttachmentPersistence *)v6 insertMessageAttachmentMetadata:v4];
LABEL_32:

  return v24;
}

- (uint64_t)removeDatabaseAttachments:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = EDAttachmentsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments to delete %@ from the attachments table", (uint8_t *)&v6, 0xCu);
    }

    a1 = [*(id *)(a1 + 8) removeAttachments:v3];
  }

  return a1;
}

- (BOOL)removeFilesystemAttachmentsByAccountIdentifier:(BOOL)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = EDAttachmentsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments to delete %@ from the filesystem", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v8 = 0x2020000000;
    char v9 = 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__EDAttachmentPersistenceManager_removeFilesystemAttachmentsByAccountIdentifier___block_invoke;
    v6[3] = &unk_1E6BFF600;
    v6[4] = &buf;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    a1 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }

  return a1;
}

void __81__EDAttachmentPersistenceManager_removeFilesystemAttachmentsByAccountIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v20 = a3;
  uint64_t v21 = v5;
  if ([v5 isEqualToString:@"regularAccountIdentifier"]) {
    [MEMORY[0x1E4F60410] baseMailDirectory];
  }
  else {
  uint64_t v19 = +[EDPersonaPersistenceLayoutManager baseAccountDirectoryForPersonaIdentifier:v5];
  }
  int v6 = +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v20;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * v10) stringValue];
        uint64_t v12 = [v6 URLByAppendingPathComponent:v11 isDirectory:1];

        uint64_t v13 = EDAttachmentsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v28 = v12;
          _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Deleting attachment directory: %{public}@", buf, 0xCu);
        }

        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        if (*(unsigned char *)(v14 + 24))
        {
          uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v22 = 0;
          char v16 = [v15 removeItemAtURL:v12 error:&v22];
          id v17 = v22;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v16;
        }
        else
        {
          id v17 = 0;
          *(unsigned char *)(v14 + 24) = 0;
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
        {
          uint64_t v18 = EDAttachmentsLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v28 = v12;
            _os_log_error_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_ERROR, "Failed to delete attachment directory: %{public}@", buf, 0xCu);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }
}

- (id)attachmentURLForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 basePath:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = EDAttachmentsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 path];
    int v22 = 134218498;
    int64_t v23 = a3;
    __int16 v24 = 2114;
    int64_t v25 = (int64_t)v8;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x20u);
  }
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  uint64_t v13 = attachmentPersistence;
  uint64_t v14 = [(EDAttachmentPersistence *)v13 attachmentMetadataForMessage:a3 mimePartNumber:v8];

  uint64_t v15 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentTableMetadata:basePath:](self, v14, v9);
  if (v15)
  {
    char v16 = EDAttachmentsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v9 path];
      int v22 = 138544130;
      int64_t v23 = (int64_t)v15;
      __int16 v24 = 2048;
      int64_t v25 = a3;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Found attachment URL %{public}@ for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x2Au);
    }
    id v18 = v15;
  }
  else
  {
    uint64_t v19 = EDAttachmentsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v9 path];
      int v22 = 134218498;
      int64_t v23 = a3;
      __int16 v24 = 2114;
      int64_t v25 = (int64_t)v8;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Could not find attachment URL for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x20u);
    }
  }

  return v15;
}

- (id)_attachmentURLForAttachmentTableMetadata:(void *)a3 basePath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 attachmentID];
    id v8 = [v7 stringValue];
    if (v8)
    {
      id v9 = [v5 nameOnDisk];

      if (v9)
      {
        uint64_t v10 = [v5 attachmentID];
        uint64_t v11 = [v5 nameOnDisk];
        a1 = -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:]((uint64_t)a1, v6, v10, v11);

        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v12 = EDAttachmentsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v5 attachmentID];
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _attachmentURLForAttachmentTableMetadata:basePath:]();
    }

    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (id)attachmentURLsForGlobalMessageIDs:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v32 allKeys];
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  [(EDAttachmentPersistence *)attachmentPersistence attachmentMetadataForMessageIDs:v5];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    uint64_t v30 = self;
    uint64_t v31 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      uint64_t v33 = v7;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * v8);
        uint64_t v10 = [v32 objectForKey:v9];
        uint64_t v11 = [obj objectForKeyedSubscript:v9];
        uint64_t v12 = -[EDAttachmentPersistenceManager _attachmentURLsAndNamesForMetadata:basePath:](self, v11, v10);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v36 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              id v18 = [v17 url];
              BOOL v19 = v18 == 0;

              if (!v19) {
                [v4 addObject:v17];
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
          }
          while (v14);
        }

        ++v8;
        self = v30;
      }
      while (v8 != v33);
      uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v7);
  }

  if (v4)
  {
    id v20 = EDAttachmentsLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F60E00];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        int64_t v23 = &stru_1F3583658;
      }
      else
      {
        int64_t v23 = [v4 componentsJoinedByString:@", "];
      }
      int64_t v25 = [v21 partiallyRedactedStringForString:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v26 = &stru_1F3583658;
      }
      else {
        __int16 v26 = v29;
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v25;
      __int16 v45 = 2114;
      uint64_t v46 = v26;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Found attachment URLs %{public}@ for globalMessageIDs %{public}@", buf, 0x16u);

      if ((isKindOfClass & 1) == 0) {
    }
      }

    id v27 = v4;
  }
  else
  {
    __int16 v24 = EDAttachmentsLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v44 = v29;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Could not find attachment URLs for globalMessageIDs %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

- (id)_attachmentURLsAndNamesForMetadata:(void *)a3 basePath:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__EDAttachmentPersistenceManager__attachmentURLsAndNamesForMetadata_basePath___block_invoke;
    v9[3] = &unk_1E6BFF628;
    v9[4] = a1;
    id v10 = v6;
    a1 = objc_msgSend(v5, "ef_map:", v9);
  }

  return a1;
}

- (id)attachmentURLForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 basePath:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = EDAttachmentsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 path];
    int v22 = 134218498;
    int64_t v23 = a3;
    __int16 v24 = 2112;
    int64_t v25 = (int64_t)v8;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x20u);
  }
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  id v13 = attachmentPersistence;
  uint64_t v14 = [(EDAttachmentPersistence *)v13 attachmentMetadataForMessage:a3 remoteURL:v8];

  uint64_t v15 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentTableMetadata:basePath:](self, v14, v9);
  if (v15)
  {
    char v16 = EDAttachmentsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v9 path];
      int v22 = 138544130;
      int64_t v23 = (int64_t)v15;
      __int16 v24 = 2048;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Found attachment URL %{public}@ for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x2Au);
    }
    id v18 = v15;
  }
  else
  {
    BOOL v19 = EDAttachmentsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v9 path];
      int v22 = 134218498;
      int64_t v23 = a3;
      __int16 v24 = 2112;
      int64_t v25 = (int64_t)v8;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Could not find attachment URL for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x20u);
    }
  }

  return v15;
}

id __78__EDAttachmentPersistenceManager__attachmentURLsAndNamesForMetadata_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F601F8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v3 first];
  id v8 = [v7 attachmentID];
  id v9 = [v3 first];
  id v10 = [v9 nameOnDisk];
  uint64_t v11 = -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:](v5, v6, v8, v10);
  uint64_t v12 = [v3 second];
  id v13 = [v4 attachmentWithURL:v11 displayName:v12];

  return v13;
}

+ (id)_cleanedNameForName:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = (void *)[v2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "applyTransform:reverse:range:updatedRange:", @"Any-Latin; Latin-ASCII",
      0,
      0,
      [v3 length],
      0);
    uint64_t v5 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v6 = [v5 invertedSet];
    uint64_t v7 = (void *)[v6 mutableCopy];

    [v7 addCharactersInString:@"/."];
    while (1)
    {
      uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];
      if (!v9) {
        break;
      }
      objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, v9, &stru_1F3583658);
    }
    if ([v4 length]) {
      id v10 = v4;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)createFilenameForAttachmentName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stringByDeletingPathExtension];
  +[EDAttachmentPersistenceManager _cleanedNameForName:]((uint64_t)a1, v5);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v4 pathExtension];
  uint64_t v8 = +[EDAttachmentPersistenceManager _cleanedNameForName:]((uint64_t)a1, v7);

  if (!v6)
  {
    uint64_t v9 = @"attachment";
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v9 = v6;
  if (v8)
  {
LABEL_5:
    id v10 = [(__CFString *)v9 stringByAppendingPathExtension:v8];
    goto LABEL_6;
  }
  id v10 = v6;
LABEL_6:
  uint64_t v9 = v10;
LABEL_7:

  return v9;
}

- (id)attachmentDirectoryURLForMessageID:(int64_t)a3 basePath:(id)a4
{
  id v4 = +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:a4];

  return v4;
}

- (id)attachmentURLForMessageAttachmentID:(id)a3 basePath:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = EDAttachmentsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 path];
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for messageAttachmentID %@ at base path %@", (uint8_t *)&v20, 0x16u);
  }
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  id v11 = attachmentPersistence;
  uint64_t v12 = [(EDAttachmentPersistence *)v11 attachmentMetadataForMessageAttachmentID:v6];

  if (v12)
  {
    id v13 = [v12 attachmentID];
    uint64_t v14 = [v13 longLongValue];
    uint64_t v15 = [v12 nameOnDisk];
    char v16 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentID:nameOnDisk:basePath:]((uint64_t)self, v14, v15, v7);

    id v17 = EDAttachmentsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v7 path];
      int v20 = 138412802;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      int64_t v25 = v18;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Found attachment URL %@ for messageAttachmentID %@ at base path %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)_attachmentURLForAttachmentID:(void *)a3 nameOnDisk:(void *)a4 basePath:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = 0;
  if (a1 && v7 && *MEMORY[0x1E4F5FCC8] != a2)
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a2);
    id v11 = +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:v8];
    uint64_t v12 = [v11 URLByAppendingPathComponent:v10 isDirectory:1];
    uint64_t v9 = [v12 URLByAppendingPathComponent:v7];
  }

  return v9;
}

- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  id v8 = v6;
  [(EDAttachmentPersistence *)attachmentPersistence insertMimePartAttachments:v6 forGlobalMessageID:a4];
}

- (id)allAttachmentsInfoForGlobalMessageIDs:(id)a3 basePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self) {
    attachmentPersistence = self->_attachmentPersistence;
  }
  else {
    attachmentPersistence = 0;
  }
  id v10 = attachmentPersistence;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__EDAttachmentPersistenceManager_allAttachmentsInfoForGlobalMessageIDs_basePath___block_invoke;
  v16[3] = &unk_1E6BFF650;
  v16[4] = self;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  [(EDAttachmentPersistence *)v10 enumerateAttachmentsInfoForGlobalMessageIDs:v6 withBlock:v16];

  id v13 = v18;
  id v14 = v12;

  return v14;
}

void __81__EDAttachmentPersistenceManager_allAttachmentsInfoForGlobalMessageIDs_basePath___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v21 = a3;
  id v9 = a5;
  id v10 = -[EDAttachmentPersistenceManager _attachmentURLForAttachmentID:nameOnDisk:basePath:](*(void *)(a1 + 32), a4, v9, *(void **)(a1 + 40));
  id v11 = [EDMessageAttachmentMetadata alloc];
  id v12 = [NSNumber numberWithLongLong:a4];
  id v13 = [(EDMessageAttachmentMetadata *)v11 initWithGlobalMessageID:a2 name:v9 mimePart:v21 attachmentID:v12 remoteURL:0];

  id v14 = [MEMORY[0x1E4F60DF0] pairWithFirst:v13 second:v10];
  uint64_t v15 = *(void **)(a1 + 48);
  char v16 = [NSNumber numberWithLongLong:a2];
  id v17 = [v15 objectForKeyedSubscript:v16];

  if (v17)
  {
    [v17 addObject:v14];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
    BOOL v19 = *(void **)(a1 + 48);
    int v20 = [NSNumber numberWithLongLong:a2];
    [v19 setObject:v18 forKeyedSubscript:v20];

    id v17 = (void *)v18;
  }
}

- (void)willDeleteAttachmentsForMessages:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v20;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v7 account];
        id v9 = [v8 baseAccount];
        uint64_t v10 = [v9 personaIdentifier];
        id v11 = (void *)v10;
        if (v10) {
          id v12 = (__CFString *)v10;
        }
        else {
          id v12 = @"regularAccountIdentifier";
        }
        id v13 = v12;

        id v14 = [v3 objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v3 setObject:v14 forKeyedSubscript:v13];
        }
        [v14 addObject:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke;
  v23[3] = &unk_1E6BFF698;
  v23[4] = self;
  id v16 = v15;
  id v24 = v16;
  [v3 enumerateKeysAndObjectsUsingBlock:v23];
  if ([v16 count])
  {
    id v17 = (void *)[v16 copy];
    uint64_t v18 = [MEMORY[0x1E4F29060] currentThread];
    BOOL v19 = [v18 threadDictionary];
    [v19 setObject:v17 forKeyedSubscript:@"attachmentsForAccountIdentifiers"];
  }
}

void __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = objc_msgSend(a3, "ef_map:", &__block_literal_global_3);
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[1];
  }
  id v8 = v7;
  id v9 = [v6 allObjects];
  uint64_t v10 = [v8 attachmentsForGlobalMessageIDs:v9];

  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
}

id __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));

  return v3;
}

- (id)_accountIdentifiersByAttachmentIDs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__EDAttachmentPersistenceManager__accountIdentifiersByAttachmentIDs___block_invoke;
    v8[3] = &unk_1E6BFF6C0;
    id v5 = v4;
    id v9 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v8];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __69__EDAttachmentPersistenceManager__accountIdentifiersByAttachmentIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10, (void)v14);
        if (!v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v10];
        }
        id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        [v13 addObject:v5];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)isDeletingMessages:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F29060], "currentThread", a3);
  id v5 = [v4 threadDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"attachmentsForAccountIdentifiers"];

  if ([v6 count])
  {
    uint64_t v7 = -[EDAttachmentPersistenceManager _accountIdentifiersByAttachmentIDs:]((uint64_t)self, v6);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke;
    v21[3] = &unk_1E6BFF6E8;
    v21[4] = self;
    id v9 = v8;
    id v22 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v21];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_2;
    v17[3] = &unk_1E6BFF738;
    id v12 = v9;
    id v18 = v12;
    id v13 = v10;
    id v19 = v13;
    id v14 = v11;
    id v20 = v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v17];
    if ([v13 count]) {
      -[EDAttachmentPersistenceManager removeDatabaseAttachments:]((uint64_t)self, v13);
    }
    if ([v14 count]) {
      -[EDAttachmentPersistenceManager removeFilesystemAttachmentsByAccountIdentifier:]((BOOL)self, v14);
    }
    long long v15 = [MEMORY[0x1E4F29060] currentThread];
    long long v16 = [v15 threadDictionary];
    [v16 setObject:0 forKeyedSubscript:@"attachmentsForAccountIdentifiers"];
  }
}

void __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[1];
  }
  id v5 = v4;
  id v6 = [v5 globalMessageIDsForAttachment:v3];

  if ([v6 count])
  {
    uint64_t v7 = EDAttachmentsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate globalMessageIDs found %{public}@ for attachment %{public}@", (uint8_t *)&v19, 0x16u);
    }

    id v8 = *(void **)(a1 + 32);
    if (v8) {
      id v8 = (void *)v8[2];
    }
    id v9 = v8;
    id v10 = [v9 persistedMessageIDsForGlobalMessageIDs:v6];

    id v11 = *(void **)(a1 + 32);
    if (v11) {
      id v11 = (void *)v11[2];
    }
    id v12 = v11;
    id v13 = [v12 persistedMessagesForDatabaseIDs:v10 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];

    id v14 = EDAttachmentsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Found persisted messages %{public}@ for attachment %{public}@", (uint8_t *)&v19, 0x16u);
    }

    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    long long v16 = objc_msgSend(v13, "ef_map:", &__block_literal_global_94);
    long long v17 = [v15 setWithArray:v16];
    id v18 = [v17 allObjects];

    [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v3];
  }
}

__CFString *__53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_92(uint64_t a1, void *a2)
{
  id v2 = [a2 account];
  id v3 = [v2 baseAccount];
  id v4 = [v3 personaIdentifier];
  id v5 = v4;
  if (!v4) {
    id v4 = @"regularAccountIdentifier";
  }
  id v6 = v4;

  return v6;
}

void __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  id v6 = [a1[4] objectForKeyedSubscript:v5];
  if ([v6 count])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_3;
    v22[3] = &unk_1E6BFF710;
    id v23 = v6;
    objc_msgSend(v17, "ef_filter:", v22);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [a1[5] addObject:v5];
    id v7 = v17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [a1[6] objectForKeyedSubscript:v12];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [a1[6] setObject:v15 forKeyedSubscript:v12];
        }
        long long v16 = [a1[6] objectForKeyedSubscript:v12];
        [v16 addObject:v5];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }
}

uint64_t __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (void)removeSynapseAttachmentAttributesForMessages:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_101);
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Remove Synapse attachment attributes for messages with persistentIDs %{public}@", buf, 0xCu);
    }

    if ([v4 count])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FA9260]);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke_103;
      v7[3] = &unk_1E6BFF780;
      id v8 = v4;
      [v6 unlinkDocumentsWithRelatedUniqueidentifiers:v8 completion:v7];
    }
  }
}

id __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 persistentID];

  return v2;
}

void __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke_103(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = EDAttachmentsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_msgSend(v5, "ef_publicDescription");
    v9[0] = 67109634;
    v9[1] = a2;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "unlinkDocumentsWithRelatedUniqueidentifiers succeeded: %{BOOL}d for persistentIDs %{public}@ error:%@", (uint8_t *)v9, 0x1Cu);
  }
}

- (id)addSynapseAttributesToAttachmentWithURL:(id)a3 contentType:(id)a4 usingGenerator:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(void))a5;
  if (!v8)
  {
    id v17 = EDAttachmentsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      long long v18 = "Not adding Synapse attributes. No file URL.";
LABEL_11:
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, v18, location, 2u);
    }
LABEL_14:

    long long v16 = [MEMORY[0x1E4F60D70] futureWithResult:MEMORY[0x1E4F1CC28]];
    goto LABEL_15;
  }
  if (!v9)
  {
    id v17 = EDAttachmentsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      long long v18 = "Not adding Synapse attributes. No content type.";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4FA9258];
  __int16 v12 = [v9 identifier];
  LOBYTE(v11) = [v11 isSupportedContentType:v12];

  if ((v11 & 1) == 0)
  {
    id v17 = EDAttachmentsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [v8 lastPathComponent];
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v19;
      __int16 v39 = 2114;
      id v40 = v9;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Not adding Synapse attributes to '%@': unsupported type %{public}@", location, 0x16u);
    }
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [MEMORY[0x1E4FA9248] instancesRespondToSelector:sel_saveToFileURL_additionalAttributes_completion_])
  {
    id v13 = [MEMORY[0x1E4F60E18] promise];
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    uint64_t v14 = (void *)MEMORY[0x1E4FA9248];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke;
    v33[3] = &unk_1E6BFF820;
    objc_copyWeak(&v37, (id *)location);
    id v34 = v8;
    id v15 = v13;
    id v35 = v15;
    long long v36 = v10;
    [v14 fetchDocumentAttributesForFileAtURL:v34 completion:v33];
    long long v16 = [v15 future];

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v32 = 0;
    long long v21 = [MEMORY[0x1E4FA9248] documentAttributesForFileAtURL:v8 error:&v32];
    id v15 = v32;

    if (v21)
    {
      id v22 = EDAttachmentsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        [v8 lastPathComponent];
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:]();
      }

      long long v16 = [MEMORY[0x1E4F60D70] futureWithResult:MEMORY[0x1E4F1CC28]];
    }
    else
    {
      id v23 = v10[2](v10);
      id v24 = v23;
      if (v23)
      {
        id v31 = v15;
        uint64_t v25 = [v23 saveToFile:v8 error:&v31];
        id v26 = v31;

        if (v25)
        {
          long long v27 = EDAttachmentsLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            long long v28 = [v8 lastPathComponent];
            *(_DWORD *)location = 138412290;
            *(void *)&location[4] = v28;
            _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "Did add Synapse attributes to '%@'.", location, 0xCu);
          }
        }
        else
        {
          long long v27 = EDAttachmentsLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            [v8 lastPathComponent];
            objc_claimAutoreleasedReturnValue();
            -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:]();
          }
        }

        uint64_t v29 = (void *)MEMORY[0x1E4F60D70];
        uint64_t v30 = [NSNumber numberWithBool:v25];
        long long v16 = [v29 futureWithResult:v30];

        id v15 = v26;
      }
      else
      {
        long long v16 = [MEMORY[0x1E4F60D70] futureWithResult:MEMORY[0x1E4F1CC28]];
      }
    }
  }

LABEL_15:

  return v16;
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2;
    v8[3] = &unk_1E6BFF7F8;
    id v9 = v3;
    id v10 = a1[4];
    id v11 = a1[5];
    id v7 = a1[6];
    __int16 v12 = v5;
    id v13 = v7;
    [v6 performBlock:v8];
  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = EDAttachmentsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 40) lastPathComponent];
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:]();
    }

    [*(id *)(a1 + 48) finishWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    id v3 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (v3)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, *(id *)(a1 + 56));
      uint64_t v4 = *(void *)(a1 + 40);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_113;
      v5[3] = &unk_1E6BFF7D0;
      objc_copyWeak(&v8, location);
      id v6 = *(id *)(a1 + 40);
      id v7 = *(id *)(a1 + 48);
      [v3 saveToFile:v4 completion:v5];

      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }
    else
    {
      [*(id *)(a1 + 48) finishWithResult:MEMORY[0x1E4F1CC28]];
    }
  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_113(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_114;
    v7[3] = &unk_1E6BFF7A8;
    id v8 = v3;
    id v9 = a1[4];
    id v10 = a1[5];
    [v6 performBlock:v7];
  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_114(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = EDAttachmentsLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) lastPathComponent];
      objc_claimAutoreleasedReturnValue();
      __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_114_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 40) lastPathComponent];
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Did add Synapse attributes to '%@'.", (uint8_t *)&v8, 0xCu);
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = [NSNumber numberWithBool:v2 == 0];
  [v6 finishWithResult:v7];
}

- (void)persistenceWillDeleteMessages:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = EDAttachmentsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Hook called persistenceWillDeleteMessages to prepare attachment deletion for messages %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(EDAttachmentPersistenceManager *)self willDeleteAttachmentsForMessages:v4];
}

- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = EDAttachmentsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Hook called persistenceIsDeletingMessages to delete attachments for messages %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(EDAttachmentPersistenceManager *)self isDeletingMessages:v5];
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = EDAttachmentsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Hook called persistenceDidDeleteMessages %{public}@", (uint8_t *)&v6, 0xCu);
  }

  +[EDAttachmentPersistenceManager removeSynapseAttachmentAttributesForMessages:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synapseAttributesScheduler, 0);
  objc_storeStrong((id *)&self->_tempDirectoryForArchiveAttachments, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_attachmentPersistence, 0);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Error persisting attachment %@ to disk attachmentID %lld", v4, v5);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a3 orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Error persisting attachment %@ to disk with existing metadata %{public}@", v4, v5);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a1 orURL:(NSObject *)a2 attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Couldn't get file attributes for attachment URL %@", (uint8_t *)&v2, 0xCu);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a1 orURL:(NSObject *)a2 attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Couldn't read data for attachment URL %@, device may be locked", (uint8_t *)&v2, 0xCu);
}

- (void)_writeAttachment:(uint64_t)a1 toDirectory:(void *)a2 outError:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "No filename set on the file wrapper attachment %{public}@ for write to %{public}@", v4, v5);
}

- (void)_writeAttachment:toDirectory:outError:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Attachment already exists at %{public}@. Overwriting with current attachment %@", v4, v5);
}

- (void)_writeAttachment:toDirectory:outError:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Error figuring out if %{public}@ already exists, %{public}@", v5, v6);
}

- (void)_writeAttachment:toDirectory:outError:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to create attachment directory at %{public}@, %{public}@", v5, v6);
}

- (void)_persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_FAULT, "attachmentMetadata %{public}@ is missing either a mimePartNumber or a remoteURL. Aborting attachment write", v4, 0xCu);
}

- (void)_persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to write archive attachment %@ to %@", v4, v5);
}

- (void)_createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to create temporary file for global ID %llu MIME part [%{public}@].", v4, v5);
}

void __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_9(a1, a2, 3.8521e-34);
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "File writer failed for global ID %llu (%{errno}d). Removing temp files.", v4, 0x12u);
}

- (void)_didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to move attachment to final location (global ID %llu): %{public}@", v4, v5);
}

- (void)_updateAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v2, v3, "Failed to get an attachmentID after inserting to attachments table for global message ID %llu", v4);
}

- (void)_updateAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to update attachmentID %@ for global message ID %llu", v4, v5);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v2, v3, "No SHA-256 digest (global ID %llu).", v4);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.2(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v2, v3, "Failed to insert attachment data (global ID %llu).", v4);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to get size of attachment file (global ID %llu): %{public}@", v4, v5);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v2, v3, "Bad SHA-256 digest length (global ID %llu).", v4);
}

- (void)_writeFileWrapper:toURL:outError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Error occurred attempting to compress file: %{public}@: %{public}@", v5, v6);
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_attachmentURLForAttachmentTableMetadata:basePath:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to create attachment URL for attachment ID %@", v5);
}

- (void)addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to write Synapse attributes to attachment '%@': %@", v4, v5);
}

- (void)addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  _os_log_debug_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEBUG, "Attachment '%@' already has synapse attributes.", v4, 0xCu);
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_114_cold_1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = *v1;
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to write Synapse attributes to attachment '%@': %@", v5, v6);
}

@end