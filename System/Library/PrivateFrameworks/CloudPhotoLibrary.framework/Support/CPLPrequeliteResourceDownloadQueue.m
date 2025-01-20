@interface CPLPrequeliteResourceDownloadQueue
- (BOOL)_createResourceTypeAndStatusIndex;
- (BOOL)_deleteEnqueuedResource:(id)a3 error:(id *)a4;
- (BOOL)_getNextPosition:(unint64_t *)a3 andBumpWithError:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6;
- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations;
- (BOOL)initializeStorage;
- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)openWithError:(id *)a3;
- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 bumpRetryCount:(BOOL)a5 didDiscard:(BOOL *)a6 error:(id *)a7;
- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteResourceDownloadQueue)initWithAbstractObject:(id)a3;
- (id)_enqueuedResourceForResource:(id)a3 verifyScopeIndex:(BOOL)a4;
- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7;
- (id)enumeratorForDownloadedResources;
- (id)recordsDesignation;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)_countOfRecordsWithStatus:(int)a3;
- (unint64_t)countOfQueuedDownloadTasks;
- (unint64_t)newTaskIdentifier;
@end

@implementation CPLPrequeliteResourceDownloadQueue

- (CPLPrequeliteResourceDownloadQueue)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  v3 = [(CPLPrequeliteStorage *)&v11 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = [v3 variableWithName:@"nextTaskIdentifier" type:v4];
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = +[CPLPrequeliteType integerType];
    uint64_t v8 = [v3 variableWithName:@"nextPosition" type:v7];
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;
  }
  return (CPLPrequeliteResourceDownloadQueue *)v3;
}

