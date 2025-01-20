@interface HDAttachmentManager
- (BOOL)_attachmentReferencesForObjectIdentifier:(uint64_t)a3 schemaIdentifier:(uint64_t)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
- (BOOL)attachmentReferencesForAttachment:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 error:(id *)a5;
- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileData:(id)a5 encrypt:(BOOL)a6 error:(id *)a7;
- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileHandle:(id)a5 encrypt:(BOOL)a6 error:(id *)a7;
- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6;
- (BOOL)removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6;
- (BOOL)removeAttachmentReferences:(id)a3 error:(id *)a4;
- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)replaceReferencesWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6;
- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6;
- (HDAttachmentManager)init;
- (HDAttachmentManager)initWithProfile:(id)a3;
- (NSURL)filesDirectoryURL;
- (NSURL)unconfirmedFilesDirectoryURL;
- (id)_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7;
- (id)addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 error:(id *)a10;
- (id)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7;
- (id)fileHandleForAttachment:(id)a3 error:(id *)a4;
- (id)readerForAttachment:(id)a3 error:(id *)a4;
- (id)schemaProviderClasses;
- (id)schemaProviderForIdentifier:(id)a3 error:(id *)a4;
- (id)unitTestdidCompleteFileCleanup;
- (int64_t)supportedSchemaVersionForReference:(id)a3;
- (uint64_t)_validateAttachment:(void *)a3 toObjectWithIdentifier:(uint64_t)a4 schemaIdentifier:(void *)a5 metadata:(uint64_t)a6 error:;
- (uint64_t)createFileDirectoriesWithError:(void *)a1;
- (void)_cleanupAttachmentsFolder;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)runMaintenanceOperationIfNeeded;
- (void)setUnitTestdidCompleteFileCleanup:(id)a3;
@end

@implementation HDAttachmentManager

- (id)schemaProviderClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (HDAttachmentManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDAttachmentManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDAttachmentManager;
  v5 = [(HDAttachmentManager *)&v19 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    [v4 registerProfileReadyObserver:v6 queue:0];

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    schemaProvidersByIdentifier = v6->_schemaProvidersByIdentifier;
    v6->_schemaProvidersByIdentifier = v8;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = [WeakRetained directoryPath];
    uint64_t v12 = [v11 stringByAppendingPathComponent:@"Files"];
    filesDirectoryPath = v6->_filesDirectoryPath;
    v6->_filesDirectoryPath = (NSString *)v12;

    id v14 = objc_loadWeakRetained((id *)&v6->_profile);
    v15 = [v14 directoryPath];
    uint64_t v16 = [v15 stringByAppendingPathComponent:@"UnconfirmedFiles"];
    unconfirmedFilesDirectoryPath = v6->_unconfirmedFilesDirectoryPath;
    v6->_unconfirmedFilesDirectoryPath = (NSString *)v16;
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDAttachmentManager;
  [(HDAttachmentManager *)&v6 dealloc];
}

- (NSURL)filesDirectoryURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_filesDirectoryPath isDirectory:1];
}

- (NSURL)unconfirmedFilesDirectoryURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_unconfirmedFilesDirectoryPath isDirectory:1];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v5 = [a3 daemon];
  id v4 = [v5 analyticsSubmissionCoordinator];
  [v4 addObserver:self queue:0];
}

- (uint64_t)createFileDirectoriesWithError:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v5 = [a1 filesDirectoryURL];
  id v18 = 0;
  char v6 = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v7 = v18;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = HKLogInfrastructure();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = [a1 filesDirectoryURL];
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Unable to create directory (%@). Error: %{public}@", buf, 0x16u);
    }
    id v11 = v7;
    if (!v11)
    {
      uint64_t v9 = 1;
      goto LABEL_15;
    }
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  v8 = [a1 unconfirmedFilesDirectoryURL];
  id v17 = v7;
  uint64_t v9 = 1;
  char v10 = [v4 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v11 = v17;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v12 = HKLogInfrastructure();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [a1 unconfirmedFilesDirectoryURL];
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Unable to create directory (%@). Error: %{public}@", buf, 0x16u);
    }
    id v11 = v11;
    if (!v11) {
      goto LABEL_15;
    }
    if (!a2)
    {
LABEL_8:
      _HKLogDroppedError();
      uint64_t v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:
    id v11 = v11;
    uint64_t v9 = 0;
    *a2 = v11;
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (uint64_t)_validateAttachment:(void *)a3 toObjectWithIdentifier:(uint64_t)a4 schemaIdentifier:(void *)a5 metadata:(uint64_t)a6 error:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    id v14 = [a1 schemaProviderForIdentifier:a4 error:a6];
    if (v14)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 2);
      uint64_t v16 = [v14 validateAttachment:v11 forObjectWithIdentifier:v12 metadata:v13 profile:WeakRetained error:a6];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__101;
  v40 = __Block_byref_object_dispose__101;
  id v41 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __105__HDAttachmentManager_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_error___block_invoke;
  v33[3] = &unk_1E6301358;
  id v16 = v12;
  id v34 = v16;
  v35 = &v36;
  if (![(HDAttachmentManager *)self attachmentReferencesForObjectIdentifier:v13 schemaIdentifier:v14 error:a7 enumerationHandler:v33])goto LABEL_11; {
  if (v37[5])
  }
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 115, @"The attachment with identifier %@ is already attached to object %@.", v37[5], v13);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v17;
    if (v17)
    {
      if (a7)
      {
        id v18 = v17;
        objc_super v19 = 0;
        *a7 = v18;
      }
      else
      {
        _HKLogDroppedError();
        objc_super v19 = 0;
      }
      id v20 = v18;
    }
    else
    {
      id v20 = 0;
      objc_super v19 = 0;
    }
    goto LABEL_24;
  }
  if ((-[HDAttachmentManager _validateAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:]((id *)&self->super.isa, v16, v13, (uint64_t)v14, v15, (uint64_t)a7) & 1) == 0)
  {
LABEL_11:
    objc_super v19 = 0;
    goto LABEL_25;
  }
  __int16 v21 = [v16 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v32 = 0;
  id v18 = +[HDAttachmentEntity attachmentWithIdentifier:v21 profile:WeakRetained error:&v32];
  id v20 = v32;

  if (!v18)
  {
    if (v20)
    {
      id v23 = v20;
    }
    else
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = [v16 identifier];
      v29 = objc_msgSend(v27, "hk_error:format:", 118, @"The attachment with identifier %@ was not found.", v28);

      id v23 = v29;
      if (!v23)
      {
        id v20 = 0;
        goto LABEL_22;
      }
    }
    if (a7)
    {
      id v23 = v23;
      objc_super v19 = 0;
      *a7 = v23;
    }
    else
    {
      _HKLogDroppedError();
      objc_super v19 = 0;
    }
    id v20 = v23;
    goto LABEL_23;
  }
  id v23 = [(HDAttachmentManager *)self _addReferenceWithAttachment:v18 toObjectWithIdentifier:v13 schemaIdentifier:v14 metadata:v15 error:a7];
  if (!v23)
  {
LABEL_22:
    objc_super v19 = 0;
    goto LABEL_23;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F2AC10]);
  v31 = [v23 identifier];
  v25 = [v23 creationDate];
  v26 = [v23 metadata];
  objc_super v19 = (void *)[v24 _initWithIdentifier:v31 objectIdentifier:v13 attachment:v16 creationDate:v25 metadata:v26];

