@interface HDInsertAttachmentOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertAttachmentOperation)initWithAttachmentReferences:(id)a3 attachment:(id)a4 fileOnDisk:(BOOL)a5;
- (HDInsertAttachmentOperation)initWithCoder:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertAttachmentOperation

- (HDInsertAttachmentOperation)initWithAttachmentReferences:(id)a3 attachment:(id)a4 fileOnDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDInsertAttachmentOperation;
  v10 = [(HDInsertAttachmentOperation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    attachment = v10->_attachment;
    v10->_attachment = (HDAttachment *)v11;

    uint64_t v13 = [v8 copy];
    attachmentReferences = v10->_attachmentReferences;
    v10->_attachmentReferences = (NSArray *)v13;

    v10->_fileOnDisk = a5;
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  uint64_t v11 = [v9 attachmentManager];
  v12 = [v11 unconfirmedFilesDirectoryURL];
  uint64_t v13 = [(HDAttachment *)self->_attachment identifier];
  v14 = [v13 UUIDString];
  v15 = [v12 URLByAppendingPathComponent:v14];

  objc_super v16 = [v9 attachmentManager];

  v17 = [v16 filesDirectoryURL];
  v18 = [(HDAttachment *)self->_attachment identifier];
  v19 = [v18 UUIDString];
  v20 = [v17 URLByAppendingPathComponent:v19];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __68__HDInsertAttachmentOperation_performWithProfile_transaction_error___block_invoke;
  v58[3] = &unk_1E62F6A40;
  v58[4] = self;
  id v21 = v10;
  id v59 = v21;
  id v22 = v15;
  id v60 = v22;
  id v23 = v20;
  id v61 = v23;
  [v8 onCommit:v58 orRollback:0];
  attachmentReferences = self->_attachmentReferences;
  v56 = self;
  attachment = self->_attachment;
  v26 = attachmentReferences;
  v27 = attachment;
  id v28 = v8;
  id v67 = 0;
  v29 = +[HDAttachmentEntity _insertIfDoesNotExistAttachment:v27 transaction:v28 error:&v67];
  id v30 = v67;

  if (v29)
  {
    v53 = v27;
    id v54 = v22;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v31 = v26;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v64;
      id v51 = v23;
      id v52 = v21;
      while (2)
      {
        uint64_t v35 = 0;
        v36 = v30;
        do
        {
          if (*(void *)v64 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void *)(*((void *)&v63 + 1) + 8 * v35);
          id v62 = v36;
          v38 = +[HDAttachmentReferenceEntity _insertIfDoesNotExistReference:v37 transaction:v28 error:&v62];
          id v30 = v62;

          if (!v38)
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v69 = v56;
              __int16 v70 = 2114;
              uint64_t v71 = v37;
              __int16 v72 = 2114;
              id v73 = v30;
              _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to insert reference %{public}@. Reverting attachment storage. %{public}@", buf, 0x20u);
            }
            id v40 = v30;
            id v30 = v40;
            id v23 = v51;
            id v21 = v52;
            id v22 = v54;
            if (v40)
            {
              if (a5) {
                *a5 = v40;
              }
              else {
                _HKLogDroppedError();
              }
            }

            buf[0] = v30 == 0;
            goto LABEL_23;
          }
          ++v35;
          v36 = v30;
        }
        while (v33 != v35);
        uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v63 objects:v74 count:16];
        id v23 = v51;
        id v21 = v52;
        if (v33) {
          continue;
        }
        break;
      }
    }

    buf[0] = 1;
    id v22 = v54;
LABEL_23:
    v27 = v53;
  }
  else
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v74 = 138543874;
      v75 = v56;
      __int16 v76 = 2114;
      v77 = v27;
      __int16 v78 = 2114;
      id v79 = v30;
      _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to insert attachment %{public}@, %{public}@", v74, 0x20u);
    }
    id v42 = v30;
    id v30 = v42;
    if (v42)
    {
      if (a5) {
        *a5 = v42;
      }
      else {
        _HKLogDroppedError();
      }
    }

    buf[0] = v30 == 0;
  }

  uint8_t v43 = buf[0];
  if ((v43 & 1) == 0 && v56->_fileOnDisk)
  {
    v44 = [v22 path];
    id v57 = 0;
    char v45 = [v21 removeItemAtPath:v44 error:&v57];
    id v46 = v57;

    if ((v45 & 1) == 0)
    {
      _HKInitializeLogging();
      v47 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v49 = v47;
        v50 = [v22 path];
        *(_DWORD *)v74 = 138543874;
        v75 = v56;
        __int16 v76 = 2114;
        v77 = v50;
        __int16 v78 = 2114;
        id v79 = v46;
        _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", v74, 0x20u);
      }
    }
  }
  return v43;
}

void __68__HDInsertAttachmentOperation_performWithProfile_transaction_error___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1[4] + 32))
  {
    v2 = (void *)a1[5];
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    id v13 = 0;
    char v5 = [v2 moveItemAtURL:v3 toURL:v4 error:&v13];
    id v6 = v13;
    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = a1[4];
        id v9 = (void *)a1[6];
        id v10 = v7;
        uint64_t v11 = [v9 path];
        v12 = [(id)a1[7] path];
        *(_DWORD *)buf = 138544130;
        uint64_t v15 = v8;
        __int16 v16 = 2114;
        v17 = v11;
        __int16 v18 = 2114;
        v19 = v12;
        __int16 v20 = 2114;
        id v21 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory, %{public}@", buf, 0x2Au);
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertAttachmentOperation)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachment"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"attachment_references"];

  uint64_t v10 = [v4 decodeBoolForKey:@"file_on_disk"];
  uint64_t v11 = [(HDInsertAttachmentOperation *)self initWithAttachmentReferences:v9 attachment:v5 fileOnDisk:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  attachment = self->_attachment;
  id v5 = a3;
  [v5 encodeObject:attachment forKey:@"attachment"];
  [v5 encodeObject:self->_attachmentReferences forKey:@"attachment_references"];
  [v5 encodeBool:self->_fileOnDisk forKey:@"file_on_disk"];
}

- (id)transactionContext
{
  uint64_t v3 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v4 = [v3 contextWithAccessibilityAssertion:self->_assertion];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_attachmentReferences, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end