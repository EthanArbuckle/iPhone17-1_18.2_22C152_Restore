@interface CPLPullSessionRevertRecords
+ (BOOL)supportsSecureCoding;
- (BOOL)applyToStore:(id)a3 error:(id *)a4;
- (BOOL)discardFromStore:(id)a3 error:(id *)a4;
- (CPLChangeBatch)revertedChangesBatch;
- (CPLPullSessionRevertRecords)initWithCoder:(id)a3;
- (CPLPullSessionRevertRecords)initWithStore:(id)a3 revertedChangesBatch:(id)a4;
- (id)statusDescription;
- (id)storageForStatusInStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLPullSessionRevertRecords

- (void).cxx_destruct
{
}

- (CPLChangeBatch)revertedChangesBatch
{
  return self->_revertedChangesBatch;
}

- (id)statusDescription
{
  return [(CPLChangeBatch *)self->_revertedChangesBatch summaryDescription];
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)[a3 revertRecords];
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionRevertRecords;
  return [(CPLChangeSessionUpdate *)&v5 discardFromStore:a3 error:a4];
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CPLPullSessionRevertRecords;
  id v41 = 0;
  unsigned int v7 = [(CPLChangeSessionUpdate *)&v40 applyToStore:v6 error:&v41];
  id v8 = v41;
  if (!v7)
  {
    char v26 = 0;
    if (!a4) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  v30 = a4;
  if (!_CPLSilentLogging)
  {
    v9 = __CPLPushSessionOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      revertedChangesBatch = self->_revertedChangesBatch;
      *(_DWORD *)buf = 138412290;
      v44 = revertedChangesBatch;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Client acknowledged reverted records %@", buf, 0xCu);
    }
  }
  v11 = [v6 quarantinedRecords];
  v29 = v6;
  v32 = [v6 idMapping];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v28 = self;
  v12 = self->_revertedChangesBatch;
  uint64_t v13 = [(CPLChangeBatch *)v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v37;
    obj = v12;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v36 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1BA993DF0]();
      v19 = [v17 scopedIdentifier];
      id v35 = v8;
      char v20 = [v11 removeQuarantinedRecordWithScopedIdentifier:v19 notify:0 error:&v35];
      id v21 = v35;

      if ((v20 & 1) == 0) {
        break;
      }
      if ([v17 isDelete])
      {
        v22 = [v17 scopedIdentifier];
        id v34 = v21;
        int v23 = [v32 addDeleteEventForRecordWithLocalScopedIdentifier:v22 direction:0 error:&v34];
        id v8 = v34;

        if (!v23)
        {
          char v26 = 0;
          id v21 = v8;
LABEL_22:
          id v6 = v29;
          v24 = obj;
          goto LABEL_23;
        }
      }
      else
      {
        id v8 = v21;
      }
      if (v14 == ++v16)
      {
        v12 = obj;
        uint64_t v14 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v14) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    char v26 = 0;
    goto LABEL_22;
  }
LABEL_18:

  id v6 = v29;
  v24 = [v29 revertRecords];
  v25 = v28->_revertedChangesBatch;
  id v33 = v8;
  char v26 = [v24 deleteRecordsToRevertFromBatch:v25 error:&v33];
  id v21 = v33;

LABEL_23:
  id v8 = v21;
  a4 = v30;
  if (v30)
  {
LABEL_24:
    if ((v26 & 1) == 0) {
      *a4 = v8;
    }
  }
LABEL_26:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionRevertRecords;
  id v4 = a3;
  [(CPLChangeSessionUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_revertedChangesBatch, @"rrb", v5.receiver, v5.super_class);
}

- (CPLPullSessionRevertRecords)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPullSessionRevertRecords;
  objc_super v5 = [(CPLChangeSessionUpdate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rrb"];
    revertedChangesBatch = v5->_revertedChangesBatch;
    v5->_revertedChangesBatch = (CPLChangeBatch *)v6;
  }
  return v5;
}

- (CPLPullSessionRevertRecords)initWithStore:(id)a3 revertedChangesBatch:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionRevertRecords;
  id v8 = [(CPLChangeSessionUpdate *)&v11 initWithStore:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_revertedChangesBatch, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end