LABEL_23:
LABEL_24:

LABEL_25:
  _Block_object_dispose(&v36, 8);

  return v19;
}

uint64_t __105__HDAttachmentManager_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 attachmentIdentifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return v5 ^ 1u;
}

- (id)addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 error:(id *)a10
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  memset(&v67, 0, sizeof(v67));
  if (fstat([v18 fileDescriptor], &v67) < 0)
  {
    id v64 = v16;
    v45 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *__error();
    v47 = __error();
    objc_msgSend(v45, "hk_error:format:", 102, @"Cannot determine file size: %d: %s", v46, strerror(*v47));
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    id v49 = v48;
    if (v48)
    {
      if (a10)
      {
        id v49 = v48;
        v44 = 0;
        *a10 = v49;
      }
      else
      {
        _HKLogDroppedError();
        v44 = 0;
      }
      id v24 = v49;
    }
    else
    {
      id v24 = 0;
      v44 = 0;
    }
    goto LABEL_34;
  }
  off_t st_size = v67.st_size;
  id v24 = +[HDEncryptedArchiveSymmetricKey randomKeyWithError:a10];
  if (!v24)
  {
    v44 = 0;
    goto LABEL_35;
  }
  off_t v58 = st_size;
  id v64 = v16;
  id v66 = 0;
  v25 = [(HDAttachmentManager *)self schemaProviderForIdentifier:v20 error:&v66];
  id v62 = v66;
  v63 = v25;
  if (v25)
  {
    v57 = v22;
    id v60 = v21;
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    }
    else {
      id WeakRetained = 0;
    }
    id v65 = 0;
    uint64_t v27 = [v25 schemaVersionForObjectIdentifier:v19 profile:WeakRetained error:&v65];
    v56 = (HDAttachment *)v65;

    id v61 = v17;
    if (v27 > 0)
    {
      uint64_t v53 = v27;
      v54 = v18;
      v28 = [HDAttachment alloc];
      v29 = [MEMORY[0x1E4F29128] UUID];
      [MEMORY[0x1E4F29128] UUID];
      v30 = uint64_t v55 = (uint64_t)v20;
      v31 = [v30 UUIDString];
      [MEMORY[0x1E4F1C9C8] date];
      v33 = id v32 = v19;
      id v34 = [(HDAttachment *)v28 initWithIdentifier:v29 name:v16 type:v17 hash:v31 size:v58 creationDate:v33 metadata:v60 encryptionKey:v24];

      id v20 = (id)v55;
      v35 = [(HDAttachment *)v34 hkAttachment];
      v59 = v32;
      id v22 = v57;
      LODWORD(v32) = -[HDAttachmentManager _validateAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:]((id *)&self->super.isa, v35, v32, v55, v57, (uint64_t)a10);

      if (v32)
      {
        uint64_t v36 = [HDAttachmentReferenceSchemaIdentifier alloc];
        v37 = [(HDAttachment *)v34 identifier];
        uint64_t v38 = [(HDAttachmentReferenceSchemaIdentifier *)v36 initWithSchemaIdentifier:v55 schemaVersion:v53 objectIdentifier:v59 attachmentIdentifier:v37];

        v39 = [HDAttachmentReference alloc];
        v40 = [MEMORY[0x1E4F29128] UUID];
        id v41 = [MEMORY[0x1E4F1C9C8] date];
        v42 = [(HDAttachmentReference *)v39 initWithIdentifier:v40 schemaIdentifier:v38 creationDate:v41 options:0 metadata:v57];

        v68[0] = v42;
        v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
        id v18 = v54;
        LODWORD(v40) = [(HDAttachmentManager *)self insertAttachmentReferences:v43 attachment:v34 fileHandle:v54 encrypt:1 error:a10];

        [v54 closeFile];
        v44 = 0;
        if (v40)
        {
          v44 = [(HDAttachmentReference *)v42 hkAttachmentReferenceWithAttachment:v34];
        }

        id v17 = v61;
        id v19 = v59;
        id v20 = (id)v55;
      }
      else
      {
        v44 = 0;
        id v18 = v54;
        id v19 = v59;
      }
      id v21 = v60;
      v51 = v56;
      goto LABEL_33;
    }
    if (v27 == -1)
    {
      v50 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"The object type is not supported");

      id v22 = v57;
    }
    else
    {
      v50 = v56;
      id v22 = v57;
    }
    id v21 = v60;
    id v34 = v50;
    if (!v34)
    {
      v51 = 0;
      v44 = 0;
LABEL_32:
      id v17 = v61;
      goto LABEL_33;
    }
LABEL_27:
    if (a10)
    {
      id v34 = v34;
      v44 = 0;
      *a10 = v34;
    }
    else
    {
      _HKLogDroppedError();
      v44 = 0;
    }
    v51 = v34;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"No schema provider found for identifier '%@'", v20);
  id v34 = (HDAttachment *)(id)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    id v61 = v17;
    goto LABEL_27;
  }
  v51 = 0;
  v44 = 0;
LABEL_33:

  id v49 = v62;
LABEL_34:

  id v16 = v64;
LABEL_35:

  return v44;
}

