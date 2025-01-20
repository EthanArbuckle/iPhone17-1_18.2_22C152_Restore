@interface HDInsertSynchronisedAttachmentReferences
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertSynchronisedAttachmentReferences)initWithAttachmentReferences:(id)a3;
- (HDInsertSynchronisedAttachmentReferences)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertSynchronisedAttachmentReferences

- (HDInsertSynchronisedAttachmentReferences)initWithAttachmentReferences:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertSynchronisedAttachmentReferences;
  v5 = [(HDInsertSynchronisedAttachmentReferences *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attachmentReferences = v5->_attachmentReferences;
    v5->_attachmentReferences = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_attachmentReferences;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (!v8)
  {
    char v17 = 1;
    goto LABEL_28;
  }
  objc_super v9 = (id *)v8;
  v24 = self;
  v25 = a5;
  uint64_t v10 = *(void *)v30;
  while (2)
  {
    a5 = 0;
    do
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * (void)a5);
      id v28 = 0;
      v12 = +[HDAttachmentReferenceEntity _insertIfDoesNotExistReference:v11 transaction:v7 error:&v28];
      id v13 = v28;

      if (!v12)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v35 = v24;
          __int16 v36 = 2114;
          uint64_t v37 = v11;
          __int16 v38 = 2114;
          id v39 = v13;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest reference %{public}@, %{public}@", buf, 0x20u);
        }
        id v19 = v13;
        id v13 = v19;
        if (v19)
        {
          if (v25)
          {
            id v13 = v19;
            LOBYTE(a5) = 0;
            id *v25 = v13;
          }
          else
          {
            _HKLogDroppedError();
            LOBYTE(a5) = 0;
          }
          v20 = v13;
        }
        else
        {
          v20 = 0;
          LOBYTE(a5) = 1;
        }
        goto LABEL_27;
      }
      uint64_t v33 = v11;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      id v27 = 0;
      BOOL v15 = +[HDAttachmentReferenceEntity setCloudStatus:1 references:v14 transaction:v7 error:&v27];
      id v16 = v27;

      if (!v15)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v35 = v24;
          __int16 v36 = 2114;
          uint64_t v37 = v11;
          __int16 v38 = 2114;
          id v39 = v16;
          _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update cloud status to synchronized for reference %{public}@, %{public}@", buf, 0x20u);
        }
        id v22 = v16;
        v20 = v22;
        LOBYTE(a5) = v22 == 0;
        if (v22)
        {
          if (v25) {
            id *v25 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }

LABEL_27:
        char v17 = 0;
        goto LABEL_28;
      }

      a5 = (id *)((char *)a5 + 1);
    }
    while (v9 != a5);
    objc_super v9 = (id *)[(NSArray *)obj countByEnumeratingWithState:&v29 objects:v40 count:16];
    char v17 = 1;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_28:

  return (v17 | a5) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertSynchronisedAttachmentReferences)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v7 = [v4 setWithArray:v6];
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"attachment_references"];

  objc_super v9 = [(HDInsertSynchronisedAttachmentReferences *)self initWithAttachmentReferences:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end