@interface HDDeleteAttachmentReferenceOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDDeleteAttachmentReferenceOperation)initWithCoder:(id)a3;
- (HDDeleteAttachmentReferenceOperation)initWithReferences:(id)a3;
- (HDDeleteAttachmentReferenceOperation)initWithSynchronizedReferences:(id)a3;
- (void)_initWithReferences:(uint64_t)a3 cloudStatus:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDeleteAttachmentReferenceOperation

- (HDDeleteAttachmentReferenceOperation)initWithReferences:(id)a3
{
  return (HDDeleteAttachmentReferenceOperation *)-[HDDeleteAttachmentReferenceOperation _initWithReferences:cloudStatus:](self, a3, 0);
}

- (void)_initWithReferences:(uint64_t)a3 cloudStatus:
{
  id v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)HDDeleteAttachmentReferenceOperation;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[2];
      a1[2] = v6;

      a1[3] = a3;
    }
  }

  return a1;
}

- (HDDeleteAttachmentReferenceOperation)initWithSynchronizedReferences:(id)a3
{
  return (HDDeleteAttachmentReferenceOperation *)-[HDDeleteAttachmentReferenceOperation _initWithReferences:cloudStatus:](self, a3, 1);
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v49 = self;
  references = self->_references;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke;
  v71[3] = &unk_1E62FB1C0;
  id v51 = v9;
  id v72 = v51;
  v53 = v8;
  if (+[HDAttachmentReferenceEntity filteredNonTombstoneReferences:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "filteredNonTombstoneReferences:transaction:error:enumerationHandler:", references, v8, a5, v71)&& (![v51 count]|| +[HDAttachmentReferenceEntity deleteReferences:cloudStatus:transaction:error:](HDAttachmentReferenceEntity, "deleteReferences:cloudStatus:transaction:error:", v51, v49->_cloudStatus, v8, a5)))
  {
    v11 = objc_msgSend(v51, "hk_map:", &__block_literal_global_237);
    v12 = v49->_references;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_3;
    v69[3] = &unk_1E63018B0;
    id v43 = v11;
    id v70 = v43;
    v44 = [(NSArray *)v12 hk_filter:v69];
    if ([v44 count]
      && !+[HDAttachmentReferenceEntity insertTombstones:v44 cloudStatus:v49->_cloudStatus transaction:v8 error:a5])
    {
      BOOL v38 = 0;
    }
    else
    {
      v13 = objc_msgSend(v51, "hk_mapToSet:", &__block_literal_global_282_0);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v15 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_5;
      v64[3] = &unk_1E62F6A40;
      id v46 = v14;
      id v65 = v46;
      id v52 = v47;
      id v66 = v52;
      id v45 = v15;
      id v67 = v45;
      v68 = v49;
      [v8 onCommit:v64 orRollback:0];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = v13;
      uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
      if (v16)
      {
        uint64_t v50 = *(void *)v61;
        *(void *)&long long v17 = 138544130;
        long long v42 = v17;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v61 != v50) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
            uint64_t v56 = 0;
            v57 = &v56;
            uint64_t v58 = 0x2020000000;
            char v59 = 0;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_285;
            v55[3] = &unk_1E63013D0;
            v55[4] = &v56;
            if (!+[HDAttachmentReferenceEntity enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:", v19, 0, v53, a5, v55, v42))
            {
LABEL_28:
              BOOL v38 = 0;
LABEL_29:
              _Block_object_dispose(&v56, 8);
              goto LABEL_30;
            }
            if (!*((unsigned char *)v57 + 24))
            {
              _HKInitializeLogging();
              v20 = (id)*MEMORY[0x1E4F29F18];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = [v19 UUIDString];
                *(_DWORD *)buf = 138543618;
                v74 = v49;
                __int16 v75 = 2114;
                v76 = v21;
                _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: No references remaining. Deleting attachment with identifier %{public}@", buf, 0x16u);
              }
              [v46 addObject:v19];
              v22 = [v52 attachmentManager];
              v23 = [v22 unconfirmedFilesDirectoryURL];
              v24 = [v19 UUIDString];
              v25 = [v23 URLByAppendingPathComponent:v24];

              uint64_t v26 = [v52 attachmentManager];
              v27 = [(id)v26 filesDirectoryURL];
              v28 = [v19 UUIDString];
              v29 = [v27 URLByAppendingPathComponent:v28];

              id v54 = 0;
              LOBYTE(v26) = [v45 moveItemAtURL:v29 toURL:v25 error:&v54];
              id v30 = v54;
              if ((v26 & 1) == 0)
              {
                _HKInitializeLogging();
                v31 = (id)*MEMORY[0x1E4F29F18];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  v36 = [v29 path];
                  v37 = [v25 path];
                  *(_DWORD *)buf = v42;
                  v74 = v49;
                  __int16 v75 = 2114;
                  v76 = v36;
                  __int16 v77 = 2114;
                  v78 = v37;
                  __int16 v79 = 2114;
                  id v80 = v30;
                  _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory with error %{public}@", buf, 0x2Au);
                }
                if (objc_msgSend(v30, "hk_isCocoaNoSuchFileError"))
                {
                  _HKInitializeLogging();
                  v32 = *MEMORY[0x1E4F29F18];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v74 = v49;
                    __int16 v75 = 2114;
                    v76 = v19;
                    _os_log_fault_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_FAULT, "[attachments] %{public}@: No such file error for attachment %{public}@", buf, 0x16u);
                  }
                }
                if ((objc_msgSend(v30, "hk_isCocoaNoSuchFileError") & 1) == 0
                  && (objc_msgSend(v30, "hk_isCocoaFileExistsError") & 1) == 0)
                {
                  id v40 = v30;
                  v41 = v40;
                  BOOL v38 = v40 == 0;
                  if (v40)
                  {
                    if (a5) {
                      *a5 = v40;
                    }
                    else {
                      _HKLogDroppedError();
                    }
                  }

                  goto LABEL_29;
                }
              }
              v33 = HDAttachmentPredicateForAttachmentIdentifier((uint64_t)v19);
              v34 = [v52 database];
              BOOL v35 = +[HDHealthEntity deleteEntitiesWithPredicate:v33 healthDatabase:v34 error:a5];

              if (!v35) {
                goto LABEL_28;
              }
            }
            _Block_object_dispose(&v56, 8);
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      BOOL v38 = 1;
LABEL_30:
    }
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 attachmentIdentifier];
}

