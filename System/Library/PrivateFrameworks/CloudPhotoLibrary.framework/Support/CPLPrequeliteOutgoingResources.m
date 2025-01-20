@interface CPLPrequeliteOutgoingResources
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedResources:(id *)a6 error:(id *)a7;
- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4;
- (BOOL)initializeStorage;
- (BOOL)shouldUploadResource:(id)a3;
- (BOOL)storeResourceToUpload:(id)a3 withUploadIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)recordsDesignation;
- (id)resourceTypesToUploadForUploadIdentifier:(id)a3;
- (id)resourcesToUploadForUploadIdentifier:(id)a3;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3;
- (unint64_t)countOfOriginalImages;
- (unint64_t)countOfOriginalOthers;
- (unint64_t)countOfOriginalVideos;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
- (void)_cacheCountOfOriginalsIfNecessary;
- (void)_cacheUploadSizesIfNecessary;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteOutgoingResources

- (BOOL)initializeStorage
{
  v7.receiver = self;
  v7.super_class = (Class)CPLPrequeliteOutgoingResources;
  BOOL v3 = [(CPLPrequeliteStorage *)&v7 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,itemIdentifier TEXT NOT NULL,resourceType INTEGER NOT NULL,fingerPrint TEXT NOT NULL,fileUTI TEXT NOT NULL,fileKind INTEGER NOT NULL,fileSize INTEGER NOT NULL,uploadIdentifier TEXT NOT NULL" error:0];
    if (v3)
    {
      unsigned int v4 = [(CPLPrequeliteStorage *)self createIndexWithName:@"resourceType" withDefinition:@"resourceType, fileKind" unique:0 error:0];
      LOBYTE(v3) = 0;
      if (v4)
      {
        unsigned int v5 = [(CPLPrequeliteStorage *)self createIndexWithName:@"resource" withDefinition:@"itemIdentifier, resourceType, fingerPrint" unique:0 error:0];
        LOBYTE(v3) = 0;
        if (v5)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"uploadIdentifier" error:0];
          if (v3)
          {
            BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
            if (v3)
            {
              LOBYTE(v3) = 1;
              *(&self->super._shouldUpgradeSchema + 1) = 1;
              *(void *)(&self->_countOfOriginalsIsCached + 4) = 0;
              *(unint64_t *)((char *)&self->_countOfOriginalImages + 4) = 0;
              *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4) = 0;
              BYTE4(self->_sizeOfOriginalResourcesToUpload) = 1;
              *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) = 0;
              *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) = 0;
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CPLPrequeliteOutgoingResources;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v13, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 == 52)
  {
    if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
    }
    return 1;
  }
  if (a3 != 39)
  {
    if (a3 == 31) {
      return [(CPLPrequeliteStorage *)self createStorage];
    }
    return 1;
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    objc_super v7 = sub_10019316C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CPLPrequeliteStorage *)self mainTable];
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = 39;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding scopeIndex column", buf, 0x16u);
    }
  }
  v9 = [(CPLPrequeliteStorage *)self pqStore];
  v10 = [v9 pqlConnection];

  v11 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v6 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v11];

  return v6;
}

- (BOOL)storeResourceToUpload:(id)a3 withUploadIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 itemScopedIdentifier];
  int64_t v11 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = a5;
    v14 = [(CPLPrequeliteStorage *)self pqStore];
    v36 = [v14 pqlConnection];

    id v33 = v9;
    v34 = v8;
    v15 = [[CPLPrequeliteOutgoingResource alloc] initWithResource:v8 uploadIdentifier:v9];
    __int16 v16 = [(CPLPrequeliteStorage *)self mainTable];
    id v35 = [(CPLPrequeliteOutgoingResource *)v15 scopeIndex];
    uint64_t v17 = [(CPLPrequeliteOutgoingResource *)v15 itemIdentifier];
    unint64_t v18 = [(CPLPrequeliteOutgoingResource *)v15 resourceType];
    v19 = [(CPLPrequeliteOutgoingResource *)v15 fingerPrint];
    v20 = [(CPLPrequeliteOutgoingResource *)v15 fileUTI];
    id v21 = (id)[(CPLPrequeliteOutgoingResource *)v15 fileKind];
    id v22 = [(CPLPrequeliteOutgoingResource *)v15 fileSize];
    v23 = [(CPLPrequeliteOutgoingResource *)v15 uploadIdentifier];
    unint64_t v31 = v18;
    v12 = v36;
    unsigned __int8 v13 = [v36 cplExecute:@"INSERT INTO %@ (scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier) VALUES (%ld, %@, %i, %@, %@, %i, %llu, %@)", v16, v35, v17, v31, v19, v20, v21, v22, v23];

    if (v13)
    {
      BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
      id v8 = v34;
      if (BYTE4(self->_sizeOfOriginalResourcesToUpload))
      {
        v24 = [v34 identity];
        id v25 = [v24 fileSize];

        *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) += (unint64_t)v25;
        if ([v34 resourceType] == (id)1) {
          *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) += (unint64_t)v25;
        }
      }
      id v9 = v33;
      if (*(&self->super._shouldUpgradeSchema + 1) && [v34 resourceType] == (id)1)
      {
        v26 = [v34 identity];
        v27 = [v26 fileUTI];

        if (v27)
        {
          v28 = +[UTType typeWithIdentifier:v27];
          if ([v28 conformsToType:UTTypeImage])
          {
            uint64_t v29 = 44;
          }
          else if ([v28 conformsToType:UTTypeMovie])
          {
            uint64_t v29 = 52;
          }
          else
          {
            uint64_t v29 = 60;
          }
          ++*(void *)&self->super.CPLPlatformObject_opaque[v29];
        }
        else
        {
          ++*(unint64_t *)((char *)&self->_countOfOriginalVideos + 4);
        }
      }
    }
    else
    {
      id v9 = v33;
      id v8 = v34;
      if (v32)
      {
        id *v32 = [v36 lastCPLError];
      }
    }

    goto LABEL_23;
  }
  if (a5)
  {
    v12 = [v8 itemScopedIdentifier];
    +[CPLErrors invalidScopeErrorWithScopedIdentifier:v12];
    unsigned __int8 v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

    goto LABEL_24;
  }
  unsigned __int8 v13 = 0;
