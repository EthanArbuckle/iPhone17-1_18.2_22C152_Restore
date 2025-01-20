@interface CPLPrequeliteFlattentPipelineMigrator
- (BOOL)_discardResourceForUpload:(id)a3;
- (BOOL)_enqueueResourcesForChange:(id)a3 inOutgoingResourcesWithUploadIdentifier:(id)a4;
- (BOOL)_migratePushQueue:(id)a3;
- (BOOL)migrate;
- (CPLPrequeliteFlattentPipelineMigrator)initWithStore:(id)a3;
- (CPLPrequeliteStore)store;
- (NSError)lastError;
- (unint64_t)_availabilityOfResource:(id)a3;
- (void)_setLastError:(id)a3;
@end

@implementation CPLPrequeliteFlattentPipelineMigrator

- (CPLPrequeliteFlattentPipelineMigrator)initWithStore:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPLPrequeliteFlattentPipelineMigrator;
  v6 = [(CPLPrequeliteFlattentPipelineMigrator *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = [(CPLPrequeliteStore *)v7->_store abstractObject];
    uint64_t v9 = [v5 clientCache];
    clientCache = v7->_clientCache;
    v7->_clientCache = (CPLPrequeliteClientCache *)v9;

    uint64_t v11 = [v8 pushRepository];
    pushRepository = v7->_pushRepository;
    v7->_pushRepository = (CPLEnginePushRepository *)v11;

    uint64_t v13 = [v8 outgoingResources];
    outgoingResources = v7->_outgoingResources;
    v7->_outgoingResources = (CPLEngineOutgoingResources *)v13;

    uint64_t v15 = [v8 resourceStorage];
    resources = v7->_resources;
    v7->_resources = (CPLEngineResourceStorage *)v15;

    v17 = [CPLPrequeliteResourceUploadQueue alloc];
    store = v7->_store;
    v19 = +[CPLPrequeliteTable tableWithName:@"uploadQueue"];
    v20 = [(CPLPrequeliteResourceUploadQueue *)v17 initWithStore:store table:v19];
    uploadQueue = v7->_uploadQueue;
    v7->_uploadQueue = v20;
  }
  return v7;
}

- (void)_setLastError:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastError, a3);
    id v5 = v6;
  }
}

- (NSError)lastError
{
  lastError = self->_lastError;
  if (lastError)
  {
    v3 = lastError;
  }
  else
  {
    v4 = [(CPLPrequeliteStore *)self->_store pqlConnection];
    v3 = [v4 lastError];
  }
  return v3;
}

- (unint64_t)_availabilityOfResource:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v5 = [(CPLPrequeliteResourceUploadQueue *)self->_uploadQueue queuedResourceForResource:v4 pendingCount:&v21];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 identity];
    v8 = [v4 identity];
    uint64_t v9 = [v7 fingerPrint];
    v10 = [v8 fingerPrint];
    unint64_t v11 = (unint64_t)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {

      if (v9 | v11) {
        goto LABEL_14;
      }
    }
    else
    {
      unsigned __int8 v14 = [(id)v9 isEqual:v10];

      if ((v14 & 1) == 0) {
        goto LABEL_14;
      }
    }
    uint64_t v15 = [v7 fileUTI];
    v16 = [v8 fileUTI];
    unint64_t v17 = (unint64_t)v16;
    if (v15 && v16)
    {
      unsigned __int8 v18 = [(id)v15 isEqual:v16];

      if ((v18 & 1) == 0)
      {
LABEL_14:
        unint64_t v13 = 3;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {

      if (v15 | v17) {
        goto LABEL_14;
      }
    }
    if ([v7 isAvailable])
    {
      v20 = [v7 fileURL];

      unint64_t v13 = v20 != 0;
    }
    else
    {
      unint64_t v13 = 2;
    }
    goto LABEL_15;
  }
  unint64_t v13 = 3;
LABEL_16:

  return v13;
}