void __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_5(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v23;
    v7 = (os_log_t *)MEMORY[0x1E4F29F18];
    *(void *)&long long v4 = 138543874;
    long long v20 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        v10 = objc_msgSend(*(id *)(a1 + 40), "attachmentManager", v20);
        uint64_t v11 = [v10 unconfirmedFilesDirectoryURL];
        v12 = [v9 UUIDString];
        v13 = [(id)v11 URLByAppendingPathComponent:v12];

        id v14 = *(void **)(a1 + 48);
        id v21 = 0;
        LOBYTE(v11) = [v14 removeItemAtURL:v13 error:&v21];
        id v15 = v21;
        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          os_log_t v16 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = *(void *)(a1 + 56);
            uint64_t v18 = v16;
            v19 = [v13 path];
            *(_DWORD *)buf = v20;
            uint64_t v27 = v17;
            v7 = (os_log_t *)MEMORY[0x1E4F29F18];
            __int16 v28 = 2114;
            v29 = v19;
            __int16 v30 = 2114;
            id v31 = v15;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to delete file from path %{public}@ with error %{public}@", buf, 0x20u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_285(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeleteAttachmentReferenceOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"delete_attachment_references"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"cloud_status"];

  if (v6) {
    v7 = [(HDDeleteAttachmentReferenceOperation *)self initWithSynchronizedReferences:v5];
  }
  else {
    v7 = [(HDDeleteAttachmentReferenceOperation *)self initWithReferences:v5];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDeleteAttachmentReferenceOperation;
  id v4 = a3;
  [(HDJournalEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_references, @"delete_attachment_references", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_cloudStatus forKey:@"cloud_status"];
}

- (void).cxx_destruct
{
}

@end