- (BOOL)_createResourceTypeAndStatusIndex
{
  BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"resourceType.status" withDefinition:@"resourceType, status, intent, position DESC" unique:0 error:0];
  if (v3)
  {
    LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"status" withDefinition:@"status, intent, position DESC" unique:0 error:0];
  }
  return v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"position INTEGER NOT NULL,scopeIndex INTEGER NOT NULL,itemIdentifier TEXT NOT NULL,resourceType INTEGER NOT NULL,fingerPrint TEXT NOT NULL,fileUTI TEXT,fileSize INTEGER NOT NULL,taskIdentifier INTEGER NOT NULL,retryCount INTEGER NOT NULL,status INTEGER NOT NULL, intent INTEGER NOT NULL" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:&off_100292160 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4) defaultValue:&off_100292160 error:0];
        if (v3)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"resource" withDefinition:@"itemIdentifier, scopeIndex, resourceType" unique:1 error:0];
          if (v3)
          {
            BOOL v3 = [(CPLPrequeliteResourceDownloadQueue *)self _createResourceTypeAndStatusIndex];
            if (v3) {
              LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
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
  v23.receiver = self;
  v23.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  unsigned int v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v23, "upgradeStorageToVersion:");
  BOOL v6 = v5;
  if (a3 == 20 || !v5) {
    return v6;
  }
  BOOL v6 = 1;
  if (a3 <= 51)
  {
    if (a3 == 33)
    {
      uint64_t v8 = [(CPLPrequeliteStorage *)self pqStore];
      v9 = [v8 pqlConnection];

      v10 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned __int8 v11 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN fileSize INTEGER DEFAULT 0", v10, v22];
LABEL_43:
      BOOL v6 = v11;
    }
    else
    {
      if (a3 != 39)
      {
        if (a3 == 49
          && [(CPLPrequeliteStorage *)self shouldUpgradeSchema]
          && !BYTE4(self->_nextPosition))
        {
          if ([(CPLPrequeliteStorage *)self dropIndexWithName:@"resource" error:0]&& [(CPLPrequeliteStorage *)self createIndexWithName:@"resource" withDefinition:@"itemIdentifier, scopeIndex, resourceType" unique:1 error:0])
          {
            BYTE4(self->_nextPosition) = 1;
          }
          else
          {
            return 0;
          }
        }
        return v6;
      }
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      if (!_CPLSilentLogging)
      {
        v12 = sub_10019FCA8();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138412546;
          v25 = v13;
          __int16 v26 = 2048;
          uint64_t v27 = 39;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding scopeIndex column", buf, 0x16u);
        }
      }
      v14 = [(CPLPrequeliteStorage *)self pqStore];
      v9 = [v14 pqlConnection];

      v15 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v16 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v15];

      if (v16
        && [(CPLPrequeliteStorage *)self dropIndexWithName:@"resource" error:0]
        && (BOOL v6 = 1,
            [(CPLPrequeliteStorage *)self createIndexWithName:@"resource" withDefinition:@"itemIdentifier, scopeIndex, resourceType" unique:1 error:0]))
      {
        BYTE4(self->_nextPosition) = 1;
      }
      else
      {
        BOOL v6 = 0;
      }
    }

    return v6;
  }
  switch(a3)
  {
    case ':':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if ([(CPLPrequeliteStorage *)self dropIndexWithName:@"position" error:0]
          && [(CPLPrequeliteStorage *)self dropIndexWithName:@"status" error:0])
        {
          unsigned __int8 v7 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"resourceType" error:0];
          goto LABEL_40;
        }
        return 0;
      }
      break;
    case ';':
    case '<':
    case '=':
    case '>':
    case '?':
    case '@':
      return v6;
    case 'A':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if (!_CPLSilentLogging)
        {
          v17 = sub_10019FCA8();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [(CPLPrequeliteStorage *)self mainTable];
            *(_DWORD *)buf = 138412546;
            v25 = v18;
            __int16 v26 = 2048;
            uint64_t v27 = 65;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding intent column", buf, 0x16u);
          }
        }
        v19 = [(CPLPrequeliteStorage *)self pqStore];
        v9 = [v19 pqlConnection];

        v10 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned __int8 v11 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN intent INTEGER DEFAULT 1", v10, v22];
        goto LABEL_43;
      }
      break;
    case 'B':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if ([(CPLPrequeliteStorage *)self dropIndexWithName:@"resourceType.status" error:0]&& [(CPLPrequeliteStorage *)self dropIndexWithName:@"status" error:0])
        {
          unsigned __int8 v7 = [(CPLPrequeliteResourceDownloadQueue *)self _createResourceTypeAndStatusIndex];
          goto LABEL_40;
        }
        return 0;
      }
      break;
    case 'C':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        v20 = [(CPLPrequeliteStorage *)self pqStore];
        v9 = [v20 pqlConnection];

        v10 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE intent = %i", v10, 5];
        goto LABEL_43;
      }
      break;
    default:
      if (a3 == 52 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        unsigned __int8 v7 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
LABEL_40:
        BOOL v6 = v7;
      }
      break;
  }
  return v6;
}

- (BOOL)openWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  if (!-[CPLPrequeliteStorage openWithError:](&v10, "openWithError:")) {
    return 0;
  }
  unsigned int v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];

  unsigned __int8 v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET status = %i WHERE status = %i", v7, 1, 0];

  if (a3 && (v8 & 1) == 0)
  {
    *a3 = [v6 lastCPLError];
  }

  return v8;
}

- (unint64_t)newTaskIdentifier
{
  BOOL v3 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  v4 = (char *)[v3 unsignedIntegerValue];

  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:v4 + 1];
  uint64_t v6 = *(void *)(&self->super._shouldUpgradeSchema + 1);
  id v11 = 0;
  unsigned __int8 v7 = [(CPLPrequeliteStorage *)self setValue:v5 forVariable:v6 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    v9 = sub_10019FCA8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to store next task identifier: %@", buf, 0xCu);
    }
  }
  return (unint64_t)v4;
}

- (BOOL)_getNextPosition:(unint64_t *)a3 andBumpWithError:(id *)a4
{
  unsigned __int8 v7 = [(CPLPrequeliteStorage *)self valueForVariable:*(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4)];
  *a3 = (unint64_t)[v7 unsignedIntegerValue];

  id v8 = +[NSNumber numberWithUnsignedInteger:*a3 + 1];
  LOBYTE(a4) = [(CPLPrequeliteStorage *)self setValue:v8 forVariable:*(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4) error:a4];

  return (char)a4;
}