- (BOOL)_enqueueResourcesForChange:(id)a3 inOutgoingResourcesWithUploadIdentifier:(id)a4
{
  id v28 = a4;
  id v6 = [a3 resources];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v34;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(obj);
      }
      BOOL v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if (![(CPLPrequeliteFlattentPipelineMigrator *)self _availabilityOfResource:v12])
      {
        resources = self->_resources;
        id v32 = 0;
        unsigned __int8 v14 = [(CPLEngineResourceStorage *)resources retainFileURLForResource:v12 error:&v32];
        id v15 = v32;
        if (v14)
        {
          v16 = v7;
          unint64_t v17 = self->_resources;
          id v31 = v15;
          unsigned __int8 v18 = [(CPLEngineResourceStorage *)v17 releaseFileURL:v14 forResource:v12 error:&v31];
          id v19 = v31;

          if (v18)
          {
            v20 = [v12 identity];
            [v20 setFileURL:v14];

            id v7 = v16;
            [v16 addObject:v12];

            continue;
          }
          [(CPLPrequeliteFlattentPipelineMigrator *)self _setLastError:v19];
          v26 = [v12 identity];
          [v26 setFileURL:v14];

          id v7 = v16;
          [v16 addObject:v12];

          id v15 = v19;
          v22 = v28;
        }
        else
        {
          v22 = v28;
          if (!_CPLSilentLogging)
          {
            v25 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v38 = v12;
              __int16 v39 = 2112;
              id v40 = v15;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to find resource %@ in cache: %@", buf, 0x16u);
            }
          }
          [(CPLPrequeliteFlattentPipelineMigrator *)self _setLastError:v15];
        }

        unsigned __int8 v23 = 0;
        id v24 = obj;
        goto LABEL_22;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_12:

  if ([v7 count])
  {
    self->_countOfOutgoingResources += (unint64_t)[v7 count];
    outgoingResources = self->_outgoingResources;
    id v30 = 0;
    v22 = v28;
    unsigned __int8 v23 = [(CPLEngineOutgoingResources *)outgoingResources storeResourcesToUpload:v7 withUploadIdentifier:v28 shouldCheckResources:0 error:&v30];
    id v24 = v30;
    if ((v23 & 1) == 0) {
      [(CPLPrequeliteFlattentPipelineMigrator *)self _setLastError:v24];
    }
LABEL_22:
  }
  else
  {
    unsigned __int8 v23 = 1;
    v22 = v28;
  }

  return v23;
}

- (BOOL)_discardResourceForUpload:(id)a3
{
  id v4 = a3;
  uploadQueue = self->_uploadQueue;
  id v16 = 0;
  unsigned int v6 = [(CPLPrequeliteResourceUploadQueue *)uploadQueue discardResource:v4 discardedResource:&v16 error:0];
  id v7 = v16;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = [v7 identity];
    if ([v10 isAvailable])
    {
      unint64_t v11 = [v8 identity];
      BOOL v12 = [v11 fileURL];

      if (v12)
      {
        LOBYTE(v6) = 1;
        goto LABEL_10;
      }
      ++self->_countOfDroppedResources;
      resources = self->_resources;
      id v15 = 0;
      LOBYTE(v6) = [(CPLEngineResourceStorage *)resources dropResourceForUpload:v4 error:&v15];
      id v10 = v15;
      if ((v6 & 1) == 0) {
        [(CPLPrequeliteFlattentPipelineMigrator *)self _setLastError:v10];
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
LABEL_10:

  return v6;
}

- (BOOL)_migratePushQueue:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  if ([v4 hasChanges])
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001AB8F0;
    v8[3] = &unk_10027F7C8;
    v8[5] = &v9;
    v8[6] = &v13;
    v8[4] = self;
    [v4 enumerateChangesWithBlock:v8];
    if (*((unsigned char *)v14 + 24) && *((unsigned char *)v10 + 24))
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001ABB3C;
      v7[3] = &unk_10027F7F0;
      v7[4] = self;
      v7[5] = &v13;
      [v4 enumerateChangesWithBlock:v7];
    }
    _Block_object_dispose(&v9, 8);
  }
  char v5 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (BOOL)migrate
{
  v3 = [(CPLPrequeliteStore *)self->_store pqlConnection];
  id v4 = +[CPLPrequeliteTable tableWithName:@"deletePushQueue"];
  char v5 = +[CPLPrequeliteTable tableWithName:@"pushQueue"];
  unsigned int v6 = [[CPLPrequeliteChangePipeEnumerator alloc] initWithStore:self->_store table:v4];
  if (![(CPLPrequeliteFlattentPipelineMigrator *)self _migratePushQueue:v6])
  {
    id v7 = v6;
    goto LABEL_6;
  }
  id v7 = [[CPLPrequeliteChangePipeEnumerator alloc] initWithStore:self->_store table:v5];

  if (![(CPLPrequeliteFlattentPipelineMigrator *)self _migratePushQueue:v7])
  {
LABEL_6:
    store = self->_store;
    unint64_t countOfMigratedChanges = self->_countOfMigratedChanges;
    char v12 = [v3 lastCPLError];
    uint64_t v13 = [v12 localizedDescription];
    [(CPLPrequeliteStore *)store recordUpgradeEvent:@"failed to migrate %lu changes to flat pipeline: %@", countOfMigratedChanges, v13];

    BOOL v14 = 0;
    goto LABEL_9;
  }
  unint64_t v8 = self->_countOfMigratedChanges;
  uint64_t v9 = self->_store;
  if (v8) {
    [(CPLPrequeliteStore *)v9 recordUpgradeEvent:@"succesfully migrated %lu changes to flat pipeline (dropped resources: %lu but re-enqueued %lu).", v8, self->_countOfDroppedResources, self->_countOfOutgoingResources];
  }
  else {
    [(CPLPrequeliteStore *)v9 recordUpgradeEvent:@"succesfully migrated empty push pipeline to flat pipeline.", v17, v18, v19];
  }
  BOOL v14 = 1;
LABEL_9:
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v4];
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v5];
  uint64_t v15 = [(CPLPrequeliteResourceUploadQueue *)self->_uploadQueue table];
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v15];

  return v14;
}

- (CPLPrequeliteStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_outgoingResources, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_clientCache, 0);
}

@end