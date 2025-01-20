@interface CPLChangedRecordStorageView
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (CPLChangeStorage)changeStorage;
- (CPLChangedRecordStorageView)initWithChangeStorage:(id)a3 overStorageView:(id)a4;
- (CPLRecordStorageView)baseStorageView;
- (id)description;
- (id)recordViewWithScopedIdentifier:(id)a3;
- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)redactedDescription;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3;
- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6;
- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
@end

@implementation CPLChangedRecordStorageView

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = [(CPLChangedRecordStorageView *)self changeStorage];
  v12 = [v11 changeWithScopedIdentifier:v10];

  if (!v12 || ([v12 isDelete] & 1) == 0 && !objc_msgSend(v12, "hasChangeType:", 8)) {
    goto LABEL_16;
  }
  if ([v12 isDelete])
  {
    uint64_t v13 = +[CPLErrors cplErrorWithCode:25, @"Record %@ has just been deleted", v10 description];
    goto LABEL_11;
  }
  if (([v12 supportsResources] & 1) == 0)
  {
    uint64_t v13 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
LABEL_11:
    id v16 = (id)v13;
    if (v13) {
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  uint64_t v14 = [v12 resourceForType:a3];
  if (v14)
  {
    v15 = (void *)v14;
    if (a5)
    {
      id v16 = 0;
      *a5 = (Class)objc_opt_class();
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v17 = +[CPLResource shortDescriptionForResourceType:a3];
  id v16 = +[CPLErrors cplErrorWithCode:26, @"Record %@ has just been modified and has no resource of type %@", v10, v17 description];

  if (!v16)
  {
LABEL_16:
    v19.receiver = self;
    v19.super_class = (Class)CPLChangedRecordStorageView;
    v15 = [(CPLRecordStorageView *)&v19 resourceOfType:a3 forRecordWithScopedIdentifier:v10 recordClass:a5 error:a6];
LABEL_17:
    id v16 = 0;
    goto LABEL_18;
  }
LABEL_12:
  if (a6)
  {
    id v16 = v16;
    v15 = 0;
    *a6 = v16;
  }
  else
  {
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v7 = [(CPLChangedRecordStorageView *)self changeStorage];
  char v8 = [v7 hasChangesWithRelatedScopedIdentifier:v6 class:a4];

  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLChangedRecordStorageView;
    id v9 = [(CPLRecordStorageView *)&v12 countOfRecordsWithRelatedScopedIdentifier:v6 class:a4];
  }
  else
  {
    id v10 = [(CPLChangedRecordStorageView *)self baseStorageView];
    id v9 = (id)[v10 countOfRecordsWithRelatedScopedIdentifier:v6 class:a4];
  }
  return (unint64_t)v9;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v5 = [(CPLChangedRecordStorageView *)self changeStorage];
  int v6 = [v5 getStoredChangeType:&v10 forRecordWithScopedIdentifier:v4];

  if (v6)
  {
    char v7 = v10 != 1024;
  }
  else
  {
    char v8 = [(CPLChangedRecordStorageView *)self baseStorageView];
    char v7 = [v8 hasRecordWithScopedIdentifier:v4];
  }
  return v7;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLChangedRecordStorageView *)self changeStorage];
  id v11 = 0;
  char v6 = [v5 getRelatedScopedIdentifier:&v11 forRecordWithScopedIdentifier:v4];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    char v8 = [(CPLChangedRecordStorageView *)self baseStorageView];
    uint64_t v9 = [v8 relatedScopedIdentifierForRecordWithScopedIdentifier:v4];

    id v7 = (id)v9;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseStorageView, 0);
  objc_storeStrong((id *)&self->_changeStorage, 0);
}

- (CPLRecordStorageView)baseStorageView
{
  return self->_baseStorageView;
}

