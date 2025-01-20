@interface CPLPrequeliteResourceUploadQueue
- (BOOL)discardResource:(id)a3 currentlyStoredResource:(id *)a4 lastReference:(BOOL *)a5 error:(id *)a6;
- (BOOL)discardResource:(id)a3 discardedResource:(id *)a4 error:(id *)a5;
- (CPLPrequeliteResourceUploadQueue)initWithStore:(id)a3 table:(id)a4;
- (CPLPrequeliteStore)store;
- (CPLPrequeliteTable)table;
- (id)_enqueuedResourceForResource:(id)a3;
- (id)mainTable;
- (id)pqStore;
- (id)queuedResourceForResource:(id)a3 pendingCount:(unint64_t *)a4;
@end

@implementation CPLPrequeliteResourceUploadQueue

- (CPLPrequeliteResourceUploadQueue)initWithStore:(id)a3 table:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteResourceUploadQueue;
  v9 = [(CPLPrequeliteResourceUploadQueue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_table, a4);
  }

  return v10;
}

- (id)pqStore
{
  return self->_store;
}

- (id)mainTable
{
  return self->_table;
}

- (id)_enqueuedResourceForResource:(id)a3
{
  id v4 = a3;
  v5 = [(CPLPrequeliteResourceUploadQueue *)self pqStore];
  v6 = [v5 pqlConnection];

  uint64_t v7 = objc_opt_class();
  id v8 = [(CPLPrequeliteResourceUploadQueue *)self mainTable];
  v9 = [v4 itemScopedIdentifier];
  v10 = [v9 identifier];
  id v11 = [v4 resourceType];

  id v12 = [v6 cplFetchObjectOfClass:v7, @"SELECT position, pendingCount, itemIdentifier, resourceType, fingerPrint, fileUTI, originalPath, available, retryCount, status FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i", v8, v10, v11 sql];
  return v12;
}

- (id)queuedResourceForResource:(id)a3 pendingCount:(unint64_t *)a4
{
  v5 = [(CPLPrequeliteResourceUploadQueue *)self _enqueuedResourceForResource:a3];
  v6 = v5;
  if (v5)
  {
    *a4 = (unint64_t)[v5 pendingCount];
    uint64_t v7 = [v6 resource];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)discardResource:(id)a3 discardedResource:(id *)a4 error:(id *)a5
{
  char v8 = 0;
  BOOL v6 = [(CPLPrequeliteResourceUploadQueue *)self discardResource:a3 currentlyStoredResource:a4 lastReference:&v8 error:a5];
  if (v6 && !v8) {
    *a4 = 0;
  }
  return v6;
}

- (BOOL)discardResource:(id)a3 currentlyStoredResource:(id *)a4 lastReference:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(CPLPrequeliteResourceUploadQueue *)self pqStore];
  id v12 = [v11 pqlConnection];

  v13 = [(CPLPrequeliteResourceUploadQueue *)self mainTable];
  v14 = [v10 itemScopedIdentifier];
  v15 = [v14 identifier];
  unsigned int v16 = [v12 cplExecute:@"UPDATE OR IGNORE %@ SET pendingCount = pendingCount - 1 WHERE itemIdentifier = %@ AND resourceType = %i", v13, v15, objc_msgSend(v10, "resourceType")];

  if (!v16)
  {
    BOOL v20 = 0;
    if (!a6) {
      goto LABEL_14;
    }
LABEL_12:
    if (!v20)
    {
      [v12 lastCPLError];
      BOOL v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  id v17 = [v12 changes];
  v18 = [(CPLPrequeliteResourceUploadQueue *)self _enqueuedResourceForResource:v10];
  v19 = v18;
  if (v17)
  {
    *a4 = [v18 resource];
    *a5 = 0;

    BOOL v20 = 1;
    goto LABEL_14;
  }
  if (v18)
  {
    v21 = [(CPLPrequeliteResourceUploadQueue *)self mainTable];
    v22 = [v10 itemScopedIdentifier];
    v23 = [v22 identifier];
    unsigned int v24 = [v12 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i", v21, v23, objc_msgSend(v10, "resourceType")];

    if (v24)
    {
      *a4 = [v19 resource];
      BOOL v20 = 1;
      *a5 = 1;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  if (a6) {
    goto LABEL_12;
  }
LABEL_14:

  return v20;
}

- (CPLPrequeliteStore)store
{
  return self->_store;
}

- (CPLPrequeliteTable)table
{
  return self->_table;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end