LABEL_24:

  return v13;
}

- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE uploadIdentifier = %@", v9, v6];

  if (v10)
  {
    BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
    *(&self->super._shouldUpgradeSchema + 1) = 0;
  }
  else if (a4)
  {
    *a4 = [v8 lastCPLError];
  }

  return v10;
}

- (id)resourceTypesToUploadForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CPLResourceTypeSet);
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v7 = [v6 pqlConnection];

  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [v7 cplFetch:@"SELECT resourceType FROM %@ WHERE uploadIdentifier = %@", v8, v4];

  if ([v9 next])
  {
    do
      objc_msgSend(v5, "addResourceType:", (int)objc_msgSend(v9, "intAtIndex:", 0));
    while (([v9 next] & 1) != 0);
  }

  return v5;
}

- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  uint64_t v7 = objc_opt_class();
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [v6 cplFetchObjectOfClass:v7, @"SELECT SUM(fileSize) FROM %@ WHERE uploadIdentifier = %@", v8, v4 sql];

  id v10 = [v9 unsignedLongLongValue];
  return (unint64_t)v10;
}

- (id)resourcesToUploadForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v7 = [v6 pqlConnection];

  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [v7 cplFetch:@"SELECT scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier FROM %@ WHERE uploadIdentifier = %@", v8, v4];

  if ([v9 next])
  {
    do
    {
      id v10 = [[CPLPrequeliteOutgoingResource alloc] initFromPQLResultSet:v9 error:0];
      int64_t v11 = [v10 resourceWithOutgoingResources:self];
      if (v11) {
        [v5 addObject:v11];
      }
    }
    while (([v9 next] & 1) != 0);
  }

  return v5;
}

- (BOOL)shouldUploadResource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemScopedIdentifier];
  int64_t v6 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    int64_t v8 = v6;
    id v9 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v11 = [v5 identifier];
    id v12 = [v4 resourceType];
    unsigned __int8 v13 = [v4 identity];
    v14 = [v13 fingerPrint];
    v15 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND itemIdentifier = %@ AND resourceType = %i AND fingerPrint = %@", v8, v11, v12, v14];
    unsigned __int8 v7 = [v9 table:v10 hasRecordsMatchingQuery:v15];
  }
  return v7;
}

- (void)_cacheCountOfOriginalsIfNecessary
{
  if (!*(&self->super._shouldUpgradeSchema + 1))
  {
    BOOL v3 = &self->_countOfOriginalsIsCached + 4;
    *(void *)(&self->_countOfOriginalsIsCached + 4) = 0;
    id v4 = (BOOL *)&self->_countOfOriginalImages + 4;
    *(unint64_t *)((char *)&self->_countOfOriginalImages + 4) = 0;
    id v5 = (BOOL *)&self->_countOfOriginalVideos + 4;
    *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4) = 0;
    int64_t v6 = [(CPLPrequeliteStorage *)self pqStore];
    id v12 = [v6 pqlConnection];

    unsigned __int8 v7 = [(CPLPrequeliteStorage *)self mainTable];
    id v8 = [v12 cplFetch:@"SELECT fileKind, count(fileKind) FROM %@ WHERE resourceType = %i GROUP BY fileKind", v7, 1];

    if ([v8 next])
    {
      do
      {
        unsigned int v9 = [v8 intAtIndex:0];
        id v10 = [v8 unsignedIntegerAtIndex:1];
        if (v9 == 1) {
          int64_t v11 = v4;
        }
        else {
          int64_t v11 = v5;
        }
        if (!v9) {
          int64_t v11 = v3;
        }
        *(void *)v11 += v10;
      }
      while (([v8 next] & 1) != 0);
    }
    *(&self->super._shouldUpgradeSchema + 1) = 1;
  }
}