- (CPLChangeStorage)changeStorage
{
  return self->_changeStorage;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  id v4 = [(CPLRecordStorageView *)self->_baseStorageView redactedDescription];
  v5 = [(CPLChangeStorage *)self->_changeStorage storageDescription];
  char v6 = (void *)[v3 initWithFormat:@"%@+%@", v4, v5];

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  baseStorageView = self->_baseStorageView;
  v5 = [(CPLChangeStorage *)self->_changeStorage storageDescription];
  char v6 = (void *)[v3 initWithFormat:@"%@+%@", baseStorageView, v5];

  return v6;
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  unint64_t v49 = (unint64_t)a3;
  v50 = self;
  -[CPLRecordStorageView recordViewsWithRelatedScopedIdentifier:class:](self->_baseStorageView, "recordViewsWithRelatedScopedIdentifier:class:");
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (!v9) {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        uint64_t v13 = [v12 scopedIdentifier];
        if (!v8) {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        [v9 setObject:v12 forKeyedSubscript:v13];
        [v8 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  uint64_t v14 = v50;
  [(CPLChangeStorage *)v50->_changeStorage changesWithRelatedScopedIdentifier:v49 class:a4];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v51 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(v51);
        }
        objc_super v19 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        v20 = [v19 scopedIdentifier];
        [v8 removeObject:v20];
        uint64_t v21 = [v9 objectForKeyedSubscript:v20];
        if (v21)
        {
          v22 = (void *)v21;
          if ([v19 isDelete])
          {
            [v9 removeObjectForKey:v20];
          }
          else
          {
            if ([v19 isFullRecord])
            {
              v23 = [v19 asRecordView];
            }
            else
            {
              v23 = [[CPLChangedRecordView alloc] initWithChange:v19 overRecordView:v22];
            }
            v27 = v23;
            [v9 setObject:v23 forKeyedSubscript:v20];
          }
        }
        else if ([v19 isFullRecord])
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v22 = [v19 asRecordView];
          [v9 setObject:v22 forKeyedSubscript:v20];
        }
        else
        {
          if ([v19 isDelete]) {
            goto LABEL_34;
          }
          baseStorageView = v14->_baseStorageView;
          v25 = [v19 scopedIdentifier];
          v22 = [(CPLRecordStorageView *)baseStorageView recordViewWithScopedIdentifier:v25];

          if (!v22)
          {
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, v50);

            abort();
          }
          v26 = [[CPLChangedRecordView alloc] initWithChange:v19 overRecordView:v22];
          [v9 setObject:v26 forKeyedSubscript:v20];

          uint64_t v14 = v50;
        }

LABEL_34:
      }
      uint64_t v16 = [v51 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v16);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v28 = v8;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (!v29) {
    goto LABEL_56;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v54;
  do
  {
    for (uint64_t k = 0; k != v30; ++k)
    {
      if (*(void *)v54 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * k);
      v34 = [(CPLChangeStorage *)v14->_changeStorage changeWithScopedIdentifier:v33];
      v35 = v34;
      if (v34)
      {
        if ([v34 isDelete])
        {
          [v9 removeObjectForKey:v33];
          goto LABEL_54;
        }
        if (![v35 hasChangeType:2]) {
          goto LABEL_50;
        }
        uint64_t v36 = [v35 relatedScopedIdentifier];
        v37 = (void *)v36;
        if (v49 && v36)
        {
          char v38 = [(id)v36 isEqual:v49];

          if ((v38 & 1) == 0) {
            goto LABEL_48;
          }
LABEL_50:
          if ([v35 isFullRecord])
          {
            v40 = [v35 asRecordView];
            [v9 setObject:v40 forKeyedSubscript:v33];
          }
          else
          {
            v41 = [CPLChangedRecordView alloc];
            v42 = [v9 objectForKeyedSubscript:v33];
            v43 = [(CPLChangedRecordView *)v41 initWithChange:v35 overRecordView:v42];
            [v9 setObject:v43 forKeyedSubscript:v33];
          }
        }
        else
        {
          unint64_t v39 = v49 | v36;

          if (!v39) {
            goto LABEL_50;
          }
LABEL_48:
          [v9 removeObjectForKey:v33];
        }
        uint64_t v14 = v50;
      }
LABEL_54:
    }
    uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v65 count:16];
  }
  while (v30);
LABEL_56:

  v44 = [v9 allValues];

  return v44;
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLChangeStorage *)self->_changeStorage changeWithScopedIdentifier:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v7 = [(CPLRecordStorageView *)self->_baseStorageView recordViewWithScopedIdentifier:v4];
    goto LABEL_5;
  }
  if ([v5 isFullRecord])
  {
    uint64_t v7 = [v6 asRecordView];
LABEL_5:
    id v8 = (CPLChangedRecordView *)v7;
    goto LABEL_6;
  }
  if ([v6 isDelete])
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v10 = [(CPLRecordStorageView *)self->_baseStorageView recordViewWithScopedIdentifier:v4];
    if (!v10) {
      _CPLBaseRecordViewFailure(self, v6);
    }
    id v11 = (void *)v10;
    id v8 = [[CPLChangedRecordView alloc] initWithChange:v6 overRecordView:v10];
  }
LABEL_6:

  return v8;
}

- (CPLChangedRecordStorageView)initWithChangeStorage:(id)a3 overStorageView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLChangedRecordStorageView;
  id v9 = [(CPLChangedRecordStorageView *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseStorageView, a4);
    objc_storeStrong((id *)&v10->_changeStorage, a3);
  }

  return v10;
}

@end