- (id)_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(HDAttachmentManager *)self schemaProviderForIdentifier:v14 error:a7];
  if (v16
    && (!self ? (id v17 = 0) : (id v17 = objc_loadWeakRetained((id *)&self->_profile)),
        uint64_t v18 = [v16 schemaVersionForObjectIdentifier:v13 profile:v17 error:a7],
        v17,
        v18 >= 1))
  {
    id v19 = [HDAttachmentReferenceSchemaIdentifier alloc];
    id v20 = [v12 identifier];
    id v21 = [(HDAttachmentReferenceSchemaIdentifier *)v19 initWithSchemaIdentifier:v14 schemaVersion:v18 objectIdentifier:v13 attachmentIdentifier:v20];

    id v22 = [HDAttachmentReference alloc];
    id v23 = [MEMORY[0x1E4F29128] UUID];
    [MEMORY[0x1E4F1C9C8] date];
    id v24 = v31 = v12;
    v25 = [(HDAttachmentReference *)v22 initWithIdentifier:v23 schemaIdentifier:v21 creationDate:v24 options:0 metadata:v15];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    LODWORD(v24) = +[HDAttachmentReferenceEntity insertReference:v25 profile:WeakRetained error:a7];

    BOOL v27 = v24 == 0;
    id v12 = v31;
    if (v27) {
      v28 = 0;
    }
    else {
      v28 = v25;
    }
    v29 = v28;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [[HDInsertAttachmentOperation alloc] initWithAttachmentReferences:v9 attachment:v8 fileOnDisk:0];

  if (self) {
    self = (HDAttachmentManager *)objc_loadWeakRetained((id *)&self->_profile);
  }
  BOOL v11 = [(HDJournalableOperation *)v10 performOrJournalWithProfile:self error:a5];

  return v11;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileHandle:(id)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a3;
  id v15 = [[HDInsertAttachmentOperation alloc] initWithAttachmentReferences:v14 attachment:v12 fileOnDisk:1];

  id v87 = 0;
  LOBYTE(a5) = -[HDAttachmentManager createFileDirectoriesWithError:](self, &v87);
  id v16 = v87;
  id v17 = v16;
  if (a5)
  {
    v85 = v13;
    uint64_t v18 = [(HDAttachmentManager *)self unconfirmedFilesDirectoryURL];
    id v19 = [v12 identifier];
    id v20 = [v19 UUIDString];
    id v21 = [v18 URLByAppendingPathComponent:v20];

    id v22 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v23 = [v21 path];
    id v83 = v22;
    LOBYTE(v22) = [v22 createFileAtPath:v23 contents:0 attributes:0];

    v84 = v15;
    if (v22)
    {
      id v86 = 0;
      id v24 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v21 error:&v86];
      id v82 = v86;
      if (v24)
      {
        uint64_t v25 = [v12 encryptionKey];
        id v26 = (id)v25;
        id v13 = v85;
        v79 = a7;
        if (v8 && v25)
        {
          BOOL v27 = +[HDEncryptedArchive encryptContentsOfFileHandle:v85 to:v24 key:v25 error:a7];
          [v24 closeFile];
          if (!v27) {
            goto LABEL_63;
          }
        }
        else
        {
          v40 = [v21 path];
          id v77 = v12;
          id v41 = v85;
          id v42 = v24;
          id v78 = v40;
          v80 = v41;
          v81 = v42;
          if (self)
          {
            v43 = (uint64_t *)MEMORY[0x1E4F14B00];
            uint64_t v44 = *MEMORY[0x1E4F14B00];
            id v91 = 0;
            v45 = [v41 readDataUpToLength:v44 error:&v91];
            id v46 = v91;
            if (v46)
            {
LABEL_28:
              id v47 = v45;
              v45 = v46;
              [v81 closeFile];
              _HKInitializeLogging();
              id v48 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v95 = self;
                __int16 v96 = 2114;
                id v97 = v78;
                __int16 v98 = 2114;
                v99 = (char *)v45;
                _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file from source for URL %{public}@. %{public}@", buf, 0x20u);
              }
              if (v79)
              {
                BOOL v76 = 0;
                id *v79 = v45;
              }
              else
              {
                _HKLogDroppedError();
                BOOL v76 = 0;
              }
            }
            else
            {
              while (v45 && [v45 length])
              {
                id v49 = v24;
                v50 = v17;
                id v90 = 0;
                char v51 = [v42 writeData:v45 error:&v90];
                id v52 = v90;
                id v47 = v52;
                if ((v51 & 1) == 0)
                {
                  [v81 closeFile];
                  _HKInitializeLogging();
                  v68 = *MEMORY[0x1E4F29F18];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v95 = self;
                    __int16 v96 = 2114;
                    id v97 = v78;
                    __int16 v98 = 2114;
                    v99 = 0;
                    _os_log_error_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to write file to URL %{public}@. %{public}@", buf, 0x20u);
                  }
                  BOOL v76 = 1;
                  id v17 = v50;
                  id v24 = v49;
                  goto LABEL_57;
                }

                uint64_t v53 = *v43;
                id v91 = 0;
                v45 = [v80 readDataUpToLength:v53 error:&v91];
                id v46 = v91;
                id v42 = v81;
                id v17 = v50;
                id v24 = v49;
                if (v46) {
                  goto LABEL_28;
                }
              }
              [v42 closeFile];

              uint64_t v54 = *MEMORY[0x1E4F28348];
              uint64_t v55 = *MEMORY[0x1E4F28330];
              v92[0] = *MEMORY[0x1E4F28370];
              v92[1] = v55;
              v93[0] = v54;
              v93[1] = &unk_1F17ED320;
              v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
              id v47 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
              id v89 = 0;
              char v56 = [v47 setAttributes:v45 ofItemAtPath:v78 error:&v89];
              v57 = (char *)v89;
              if (v56)
              {
                BOOL v76 = 1;
              }
              else
              {
                v75 = v57;
                _HKInitializeLogging();
                id v62 = *MEMORY[0x1E4F29F18];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v95 = self;
                  __int16 v96 = 2114;
                  id v97 = v78;
                  __int16 v98 = 2114;
                  v99 = v75;
                  _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set protection class for %{public}@. Reverting storage. %{public}@", buf, 0x20u);
                }
                id v88 = 0;
                char v63 = [v47 removeItemAtPath:v78 error:&v88];
                id v64 = (char *)v88;
                if ((v63 & 1) == 0)
                {
                  _HKInitializeLogging();
                  id v65 = *MEMORY[0x1E4F29F18];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v95 = self;
                    __int16 v96 = 2114;
                    id v97 = v78;
                    __int16 v98 = 2114;
                    v99 = v64;
                    _os_log_error_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);
                  }
                }
                id v66 = v75;
                BOOL v76 = v66 == 0;
                if (v66)
                {
                  if (v79)
                  {
                    v74 = v64;
                    stat v67 = v66;
                    id *v79 = v66;
                    id v66 = v67;
                    id v64 = v74;
                  }
                  else
                  {
                    v71 = v66;
                    _HKLogDroppedError();
                    id v66 = v71;
                  }
                }

                v57 = v75;
              }
            }
