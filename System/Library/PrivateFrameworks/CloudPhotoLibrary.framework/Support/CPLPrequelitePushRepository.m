@interface CPLPrequelitePushRepository
- (BOOL)_createFlagsIndexes;
- (BOOL)_createIndexForFlags:(int64_t)a3;
- (BOOL)_createIndexesWithPriority:(BOOL)a3;
- (BOOL)_mergeChange:(id)a3 overChange:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6;
- (BOOL)_overwriteChange:(id)a3 pushContext:(id)a4 error:(id *)a5;
- (BOOL)_storeChange:(id)a3 update:(BOOL)a4 error:(id *)a5;
- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4;
- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6;
- (BOOL)deleteAllChangesWithError:(id *)a3;
- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 discardedUploadIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedUploadIdentifiers:(id *)a6 error:(id *)a7;
- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4;
- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (BOOL)hasChangesWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)isEmpty;
- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 discardedUploadIdentifier:(id *)a5 overwrittenRecord:(BOOL *)a6 error:(id *)a7;
- (BOOL)resetPriorityForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6;
- (BOOL)storeChange:(id)a3 pushContext:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6;
- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequelitePushRepository)initWithAbstractObject:(id)a3;
- (id)_allChangesWithScopeIdentifier:(id)a3 scopeIndex:(int64_t)a4 ordered:(BOOL)a5 table:(id)a6 query:(id)a7;
- (id)_injectionForChangeType:(unint64_t)a3;
- (id)_pqlChangeWithScopedIdentifier:(id)a3;
- (id)_scopedIdentifierForIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4 table:(id)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5 table:(id)a6;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5 table:(id)a6;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4 table:(id)a5;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allChangesWithScopeIdentifier:(id)a3 table:(id)a4;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 table:(id)a5;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4;
- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4;
- (id)countPerFlagsForScopeWithIdentifier:(id)a3;
- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (id)storedExtractedBatch;
- (int64_t)_scopeIndexForScopeIdentifier:(id)a3;
- (int64_t)_scopeIndexForScopedIdentifier:(id)a3;
- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3;
- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequelitePushRepository

- (CPLPrequelitePushRepository)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequelitePushRepository;
  v3 = [(CPLPrequeliteStorage *)&v10 initWithAbstractObject:a3];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v4;

    v6 = +[CPLPrequeliteType dataType];
    uint64_t v7 = [v3 variableWithName:@"extractedBatch" type:v6];
    v8 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v7;

    [*(id *)(v3 + 44) setShouldNotCacheValue:1];
  }
  return (CPLPrequelitePushRepository *)v3;
}

- (BOOL)_createIndexForFlags:(int64_t)a3
{
  v6 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v7 = [v6 pqlConnection];

  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"flags%ld", a3);
  v9 = [(CPLPrequeliteStorage *)self mainTable];
  objc_super v10 = +[CPLPrequeliteVariable indexVariableForVariableWithName:v8 forTable:v9];

  id v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"(flags & %ld) != 0", a3);
  id v12 = objc_alloc((Class)PQLRawInjection);
  v13 = [v11 dataUsingEncoding:4];
  id v14 = [v12 initWithData:v13];

  v15 = [(CPLPrequeliteStorage *)self mainTable];
  LOBYTE(v13) = [v7 cplExecute:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (scopeIndex, flags) WHERE %@", v10, v15, v14];

  return (char)v13;
}

- (BOOL)_createFlagsIndexes
{
  BOOL v3 = [(CPLPrequelitePushRepository *)self _createIndexForFlags:1];
  if (v3)
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 2) {
        break;
      }
      unsigned __int8 v6 = [(CPLPrequelitePushRepository *)self _createIndexForFlags:qword_1002517C8[v4 + 1]];
      unint64_t v4 = v5 + 1;
    }
    while ((v6 & 1) != 0);
    LOBYTE(v3) = v5 > 1;
  }
  return v3;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  if (BYTE4(self->_batchStoragesPerPriority))
  {
    id v10 = a4;
    id v11 = [a3 stringByAppendingString:@".pri"];
    id v12 = objc_msgSend(@"priority, ", "stringByAppendingString:", v10);

    v15.receiver = self;
    v15.super_class = (Class)CPLPrequelitePushRepository;
    BOOL v13 = [(CPLPrequeliteStorage *)&v15 createIndexWithName:v11 withDefinition:v12 unique:v7 error:a6];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CPLPrequelitePushRepository;
    id v11 = a4;
    BOOL v13 = [(CPLPrequeliteStorage *)&v16 createIndexWithName:a3 withDefinition:v11 unique:v7 error:a6];
  }

  return v13;
}

- (BOOL)_createIndexesWithPriority:(BOOL)a3
{
  BYTE4(self->_batchStoragesPerPriority) = a3;
  unsigned int v4 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"scopeIndex, identifier" unique:0 error:0];
  BOOL result = 0;
  if (v4)
  {
    unsigned int v6 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"relatedIdentifier" withDefinition:@"class, scopeIndex, relatedIdentifier" unique:0 error:0];
    BOOL result = 0;
    if (v6)
    {
      unsigned int v7 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"secondaryIdentifier" withDefinition:@"class, scopeIndex, secondaryIdentifier" unique:0 error:0];
      BOOL result = 0;
      if (v7)
      {
        unsigned int v8 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"class" withDefinition:@"scopeIndex, class, dequeueOrder DESC" unique:0 error:0];
        BOOL result = 0;
        if (v8)
        {
          unsigned int v9 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"dequeueOrder" withDefinition:@"scopeIndex, dequeueOrder DESC" unique:0 error:0];
          BOOL result = 0;
          if (v9)
          {
            unsigned int v10 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"class.trashed" withDefinition:@"scopeIndex, class, trashed, dequeueOrder DESC" unique:0 error:0];
            BOOL result = 0;
            if (v10)
            {
              unsigned int v11 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"class.changeType" withDefinition:@"scopeIndex, class, changeType, dequeueOrder DESC" unique:0 error:0];
              BOOL result = 0;
              if (v11) {
                BOOL result = [(CPLPrequelitePushRepository *)self createIndexWithName:@"flags" withDefinition:@"scopeIndex, flags" unique:0 error:0];
              }
            }
          }
        }
      }
    }
  }
  BYTE4(self->_batchStoragesPerPriority) = 0;
  return result;
}

