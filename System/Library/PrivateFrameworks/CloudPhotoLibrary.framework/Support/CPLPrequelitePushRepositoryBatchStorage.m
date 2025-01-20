@interface CPLPrequelitePushRepositoryBatchStorage
- (BOOL)checkOutWithError:(id *)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)removeChange:(id)a3 error:(id *)a4;
- (CPLPrequelitePushRepository)pushRepository;
- (CPLPrequelitePushRepositoryBatchStorage)initWithPushRepository:(id)a3 priority:(unint64_t)a4;
- (CPLPrequeliteTable)enumerationTable;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)changeWithScopedIdentifier:(id)a3;
- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3;
- (unint64_t)priority;
@end

@implementation CPLPrequelitePushRepositoryBatchStorage

- (CPLPrequelitePushRepositoryBatchStorage)initWithPushRepository:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLPrequelitePushRepositoryBatchStorage;
  v7 = [(CPLPrequelitePushRepositoryBatchStorage *)&v22 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_pushRepository, v6);
    uint64_t v9 = [v6 mainTable];
    pushRepositoryTable = v8->_pushRepositoryTable;
    v8->_pushRepositoryTable = (CPLPrequeliteTable *)v9;

    v8->_priority = a4;
    if (a4 == -1)
    {
      v16 = v8->_pushRepositoryTable;
      enumerationTable = v8->_enumerationTable;
      v8->_enumerationTable = v16;
    }
    else
    {
      id v11 = objc_alloc((Class)NSString);
      v12 = [(CPLPrequeliteTable *)v8->_pushRepositoryTable tableName];
      enumerationTable = (CPLPrequeliteTable *)[v11 initWithFormat:@"%@_%lu", v12, a4];

      uint64_t v14 = +[CPLPrequeliteTable tableWithName:enumerationTable];
      v15 = v8->_enumerationTable;
      v8->_enumerationTable = (CPLPrequeliteTable *)v14;
    }
    v17 = [v6 abstractObject];
    v18 = [v17 engineStore];
    uint64_t v19 = [v18 outgoingResources];
    outgoingResources = v8->_outgoingResources;
    v8->_outgoingResources = (CPLEngineOutgoingResources *)v19;
  }
  return v8;
}

- (BOOL)checkOutWithError:(id *)a3
{
  ++self->_checkOutCount;
  if (self->_viewIsCreated)
  {
    id v3 = 0;
    unsigned __int8 v4 = 1;
  }
  else if (self->_pushRepositoryTable == self->_enumerationTable)
  {
    id v3 = 0;
    unsigned __int8 v4 = 1;
    self->_viewIsCreated = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pushRepository);
    uint64_t v9 = [WeakRetained pqStore];
    v10 = [v9 pqlConnection];

    if (!_CPLSilentLogging)
    {
      id v11 = sub_1001B2590();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(CPLPrequeliteTable *)self->_enumerationTable tableName];
        id v13 = objc_loadWeakRetained((id *)&self->_pushRepository);
        uint64_t v14 = [v13 mainTable];
        v15 = [v14 tableName];
        unint64_t priority = self->_priority;
        *(_DWORD *)buf = 138543874;
        v23 = v12;
        __int16 v24 = 2112;
        v25 = v15;
        __int16 v26 = 2048;
        unint64_t v27 = priority;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating view %{public}@ for %@ with priority %lu", buf, 0x20u);
      }
    }
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"unint64_t priority = %lu", self->_priority);
    id v18 = objc_alloc((Class)PQLRawInjection);
    uint64_t v19 = [v17 dataUsingEncoding:4];
    id v20 = [v18 initWithData:v19];

    unsigned __int8 v4 = [v10 cplExecute:@"CREATE TEMP VIEW %@ AS SELECT rowid, class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@", self->_enumerationTable, self->_pushRepositoryTable, v20];
    if (v4)
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [v10 lastError];
    }

    self->_viewIsCreated = v4;
    if (a3) {
      char v21 = v4;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0)
    {
      id v3 = v3;
      unsigned __int8 v4 = 0;
      *a3 = v3;
    }
  }

  return v4;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  p_pushRepository = &self->_pushRepository;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v6 = [WeakRetained changeWithScopedIdentifier:v4];

  return v6;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  BOOL v5 = a5;
  p_pushRepository = &self->_pushRepository;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v11 = [WeakRetained allChangesWithClass:a3 scopeIdentifier:v9 trashed:v5 table:self->_enumerationTable];

  return v11;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  p_pushRepository = &self->_pushRepository;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v11 = [WeakRetained allChangesWithClass:a3 scopeIdentifier:v9 changeType:a5 table:self->_enumerationTable];

  return v11;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = [WeakRetained allNonDeletedChangesWithClass:a3 scopeIdentifier:v7 table:self->_enumerationTable];

  return v9;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = [WeakRetained allChangesWithClass:a3 relatedScopedIdentifier:v7 table:self->_pushRepositoryTable];

  return v9;
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = [WeakRetained allChangesWithClass:a3 secondaryScopedIdentifier:v7 table:self->_pushRepositoryTable];

  return v9;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  p_pushRepository = &self->_pushRepository;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v7 = [WeakRetained allChangesWithScopeIdentifier:v5 table:self->_enumerationTable];

  return v7;
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  p_pushRepository = &self->_pushRepository;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  v8 = [v6 scopedIdentifier];

  LOBYTE(a4) = [WeakRetained deleteChangeWithScopedIdentifier:v8 error:a4];
  return (char)a4;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v3 = self;
  p_pushRepository = &self->_pushRepository;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  LOBYTE(v3) = [WeakRetained hasChangesInScopeWithIdentifier:v5 table:v3->_enumerationTable];

  return (char)v3;
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  return (unint64_t)[(CPLEngineOutgoingResources *)self->_outgoingResources availableResourceSizeForUploadIdentifier:a3];
}

- (CPLPrequelitePushRepository)pushRepository
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushRepository);
  return (CPLPrequelitePushRepository *)WeakRetained;
}

- (CPLPrequeliteTable)enumerationTable
{
  return self->_enumerationTable;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pushRepository);
  objc_storeStrong((id *)&self->_pushRepositoryTable, 0);
  objc_storeStrong((id *)&self->_enumerationTable, 0);
  objc_storeStrong((id *)&self->_outgoingResources, 0);
}

@end