LABEL_57:
          }
          else
          {
            BOOL v76 = 0;
          }

          id v13 = v85;
          if (!v76)
          {
            id v24 = v81;
LABEL_63:
            char v29 = 0;
LABEL_64:
            v35 = v82;
            v37 = v83;
            goto LABEL_65;
          }
        }
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        }
        else {
          id WeakRetained = 0;
        }
        char v29 = [(HDJournalableOperation *)v84 performOrJournalWithProfile:WeakRetained error:v79];

        goto LABEL_64;
      }
      _HKInitializeLogging();
      uint64_t v38 = (void *)*MEMORY[0x1E4F29F18];
      id v13 = v85;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v69 = v38;
        v70 = [v21 path];
        *(_DWORD *)buf = 138543874;
        v95 = self;
        __int16 v96 = 2114;
        id v97 = v70;
        __int16 v98 = 2114;
        v99 = (char *)v82;
        _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create a file handle for URL %{public}@. %{public}@", buf, 0x20u);
      }
      id v39 = v82;
      id v26 = v39;
      if (v39)
      {
        v37 = v83;
        if (a7)
        {
          id v26 = v39;
          id v24 = 0;
          char v29 = 0;
          *a7 = v26;
        }
        else
        {
          _HKLogDroppedError();
          id v24 = 0;
          char v29 = 0;
        }
        v35 = v26;
        goto LABEL_65;
      }
      id v24 = 0;
      v35 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        off_t v58 = v30;
        v59 = [v21 path];
        id v60 = __error();
        id v61 = strerror(*v60);
        *(_DWORD *)buf = 138543874;
        v95 = self;
        __int16 v96 = 2114;
        id v97 = v59;
        __int16 v98 = 2080;
        v99 = v61;
        _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create file %{public}@ error: %s.", buf, 0x20u);
      }
      id v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *__error();
      v33 = __error();
      id v34 = strerror(*v33);
      v35 = [v21 path];
      objc_msgSend(v31, "hk_error:format:", 102, @"Error %d, %s while creating file at %@ ", v32, v34, v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v36;
      id v13 = v85;
      if (v36)
      {
        v37 = v83;
        if (a7)
        {
          id v26 = v36;
          char v29 = 0;
          *a7 = v26;
        }
        else
        {
          _HKLogDroppedError();
          char v29 = 0;
        }
        id v24 = v26;
        goto LABEL_65;
      }
      id v24 = 0;
    }
    char v29 = 1;
    v37 = v83;
LABEL_65:

    id v15 = v84;
    goto LABEL_66;
  }
  id v28 = v16;
  id v21 = v28;
  if (v28)
  {
    if (a7)
    {
      id v21 = v28;
      char v29 = 0;
      *a7 = v21;
    }
    else
    {
      _HKLogDroppedError();
      char v29 = 0;
    }
  }
  else
  {
    char v29 = 1;
  }