- (BOOL)initializeStorage
{
  v7.receiver = self;
  v7.super_class = (Class)CPLPrequelitePushRepository;
  BOOL v3 = [(CPLPrequeliteStorage *)&v7 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"class TEXT NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,changeType INTEGER NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,dequeueOrder INTEGER NOT NULL,trashed INTEGER NOT NULL,uploadIdentifier TEXT,flags INTEGER NOT NULL DEFAULT 0,priority INTEGER NOT NULL DEFAULT 0,trustLevel INTEGER NOT NULL DEFAULT 0,serializedRecord DATA" error:0];
    if (v3)
    {
      unsigned int v4 = [(CPLPrequelitePushRepository *)self _createIndexesWithPriority:0];
      LOBYTE(v3) = 0;
      if (v4)
      {
        BOOL v3 = [(CPLPrequelitePushRepository *)self _createIndexesWithPriority:1];
        if (v3)
        {
          uint64_t v5 = *(uint64_t *)((char *)&self->_injectionPerChangeType + 4);
          if (!v5
            || (BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:v5 defaultValue:0 error:0]))
          {
            LOBYTE(v3) = [(CPLPrequelitePushRepository *)self _createFlagsIndexes];
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequelitePushRepository;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 fixStorageAfterAnyVersionChange];
  if (v3) {
    LOBYTE(v3) = [(CPLPrequelitePushRepository *)self _createFlagsIndexes];
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v64.receiver = self;
  v64.super_class = (Class)CPLPrequelitePushRepository;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v64, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 57)
  {
    if (a3 <= 38)
    {
      if (a3 == 31) {
        return [(CPLPrequeliteStorage *)self createStorage];
      }
      if (a3 != 32 || ![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      v18 = [(CPLPrequeliteStorage *)self pqStore];
      v19 = [v18 pqlConnection];

      v20 = [(CPLPrequeliteStorage *)self pqStore];
      v21 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v22 = [v20 tableHasRecords:v21];

      if (v22)
      {
        v23 = [(CPLPrequeliteStorage *)self pqStore];
        [v23 recordUpgradeEvent:@"Adding trust level column will mark all existing changes as un-trustable"];
      }
      v24 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned __int8 v5 = [v19 cplExecute:@"ALTER TABLE %@ ADD COLUMN trustLevel INTEGER DEFAULT 2", v24];

      goto LABEL_81;
    }
    if (a3 != 39)
    {
      if (a3 != 48)
      {
        if (a3 == 57)
        {
          unsigned int v6 = [(CPLPrequeliteStorage *)self pqStore];
          objc_super v7 = [(CPLPrequeliteStorage *)self mainTable];
          unsigned int v8 = [v6 tableHasRecords:v7];

          if (v8)
          {
            unsigned int v9 = [(CPLPrequeliteStorage *)self pqStore];
            unsigned int v10 = [v9 abstractObject];
            unsigned int v11 = [v10 scopes];
            id v12 = [v11 platformObject];

            unsigned __int8 v5 = [v12 forcePushToTransportForActiveScopesWithError:0];
          }
          else
          {
            return 1;
          }
        }
        return v5;
      }
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      return [(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord" oldFields:@"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord" error:0];
    }
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    if ([(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord" oldFields:@"class, 1, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, 0, 0, trustLevel, serializedRecord" error:0])
    {
      if (!*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4)) {
        return v5;
      }
      v47 = [(CPLPrequelitePushRepository *)self storedExtractedBatch];
      v19 = v47;
      if (v47)
      {
        [v47 forceScopeIndexOnAllRecordsTo:1];
        unsigned __int8 v48 = [(CPLPrequelitePushRepository *)self storeExtractedBatch:v19 error:0];
LABEL_64:
        unsigned __int8 v5 = v48;
      }
LABEL_81:

      return v5;
    }
    return 0;
  }
  if (a3 > 74)
  {
    if (a3 == 75)
    {
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      if (!_CPLSilentLogging)
      {
        v49 = sub_1001B2590();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138412546;
          v66 = v50;
          __int16 v67 = 2048;
          uint64_t v68 = 75;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding flags column", buf, 0x16u);
        }
      }
      v51 = [(CPLPrequeliteStorage *)self pqStore];
      v19 = [v51 pqlConnection];

      v52 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v53 = [v19 cplExecute:@"ALTER TABLE %@ ADD COLUMN flags INTEGER DEFAULT 0", v52];

      if (v53)
      {
        unsigned __int8 v48 = [(CPLPrequelitePushRepository *)self createIndexWithName:@"flags" withDefinition:@"scopeIndex, flags" unique:0 error:0];
        goto LABEL_64;
      }
    }
    else
    {
      if (a3 != 83)
      {
        if (a3 == 84 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
        {
          if (!_CPLSilentLogging)
          {
            BOOL v13 = sub_1001B2590();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [(CPLPrequeliteStorage *)self mainTable];
              *(_DWORD *)buf = 138412546;
              v66 = v14;
              __int16 v67 = 2048;
              uint64_t v68 = 84;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding indexes for local conflict resolution", buf, 0x16u);
            }
          }
          unsigned __int8 v5 = 0;
          if ([(CPLPrequelitePushRepository *)self createIndexWithName:@"relatedIdentifier.all" withDefinition:@"scopeIndex, relatedIdentifier" unique:0 error:0])
          {
            CFStringRef v15 = @"secondaryIdentifier.all";
            CFStringRef v16 = @"scopeIndex, secondaryIdentifier";
            return [(CPLPrequelitePushRepository *)self createIndexWithName:v15 withDefinition:v16 unique:0 error:0];
          }
        }
        return v5;
      }
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      if (!_CPLSilentLogging)
      {
        v54 = sub_1001B2590();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138412546;
          v66 = v55;
          __int16 v67 = 2048;
          uint64_t v68 = 83;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding priority column", buf, 0x16u);
        }
      }
      v56 = [(CPLPrequeliteStorage *)self pqStore];
      v19 = [v56 pqlConnection];

      v57 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v58 = [v19 cplExecute:@"ALTER TABLE %@ ADD COLUMN priority INTEGER DEFAULT 0", v57];

      if (v58)
      {
        unsigned __int8 v48 = [(CPLPrequelitePushRepository *)self _createIndexesWithPriority:1];
        goto LABEL_64;
      }
    }
    unsigned __int8 v5 = 0;
    goto LABEL_81;
  }
  if (a3 == 58)
  {
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    if (![(CPLPrequeliteStorage *)self dropIndexWithName:@"class" error:0]
      || ![(CPLPrequeliteStorage *)self dropIndexWithName:@"dequeueOrder" error:0]
      || ![(CPLPrequeliteStorage *)self dropIndexWithName:@"class.trashed" error:0]|| ![(CPLPrequeliteStorage *)self dropIndexWithName:@"class.changeType" error:0])
    {
      return 0;
    }
    unsigned __int8 v5 = 0;
    if (![(CPLPrequelitePushRepository *)self createIndexWithName:@"relatedIdentifier" withDefinition:@"class, scopeIndex, relatedIdentifier" unique:0 error:0])return v5; {
    unsigned __int8 v5 = 0;
    }
    if (![(CPLPrequelitePushRepository *)self createIndexWithName:@"secondaryIdentifier" withDefinition:@"class, scopeIndex, secondaryIdentifier" unique:0 error:0])return v5; {
    unsigned __int8 v5 = 0;
    }
    if (![(CPLPrequelitePushRepository *)self createIndexWithName:@"class" withDefinition:@"scopeIndex, class, dequeueOrder DESC" unique:0 error:0])return v5; {
    unsigned __int8 v5 = 0;
    }
    if (![(CPLPrequelitePushRepository *)self createIndexWithName:@"class.trashed" withDefinition:@"scopeIndex, class, trashed, dequeueOrder DESC" unique:0 error:0])return v5; {
    CFStringRef v15 = @"class.changeType";
    }
    CFStringRef v16 = @"scopeIndex, class, changeType, dequeueOrder DESC";
    return [(CPLPrequelitePushRepository *)self createIndexWithName:v15 withDefinition:v16 unique:0 error:0];
  }
  if (a3 == 63 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
  {
    if (!_CPLSilentLogging)
    {
      v25 = sub_1001B2590();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(CPLPrequeliteStorage *)self mainTable];
        *(_DWORD *)buf = 138412546;
        v66 = v26;
        __int16 v67 = 2048;
        uint64_t v68 = 63;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding serializedRecord column", buf, 0x16u);
      }
    }
    v27 = [(CPLPrequeliteStorage *)self pqStore];
    v28 = [v27 pqlConnection];

    v29 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v30 = [v28 cplExecute:@"ALTER TABLE %@ ADD COLUMN serializedRecord DATA DEFAULT NULL", v29];

    if (v30)
    {
      v31 = [(CPLPrequeliteStorage *)self pqStore];
      v32 = [v31 clientCache];
      uint64_t v33 = [v32 mainTable];

      v34 = [(CPLPrequeliteStorage *)self mainTable];
      v62 = (void *)v33;
      v63 = v28;
      id v35 = [v28 cplFetch:@"SELECT %@.rowid, %@.changeType, %@.serializedRecord FROM %@, %@ WHERE %@.scopeIndex = %@.scopeIndex AND %@.identifier = %@.identifier AND (changeType != %ld AND changeType != %ld)", v34, v34, v33, v34, v33, v34, v33, v34, v33, 1024, 0];
      uint64_t v36 = 0;
      char v37 = 1;
      while ([v35 next])
      {
        id v39 = [v35 integerAtIndex:0];
        id v40 = [v35 integerAtIndex:1];
        v41 = [v35 cplChangeAtIndex:2];
        v42 = v41;
        if (v41)
        {
          id v43 = [v41 copyChangeType:v40];
          uint64_t v44 = +[CPLArchiver archivedDataWithRootObject:v43];
          v45 = (void *)v44;
          if (v44)
          {
            unsigned int v46 = [v63 execute:@"UPDATE %@ SET serializedRecord = %@ WHERE rowid = %ld", v34, v44, v39];
            char v37 = v46;
            v36 += v46;
          }
        }
        if ((v37 & 1) == 0) {
          goto LABEL_89;
        }
      }
      if (v37)
      {
        if ([v63 execute:@"UPDATE %@ SET serializedRecord = (SELECT serializedRecord FROM %@ WHERE scopeIndex = %@.scopeIndex AND identifier = %@.identifier) WHERE changeType = %ld", v34, v62, v34, v34, 0])
        {
          uint64_t v60 = (uint64_t)[v63 changes] + v36;
          if (v60 >= 1)
          {
            v61 = [(CPLPrequeliteStorage *)self pqStore];
            objc_msgSend(v61, "recordUpgradeEvent:", @"Transferred %lld records from client cache to push repository", v60);
          }
          char v37 = 1;
        }
        else
        {
          char v37 = 0;
        }
      }
LABEL_89:

      v28 = v63;
    }
    else
    {
      char v37 = 0;
    }

    return v37 & 1;
  }
  return v5;
}

- (id)_scopedIdentifierForIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(CPLPrequelitePushRepository *)self abstractObject];
  id v8 = [v7 scopeType];

  switch((unint64_t)v8)
  {
    case 0uLL:
    case 3uLL:
      sub_1001D3440();
    case 1uLL:
      uint64_t v9 = [(CPLPrequeliteStorage *)self scopedIdentifierForLocalIdentifier:v6 scopeIndex:a4];
      goto LABEL_4;
    case 2uLL:
      uint64_t v9 = [(CPLPrequeliteStorage *)self scopedIdentifierForCloudIdentifier:v6 scopeIndex:a4];
LABEL_4:
      unsigned int v10 = (void *)v9;
      break;
    default:
      unsigned int v10 = 0;
      break;
  }

  return v10;
}

- (int64_t)_scopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequelitePushRepository *)self abstractObject];
  id v6 = [v5 scopeType];

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 3uLL:
      sub_1001D34B4();
    case 1uLL:
      int64_t v7 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v4];
      goto LABEL_4;
    case 2uLL:
      int64_t v7 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v4];