- (BOOL)_deleteEnqueuedResource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 itemScopedIdentifier];
  id v8 = [v7 scopeIndex];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_1001D28F8();
  }
  id v9 = v8;
  objc_super v10 = [(CPLPrequeliteStorage *)self pqStore];
  id v11 = [v10 pqlConnection];

  v12 = [(CPLPrequeliteStorage *)self mainTable];
  id v13 = [v7 identifier];
  unsigned __int8 v14 = [v11 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v12, v13, objc_msgSend(v6, "resourceType"), v9];

  if (a4 && (v14 & 1) == 0)
  {
    *a4 = [v11 lastCPLError];
  }

  return v14;
}

- (id)_enqueuedResourceForResource:(id)a3 verifyScopeIndex:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 itemScopedIdentifier];
  id v8 = v7;
  if (a4)
  {
    id v9 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v7];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = [v7 scopeIndex];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_1001D29AC();
    }
  }
  id v11 = [(CPLPrequeliteStorage *)self pqStore];
  v12 = [v11 pqlConnection];

  uint64_t v13 = objc_opt_class();
  unsigned __int8 v14 = [(CPLPrequeliteStorage *)self mainTable];
  v15 = [v8 identifier];
  id v10 = [v12 cplFetchObjectOfClass:v13, @"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v14, v15, objc_msgSend(v6, "resourceType"), v9 sql];

LABEL_6:
  return v10;
}

- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = [v10 itemScopedIdentifier];
  if ([(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v11] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v38 = 0;
    if (![(CPLPrequeliteResourceDownloadQueue *)self _getNextPosition:&v38 andBumpWithError:a6])goto LABEL_8; {
    v28 = a6;
    }
    id v36 = v10;
    uint64_t v13 = [[CPLPrequeliteDownloadResource alloc] initWithResource:v10];
    [(CPLPrequeliteDownloadResource *)v13 setPosition:v38];
    [(CPLPrequeliteDownloadResource *)v13 setStatus:!v7];
    [(CPLPrequeliteDownloadResource *)v13 setIntent:a4];
    unsigned __int8 v14 = [(CPLPrequeliteStorage *)self pqStore];
    v37 = [v14 pqlConnection];

    v34 = [(CPLPrequeliteStorage *)self mainTable];
    id v32 = [(CPLPrequeliteDownloadResource *)v13 position];
    id v30 = [(CPLPrequeliteDownloadResource *)v13 scopeIndex];
    v15 = [(CPLPrequeliteDownloadResource *)v13 itemIdentifier];
    id v29 = [(CPLPrequeliteDownloadResource *)v13 resourceType];
    unsigned int v16 = [(CPLPrequeliteDownloadResource *)v13 fingerPrint];
    v17 = [(CPLPrequeliteDownloadResource *)v13 fileUTI];
    v18 = v37;
    unsigned int v19 = [v37 cplExecute:@"INSERT OR IGNORE INTO %@ (position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent) VALUES (%lu, %ld, %@, %i, %@, %@, %lu, %lu, %i, %i, %lu)", v34, v32, v30, v15, v29, v16, v17, -[CPLPrequeliteDownloadResource fileSize](v13, "fileSize"), -[CPLPrequeliteDownloadResource taskIdentifier](v13, "taskIdentifier"), -[CPLPrequeliteDownloadResource retryCount](v13, "retryCount"), -[CPLPrequeliteDownloadResource status](v13, "status"), -[CPLPrequeliteDownloadResource intent](v13, "intent")];

    if (v19)
    {
      if ([v37 changes])
      {
        unsigned __int8 v12 = 1;
LABEL_20:

        goto LABEL_21;
      }
      if ([(CPLPrequeliteResourceDownloadQueue *)self _deleteEnqueuedResource:v10 error:v28])
      {
        if (!_CPLSilentLogging)
        {
          v21 = sub_10019FCA8();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v22 = +[CPLResourceTransferTaskOptions descriptionForIntent:[(CPLPrequeliteDownloadResource *)v13 intent]];
            *(_DWORD *)buf = 138412546;
            id v40 = v10;
            __int16 v41 = 2112;
            v42 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "New background download will superseeds current enqueued one for %@, intent: %@", buf, 0x16u);
          }
        }
        v35 = [(CPLPrequeliteStorage *)self mainTable];
        id v33 = [(CPLPrequeliteDownloadResource *)v13 position];
        id v31 = [(CPLPrequeliteDownloadResource *)v13 scopeIndex];
        objc_super v23 = [(CPLPrequeliteDownloadResource *)v13 itemIdentifier];
        id v24 = [(CPLPrequeliteDownloadResource *)v13 resourceType];
        v25 = [(CPLPrequeliteDownloadResource *)v13 fingerPrint];
        __int16 v26 = [(CPLPrequeliteDownloadResource *)v13 fileUTI];
        unsigned __int8 v12 = [v37 cplExecute:@"INSERT INTO %@ (position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent) VALUES (%lu, %ld, %@, %i, %@, %@, %lu, %lu, %i, %i, %lu)", v35, v33, v31, v23, v24, v25, v26, -[CPLPrequeliteDownloadResource fileSize](v13, "fileSize"), -[CPLPrequeliteDownloadResource taskIdentifier](v13, "taskIdentifier"), -[CPLPrequeliteDownloadResource retryCount](v13, "retryCount"), -[CPLPrequeliteDownloadResource status](v13, "status"), -[CPLPrequeliteDownloadResource intent](v13, "intent")];

        v20 = v28;
        if (!v28)
        {
          id v10 = v36;
          v18 = v37;
          goto LABEL_20;
        }
        id v10 = v36;
        v18 = v37;
        if (v12) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
    }
    else
    {
      v20 = v28;
      if (v28)
      {
LABEL_10:
        [v18 lastCPLError];
        unsigned __int8 v12 = 0;
        id *v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    unsigned __int8 v12 = 0;
    goto LABEL_20;
  }
  if (!a6)
  {
LABEL_8:
    unsigned __int8 v12 = 0;
    goto LABEL_21;
  }
  +[CPLErrors invalidScopeErrorWithScopedIdentifier:v11];
  unsigned __int8 v12 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v12;
}

- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 bumpRetryCount:(BOOL)a5 didDiscard:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v13 = [(CPLPrequeliteResourceDownloadQueue *)self _enqueuedResourceForResource:v12 verifyScopeIndex:0];
  unsigned __int8 v14 = v13;
  *a6 = 0;
  if (v13)
  {
    if ([v13 taskIdentifier] == (id)a4)
    {
      v15 = [(CPLPrequeliteStorage *)self pqStore];
      unsigned int v16 = [v15 pqlConnection];

      v17 = [v12 itemScopedIdentifier];
      id v18 = [v17 scopeIndex];
      if (v18 == (id)0x7FFFFFFFFFFFFFFFLL) {
        sub_1001D2A60();
      }
      id v19 = v18;
      if (v9)
      {
        int v20 = [v14 retryCount];
        if (v20 < 10)
        {
          uint64_t v28 = (v20 + 1);
          id v29 = [(CPLPrequeliteStorage *)self mainTable];
          id v30 = [v17 identifier];
          unsigned __int8 v22 = -[NSObject cplExecute:](v16, "cplExecute:", @"UPDATE %@ SET retryCount = %i, status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v29, v28, 2, v30, [v12 resourceType], v19);

          if (a7 && (v22 & 1) == 0)
          {
            [v16 lastCPLError];
            unsigned __int8 v22 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v21 = sub_10019FCA8();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v12;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Discarding background download of %@: failed too many times", buf, 0xCu);
            }
          }
          unsigned __int8 v22 = [(CPLPrequeliteResourceDownloadQueue *)self _deleteEnqueuedResource:v12 error:a7];
          *a6 = 1;
        }
      }
      else
      {
        id v24 = [(CPLPrequeliteStorage *)self pqStore];
        v25 = [v24 pqlConnection];

        __int16 v26 = [(CPLPrequeliteStorage *)self mainTable];
        uint64_t v27 = [v17 identifier];
        unsigned __int8 v22 = [v25 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v26, 2, v27, objc_msgSend(v12, "resourceType"), v19];

        if (a7 && (v22 & 1) == 0)
        {
          *a7 = [v25 lastCPLError];
        }
      }
      goto LABEL_27;
    }
    if (!_CPLSilentLogging)
    {
      unsigned int v16 = sub_10019FCA8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v12;
        objc_super v23 = "Dropping background download of %@ as the current enqueued task superseeeds it";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_29:
    unsigned __int8 v22 = 1;
    goto LABEL_28;
  }
  if (_CPLSilentLogging) {
    goto LABEL_29;
  }
  unsigned int v16 = sub_10019FCA8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v12;
    objc_super v23 = "Dropping background download of %@ as it has been removed from the queue";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v23, buf, 0xCu);
  }