LABEL_66:

  return v29;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileData:(id)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a3;
  id v15 = [[HDInsertAttachmentOperation alloc] initWithAttachmentReferences:v14 attachment:v12 fileOnDisk:1];

  id v91 = 0;
  char v16 = -[HDAttachmentManager createFileDirectoriesWithError:](self, &v91);
  id v17 = v91;
  uint64_t v18 = v17;
  if (v16)
  {
    v84 = v15;
    id v85 = v13;
    id v19 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v20 = [(HDAttachmentManager *)self unconfirmedFilesDirectoryURL];
    id v21 = [v12 identifier];
    id v22 = [v21 UUIDString];
    id v23 = [(id)v20 URLByAppendingPathComponent:v22];

    id v24 = [v23 path];
    LOBYTE(v20) = [v19 createFileAtPath:v24 contents:0 attributes:0];

    if ((v20 & 1) == 0)
    {
      id v36 = v12;
      v37 = v18;
      uint64_t v38 = a7;
      _HKInitializeLogging();
      id v39 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v61 = v39;
        id v62 = [v23 path];
        *(_DWORD *)buf = 138543618;
        v95 = self;
        __int16 v96 = 2114;
        *(void *)id v97 = v62;
        _os_log_error_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create file %{public}@.", buf, 0x16u);
      }
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = [v23 path];
      objc_msgSend(v40, "hk_error:format:", 102, @"Error creating file at %@", v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v85;
      if (v42)
      {
        id v15 = v84;
        if (v38)
        {
          id v42 = v42;
          BOOL v34 = 0;
          *uint64_t v38 = v42;
          v43 = (void *)v41;
          uint64_t v18 = v37;
          id v12 = v36;
          uint64_t v25 = v42;
        }
        else
        {
          id v56 = v42;
          _HKLogDroppedError();
          id v42 = v56;
          BOOL v34 = 0;
          v57 = v56;
          v43 = (void *)v41;
          uint64_t v18 = v37;
          id v12 = v36;
          uint64_t v25 = v57;
        }
      }
      else
      {
        BOOL v34 = 0;
        id v15 = v84;
        v43 = (void *)v41;
        uint64_t v18 = v37;
        id v12 = v36;
        uint64_t v25 = 0;
      }
      goto LABEL_59;
    }
    id v90 = 0;
    uint64_t v25 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingURL:v23 error:&v90];
    id v83 = v90;
    if (!v25)
    {
      _HKInitializeLogging();
      uint64_t v44 = (os_log_t *)MEMORY[0x1E4F29F18];
      v45 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v68 = v45;
        v69 = [v23 path];
        *(_DWORD *)buf = 138543874;
        v95 = self;
        __int16 v96 = 2114;
        *(void *)id v97 = v69;
        *(_WORD *)&v97[8] = 2114;
        *(void *)&v97[10] = v83;
        _os_log_error_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to retreive fileHandle for %{public}@. Reverting attachment and reference storage. %{public}@", buf, 0x20u);
      }
      id v46 = [v23 path];
      id v89 = 0;
      char v47 = [v19 removeItemAtPath:v46 error:&v89];
      id v82 = v89;

      if ((v47 & 1) == 0)
      {
        _HKInitializeLogging();
        os_log_t v48 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
        {
          v73 = v48;
          v74 = [v23 path];
          *(_DWORD *)buf = 138543874;
          v95 = self;
          __int16 v96 = 2114;
          *(void *)id v97 = v74;
          *(_WORD *)&v97[8] = 2114;
          *(void *)&v97[10] = v82;
          _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);
        }
      }
      v43 = v83;
      id v49 = v83;
      if (v49)
      {
        id v15 = v84;
        id v13 = v85;
        if (a7)
        {
          id v49 = v49;
          BOOL v34 = 0;
          *a7 = v49;
        }
        else
        {
          id v59 = v49;
          _HKLogDroppedError();
          id v49 = v59;
          BOOL v34 = 0;
        }
      }
      else
      {
        BOOL v34 = 0;
        id v15 = v84;
        id v13 = v85;
      }
      goto LABEL_58;
    }
    v79 = v25;
    if (fcntl([v25 fileDescriptor], 48, 1))
    {
      _HKInitializeLogging();
      id v26 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        char v63 = v26;
        id v64 = [v23 path];
        int v65 = *__error();
        id v66 = __error();
        stat v67 = strerror(*v66);
        *(_DWORD *)buf = 138543874;
        v95 = v64;
        __int16 v96 = 1024;
        *(_DWORD *)id v97 = v65;
        *(_WORD *)&v97[4] = 2082;
        *(void *)&v97[6] = v67;
        _os_log_error_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_ERROR, "Error setting F_NOCACHE on file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);
      }
    }
    uint64_t v27 = *MEMORY[0x1E4F28348];
    uint64_t v28 = *MEMORY[0x1E4F28330];
    v92[0] = *MEMORY[0x1E4F28370];
    v92[1] = v28;
    v93[0] = v27;
    v93[1] = &unk_1F17ED320;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
    v30 = [v23 path];
    id v88 = 0;
    id v82 = (id)v29;
    LOBYTE(v29) = [v19 setAttributes:v29 ofItemAtPath:v30 error:&v88];
    id v81 = v88;

    if (v29)
    {
      uint64_t v31 = [v12 encryptionKey];
      id v80 = (id)v31;
      if (v8 && v31)
      {
        uint64_t v25 = v79;
        id WeakRetained = +[HDEncryptedArchive archiveForEncryptionWithFileHandle:v79 key:v31 error:a7];
        [v79 closeFile];
        id v13 = v85;
        if (!WeakRetained
          || (char v33 = [WeakRetained writeData:v85 error:a7],
              [WeakRetained close],
              (v33 & 1) == 0))
        {
          BOOL v34 = 0;
          id v15 = v84;
LABEL_57:

          v43 = v83;
          id v49 = v81;
LABEL_58:

          id v42 = v82;
LABEL_59:

          goto LABEL_60;
        }
LABEL_42:

        id v15 = v84;
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        }
        else {
          id WeakRetained = 0;
        }
        BOOL v34 = [(HDJournalableOperation *)v84 performOrJournalWithProfile:WeakRetained error:a7];
        goto LABEL_57;
      }
      id v86 = 0;
      uint64_t v25 = v79;
      id v13 = v85;
      char v58 = [v79 writeData:v85 error:&v86];
      id WeakRetained = v86;
      [v79 closeFile];
      if (v58) {
        goto LABEL_42;
      }
      _HKInitializeLogging();
      id v60 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v77 = v60;
        id v78 = [v23 path];
        *(_DWORD *)buf = 138543874;
        v95 = self;
        __int16 v96 = 2114;
        *(void *)id v97 = v78;
        *(_WORD *)&v97[8] = 2114;
        *(void *)&v97[10] = WeakRetained;
        _os_log_error_impl(&dword_1BCB7D000, v77, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to write data to file at %{public}@, %{public}@", buf, 0x20u);

        id v13 = v85;
      }
      id WeakRetained = WeakRetained;
      id v15 = v84;
      if (WeakRetained)
      {
        if (a7) {
          *a7 = WeakRetained;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v50 = (os_log_t *)MEMORY[0x1E4F29F18];
      char v51 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v70 = v51;
        v71 = [v23 path];
        *(_DWORD *)buf = 138543874;
        v95 = self;
        __int16 v96 = 2114;
        *(void *)id v97 = v71;
        *(_WORD *)&v97[8] = 2114;
        *(void *)&v97[10] = v81;
        _os_log_error_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set protection class for %{public}@. Reverting storage. %{public}@", buf, 0x20u);
      }
      id v52 = [v23 path];
      id v87 = 0;
      char v53 = [v19 removeItemAtPath:v52 error:&v87];
      id v80 = v87;

      if ((v53 & 1) == 0)
      {
        _HKInitializeLogging();
        os_log_t v54 = *v50;
        if (os_log_type_enabled(*v50, OS_LOG_TYPE_ERROR))
        {
          v75 = v54;
          BOOL v76 = [v23 path];
          *(_DWORD *)buf = 138543874;
          v95 = self;
          __int16 v96 = 2114;
          *(void *)id v97 = v76;
          *(_WORD *)&v97[8] = 2114;
          *(void *)&v97[10] = v80;
          _os_log_error_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);
        }
      }
      id v55 = v81;
      id WeakRetained = v55;
      uint64_t v25 = v79;
      if (!v55)
      {
        BOOL v34 = 0;
        id v15 = v84;
        id v13 = v85;
        goto LABEL_57;
      }
      id v15 = v84;
      id v13 = v85;
      if (a7)
      {
        id WeakRetained = v55;
        BOOL v34 = 0;
        *a7 = WeakRetained;
        goto LABEL_57;
      }
      _HKLogDroppedError();
    }
    BOOL v34 = 0;
    goto LABEL_57;
  }
  id v35 = v17;
  id v19 = v35;
  if (!v35) {
    goto LABEL_22;
  }
  if (!a7)
  {
    _HKLogDroppedError();
LABEL_22:
    BOOL v34 = 0;
    goto LABEL_60;
  }
  id v19 = v35;
  BOOL v34 = 0;
  *a7 = v19;
LABEL_60:

  return v34;
}

- (BOOL)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__HDAttachmentManager_attachmentReferencesForObjectIdentifier_schemaIdentifier_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E62F8280;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a5 block:v19];

  return (char)a5;
}

BOOL __105__HDAttachmentManager_attachmentReferencesForObjectIdentifier_schemaIdentifier_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDAttachmentManager _attachmentReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), a2, a3, *(void **)(a1 + 56));
}

- (BOOL)_attachmentReferencesForObjectIdentifier:(uint64_t)a3 schemaIdentifier:(uint64_t)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v11 = a6;
  id v12 = v11;
  if (a1)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __118__HDAttachmentManager__attachmentReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke;
    v15[3] = &unk_1E6301470;
    v15[4] = a1;
    id v16 = v11;
    BOOL v13 = +[HDAttachmentReferenceEntity enumerateReferencesForObjectIdentifier:a2 schemaIdentifier:a3 transaction:a4 error:a5 enumerationHandler:v15];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)attachmentReferencesForAttachment:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HDAttachmentManager_attachmentReferencesForAttachment_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E62F8050;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a4 block:v15];

  return (char)a4;
}

BOOL __82__HDAttachmentManager_attachmentReferencesForAttachment_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 identifier];
  id v8 = HDAttachmentReferencePredicateForAttachmentIdentifier((uint64_t)v7);
  BOOL v9 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:v8 transaction:v6 error:a3 enumerationHandler:*(void *)(a1 + 40)];

  return v9;
}