LABEL_4:
      int64_t v8 = v7;
      break;
    default:
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  return v8;
}

- (int64_t)_scopeIndexForScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequelitePushRepository *)self abstractObject];
  id v6 = [v5 scopeType];

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 3uLL:
      sub_1001D3528();
    case 1uLL:
      int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
      goto LABEL_4;
    case 2uLL:
      int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
LABEL_4:
      int64_t v8 = v7;
      break;
    default:
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  return v8;
}

- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld", v6];
  id v10 = [v7 table:v8 countOfRecordsMatchingQuery:v9];

  return (unint64_t)v10;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v11 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld", v9];
    unsigned __int8 v8 = [v10 table:v6 hasRecordsMatchingQuery:v11];
  }
  return v8;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self mainTable];
  LOBYTE(self) = [(CPLPrequelitePushRepository *)self hasChangesInScopeWithIdentifier:v4 table:v5];

  return (char)self;
}

- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v4;
    int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v8 = [v7 pqlConnection];

    uint64_t v9 = objc_opt_class();
    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    id v11 = [v8 cplFetchObjectOfClass:v9, @"SELECT priority FROM %@ where scopeIndex = %ld ORDER BY priority LIMIT 1", v10, v6 sql];

    if (v11) {
      unint64_t v5 = (unint64_t)[v11 unsignedIntegerValue];
    }
    else {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  int64_t v6 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v8 = v6;
  uint64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [(CPLPrequeliteStorage *)self mainTable];
  id v11 = +[PQLFormatInjection formatInjection:@"priority < %lu AND scopeIndex = %ld", a3, v8];
  LOBYTE(v8) = [v9 table:v10 hasRecordsMatchingQuery:v11];

  return v8;
}

- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  int64_t v6 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v8 = v6;
  uint64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [(CPLPrequeliteStorage *)self mainTable];
  id v11 = +[PQLFormatInjection formatInjection:@"priority > %lu AND scopeIndex = %ld", a3, v8];
  LOBYTE(v8) = [v9 table:v10 hasRecordsMatchingQuery:v11];

  return v8;
}

- (BOOL)hasChangesWithScopeFilter:(id)a3
{
  id v4 = a3;
  if (![(CPLPrequelitePushRepository *)self isEmpty])
  {
    id v6 = v4;
    int64_t v7 = [v6 includedScopeIdentifiers];

    if (v7)
    {
      int64_t v8 = [v6 localIndexes];
      id v9 = [v8 count];

      if (!v9)
      {
        unsigned __int8 v5 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      id v10 = [v6 excludedScopeIdentifiers];

      if (v10)
      {
        id v11 = [v6 localIndexes];
        id v12 = [v11 count];

        if (!v12)
        {
          unsigned __int8 v5 = 1;
          goto LABEL_9;
        }
      }
    }
    BOOL v13 = [(CPLPrequeliteStorage *)self pqStore];
    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    CFStringRef v15 = [v6 localIndexesInjection];
    unsigned __int8 v5 = [v13 table:v14 hasRecordsMatchingQuery:v15];

    goto LABEL_9;
  }
  unsigned __int8 v5 = 0;
LABEL_10:

  return v5;
}

- (id)_pqlChangeWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = (CPLPrequelitePushRepository *)sub_1001D359C(v5, a2, self);
    return (id)[(CPLPrequelitePushRepository *)v14 _storeChange:v16 update:v17 error:v18];
  }
  else
  {
    id v6 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v7 = [v6 pqlConnection];

    uint64_t v8 = objc_opt_class();
    id v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v5 scopeIndex];
    id v11 = [v5 identifier];
    id v12 = [v7 cplFetchObjectOfClass:v8, @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v9, v10, v11 sql];

    return v12;
  }
}