LABEL_18:
  unsigned __int8 v22 = 1;
LABEL_27:

LABEL_28:
  return v22;
}

- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [v8 itemScopedIdentifier];
  id v10 = [v9 scopeIndex];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_1001D2B14();
  }
  id v11 = v10;
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v13 = [v12 pqlConnection];

  unsigned __int8 v14 = [(CPLPrequeliteStorage *)self mainTable];
  v15 = [v9 identifier];
  unsigned __int8 v16 = [v13 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND taskIdentifier = %lu AND scopeIndex = %ld", v14, 3, v15, objc_msgSend(v8, "resourceType"), a4, v11];

  if (a5 && (v16 & 1) == 0)
  {
    *a5 = [v13 lastCPLError];
  }

  return v16;
}

- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [v8 itemScopedIdentifier];
  id v10 = [v9 scopeIndex];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_1001D2BC8();
  }
  id v11 = v10;
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v13 = [v12 pqlConnection];

  unsigned __int8 v14 = [(CPLPrequeliteStorage *)self mainTable];
  v15 = [v9 identifier];
  unsigned __int8 v16 = [v13 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND taskIdentifier = %lu AND scopeIndex = %ld", v14, v15, objc_msgSend(v8, "resourceType"), a4, v11];

  if (a5 && (v16 & 1) == 0)
  {
    *a5 = [v13 lastCPLError];
  }

  return v16;
}

- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7
{
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v13 = [v12 pqlConnection];

  uint64_t v14 = [(CPLPrequeliteStorage *)self mainTable];
  v15 = (void *)v14;
  if (a3 == -1) {
    id v16 = [v13 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i AND intent = %i ORDER BY position", v14, 1, a4, v33];
  }
  else {
    id v16 = [v13 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i AND resourceType = %i AND intent = %i ORDER BY position", v14, 1, a3, a4];
  }
  v17 = v16;

  if (!v17)
  {
    id v29 = [v13 lastCPLError];
    id v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = +[CPLErrors unknownError];
    }
    uint64_t v28 = v31;

    id v11 = 0;
    if (!a7) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v17 enumerateObjectsOfClass:objc_opt_class()];
  id v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v41)
  {
    v34 = v17;
    v37 = v13;
    v35 = a7;
    unint64_t v18 = 0;
    uint64_t v40 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        int v20 = [*(id *)(*((void *)&v42 + 1) + 8 * i) resourceWithDownloadQueue:self];
        v21 = v20;
        if (v20)
        {
          id v22 = [v20 estimatedResourceSize];
          id v23 = v22;
          if ((a5 <= v18 || a5 - v18 < (unint64_t)v22) && [v11 count])
          {
            uint64_t v28 = 0;
            a7 = v35;
            uint64_t v13 = v37;
            goto LABEL_31;
          }
          id v24 = [v21 itemScopedIdentifier];
          if ([v24 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
            sub_1001D2C7C();
          }
          v25 = [(CPLPrequeliteStorage *)self mainTable];
          __int16 v26 = [v24 identifier];
          unsigned __int8 v27 = [v37 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v25, 0, v26, objc_msgSend(v21, "resourceType"), objc_msgSend(v24, "scopeIndex")];

          if ((v27 & 1) == 0)
          {
            uint64_t v13 = v37;
            uint64_t v28 = [v37 lastCPLError];

            id v11 = 0;
            goto LABEL_26;
          }
          [v11 addObject:v21];
          if ((unint64_t)[v11 count] >= a6)
          {
            uint64_t v28 = 0;
            uint64_t v13 = v37;
LABEL_26:

            a7 = v35;
LABEL_31:
            v17 = v34;

            goto LABEL_32;
          }
          v18 += (unint64_t)v23;
        }
      }
      id v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v41) {
        continue;
      }
      break;
    }
    uint64_t v28 = 0;
    v17 = v34;
    a7 = v35;
    uint64_t v13 = v37;
  }
  else
  {
    uint64_t v28 = 0;
  }