- (id)fileHandleForAttachment:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HDAttachmentManager *)self filesDirectoryURL];
  id v8 = [v6 identifier];
  BOOL v9 = [v8 UUIDString];
  id v10 = [v7 URLByAppendingPathComponent:v9];

  id v36 = 0;
  id v11 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v10 error:&v36];
  id v12 = v36;
  id v13 = v12;
  if (v11)
  {
    id v14 = v11;
  }
  else if (objc_msgSend(v12, "hk_isCocoaNoSuchFileError"))
  {
    BOOL v34 = a4;
    id v15 = [(HDAttachmentManager *)self unconfirmedFilesDirectoryURL];
    id v16 = [v6 identifier];
    id v17 = [v16 UUIDString];
    uint64_t v18 = [v15 URLByAppendingPathComponent:v17];

    id v35 = 0;
    id v14 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v18 error:&v35];
    id v19 = v35;
    if (v14)
    {
      id v20 = v14;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v25 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        log = v25;
        uint64_t v32 = [v18 path];
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = self;
        __int16 v39 = 2114;
        v40 = v32;
        __int16 v41 = 2114;
        id v42 = v19;
        _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: File not found at %{public}@, %{public}@", buf, 0x20u);
      }
      id v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = [v18 path];
      objc_msgSend(v26, "hk_error:format:", 102, @"File not found at %@, %@", v27, v19);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        if (v34) {
          *BOOL v34 = v28;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v21 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v30 = v21;
      uint64_t v31 = [v10 path];
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = self;
      __int16 v39 = 2114;
      v40 = v31;
      __int16 v41 = 2114;
      id v42 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: File not found at %{public}@, %{public}@", buf, 0x20u);
    }
    id v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = [v10 path];
    objc_msgSend(v22, "hk_error:format:", 102, @"File not found at %@, %@", v23, v13);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v14 = 0;
  }

  return v14;
}

- (id)readerForAttachment:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDAttachmentManager *)self fileHandleForAttachment:v6 error:a4];
  if (v7)
  {
    id v8 = [v6 encryptionKey];

    if (v8)
    {
      BOOL v9 = [v6 encryptionKey];
      id v10 = +[HDEncryptedArchive archiveForDecryptionWithFileHandle:v7 key:v9 error:a4];

      [v7 closeFile];
      if (v10) {
        id v11 = [[HDAttachmentEncryptedReader alloc] initAdoptingArchive:v10];
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = [[HDAttachmentFileHandleReader alloc] initAdoptingFileHandle:v7];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)replaceReferencesWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[HDReplaceObjectIdentifierOperation alloc] initWithWithObjectIdentifier:v12 replacementIdentifier:v11 schemaIdentifier:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a6) = [(HDJournalableOperation *)v13 performOrJournalWithProfile:WeakRetained error:a6];

  return (char)a6;
}

- (BOOL)removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke;
  v19[3] = &unk_1E62FB0D0;
  v19[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a6 block:v19 inaccessibilityHandler:0];

  return (char)a6;
}

uint64_t __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke_2;
  id v21 = &unk_1E6301380;
  uint64_t v8 = *(void *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v9 = v5;
  id v23 = v9;
  if (![v6 attachmentReferencesForObjectIdentifier:v7 schemaIdentifier:v8 error:a3 enumerationHandler:&v18])
  {
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  if (![v9 count])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 11, @"No references found for attachment: %@ and object: %@", *(void *)(a1 + 56), *(void *)(a1 + 40), v18, v19, v20, v21, v22);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_12;
  }
  if ([v9 count] != 1)
  {
    _HKInitializeLogging();
    id v10 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = v10;
      uint64_t v17 = [v9 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      uint64_t v27 = v15;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "Expected only a single reference for attachment: %{public}@ and object: %{public}@, found %lu", buf, 0x20u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) removeAttachmentReferences:v9 error:a3];
LABEL_13:

  return v11;
}

uint64_t __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attachmentIdentifier];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return 1;
}

- (BOOL)removeAttachmentReferences:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [[HDDeleteAttachmentReferenceOperation alloc] initWithReferences:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = [(HDJournalableOperation *)v7 performOrJournalWithProfile:WeakRetained error:a4];

  return (char)a4;
}

- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_error___block_invoke;
  v15[3] = &unk_1E62F5A88;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

uint64_t __93__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeAttachmentReferencesWithObjectIdentifier:*(void *)(a1 + 40) schemaIdentifier:*(void *)(a1 + 48) transaction:a2 error:a3];
}

- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__101;
  id v23 = __Block_byref_object_dispose__101;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_transaction_error___block_invoke;
  v18[3] = &unk_1E63013A8;
  v18[4] = &v19;
  if (-[HDAttachmentManager _attachmentReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:]((uint64_t)self, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)a6, v18))
  {
    id v13 = [HDDeleteAttachmentReferenceOperation alloc];
    uint64_t v14 = [(HDDeleteAttachmentReferenceOperation *)v13 initWithReferences:v20[5]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v16 = [(HDDeleteAttachmentReferenceOperation *)v14 performWithProfile:WeakRetained transaction:v12 error:a6];
  }
  else
  {
    BOOL v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __105__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HDAttachmentManager *)self schemaProviderForIdentifier:a4 error:a6];
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    char v14 = [v12 readAuthorizationForObjectIdentifier:v10 client:v11 profile:WeakRetained error:a6];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HDAttachmentManager *)self schemaProviderForIdentifier:a4 error:a6];
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    char v14 = [v12 writeAuthorizationForObjectIdentifier:v10 client:v11 profile:WeakRetained error:a6];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v26 = WeakRetained;
    id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = [v9 startOfDayForDate:v10];

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v66 = 0;
    stat v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v62 = 0;
    char v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    id v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    uint64_t v54 = 0;
    id v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    uint64_t v50 = 0;
    char v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    uint64_t v46 = 0;
    char v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    id v12 = [v26 database];
    id v41 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
    v29[3] = &unk_1E6301448;
    uint64_t v31 = &v78;
    uint64_t v32 = &v66;
    id v13 = v11;
    id v30 = v13;
    char v33 = &v50;
    BOOL v34 = &v62;
    id v35 = &v42;
    id v36 = &v74;
    v37 = &v54;
    uint64_t v38 = &v58;
    __int16 v39 = &v70;
    v40 = &v46;
    BOOL v14 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v12 error:&v41 block:v29];
    id v15 = v41;

    if (v14)
    {
      BOOL v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      unconfirmedFilesDirectoryPath = self->_unconfirmedFilesDirectoryPath;
      id v28 = 0;
      uint64_t v18 = [v16 contentsOfDirectoryAtPath:unconfirmedFilesDirectoryPath error:&v28];
      id v19 = v28;

      if (v19)
      {
        _HKInitializeLogging();
        id v20 = HKLogAnalytics();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v83 = self;
          __int16 v84 = 2114;
          id v85 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read directory contents at %{public}@", buf, 0x16u);
        }

        (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
      }
      else
      {
        uint64_t v22 = [v18 count];
        id v23 = objc_alloc_init(HDAttachmentAnalytics);
        [(HDAttachmentAnalytics *)v23 setNumberOfAttachments:v79[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfReferences:v75[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfTombstones:v71[3]];
        [(HDAttachmentAnalytics *)v23 setTotalSizeOfFiles:v67[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfUnconfirmedFiles:v22];
        [(HDAttachmentAnalytics *)v23 setNumberOfOrphanedAttachments:v63[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfOrphanedReferences:v59[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfReferencesCreatedLast24Hours:v55[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfAttachmentsCreatedLast24Hours:v51[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfTombstonesCreatedLast24Hours:v47[3]];
        [(HDAttachmentAnalytics *)v23 setNumberOfAttachmentsWithMultipleReferences:v43[3]];
        id v24 = [v26 daemon];
        uint64_t v25 = [v24 analyticsSubmissionCoordinator];
        objc_msgSend(v25, "attachments_reportDailyAnalytics:", v23);

        (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v21 = HKLogAnalytics();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v83 = self;
        __int16 v84 = 2114;
        id v85 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read directory contents at %{public}@", buf, 0x16u);
      }

      (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);

    id v8 = v26;
  }
  else
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
  v29[3] = &unk_1E63013F8;
  long long v32 = *(_OWORD *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v30 = v6;
  uint64_t v33 = v7;
  id v8 = v5;
  id v31 = v8;
  long long v34 = *(_OWORD *)(a1 + 64);
  BOOL v9 = +[HDAttachmentEntity enumerateAttachmentsWithPredicate:0 transaction:v8 error:&v35 enumerationHandler:v29];
  id v10 = v35;
  id v11 = v10;
  if (v9)
  {
    id v28 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_4;
    v21[3] = &unk_1E6301420;
    uint64_t v24 = *(void *)(a1 + 80);
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 88);
    id v22 = v12;
    uint64_t v25 = v13;
    id v23 = v8;
    long long v26 = *(_OWORD *)(a1 + 96);
    uint64_t v27 = *(void *)(a1 + 112);
    BOOL v14 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:0 transaction:v23 error:&v28 enumerationHandler:v21];
    id v15 = v28;
    id v16 = v15;
    if (v14)
    {
      BOOL v17 = 1;
    }
    else
    {
      id v19 = v15;
      BOOL v17 = v19 == 0;
      if (v19)
      {
        if (a3) {
          *a3 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    id v18 = v10;
    id v16 = v18;
    if (v18)
    {
      if (a3)
      {
        id v16 = v18;
        BOOL v17 = 0;
        *a3 = v16;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
  }

  return v17;
}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  *(void *)(*(void *)(a1[7] + 8) + 24) += [v5 size];
  id v6 = [v5 creationDate];
  int v7 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", a1[4]);

  if (v7) {
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v8 = [v5 identifier];
  BOOL v9 = HDAttachmentReferencePredicateForAttachmentIdentifier((uint64_t)v8);
  uint64_t v10 = a1[5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_3;
  v19[3] = &unk_1E63013D0;
  v19[4] = &v21;
  id v20 = 0;
  BOOL v11 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:v9 transaction:v10 error:&v20 enumerationHandler:v19];
  id v12 = v20;

  if (v11)
  {
    uint64_t v13 = v22;
    uint64_t v14 = v22[3];
    if (!v14)
    {
      ++*(void *)(*(void *)(a1[9] + 8) + 24);
      uint64_t v14 = v13[3];
    }
    if (v14 >= 2) {
      ++*(void *)(*(void *)(a1[10] + 8) + 24);
    }
    BOOL v15 = 1;
  }
  else
  {
    id v16 = v12;
    BOOL v17 = v16;
    BOOL v15 = v16 == 0;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v21, 8);

  return v15;
}

uint64_t __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_3(uint64_t a1)
{
  return 1;
}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([v5 type])
  {
LABEL_8:
    if ([v5 type] == 1)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      BOOL v15 = [v5 creationDate];
      int v16 = objc_msgSend(v15, "hk_isAfterOrEqualToDate:", *(void *)(a1 + 32));

      if (v16) {
        ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      }
    }
    BOOL v17 = 1;
    goto LABEL_12;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v6 = [v5 creationDate];
  int v7 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", *(void *)(a1 + 32));

  if (v7) {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  BOOL v9 = [v5 objectIdentifier];
  uint64_t v10 = (void *)[v8 initWithUUIDString:v9];

  if (v10)
  {
    BOOL v11 = [*(id *)(a1 + 40) protectedDatabase];
    id v12 = HDDataEntityPredicateForDataUUID();
    id v22 = 0;
    uint64_t v13 = +[HDDataEntity anyInDatabase:v11 predicate:v12 error:&v22];
    id v14 = v22;

    if (!v13) {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }

    goto LABEL_8;
  }
  id v19 = (void *)MEMORY[0x1E4F28C58];
  id v20 = [v5 objectIdentifier];
  objc_msgSend(v19, "hk_error:format:", 3, @"reference objectIdentifier '%@' is not a UUID string", v20);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v17 = v21 == 0;
  if (v21)
  {
    if (a3) {
      *a3 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_12:
  return v17;
}

- (id)schemaProviderForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [(NSMutableDictionary *)self->_schemaProvidersByIdentifier objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v19 = a4;
    os_unfair_lock_t lock = &self->_lock;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v9 = [(HDAttachmentManager *)self schemaProviderClasses];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v21 = self;
      id v8 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v14 conformsToProtocol:&unk_1F1800A40])
          {
            BOOL v15 = [v14 schemaIdentifier];
            int v16 = [v15 isEqualToString:v6];

            if (v16)
            {
              id v17 = objc_alloc_init((Class)v14);

              [(NSMutableDictionary *)v21->_schemaProvidersByIdentifier setObject:v17 forKeyedSubscript:v6];
              id v8 = v17;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    else
    {
      id v8 = 0;
    }

    os_unfair_lock_unlock(lock);
    if (!v8) {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v19, 100, @"No schema provider found for identifier '%@'", v6);
    }
  }

  return v8;
}

- (int64_t)supportedSchemaVersionForReference:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 schemaIdentifier];
  id v22 = 0;
  id v6 = [(HDAttachmentManager *)self schemaProviderForIdentifier:v5 error:&v22];
  id v7 = v22;

  if (v6)
  {
    id v8 = [v4 objectIdentifier];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    }
    else {
      id WeakRetained = 0;
    }
    id v21 = 0;
    int64_t v10 = [v6 schemaVersionForObjectIdentifier:v8 profile:WeakRetained error:&v21];
    id v11 = v21;

    if (!v10)
    {
      _HKInitializeLogging();
      uint64_t v12 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v18 = v12;
        id v19 = [v4 schemaIdentifier];
        id v20 = [v4 identifier];
        *(_DWORD *)buf = 138544130;
        long long v24 = self;
        __int16 v25 = 2114;
        long long v26 = v19;
        __int16 v27 = 2114;
        id v28 = v20;
        __int16 v29 = 2114;
        id v30 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get schema version for schema identifier %{public}@ for reference %{public}@, error: %{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = v13;
      int v16 = [v4 schemaIdentifier];
      id v17 = [v4 identifier];
      *(_DWORD *)buf = 138544130;
      long long v24 = self;
      __int16 v25 = 2114;
      long long v26 = v16;
      __int16 v27 = 2114;
      id v28 = v17;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find attachment schema provider %{public}@ for reference %{public}@: %{public}@", buf, 0x2Au);
    }
    int64_t v10 = -1;
  }

  return v10;
}

uint64_t __118__HDAttachmentManager__attachmentReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 attachmentIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v15 = 0;
  id v8 = +[HDAttachmentEntity attachmentWithIdentifier:v6 profile:WeakRetained error:&v15];
  id v9 = v15;

  if (!v8)
  {
    if (v9)
    {
      id v9 = v9;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = [v5 attachmentIdentifier];
      uint64_t v13 = objc_msgSend(v11, "hk_error:format:", 118, @"The attachment with identifier %@ was not found.", v12);

      id v9 = v13;
      if (!v9)
      {
LABEL_10:
        uint64_t v10 = 0;
        goto LABEL_11;
      }
    }
    if (a3) {
      *a3 = v9;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_10;
  }
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:

  return v10;
}

- (void)runMaintenanceOperationIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [HDKeyValueDomain alloc];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [(HDKeyValueDomain *)v3 initWithCategory:0 domainName:@"attachment-manager" profile:WeakRetained];

  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  id v21 = 0;
  id v8 = [(HDKeyValueDomain *)v6 dateForKey:@"file-cleanup" error:&v21];
  id v9 = v21;
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    if (!v8 || objc_msgSend(v7, "hk_isAfterDate:", v8))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__HDAttachmentManager_runMaintenanceOperationIfNeeded__block_invoke;
      v20[3] = &unk_1E62F3208;
      v20[4] = self;
      id v14 = +[HDMaintenanceOperation maintenanceOperationWithName:v13 queue:0 synchronousBlock:v20];

      id v15 = objc_loadWeakRetained((id *)p_profile);
      int v16 = [v15 daemon];
      id v17 = [v16 maintenanceWorkCoordinator];
      [v17 enqueueMaintenanceOperation:v14];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      long long v23 = self;
      __int16 v24 = 2114;
      __int16 v25 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup attachment cleanup date with error %{public}@", buf, 0x16u);
    }
  }
}

void __54__HDAttachmentManager_runMaintenanceOperationIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupAttachmentsFolder];
  v2 = [*(id *)(a1 + 32) unitTestdidCompleteFileCleanup];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)_cleanupAttachmentsFolder
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = (os_log_t *)MEMORY[0x1E4F29F18];
  id v4 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cleaning up attachments folder", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  v18[4] = self;
  id v19 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__HDAttachmentManager__cleanupAttachmentsFolder__block_invoke;
  v18[3] = &unk_1E62F6130;
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v19 block:v18];
  id v8 = v19;

  if (v7)
  {
    id v9 = [HDKeyValueDomain alloc];
    id v10 = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v11 = [(HDKeyValueDomain *)v9 initWithCategory:0 domainName:@"attachment-manager" profile:v10];

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    id v17 = 0;
    BOOL v13 = [(HDKeyValueDomain *)v11 setDate:v12 forKey:@"file-cleanup" error:&v17];
    id v14 = v17;

    if (!v13)
    {
      _HKInitializeLogging();
      id v15 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = self;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set cleanup date %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    int v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Cleanup failed with error %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __48__HDAttachmentManager__cleanupAttachmentsFolder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v6 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v7 = a2;
  id v8 = objc_alloc_init(v6);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__HDAttachmentManager__moveFilesWithAttachmentsToConfirmedDirectory_errorOut___block_invoke;
  v25[3] = &unk_1E6301498;
  v25[4] = v3;
  id v26 = v8;
  id v9 = v8;
  LODWORD(v6) = +[HDAttachmentEntity enumerateAttachmentsWithPredicate:0 transaction:v7 error:a3 enumerationHandler:v25];

  if (!v6) {
    return 0;
  }
  id v10 = *(void **)(a1 + 32);
  if (!v10) {
    return 0;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v12 = [v10 unconfirmedFilesDirectoryURL];
  BOOL v13 = [v11 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:4 error:a3];

  if (v13)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (!objc_msgSend(v11, "removeItemAtURL:error:", *(void *)(*((void *)&v21 + 1) + 8 * v18), a3, (void)v21))
          {
            uint64_t v19 = 0;
            goto LABEL_16;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    uint64_t v19 = 1;
LABEL_16:
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

BOOL __78__HDAttachmentManager__moveFilesWithAttachmentsToConfirmedDirectory_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) unconfirmedFilesDirectoryURL];
  id v7 = [v5 identifier];
  id v8 = [v7 UUIDString];
  id v9 = [v6 URLByAppendingPathComponent:v8];

  id v10 = *(void **)(a1 + 40);
  id v11 = [v9 path];
  LODWORD(v10) = [v10 fileExistsAtPath:v11];

  if (v10)
  {
    uint64_t v12 = [*(id *)(a1 + 32) filesDirectoryURL];
    uint64_t v13 = [v5 identifier];
    id v14 = [(id)v13 UUIDString];
    uint64_t v15 = [v12 URLByAppendingPathComponent:v14];

    uint64_t v16 = *(void **)(a1 + 40);
    id v26 = 0;
    LOBYTE(v13) = [v16 moveItemAtURL:v9 toURL:v15 error:&v26];
    id v17 = v26;
    if (v13)
    {
      BOOL v18 = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v19 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        long long v23 = v19;
        long long v24 = [v15 path];
        __int16 v25 = [v9 path];
        *(_DWORD *)buf = 138544130;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        id v30 = v24;
        __int16 v31 = 2114;
        long long v32 = v25;
        __int16 v33 = 2114;
        id v34 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory with error %{public}@", buf, 0x2Au);
      }
      id v20 = v17;
      BOOL v18 = v20 == 0;
      if (v20)
      {
        if (a3) {
          *a3 = v20;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (id)unitTestdidCompleteFileCleanup
{
  return self->_unitTestdidCompleteFileCleanup;
}

- (void)setUnitTestdidCompleteFileCleanup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTestdidCompleteFileCleanup, 0);
  objc_storeStrong((id *)&self->_unconfirmedFilesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_filesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_schemaProvidersByIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end