- (BOOL)_storeChange:(id)a3 update:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = a3;
  id v9 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v10 = [v9 pqlConnection];

  [(CPLPrequeliteStorage *)self mainTable];
  v62 = a5;
  objc_super v64 = v63 = (void *)v10;
  if (v6)
  {
    if (v8)
    {
      unsigned int v53 = NSStringFromClass((Class)v8[3]);
      uint64_t v55 = v8[4];
      id v11 = (id)v8[5];
      uint64_t v49 = *((unsigned int *)v8 + 12);
      id v12 = (id)v8[7];
      id v51 = (id)v8[8];
      uint64_t v47 = *((unsigned __int8 *)v8 + 8);
      uint64_t v45 = v8[9];
      BOOL v13 = (void *)v8[10];
    }
    else
    {
      unsigned int v53 = NSStringFromClass(0);
      uint64_t v47 = 0;
      id v51 = 0;
      uint64_t v49 = 0;
      uint64_t v55 = 0;
      id v11 = 0;
      id v12 = 0;
      uint64_t v45 = 0;
      BOOL v13 = 0;
    }
    id v14 = v13;
    [v14 uploadIdentifier];
    SEL v15 = v60 = v14;
    if (v8) {
      id v16 = (void *)v8[10];
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    id v18 = [v17 flags];
    if (v8) {
      v19 = (void *)v8[10];
    }
    else {
      v19 = 0;
    }
    id v20 = v19;
    id v21 = [v20 priority];
    if (v8)
    {
      uint64_t v22 = *((unsigned int *)v8 + 3);
      v23 = sub_1001B27F4(v8);
      uint64_t v24 = v8[4];
      uint64_t v25 = v8[5];
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v22 = 0;
      v23 = 0;
      uint64_t v25 = 0;
    }
    uint64_t v43 = v22;
    v26 = v63;
    unsigned __int8 v56 = [v63 cplExecute:@"UPDATE %@ SET class = %@, scopeIndex = %ld, identifier = %@, changeType = %i, relatedIdentifier = %@, secondaryIdentifier = %@, dequeueOrder = %ld, trashed = %i, uploadIdentifier = %@, flags = %ld, priority = %lu, trustLevel = %i, serializedRecord = %@ WHERE scopeIndex = %ld AND identifier = %@", v64, v53, v55, v11, v49, v12, v51, v45, v47, v15, v18, v21, v43, v23, v24, v25];

    if (v56)
    {
      BOOL v27 = 1;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (v8)
  {
    v54 = NSStringFromClass((Class)v8[3]);
    uint64_t v57 = v8[4];
    id v44 = (id)v8[5];
    uint64_t v50 = *((unsigned int *)v8 + 12);
    id v28 = (id)v8[7];
    id v52 = (id)v8[8];
    uint64_t v48 = *((unsigned __int8 *)v8 + 8);
    uint64_t v46 = v8[9];
    v29 = (void *)v8[10];
  }
  else
  {
    v54 = NSStringFromClass(0);
    uint64_t v48 = 0;
    id v52 = 0;
    uint64_t v50 = 0;
    uint64_t v57 = 0;
    id v44 = 0;
    uint64_t v46 = 0;
    id v28 = 0;
    v29 = 0;
  }
  id v30 = v29;
  v31 = [v30 uploadIdentifier];
  if (v8) {
    v32 = (void *)v8[10];
  }
  else {
    v32 = 0;
  }
  id v33 = v32;
  id v34 = [v33 flags];
  v61 = v30;
  if (v8) {
    id v35 = (void *)v8[10];
  }
  else {
    id v35 = 0;
  }
  id v36 = v35;
  id v37 = [v36 priority];
  v59 = v33;
  if (v8) {
    uint64_t v38 = *((unsigned int *)v8 + 3);
  }
  else {
    uint64_t v38 = 0;
  }
  id v39 = sub_1001B27F4(v8);
  id v42 = v37;
  v26 = v63;
  unsigned __int8 v58 = [v63 cplExecute:@"INSERT INTO %@ (class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord) VALUES (%@, %ld, %@, %i, %@, %@, %ld, %i, %@, %ld, %lu, %i, %@)", v64, v54, v57, v44, v50, v28, v52, v46, v48, v31, v34, v42, v38, v39];

  if ((v58 & 1) == 0)
  {
LABEL_25:
    if (v62)
    {
      [v26 lastCPLError];
      BOOL v27 = 0;
      id *v62 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v27 = 0;
    }
    goto LABEL_28;
  }
  if (v8) {
    id v40 = (void *)v8[10];
  }
  else {
    id v40 = 0;
  }
  BOOL v27 = 1;
  if ([v40 flags]) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }
LABEL_28:

  return v27;
}

- (BOOL)_mergeChange:(id)a3 overChange:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  BOOL v13 = v12;
  if (v11)
  {
    int v14 = *((_DWORD *)v11 + 3);
    if (v12)
    {
LABEL_3:
      int v15 = *((_DWORD *)v12 + 3);
      goto LABEL_4;
    }
  }
  else
  {
    int v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  int v15 = 0;
LABEL_4:
  id v51 = a6;
  BOOL v50 = (v15 | v14) != 0;
  if (v11) {
    id v16 = (void *)*((void *)v11 + 10);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  id v18 = [v17 uploadIdentifier];
  if (v13) {
    v19 = (void *)v13[10];
  }
  else {
    v19 = 0;
  }
  id v20 = v19;
  id v21 = [v17 uploadIdentifier];
  if (v21)
  {

LABEL_12:
    *a5 = [v20 uploadIdentifier];
    goto LABEL_13;
  }
  if (v11 && *((void *)v11 + 6) == 1024) {
    goto LABEL_12;
  }
  uint64_t v41 = [v20 uploadIdentifier];

  id v18 = (void *)v41;
LABEL_13:
  id v22 = [v20 flags];
  if (v11)
  {
    v23 = objc_msgSend(v17, "pushContextMergingFlags:changeType:uploadIdentifier:priority:", v22, *((void *)v11 + 6), v18, objc_msgSend(v17, "priority"));
    sub_1001B2BE0((uint64_t)v11, v23);

    uint64_t v24 = (void *)*((void *)v11 + 10);
  }
  else
  {
    uint64_t v48 = objc_msgSend(v17, "pushContextMergingFlags:changeType:uploadIdentifier:priority:", v22, 0, v18, objc_msgSend(v17, "priority"));
    sub_1001B2BE0(0, v48);

    uint64_t v24 = 0;
  }
  id v25 = v24;
  id v26 = [v25 flags];
  id v27 = [v20 flags];

  if (v26 != v27) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }
  if (v13 && v13[6] == 1024)
  {
    if (v11)
    {
      if (*((void *)v11 + 6) == 2)
      {
        uint64_t v28 = objc_opt_class();
        if (v28 == objc_opt_class())
        {
          *((void *)v11 + 6) = 0;
          [*((id *)v11 + 11) setChangeType:0];
          if (!_CPLSilentLogging)
          {
            v29 = sub_1001B2590();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              id v30 = sub_1001B288C((uint64_t)v11, self);
              *(_DWORD *)buf = 138412290;
              id v53 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Got an update over a delete (automatically fixing it): %@", buf, 0xCu);
            }
          }
        }
      }
LABEL_27:
      if ((*((void *)v11 + 6) | 0x400) == 0x400)
      {
LABEL_38:
        *((_DWORD *)v11 + 3) = 2 * v50;
        goto LABEL_39;
      }
      SEL v49 = a2;
      if (v13)
      {
        uint64_t v31 = v13[6];
        if (v31 == 1024)
        {
          sub_1001D3760(v11, self, v49);
          goto LABEL_42;
        }
      }
      else
      {
        uint64_t v31 = 0;
      }
      uint64_t v32 = sub_1001B288C((uint64_t)v11, self);
      if (v32)
      {
        id v33 = (void *)v32;
        id v34 = sub_1001B288C((uint64_t)v13, self);
        id v35 = [v34 copy];

        if (v35)
        {
          [v35 applyChange:v33];
          sub_1001B2B00((uint64_t)v11, v35);
          sub_1001B2BD0((uint64_t)v11, 0);
          uint64_t v36 = *((void *)v11 + 6);
          if (v36) {
            BOOL v37 = v31 == 0;
          }
          else {
            BOOL v37 = 1;
          }
          uint64_t v38 = v36 | v31;
          if (v37) {
            uint64_t v38 = 0;
          }
          *((void *)v11 + 6) = v38;

          goto LABEL_38;
        }
LABEL_43:
        if (!_CPLSilentLogging)
        {
          id v42 = sub_1001B2590();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            if (v13) {
              uint64_t v43 = (void *)v13[5];
            }
            else {
              uint64_t v43 = 0;
            }
            id v44 = v43;
            *(_DWORD *)buf = 138412290;
            id v53 = v44;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Invalid bottom change for %@", buf, 0xCu);
          }
        }
        uint64_t v45 = +[NSAssertionHandler currentHandler];
        uint64_t v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/PrequeliteStore/CPLPrequelitePushRepository.m"];
        if (v13) {
          uint64_t v47 = v13[5];
        }
        else {
          uint64_t v47 = 0;
        }
        [v45 handleFailureInMethod:v49, self, v46, 702, @"Invalid bottom change for %@", v47 object file lineNumber description];

        abort();
      }
LABEL_42:
      sub_1001D3674(v11, v49, self);
      goto LABEL_43;
    }
  }
  else if (v11)
  {
    goto LABEL_27;
  }
LABEL_39:
  BOOL v39 = [(CPLPrequelitePushRepository *)self _storeChange:v11 update:1 error:v51];

  return v39;
}

- (BOOL)storeChange:(id)a3 pushContext:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 scopedIdentifier];
  if ([(CPLPrequelitePushRepository *)self _scopeIndexForScopedIdentifier:v12] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a6)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v12];
      BOOL v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    int v14 = [(CPLPrequelitePushRepository *)self _pqlChangeWithScopedIdentifier:v12];
    int v15 = sub_1001B23E0((id *)[CPLPrequelitePushedChange alloc], v10, v11);
    if (v14) {
      unsigned __int8 v16 = [(CPLPrequelitePushRepository *)self _mergeChange:v15 overChange:v14 discardedUploadIdentifier:a5 error:a6];
    }
    else {
      unsigned __int8 v16 = [(CPLPrequelitePushRepository *)self _storeChange:v15 update:0 error:a6];
    }
    BOOL v13 = v16;
  }
  return v13;
}

- (BOOL)_overwriteChange:(id)a3 pushContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 scopedIdentifier];
  if ([(CPLPrequelitePushRepository *)self _scopeIndexForScopedIdentifier:v10] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v10];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    id v12 = sub_1001B23E0((id *)[CPLPrequelitePushedChange alloc], v8, v9);
    BOOL v11 = [(CPLPrequelitePushRepository *)self _storeChange:v12 update:1 error:a5];
  }
  return v11;
}

- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 discardedUploadIdentifier:(id *)a5 overwrittenRecord:(BOOL *)a6 error:(id *)a7
{
  id v13 = a3;
  int v14 = [v13 scopedIdentifier];
  id v15 = [v14 scopeIndex];

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    sub_1001D3868(v13, a2, self);
  }
  else
  {
    unsigned __int8 v16 = [v13 scopedIdentifier];
    a2 = [(CPLPrequelitePushRepository *)self _pqlChangeWithScopedIdentifier:v16];

    *a6 = a2 != 0;
    id v17 = [CPLPrequelitePushedChange alloc];
    id v18 = [v13 _pushContext];
    a6 = (BOOL *)sub_1001B23E0((id *)&v17->super.isa, v13, v18);

    if (a6)
    {
      int v19 = *((_DWORD *)a6 + 3);
      if (v19 <= 1) {
        int v19 = 1;
      }
      *((_DWORD *)a6 + 3) = v19;
      if (a2) {
        goto LABEL_6;
      }
      if (*((void *)a6 + 9) < a4) {
        *((void *)a6 + 9) = a4;
      }
LABEL_9:
      unsigned __int8 v20 = [(CPLPrequelitePushRepository *)self _storeChange:a6 update:0 error:a7];
      goto LABEL_10;
    }
  }
  if (!a2) {
    goto LABEL_9;
  }
LABEL_6:
  unsigned __int8 v20 = [(CPLPrequelitePushRepository *)self _mergeChange:a2 overChange:a6 discardedUploadIdentifier:a5 error:a7];
LABEL_10:
  BOOL v21 = v20;

  return v21;
}

- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = (CPLPrequelitePushRepository *)sub_1001D3940(v7, a2, self);
    return [(CPLPrequelitePushRepository *)v15 deleteChangeWithScopedIdentifier:v17 discardedUploadIdentifier:v18 error:v19];
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    id v9 = [v8 pqlConnection];

    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    id v11 = [v7 scopeIndex];
    id v12 = [v7 identifier];
    unsigned __int8 v13 = [v9 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v11, v12];

    if (v13)
    {
      BYTE4(self->_cachedExtractedBatch) = 1;
    }
    else if (a4)
    {
      *a4 = [v9 lastCPLError];
    }

    return v13;
  }
}

- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 discardedUploadIdentifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = sub_1001D3A18(v8, a2, self);
    goto LABEL_8;
  }
  uint64_t v9 = [(CPLPrequelitePushRepository *)self _pqlChangeWithScopedIdentifier:v8];
  a2 = (SEL)v9;
  if (!v9)
  {
LABEL_8:
    *a4 = [(id)v9 uploadIdentifier];
    LOBYTE(v17) = 1;
    goto LABEL_6;
  }
  id v10 = *(id *)(v9 + 80);
  id v11 = [v10 uploadIdentifier];

  *a4 = v11;
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v13 = [v12 pqlConnection];

  int v14 = [(CPLPrequeliteStorage *)self mainTable];
  id v15 = [v8 scopeIndex];
  SEL v16 = [v8 identifier];
  unsigned int v17 = [v13 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v14, v15, v16];

  if (v17) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }

LABEL_6:
  return v17;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (CPLPrequelitePushRepository *)sub_1001D3AF0(v5, a2, self);
    return [(CPLPrequelitePushRepository *)v12 deleteAllChangesWithError:v14];
  }
  else
  {
    BOOL v6 = [(CPLPrequeliteStorage *)self pqStore];
    id v7 = [(CPLPrequeliteStorage *)self mainTable];
    id v8 = [v5 scopeIndex];
    uint64_t v9 = [v5 identifier];
    id v10 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND identifier = %@", v8, v9];
    LOBYTE(v8) = [v6 table:v7 hasRecordsMatchingQuery:v10];

    return (char)v8;
  }
}

- (BOOL)deleteAllChangesWithError:(id *)a3
{
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];

  id v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

  if (a3 && (v8 & 1) == 0)
  {
    *a3 = [v6 lastCPLError];
  }

  return v8;
}

- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (!*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4))
  {
    id v18 = (CPLPrequelitePushRepository *)sub_1001D3BC8(self, a2);
    return [(CPLPrequelitePushRepository *)v18 storedExtractedBatch];
  }
  uint64_t v9 = v8;
  if (!v9) {
    goto LABEL_5;
  }
  id v11 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v9];
  if (!v11)
  {
    sub_1001D3CC4(v9, a2, self);
LABEL_5:
    id v11 = 0;
  }
  BYTE4(self->_extractedBatchVar) = 1;
  id v12 = (void **)(&self->_hasCachedExtractedBatch + 4);
  objc_storeStrong((id *)(&self->_hasCachedExtractedBatch + 4), a3);
  uint64_t v13 = *(uint64_t *)((char *)&self->_injectionPerChangeType + 4);
  id v20 = 0;
  BOOL v14 = [(CPLPrequeliteStorage *)self setValue:v11 forVariable:v13 error:&v20];
  id v15 = v20;

  if (!v14)
  {
    BYTE4(self->_extractedBatchVar) = 0;
    SEL v16 = *v12;
    *id v12 = 0;

    if (a4) {
      *a4 = v15;
    }
  }

  return v14;
}

- (id)storedExtractedBatch
{
  if (!*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4))
  {
    id v8 = (_Unwind_Exception *)sub_1001D3D9C(self, a2);
    if (v9 != 1) {
      goto LABEL_19;
    }
    sub_1001D3EA0(v8);
LABEL_14:
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1001B2590();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to decode extracted batch", v11, 2u);
      }
    }
    id v8 = (_Unwind_Exception *)_CPLStoreFailure();
LABEL_19:
    _Unwind_Resume(v8);
  }
  if (BYTE4(self->_extractedBatchVar))
  {
    id v3 = *(id *)(&self->_hasCachedExtractedBatch + 4);
    goto LABEL_9;
  }
  id v5 = [(CPLPrequeliteStorage *)self valueForVariable:*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4)];
  if (v5)
  {
    id v3 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v5 class:objc_opt_class()];
    objc_storeStrong((id *)(&self->_hasCachedExtractedBatch + 4), v3);
    BYTE4(self->_extractedBatchVar) = 1;
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    BYTE4(self->_extractedBatchVar) = 1;
    BOOL v6 = *(void **)(&self->_hasCachedExtractedBatch + 4);
    *(void *)(&self->_hasCachedExtractedBatch + 4) = 0;

    id v3 = 0;
  }

LABEL_9:
  return v3;
}

- (BOOL)resetPriorityForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  *a5 = 0;
  int64_t v11 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:v10];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    int64_t v13 = v11;
    BOOL v14 = [(CPLPrequeliteStorage *)self pqStore];
    id v15 = [v14 pqlConnection];

    SEL v16 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v12 = [v15 cplExecute:@"UPDATE %@ SET priority = 0 WHERE priority != 0 AND scopeIndex = %ld LIMIT %lu", v16, v13, a4];

    if (v12)
    {
      uint64_t v17 = (uint64_t)[v15 changes];
      if (v17 >= 1)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v18 = v17;
          SEL v19 = sub_1001B2590();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v22 = v18;
            __int16 v23 = 2114;
            id v24 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Reset priority for %llu records in %{public}@", buf, 0x16u);
          }
        }
        *a5 = 1;
      }
    }
    else if (a6)
    {
      *a6 = [v15 lastError];
    }
  }
  return v12;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4 = [(CPLPrequelitePushRepository *)self _pqlChangeWithScopedIdentifier:a3];
  id v5 = sub_1001B288C((uint64_t)v4, self);

  return v5;
}

- (id)_allChangesWithScopeIdentifier:(id)a3 scopeIndex:(int64_t)a4 ordered:(BOOL)a5 table:(id)a6 query:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    && (a4 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:v12],
        a4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v15 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }
  else
  {
    SEL v16 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v17 = [v16 pqlConnection];

    if (v9) {
      CFStringRef v18 = @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@ AND scopeIndex = %ld ORDER BY dequeueOrder DESC, rowID DESC";
    }
    else {
      CFStringRef v18 = @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@ AND scopeIndex = %ld";
    }
    id v19 = objc_msgSend(v17, "cplFetch:", v18, v13, v14, a4);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001B5C04;
    v22[3] = &unk_10027EE80;
    v22[4] = self;
    id v20 = [v19 enumerateObjects:v22];
    id v15 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v20];
  }
  return v15;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5 table:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = NSStringFromClass(a3);
  id v13 = +[PQLFormatInjection formatInjection:@"class = %@ AND trashed = %i", v12, v6];
  id v14 = [(CPLPrequelitePushRepository *)self _allChangesWithScopeIdentifier:v11 scopeIndex:0x7FFFFFFFFFFFFFFFLL ordered:1 table:v10 query:v13];

  return v14;
}