LABEL_32:

  if (a7)
  {
LABEL_33:
    if (!v11) {
      *a7 = v28;
    }
  }
LABEL_35:

  return v11;
}

- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3
{
  unsigned int v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  BOOL v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET status = %i WHERE status = %i", v7, 1, 2];

  if (a3 && (v8 & 1) == 0)
  {
    *a3 = [v6 lastCPLError];
  }

  return v8;
}

- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v6];
      unsigned __int8 v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    id v12 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v13 = [v6 identifier];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if (a4 && (v8 & 1) == 0)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (id)enumeratorForDownloadedResources
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  v4 = [v3 pqlConnection];

  unsigned int v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = [v4 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i", v5, 3];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A1B4C;
  v10[3] = &unk_10027EE80;
  v10[4] = self;
  int64_t v7 = [v6 enumerateObjects:v10];
  unsigned __int8 v8 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v7];

  return v8;
}

- (unint64_t)_countOfRecordsWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  int64_t v7 = +[PQLFormatInjection formatInjection:@"status = %i", v3];
  id v8 = [v5 table:v6 countOfRecordsMatchingQuery:v7];

  return (unint64_t)v8;
}

- (unint64_t)countOfQueuedDownloadTasks
{
  return [(CPLPrequeliteResourceDownloadQueue *)self _countOfRecordsWithStatus:1];
}

- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations
{
  uint64_t v3 = [(CPLPrequeliteStorage *)self pqStore];
  v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v5 = +[PQLFormatInjection formatInjection:@"status != %i", 3];
  unsigned __int8 v6 = [v3 table:v4 hasRecordsMatchingQuery:v5];

  return v6;
}

- (id)recordsDesignation
{
  return @"resources";
}

- (id)status
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = sub_1001A1F70;
  id v19 = sub_1001A1F80;
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  uint64_t v3 = [(CPLPrequeliteStorage *)&v14 status];
  id v20 = [v3 mutableCopy];

  unint64_t v4 = [(CPLPrequeliteResourceDownloadQueue *)self _countOfRecordsWithStatus:2];
  unint64_t v5 = [(CPLPrequeliteResourceDownloadQueue *)self _countOfRecordsWithStatus:3];
  unint64_t v6 = [(CPLPrequeliteResourceDownloadQueue *)self _countOfRecordsWithStatus:0];
  if (v4) {
    objc_msgSend((id)v16[5], "appendFormat:", @" (%lu to retry)", v4);
  }
  if (v5) {
    objc_msgSend((id)v16[5], "appendFormat:", @" (%lu downloaded)", v5);
  }
  if (v6) {
    objc_msgSend((id)v16[5], "appendFormat:", @" (%lu downloading)", v6);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 1;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A1F88;
  v11[3] = &unk_10027F610;
  v11[4] = v12;
  v11[5] = &v15;
  [v7 table:v8 enumerateCountGroupedByUnsignedIntegerProperty:@"resourceType" block:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteResourceDownloadQueue;
  v2 = [(CPLPrequeliteStorage *)&v4 statusPerScopeIndexWithGroupProperty:@"resourceType" valueDescription:&stru_10027F630];
  return v2;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v11 pqlConnection];

  char v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }
  else if (a6)
  {
    *a6 = [v12 lastError];
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_nextTaskIdentifier + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end