- (unint64_t)countOfOriginalImages
{
  return *(void *)(&self->_countOfOriginalsIsCached + 4);
}

- (unint64_t)countOfOriginalVideos
{
  return *(unint64_t *)((char *)&self->_countOfOriginalImages + 4);
}

- (unint64_t)countOfOriginalOthers
{
  return *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4);
}

- (void)_cacheUploadSizesIfNecessary
{
  if (!BYTE4(self->_sizeOfOriginalResourcesToUpload))
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [v3 pqlConnection];

    uint64_t v4 = objc_opt_class();
    id v5 = [(CPLPrequeliteStorage *)self mainTable];
    id v6 = [v10 cplFetchObjectOfClass:v4, @"SELECT SUM(fileSize) FROM %@", v5 sql];
    *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) = (unint64_t)[v6 unsignedLongLongValue];

    uint64_t v7 = objc_opt_class();
    id v8 = [(CPLPrequeliteStorage *)self mainTable];
    id v9 = [v10 cplFetchObjectOfClass:v7, @"SELECT SUM(fileSize) FROM %@ WHERE resourceType = %i", v8, 1 sql];
    *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) = (unint64_t)[v9 unsignedLongLongValue];

    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 1;
  }
}

- (unint64_t)sizeOfResourcesToUpload
{
  return *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4);
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4);
}

- (id)recordsDesignation
{
  return @"resources";
}

- (id)status
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100194480;
  v15 = sub_100194490;
  id v16 = 0;
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v4 = [(CPLPrequeliteStorage *)self mainTable];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100194498;
  v10[3] = &unk_10027F290;
  v10[4] = self;
  v10[5] = &v11;
  [v3 table:v4 enumerateCountGroupedByUnsignedIntegerProperty:@"resourceType" block:v10];

  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLPrequeliteOutgoingResources;
    id v6 = [(CPLPrequeliteStorage *)&v9 status];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteOutgoingResources;
  v2 = [(CPLPrequeliteStorage *)&v4 statusPerScopeIndexWithGroupProperty:@"resourceType" valueDescription:&stru_10027F2D0];
  return v2;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPrequeliteOutgoingResources;
  [(CPLPrequeliteStorage *)&v3 writeTransactionDidFail];
  if (BYTE5(self->_sizeOfOriginalResourcesToUpload))
  {
    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
    *(&self->super._shouldUpgradeSchema + 1) = 0;
  }
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedResources:(id *)a6 error:(id *)a7
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  if (a4 >= 100) {
    int64_t v10 = 100;
  }
  else {
    int64_t v10 = a4;
  }
  id v11 = objc_alloc_init((Class)NSMutableIndexSet);
  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  uint64_t v13 = [(CPLPrequeliteStorage *)self pqStore];
  v14 = [v13 pqlConnection];

  v15 = [(CPLPrequeliteStorage *)self mainTable];
  id v16 = [v14 cplFetch:@"SELECT scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier, rowID FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v15, a3, v10];
  while (1)
  {

    if (![v16 next]) {
      break;
    }
    id v17 = [[CPLPrequeliteOutgoingResource alloc] initFromPQLResultSet:v16 error:a7];
    v15 = v17;
    if (!v17)
    {
      *((unsigned char *)v30 + 24) = 0;
      break;
    }
    unint64_t v18 = [v17 resourceWithScopeIdentifier:@"<DELETED_SCOPE>"];
    [v12 addObject:v18];
    objc_msgSend(v11, "addIndex:", objc_msgSend(v16, "integerAtIndex:", 8));
  }
  v19 = v30;
  if (*((unsigned char *)v30 + 24))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100194AA4;
    v25[3] = &unk_10027F2F8;
    v28 = &v29;
    id v20 = v14;
    id v26 = v20;
    v27 = self;
    [v11 enumerateIndexesUsingBlock:v25];
    if (a7 && !*((unsigned char *)v30 + 24))
    {
      *a7 = [v20 lastError];
    }

    v19 = v30;
    if (*((unsigned char *)v30 + 24))
    {
      *a5 = (int64_t)[v11 count];
      *a6 = v12;
      v19 = v30;
    }
  }
  BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
  BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
  *(&self->super._shouldUpgradeSchema + 1) = 0;
  char v21 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v29, 8);
  return v21;
}

@end