- (id)_injectionForChangeType:(unint64_t)a3
{
  id v5 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0) {
      +[PQLFormatInjection formatInjection:@"((changeType & %i) = %i) OR (changeType = %i)", a3, a3, 0];
    }
    else {
    id v7 = +[PQLFormatInjection formatInjection:@"changeType = %i", a3, v11, v12];
    }
    id v8 = *(void **)(&self->super._shouldUpgradeSchema + 1);
    BOOL v9 = +[NSNumber numberWithUnsignedInteger:a3];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5 table:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = NSStringFromClass(a3);
  id v13 = [(CPLPrequelitePushRepository *)self _injectionForChangeType:a5];
  id v14 = +[PQLFormatInjection formatInjection:@"class = %@ AND (%@)", v12, v13];
  id v15 = [(CPLPrequelitePushRepository *)self _allChangesWithScopeIdentifier:v11 scopeIndex:0x7FFFFFFFFFFFFFFFLL ordered:1 table:v10 query:v14];

  return v15;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 table:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = NSStringFromClass(a3);
  id v11 = +[PQLFormatInjection formatInjection:@"class = %@ AND changeType != %i", v10, 1024];
  uint64_t v12 = [(CPLPrequelitePushRepository *)self _allChangesWithScopeIdentifier:v9 scopeIndex:0x7FFFFFFFFFFFFFFFLL ordered:1 table:v8 query:v11];

  return v12;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4 table:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([v9 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v18 = (CPLPrequelitePushRepository *)sub_1001D3F6C(v9, a2, self);
    return [(CPLPrequelitePushRepository *)v18 allChangesWithClass:v20 relatedScopedIdentifier:v21];
  }
  else
  {
    id v11 = [v9 scopeIdentifier];
    id v12 = [v9 scopeIndex];
    id v13 = NSStringFromClass(a3);
    id v14 = [v9 identifier];
    id v15 = +[PQLFormatInjection formatInjection:@"class = %@ AND relatedIdentifier = %@", v13, v14];
    SEL v16 = [(CPLPrequelitePushRepository *)self _allChangesWithScopeIdentifier:v11 scopeIndex:v12 ordered:0 table:v10 query:v15];

    return v16;
  }
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [(CPLPrequelitePushRepository *)self allChangesWithClass:a3 relatedScopedIdentifier:v6 table:v7];

  return v8;
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4 table:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([v9 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v18 = (CPLPrequelitePushRepository *)sub_1001D4044(v9, a2, self);
    return [(CPLPrequelitePushRepository *)v18 allChangesWithScopeIdentifier:v20 table:v21];
  }
  else
  {
    id v11 = [v9 scopeIdentifier];
    id v12 = [v9 scopeIndex];
    id v13 = NSStringFromClass(a3);
    id v14 = [v9 identifier];
    id v15 = +[PQLFormatInjection formatInjection:@"class = %@ AND secondaryIdentifier = %@", v13, v14];
    SEL v16 = [(CPLPrequelitePushRepository *)self _allChangesWithScopeIdentifier:v11 scopeIndex:v12 ordered:0 table:v10 query:v15];

    return v16;
  }
}

- (id)allChangesWithScopeIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    id v12 = [v11 cplFetch:@"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ldORDER BY dequeueOrder DESC, rowID DESC", v6, v9];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B6448;
    v15[3] = &unk_10027EE80;
    v15[4] = self;
    id v13 = [v12 enumerateObjects:v15];
    id v8 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v13];
  }
  return v8;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = [(CPLPrequelitePushRepository *)self allChangesWithScopeIdentifier:v4 table:v5];

  return v6;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = (CPLPrequelitePushRepository *)sub_1001D411C(v7, a2, self);
    return [(CPLPrequelitePushRepository *)v15 hasAnyChangeWithRelatedScopedIdentifier:v17];
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = NSStringFromClass(a4);
    id v11 = [v7 scopeIndex];
    id v12 = [v7 identifier];
    id v13 = +[PQLFormatInjection formatInjection:@"class = %@ AND scopeIndex = %ld AND relatedIdentifier = %@", v10, v11, v12];
    LOBYTE(v11) = [v8 table:v9 hasRecordsMatchingQuery:v13];

    return (char)v11;
  }
}

- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    SEL v16 = (CPLPrequelitePushRepository *)sub_1001D41F4(v5, a2, self);
    return [(CPLPrequelitePushRepository *)v16 status];
  }
  else
  {
    id v6 = [(CPLPrequeliteStorage *)self pqStore];
    id v7 = [(CPLPrequeliteStorage *)self mainTable];
    id v8 = [v5 scopeIndex];
    int64_t v9 = [v5 identifier];
    id v10 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND relatedIdentifier = %@", v8, v9];
    if ([v6 table:v7 hasRecordsMatchingQuery:v10])
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      id v12 = [v5 scopeIndex];
      id v13 = [v5 identifier];
      id v14 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND secondaryIdentifier = %@", v12, v13];
      unsigned __int8 v11 = [v6 table:v7 hasRecordsMatchingQuery:v14];
    }
    return v11;
  }
}

- (id)status
{
  v38.receiver = self;
  v38.super_class = (Class)CPLPrequelitePushRepository;
  id v3 = [(CPLPrequeliteStorage *)&v38 status];
  id v4 = [v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  id v7 = [v6 pqlConnection];

  uint64_t v32 = self;
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v33 = v7;
  id v9 = [v7 cplFetch:@"SELECT class, changeType, trashed, count(*) FROM %@ GROUP BY class, changeType, trashed", v8];

  if ([v9 next])
  {
    do
    {
      uint64_t v10 = [v9 stringAtIndex:0];
      if (v10) {
        unsigned __int8 v11 = (__CFString *)v10;
      }
      else {
        unsigned __int8 v11 = @"(nil)";
      }
      unsigned int v12 = [v9 intAtIndex:1];
      unsigned int v13 = [v9 intAtIndex:2];
      id v14 = (char *)[v9 unsignedIntegerAtIndex:3];
      id v15 = [v5 objectForKeyedSubscript:v11];
      if (!v15)
      {
        id v15 = objc_alloc_init(_CPLPushRepositoryClassCount);
        [v5 setObject:v15 forKeyedSubscript:v11];
      }
      if (v12 == 1024)
      {
        [(_CPLPushRepositoryClassCount *)v15 setDeletes:&v14[[(_CPLPushRepositoryClassCount *)v15 deletes]]];
      }
      else
      {
        if (v13 == 1) {
          [(_CPLPushRepositoryClassCount *)v15 setTrashed:&v14[[(_CPLPushRepositoryClassCount *)v15 trashed]]];
        }
        if (v12) {
          [(_CPLPushRepositoryClassCount *)v15 setModifies:&v14[[(_CPLPushRepositoryClassCount *)v15 modifies]]];
        }
        else {
          [(_CPLPushRepositoryClassCount *)v15 setAdds:&v14[[(_CPLPushRepositoryClassCount *)v15 adds]]];
        }
      }
    }
    while (([v9 next] & 1) != 0);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  SEL v16 = [v5 allKeys];
  SEL v17 = [v16 sortedArrayUsingSelector:"compare:"];

  id v18 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        __int16 v23 = [v5 objectForKeyedSubscript:v22];
        [v4 appendFormat:@"\n\t%@: %@", v22, v23];
      }
      id v19 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v19);
  }

  if (*(NSMutableDictionary **)((char *)&v32->_injectionPerChangeType + 4))
  {
    id v24 = [(CPLPrequelitePushRepository *)v32 storedExtractedBatch];
    if (v24)
    {
      id v25 = [[CPLPrequelitePushRepositoryBatchStorage alloc] initWithPushRepository:v32 priority:-1];
      id v26 = [v24 effectiveResourceSizeToUploadUsingStorage:v25];
      id v27 = [v24 batch];
      uint64_t v28 = [v27 summaryDescription];
      v29 = (void *)v28;
      if (v26)
      {
        id v30 = +[NSByteCountFormatter stringFromByteCount:v26 countStyle:1];
        [v4 appendFormat:@"\nCurrent extracted batch:\n\t%@ %@", v29, v30];
      }
      else
      {
        [v4 appendFormat:@"\nCurrent extracted batch:\n\t%@", v28];
      }
    }
  }

  return v4;
}

