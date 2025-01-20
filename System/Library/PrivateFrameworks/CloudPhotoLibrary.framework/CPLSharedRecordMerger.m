@interface CPLSharedRecordMerger
- (CPLSharedRecordMerger)initWithMapping:(id)a3;
- (CPLSharedRecordPropertyMapping)mapping;
- (void)mergeRecord:(id)a3 isSharedRecord:(BOOL)a4 inPrivateRecord:(id)a5;
@end

@implementation CPLSharedRecordMerger

- (void).cxx_destruct
{
}

- (CPLSharedRecordPropertyMapping)mapping
{
  return self->_mapping;
}

- (void)mergeRecord:(id)a3 isSharedRecord:(BOOL)a4 inPrivateRecord:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v9 recordChangeData];
  v11 = v10;
  if (v6)
  {
    v12 = [v8 recordChangeData];
  }
  else
  {
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      id v13 = [v8 recordChangeData];
    }
    id v14 = v13;

    v12 = [v8 sharingRecordChangeData];
    v11 = v14;
  }
  if (([v9 isMasterChange] & 1) == 0)
  {
    if ([v9 supportsResources])
    {
      v15 = [v9 propertiesForChangeType:8];
    }
    else
    {
      v15 = 0;
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __68__CPLSharedRecordMerger_mergeRecord_isSharedRecord_inPrivateRecord___block_invoke;
    v41[3] = &unk_1E60A6BE8;
    id v42 = v15;
    v43 = self;
    id v44 = v9;
    id v16 = v15;
    [v44 cplCopyPropertiesFromObject:v8 withCopyBlock:v41];
  }
  [v9 setRecordChangeData:v11];
  [v9 setSharingRecordChangeData:v12];
  int v17 = [v9 inTrash];
  if (!v6)
  {
    if (v17)
    {
      v24 = [v9 dateDeleted];
      v25 = [v8 dateDeleted];
      id v26 = v24;
      id v27 = v25;
      v28 = v27;
      if (v26) {
        v29 = v26;
      }
      else {
        v29 = v27;
      }
      id v30 = v29;

      [v9 setDateDeleted:v30];
    }
    else
    {
      [v9 setDateDeleted:0];
    }
    v31 = [v9 recordModificationDate];
    v32 = [v8 recordModificationDate];
    id v33 = v31;
    id v34 = v32;
    if (v33) {
      goto LABEL_32;
    }
LABEL_33:
    id v39 = v34;
    id v34 = v39;
    goto LABEL_34;
  }
  if (v17)
  {
    v18 = [v9 dateDeleted];
    v19 = [v8 dateDeleted];
    id v20 = v18;
    id v21 = v19;
    v22 = v21;
    if (v20)
    {
      if (v21)
      {
        id v23 = [v20 laterDate:v21];
      }
      else
      {
        id v23 = v20;
      }
    }
    else
    {
      id v23 = v21;
    }
    v35 = v23;

    [v9 setDateDeleted:v35];
  }
  else
  {
    [v9 setDateDeleted:0];
  }
  v36 = [v9 recordModificationDate];
  v37 = [v8 recordModificationDate];
  id v33 = v36;
  id v38 = v37;
  id v34 = v38;
  if (!v33) {
    goto LABEL_33;
  }
  if (!v38)
  {
LABEL_32:
    id v39 = v33;
    id v33 = v39;
    goto LABEL_34;
  }
  id v39 = [v33 laterDate:v38];
LABEL_34:
  v40 = v39;

  [v9 setRecordModificationDate:v40];
}

uint64_t __68__CPLSharedRecordMerger_mergeRecord_isSharedRecord_inPrivateRecord___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, char *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (sel_recordModificationDate == a6)
  {
    id v16 = [v10 recordModificationDate];
    uint64_t v17 = [v11 recordModificationDate];
    v18 = (void *)v17;
    if ((v16 || !v17) && (!v16 || !v17 || [v16 compare:v17] != -1))
    {

LABEL_21:
      uint64_t v19 = 0;
      goto LABEL_22;
    }
    [v10 setRecordModificationDate:v18];
  }
  else if (sel_recordChangeData != a6 && sel_sharingRecordChangeData != a6 && sel_sharingScopeIdentifier != a6)
  {
    v15 = *(void **)(a1 + 32);
    if (v15)
    {
      if ([v15 containsObject:v12]) {
        goto LABEL_21;
      }
    }
    if (([*(id *)(*(void *)(a1 + 40) + 8) shouldUpdatePropertyOnPrivateRecord:v12 recordClass:objc_opt_class()] & 1) == 0)goto LABEL_21; {
  }
    }
  uint64_t v19 = 1;
LABEL_22:

  return v19;
}

- (CPLSharedRecordMerger)initWithMapping:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSharedRecordMerger;
  BOOL v6 = [(CPLSharedRecordMerger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapping, a3);
  }

  return v7;
}

@end