- (id)statusDictionary
{
  v30.receiver = self;
  v30.super_class = (Class)CPLPrequelitePushRepository;
  id v3 = [(CPLPrequeliteStorage *)&v30 statusDictionary];
  id v4 = [v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v5 forKeyedSubscript:@"changes"];
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  id v7 = [(CPLPrequeliteStorage *)self mainTable];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001B6E98;
  v28[3] = &unk_10027F4E0;
  id v8 = v5;
  id v29 = v8;
  [v6 table:v7 enumerateCountGroupedByProperty:@"class" block:v28];

  if (*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4))
  {
    id v9 = [(CPLPrequelitePushRepository *)self storedExtractedBatch];
    if (v9)
    {
      id v23 = v8;
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v22 = v9;
      unsigned __int8 v11 = [v9 batch];
      unsigned int v12 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v12)
      {
        unsigned int v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            SEL v16 = (objc_class *)objc_opt_class();
            SEL v17 = NSStringFromClass(v16);
            id v18 = [v10 objectForKeyedSubscript:v17];
            id v19 = v18;
            if (v18)
            {
              uint64_t v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v18 unsignedIntegerValue] + 1);
              [v10 setObject:v20 forKeyedSubscript:v17];
            }
            else
            {
              [v10 setObject:&off_1002921A8 forKeyedSubscript:v17];
            }
          }
          unsigned int v13 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v13);
      }

      [v4 setObject:v10 forKeyedSubscript:@"extracted"];
      id v9 = v22;
      id v8 = v23;
    }
  }
  return v4;
}

- (id)statusPerScopeIndex
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  id v38 = objc_alloc_init((Class)NSMutableDictionary);
  long long v36 = self;
  id v5 = [(CPLPrequeliteStorage *)self mainTable];
  long long v37 = v4;
  id v6 = [v4 cplFetch:@"SELECT scopeIndex, class, changeType, trashed, count(*) FROM %@ GROUP BY scopeIndex, class, changeType, trashed", v5];

  if ([v6 next])
  {
    do
    {
      id v7 = [v6 integerAtIndex:0];
      id v8 = +[NSNumber numberWithInteger:v7];
      id v9 = [v38 objectForKeyedSubscript:v8];

      if (!v9)
      {
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        id v10 = +[NSNumber numberWithInteger:v7];
        [v38 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v11 = [v6 stringAtIndex:1];
      if (v11) {
        unsigned int v12 = (__CFString *)v11;
      }
      else {
        unsigned int v12 = @"(nil)";
      }
      unsigned int v13 = [v6 intAtIndex:2];
      unsigned int v14 = [v6 intAtIndex:3];
      id v15 = (char *)[v6 unsignedIntegerAtIndex:4];
      SEL v16 = [v9 objectForKeyedSubscript:v12];
      if (!v16)
      {
        SEL v16 = objc_alloc_init(_CPLPushRepositoryClassCount);
        [v9 setObject:v16 forKeyedSubscript:v12];
      }
      if (v13 == 1024)
      {
        [(_CPLPushRepositoryClassCount *)v16 setDeletes:&v15[[(_CPLPushRepositoryClassCount *)v16 deletes]]];
      }
      else
      {
        if (v14 == 1) {
          [(_CPLPushRepositoryClassCount *)v16 setTrashed:&v15[[(_CPLPushRepositoryClassCount *)v16 trashed]]];
        }
        if (v13) {
          [(_CPLPushRepositoryClassCount *)v16 setModifies:&v15[[(_CPLPushRepositoryClassCount *)v16 modifies]]];
        }
        else {
          [(_CPLPushRepositoryClassCount *)v16 setAdds:&v15[[(_CPLPushRepositoryClassCount *)v16 adds]]];
        }
      }
    }
    while (([v6 next] & 1) != 0);
  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001B7418;
  v46[3] = &unk_10027F8E0;
  id v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v38, "count"));
  id v47 = v17;
  [v38 enumerateKeysAndObjectsUsingBlock:v46];
  id v18 = v4;
  if (*(NSMutableDictionary **)((char *)&v36->_injectionPerChangeType + 4))
  {
    id v19 = [(CPLPrequelitePushRepository *)v36 storedExtractedBatch];
    if (v19)
    {
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v35 = v19;
      id v21 = [v19 batch];
      id v22 = [v21 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            long long v27 = [v26 scopedIdentifier];
            uint64_t v28 = [v27 scopeIdentifier];

            id v29 = [v20 objectForKeyedSubscript:v28];
            if (!v29)
            {
              id v29 = objc_alloc_init((Class)CPLChangeBatch);
              [v20 setObject:v29 forKeyedSubscript:v28];
            }
            [v29 addRecord:v26];
          }
          id v23 = [v21 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v23);
      }

      objc_super v30 = [(CPLPrequelitePushRepository *)v36 abstractObject];
      uint64_t v31 = [v30 engineStore];
      uint64_t v32 = [v31 scopes];

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1001B75A8;
      v39[3] = &unk_10027F908;
      id v40 = v32;
      id v41 = v17;
      id v33 = v32;
      [v20 enumerateKeysAndObjectsUsingBlock:v39];

      id v18 = v37;
      id v19 = v35;
    }
  }
  return v17;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedUploadIdentifiers:(id *)a6 error:(id *)a7
{
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  if (a4 >= 100) {
    int64_t v12 = 100;
  }
  else {
    int64_t v12 = a4;
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableIndexSet);
  id v15 = [(CPLPrequeliteStorage *)self pqStore];
  SEL v16 = [v15 pqlConnection];

  id v17 = [(CPLPrequeliteStorage *)self mainTable];
  id v18 = [v16 cplFetch:@"SELECT rowID, uploadIdentifier FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v17, a3, v12];
  while (1)
  {

    if (![v18 next]) {
      break;
    }
    objc_msgSend(v14, "addIndex:", objc_msgSend(v18, "integerAtIndex:", 0));
    id v17 = [v18 stringAtIndex:1];
    if (v17) {
      [v13 addObject:v17];
    }
  }
  if (*((unsigned char *)v27 + 24))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001B794C;
    v22[3] = &unk_10027F2F8;
    long long v25 = &v26;
    id v19 = v16;
    id v23 = v19;
    uint64_t v24 = self;
    [v14 enumerateIndexesUsingBlock:v22];
    if (a7 && !*((unsigned char *)v27 + 24))
    {
      *a7 = [v19 lastError];
    }

    if (*((unsigned char *)v27 + 24))
    {
      *a5 = (int64_t)[v14 count];
      *a6 = v13;
      if (*a5 >= 1) {
        BYTE4(self->_cachedExtractedBatch) = 1;
      }
    }
  }
  char v20 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (BOOL)isEmpty
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  char v5 = [v3 tableHasRecords:v4] ^ 1;

  return v5;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v7 = a4;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = (_Unwind_Exception *)sub_1001D42CC(v7, a2, self);
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v19);
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v8 = [(CPLPrequeliteStorage *)self pqStore];
  id v9 = [v8 pqlConnection];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001B7C34;
  v20[3] = &unk_10027F930;
  v20[4] = &v21;
  id v10 = [(CPLPrequeliteStorage *)self mainTable];
  id v11 = [v7 scopeIndex];
  int64_t v12 = [v7 identifier];
  id v13 = [v9 cplFetchObject:v20, @"SELECT relatedIdentifier FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v11, v12 sql];

  if (!*((unsigned char *)v22 + 24)
    || (+[NSNull null],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v13 == v14))
  {
    *a3 = 0;
  }
  else
  {
    id v15 = objc_alloc((Class)CPLScopedIdentifier);
    SEL v16 = [v7 scopeIdentifier];
    *a3 = objc_msgSend(v15, "initWithScopeIdentifier:identifier:scopeIndex:", v16, v13, objc_msgSend(v7, "scopeIndex"));
  }
  char v17 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v17;
}

- (id)countPerFlagsForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSDictionary0__struct;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [v9 pqlConnection];

    id v11 = [(CPLPrequeliteStorage *)self mainTable];
    id v12 = [v10 cplFetch:@"SELECT flags, COUNT(flags) FROM %@ WHERE scopeIndex = %ld AND flags != 0", v11, v7];

    if ([v12 next])
    {
      do
      {
        id v13 = [v12 integerAtIndex:0];
        id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 unsignedIntegerAtIndex:1]);
        id v15 = +[NSNumber numberWithInteger:v13];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      while (([v12 next] & 1) != 0);
    }
    SEL v16 = [(CPLPrequelitePushRepository *)self storedExtractedBatch];
    if (v16)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001B7EC4;
      v18[3] = &unk_10027F958;
      id v19 = v4;
      id v20 = v10;
      uint64_t v21 = self;
      int64_t v23 = v7;
      id v22 = v8;
      [v16 enumeratePushContextsWithBlock:v18];
    }
    id v6 = [v8 copy];
  }
  return v6;
}

- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = &__NSArray0__struct;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    uint64_t v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = (void *)v12;
    if (a3) {
      id v14 = [v11 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld AND (flags & %ld) != 0", v12, v9, a3];
    }
    else {
      id v14 = [v11 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld AND flags = 0", v12, v9, v18];
    }
    id v15 = v14;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001B8278;
    v19[3] = &unk_10027F5C8;
    id v20 = v6;
    int64_t v21 = v9;
    SEL v16 = [v15 enumerateObjects:v19];
    id v8 = [objc_alloc((Class)CPLMapEnumerator) initWithEnumerator:v16];
  }
  return v8;
}

- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  int64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [v9 pqlConnection];

  id v11 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v12 = [v10 cplExecute:@"UPDATE %@ SET flags = flags & %ld WHERE (flags & %ld) != 0 LIMIT %lu", v11, -4, 3, a3];

  if (v12)
  {
    *a4 = (unint64_t)[v10 changes];
  }
  else if (a5)
  {
    *a5 = [v10 lastError];
  }

  return v12;
}

- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
  int64_t v8 = [(CPLPrequelitePushRepository *)self _scopeIndexForScopeIdentifier:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    int64_t v10 = v8;
    id v11 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v12 = [v11 pqlConnection];

    id v13 = [(CPLPrequeliteStorage *)self mainTable];
    id v14 = [v12 cplFetch:@"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE (flags & %ld) != 0 AND scopeIndex = %ld LIMIT %lu", v13, 4, v10, a4];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001B8600;
    v26[3] = &unk_10027EE80;
    v26[4] = self;
    id v15 = [v14 enumerateObjects:v26];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    SEL v16 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v15];
    id v17 = [(CPLPrequeliteSkipNullEnumerator *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [v7 addObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        id v18 = [(CPLPrequeliteSkipNullEnumerator *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }

    id v9 = v7;
  }

  return v9;
}

- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v41 = self;
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  id v7 = [v6 pqlConnection];

  long long v42 = [(CPLPrequeliteStorage *)v41 mainTable];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v8)
  {
    uint64_t v37 = 0;
    id v38 = 0;
    uint64_t v40 = *(void *)v45;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v45 != v40) {
        objc_enumerationMutation(obj);
      }
      int64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
      unsigned int v12 = [v10 scopedIdentifier];
      if ([v12 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        sub_1001D43AC(v12, a2, v41);
        __break(1u);
      }
      *(void *)&long long v50 = 0;
      *((void *)&v50 + 1) = &v50;
      uint64_t v51 = 0x2020000000;
      uint64_t v52 = 0;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1001B8B98;
      v43[3] = &unk_10027F930;
      v43[4] = &v50;
      id v13 = [v12 scopeIndex];
      uint64_t v14 = [v12 identifier];
      id v15 = [v7 cplFetchObject:v43, @"SELECT rowID, class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v42, v13, v14 sql];

      SEL v16 = +[NSNull null];
      LOBYTE(v14) = v15 == v16;

      if ((v14 & 1) == 0) {
        break;
      }
      int v23 = 1;
LABEL_24:

      _Block_object_dispose(&v50, 8);
      if (!v23)
      {

        if (a4)
        {
          id v38 = v38;
          BOOL v32 = 0;
          *a4 = v38;
        }
        else
        {
          BOOL v32 = 0;
        }
        goto LABEL_39;
      }
      if (v8 == (id)++v9)
      {
        id v31 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
        id v8 = v31;
        if (v31) {
          goto LABEL_3;
        }
        goto LABEL_33;
      }
    }
    id v17 = sub_1001B288C((uint64_t)v15, v41);
    uint64_t v18 = [v17 updateSharingContributorUserIdentifiers];
    uint64_t v19 = [v10 updateSharingContributorUserIdentifiers];
    id v20 = (void *)v19;
    if (v18 && v19)
    {
      unsigned __int8 v21 = [(id)v18 isEqual:v19];

      if ((v21 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v24 = (v18 | v19) != 0;

      if (v24)
      {
LABEL_11:
        if (!_CPLSilentLogging)
        {
          long long v22 = sub_1001B2590();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            SEL v49 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ still has contributors to update", buf, 0xCu);
          }
        }
        goto LABEL_21;
      }
    }
    if (v15) {
      long long v25 = (void *)v15[10];
    }
    else {
      long long v25 = 0;
    }
    id v26 = v25;
    unint64_t v27 = (unint64_t)[v26 flags];

    uint64_t v28 = [(CPLPrequeliteStorage *)v41 mainTable];
    unsigned __int8 v29 = [v7 cplExecute:@"UPDATE %@ SET flags = %ld WHERE rowID = %lu", v28, v27 & 0xFFFFFFFFFFFFFFFBLL, *(void *)(*((void *)&v50 + 1) + 24)];

    if ((v29 & 1) == 0)
    {
      uint64_t v30 = [v7 lastError];

      int v23 = 0;
      id v38 = (id)v30;
      goto LABEL_23;
    }
    ++v37;
LABEL_21:
    int v23 = 1;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v37 = 0;
  id v38 = 0;
LABEL_33:

  if (!_CPLSilentLogging)
  {
    id v33 = sub_1001B2590();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v50) = 134217984;
      *(void *)((char *)&v50 + 4) = v37;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Acknowledged %lu contributors updates", (uint8_t *)&v50, 0xCu);
    }
  }
  BOOL v32 = 1;
LABEL_39:

  return v32;
}

- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4
{
  id v7 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v9 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
    *(void *)(&self->_shouldNotifyFlagsCountChanges + 4) = v8;

    id v7 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
  }
  int64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
  id v11 = [v7 objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v11 = [[CPLPrequelitePushRepositoryBatchStorage alloc] initWithPushRepository:self priority:a3];
    unsigned int v12 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
    id v13 = +[NSNumber numberWithUnsignedInteger:a3];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  if ([(CPLPrequelitePushRepositoryBatchStorage *)v11 checkOutWithError:a4]) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 pushRepository];

    if (v8 == self)
    {
      unsigned __int8 v9 = [v7 checkInWithError:a4];

      return v9;
    }
  }
  else
  {
    sub_1001D4564(v7, a2, self);
  }
  id v11 = (CPLPrequelitePushRepository *)sub_1001D448C(v7, a2, self);
  [(CPLPrequelitePushRepository *)v11 writeTransactionDidSucceed];
  return result;
}

- (void)writeTransactionDidSucceed
{
  v6.receiver = self;
  v6.super_class = (Class)CPLPrequelitePushRepository;
  [(CPLPrequeliteStorage *)&v6 writeTransactionDidSucceed];
  if (BYTE4(self->_cachedExtractedBatch))
  {
    id v3 = [(CPLPrequelitePushRepository *)self abstractObject];
    id v4 = [v3 engineStore];
    id v5 = [v4 engineLibrary];
    [v5 notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged];

    BYTE4(self->_cachedExtractedBatch) = 0;
  }
}

- (void)writeTransactionDidFail
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequelitePushRepository;
  [(CPLPrequeliteStorage *)&v4 writeTransactionDidFail];
  BYTE4(self->_extractedBatchVar) = 0;
  id v3 = *(void **)(&self->_hasCachedExtractedBatch + 4);
  *(void *)(&self->_hasCachedExtractedBatch + 4) = 0;

  BYTE4(self->_cachedExtractedBatch) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_shouldNotifyFlagsCountChanges + 4), 0);
  objc_storeStrong((id *)(&self->_hasCachedExtractedBatch + 4), 0);
  objc_storeStrong((id *)((char *)&self->_injectionPerChangeType + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end