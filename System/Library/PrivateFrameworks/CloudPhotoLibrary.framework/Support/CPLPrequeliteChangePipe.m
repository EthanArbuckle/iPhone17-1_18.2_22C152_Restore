@interface CPLPrequeliteChangePipe
- (BOOL)_deleteAllChangesWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_resetPushAndPullMarkersIfEmptyWithError:(id *)a3;
- (BOOL)_resetPushAndPullMarkersWithError:(id *)a3;
- (BOOL)_setPullMarker:(unint64_t)a3 error:(id *)a4;
- (BOOL)_setPushMarker:(unint64_t)a3 error:(id *)a4;
- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4;
- (BOOL)compactChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasQueuedBatches;
- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3;
- (BOOL)hasSomeChangeWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4;
- (BOOL)popNextBatchWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteChangePipe)initWithAbstractObject:(id)a3;
- (id)allChangeBatches;
- (id)nextBatch;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)_pullMarker;
- (unint64_t)_pushMarker;
- (unint64_t)countOfQueuedBatches;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteChangePipe

- (CPLPrequeliteChangePipe)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteChangePipe;
  v3 = [(CPLPrequeliteStorage *)&v11 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = [v3 variableWithName:@"pullMarker" type:v4];
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = +[CPLPrequeliteType integerType];
    uint64_t v8 = [v3 variableWithName:@"pushMarker" type:v7];
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;
  }
  return (CPLPrequeliteChangePipe *)v3;
}

- (BOOL)initializeStorage
{
  v6.receiver = self;
  v6.super_class = (Class)CPLPrequeliteChangePipe;
  BOOL v3 = [(CPLPrequeliteStorage *)&v6 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:&off_100292190 error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4) defaultValue:&off_100292190 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"library_version TEXT NOT NULL,batch_marker INTEGER NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,serializedRecord DATA NOT NULL" error:0];
        if (v3)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"library_version" error:0];
          if (v3)
          {
            unsigned int v4 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:0 error:0];
            LOBYTE(v3) = 0;
            if (v4)
            {
              BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"batch_marker" error:0];
              if (v3) {
                LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
              }
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
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteChangePipe;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v14, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 > 51)
  {
    if (a3 != 52)
    {
      if (a3 != 56) {
        return v5;
      }
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      unsigned __int8 v5 = 0;
      if (![(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:0 error:0])return v5; {
      return [(CPLPrequeliteStorage *)self dropIndexWithName:@"identifier" error:0];
      }
    }
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    CFStringRef v13 = @"scopeIndex";
    return [(CPLPrequeliteStorage *)self createIndexOnColumn:v13 error:0];
  }
  if (a3 == 20)
  {
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    CFStringRef v13 = @"batch_marker";
    return [(CPLPrequeliteStorage *)self createIndexOnColumn:v13 error:0];
  }
  if (a3 == 39 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
  {
    if (!_CPLSilentLogging)
    {
      objc_super v6 = sub_1001A8F2C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(CPLPrequeliteStorage *)self mainTable];
        *(_DWORD *)buf = 138412546;
        v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = 39;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding scopeIndex column", buf, 0x16u);
      }
    }
    uint64_t v8 = [(CPLPrequeliteStorage *)self pqStore];
    v9 = [v8 pqlConnection];

    v10 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v5 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v10];
  }
  return v5;
}

- (unint64_t)_pullMarker
{
  v2 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (BOOL)_setPullMarker:(unint64_t)a3 error:(id *)a4
{
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(a4) = [(CPLPrequeliteStorage *)self setValue:v6 forVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) error:a4];

  return (char)a4;
}

- (unint64_t)_pushMarker
{
  v2 = [(CPLPrequeliteStorage *)self valueForVariable:*(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4)];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (BOOL)_setPushMarker:(unint64_t)a3 error:(id *)a4
{
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(a4) = [(CPLPrequeliteStorage *)self setValue:v6 forVariable:*(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4) error:a4];

  return (char)a4;
}

- (BOOL)_resetPushAndPullMarkersWithError:(id *)a3
{
  id v11 = 0;
  BOOL v5 = [(CPLPrequeliteChangePipe *)self _setPushMarker:0 error:&v11];
  id v6 = v11;
  v7 = v6;
  if (v5)
  {
    id v10 = v6;
    LOBYTE(v5) = [(CPLPrequeliteChangePipe *)self _setPullMarker:0 error:&v10];
    id v8 = v10;

    v7 = v8;
  }
  *(NSString **)((char *)&self->_logDomain + 4) = 0;
  if (a3 && !v5) {
    *a3 = v7;
  }

  return v5;
}

- (BOOL)_resetPushAndPullMarkersIfEmptyWithError:(id *)a3
{
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v7 = [v5 tableHasRecords:v6];

  if (v7) {
    return 1;
  }
  return [(CPLPrequeliteChangePipe *)self _resetPushAndPullMarkersWithError:a3];
}

- (unint64_t)countOfQueuedBatches
{
  unint64_t v3 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  unint64_t v4 = [(CPLPrequeliteChangePipe *)self _pushMarker];
  unint64_t result = v4 - v3;
  if (v4 < v3)
  {
    unint64_t v8 = v4;
    v9 = self;
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1001A8F2C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v7 = [(CPLPrequeliteChangePipe *)v9 abstractObject];
        *(_DWORD *)buf = 134218498;
        unint64_t v11 = v3;
        __int16 v12 = 2048;
        unint64_t v13 = v8;
        __int16 v14 = 2112;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Pull marker %lu should always be less than push marker %lu for %@", buf, 0x20u);
      }
    }
    _CPLStoreFailure();
  }
  return result;
}

- (BOOL)hasQueuedBatches
{
  return [(CPLPrequeliteChangePipe *)self countOfQueuedBatches] != 0;
}

- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v8 = [(CPLPrequeliteStorage *)self pqStore];
  v32 = [v8 pqlConnection];

  v9 = [(CPLPrequeliteChangePipe *)self abstractObject];
  id v10 = [v9 engineStore];
  v31 = [v10 libraryVersion];

  unint64_t v11 = [(CPLPrequeliteChangePipe *)self _pushMarker];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    v28 = a4;
    v29 = v7;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
      __int16 v17 = [v16 scopedIdentifier];
      uint64_t v18 = [v17 scopeIdentifier];
      int64_t v19 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v18];

      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v20 = +[CPLArchiver archivedDataWithRootObject:v16];
      if (!v20)
      {
        a4 = v28;
        if (!_CPLSilentLogging)
        {
          v26 = sub_1001A8F2C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v16;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to serialize %@", buf, 0xCu);
          }
        }
        id v25 = +[CPLErrors invalidClientCacheErrorWithReason:0];
LABEL_19:

LABEL_20:
        BOOL v24 = 0;
        unsigned __int8 v7 = v29;
        goto LABEL_21;
      }
      v21 = [(CPLPrequeliteStorage *)self mainTable];
      v22 = [v17 identifier];
      unsigned __int8 v23 = [v32 cplExecute:@"INSERT INTO %@ (library_version, batch_marker, scopeIndex, identifier, serializedRecord) VALUES (%@, %lu, %ld, %@, %@)", v21, v31, v11, v19, v22, v20];

      if ((v23 & 1) == 0)
      {
        id v25 = [v32 lastCPLError];
        a4 = v28;
        goto LABEL_19;
      }

      if (v13 == (id)++v15)
      {
        id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
        a4 = v28;
        unsigned __int8 v7 = v29;
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v25 = +[CPLErrors invalidScopeErrorWithScopedIdentifier:v17];
    a4 = v28;
    goto LABEL_20;
  }
LABEL_11:

  id v33 = 0;
  BOOL v24 = [(CPLPrequeliteChangePipe *)self _setPushMarker:v11 + 1 error:&v33];
  id v25 = v33;
LABEL_21:

  if (a4 && !v24) {
    *a4 = v25;
  }

  return v24;
}

- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4
{
  unint64_t v7 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  unint64_t v8 = [(CPLPrequeliteChangePipe *)self _pushMarker];
  if (v7 > v8)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v28 = v8;
      v29 = sub_1001A8F2C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = [(CPLPrequeliteChangePipe *)self abstractObject];
        *(_DWORD *)buf = 138412802;
        v46 = v30;
        __int16 v47 = 2048;
        unint64_t v48 = v7;
        __int16 v49 = 2048;
        unint64_t v50 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Inconsistency when popping one batch %@ (pull marker: %lu / push marker: %lu)", buf, 0x20u);
      }
    }
    _CPLStoreFailure();
  }
  if (v7 != v8)
  {
    SEL v32 = a2;
    long long v36 = a4;
    *a3 = objc_alloc_init((Class)CPLChangeBatch);
    v9 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [v9 pqlConnection];

    unint64_t v11 = [(CPLPrequeliteStorage *)self mainTable];
    unint64_t v33 = v7;
    long long v35 = v10;
    id v12 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE batch_marker == %lu ORDER BY rowid", v11, v7];

    id v34 = v12;
    [v12 enumerateObjects:&stru_10027F760];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v41;
      id v37 = v13;
      uint64_t v38 = *(void *)v41;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          int64_t v19 = [v18 scopedIdentifier];
          id v20 = [v19 scopeIndex];
          if (v20 == (id)0x7FFFFFFFFFFFFFFFLL) {
            sub_1001D2F00((uint64_t)v32, (uint64_t)self);
          }
          unint64_t v21 = (unint64_t)v20;
          if ([(CPLPrequeliteStorage *)self isLocalScopeIndexValid:v20])
          {
            [v18 setScopeIndex:0];
            [*a3 addRecord:v18];
          }
          else if (!_CPLSilentLogging)
          {
            v22 = sub_1001A8F2C();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v23 = [(CPLPrequeliteChangePipe *)self abstractObject];
              BOOL v24 = [v23 name];
              *(_DWORD *)buf = 138412802;
              v46 = v24;
              __int16 v47 = 2112;
              unint64_t v48 = (unint64_t)v18;
              __int16 v49 = 2048;
              unint64_t v50 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ dropping %@ (scope index %ld id no longer valid)", buf, 0x20u);

              id v13 = v37;
              uint64_t v16 = v38;
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    id v25 = [v35 lastCPLError];

    if (v25)
    {
      if (v36)
      {
        [v35 lastCPLError];
        BOOL v26 = 0;
        *long long v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v27 = v34;
LABEL_29:

        return v26;
      }
    }
    else if ([(CPLPrequeliteChangePipe *)self _setPullMarker:v33 + 1 error:v36])
    {
      v27 = v34;
      if (v33 + 1 - *(unint64_t *)((char *)&self->_logDomain + 4) < 0x15) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = [(CPLPrequeliteChangePipe *)self compactChangeBatchesWithError:v36];
      }
      goto LABEL_29;
    }
    BOOL v26 = 0;
    goto LABEL_28;
  }
  *a3 = 0;
  return [(CPLPrequeliteChangePipe *)self deleteAllChangeBatchesWithError:a4];
}

- (id)nextBatch
{
  unint64_t v4 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  unint64_t v5 = [(CPLPrequeliteChangePipe *)self _pushMarker];
  if (v4 > v5)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v23 = v5;
      BOOL v24 = sub_1001A8F2C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = [(CPLPrequeliteChangePipe *)self abstractObject];
        *(_DWORD *)buf = 138412802;
        uint64_t v38 = v25;
        __int16 v39 = 2048;
        unint64_t v40 = v4;
        __int16 v41 = 2048;
        unint64_t v42 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Inconsistency getting next batch %@ (pull marker: %lu / push marker: %lu)", buf, 0x20u);
      }
    }
    _CPLStoreFailure();
  }
  if (v4 >= v5)
  {
    id v31 = 0;
  }
  else
  {
    SEL v26 = a2;
    id v31 = objc_alloc_init((Class)CPLChangeBatch);
    id v6 = [(CPLPrequeliteStorage *)self pqStore];
    unint64_t v7 = [v6 pqlConnection];

    unint64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
    unint64_t v28 = v7;
    id v9 = [v7 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE batch_marker == %lu ORDER BY rowid", v8, v4];

    v27 = v9;
    [v9 enumerateObjects:&stru_10027F780];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v33;
      id v29 = v10;
      uint64_t v30 = *(void *)v33;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v16 = [v15 scopedIdentifier];
          id v17 = [v16 scopeIndex];
          if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
            sub_1001D2FC0((uint64_t)v26, (uint64_t)self);
          }
          unint64_t v18 = (unint64_t)v17;
          if ([(CPLPrequeliteStorage *)self isLocalScopeIndexValid:v17])
          {
            [v15 setScopeIndex:0];
            [v31 addRecord:v15];
          }
          else if (!_CPLSilentLogging)
          {
            int64_t v19 = sub_1001A8F2C();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [(CPLPrequeliteChangePipe *)self abstractObject];
              unint64_t v21 = [v20 name];
              *(_DWORD *)buf = 138412802;
              uint64_t v38 = v21;
              __int16 v39 = 2112;
              unint64_t v40 = (unint64_t)v15;
              __int16 v41 = 2048;
              unint64_t v42 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ dropping %@ (scope index %ld id no longer valid)", buf, 0x20u);

              id v10 = v29;
              uint64_t v13 = v30;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }
  }
  return v31;
}

- (BOOL)popNextBatchWithError:(id *)a3
{
  unint64_t v5 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  unint64_t v6 = [(CPLPrequeliteChangePipe *)self _pushMarker];
  if (v5 >= v6)
  {
    unint64_t v12 = v6;
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1001A8F2C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(CPLPrequeliteChangePipe *)self abstractObject];
        *(_DWORD *)buf = 138412802;
        id v14 = v10;
        __int16 v15 = 2048;
        unint64_t v16 = v5;
        __int16 v17 = 2048;
        unint64_t v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Inconsistency when popping next batch from %@ (pull marker: %lu / push marker: %lu)", buf, 0x20u);
      }
    }
    _CPLStoreFailure();
  }
  unint64_t v7 = v5 + 1;
  BOOL v8 = [(CPLPrequeliteChangePipe *)self _setPullMarker:v7 error:a3];
  if (v8)
  {
    if (v7 - *(unint64_t *)((char *)&self->_logDomain + 4) < 0x15)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      LOBYTE(v8) = [(CPLPrequeliteChangePipe *)self compactChangeBatchesWithError:a3];
    }
  }
  return v8;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CPLPrequeliteChangePipe *)self hasQueuedBatches]
    && ([v4 scopeIdentifier],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v5],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
    id v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v4 identifier];
    id v11 = +[PQLFormatInjection formatInjection:@"identifier = %@ AND scopeIndex = %ld", v10, v6];
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([(CPLPrequeliteChangePipe *)self hasQueuedBatches])
  {
    unint64_t v5 = [(CPLPrequeliteStorage *)self filterForIncludedScopeIdentifiers:v4];
    int64_t v6 = [v5 localIndexes];
    id v7 = [v6 count];

    if (v7)
    {
      BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
      id v9 = [(CPLPrequeliteStorage *)self mainTable];
      id v10 = [v5 localIndexesInjection];
      unsigned __int8 v11 = [v8 table:v9 hasRecordsMatchingQuery:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)hasSomeChangeWithScopeFilter:(id)a3
{
  id v4 = a3;
  if ([(CPLPrequeliteChangePipe *)self hasQueuedBatches])
  {
    id v5 = v4;
    int64_t v6 = [v5 includedScopeIdentifiers];

    if (v6)
    {
      id v7 = [v5 localIndexes];
      id v8 = [v7 count];

      if (!v8)
      {
        unsigned __int8 v9 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      id v10 = [v5 excludedScopeIdentifiers];

      if (v10)
      {
        unsigned __int8 v11 = [v5 localIndexes];
        id v12 = [v11 count];

        if (!v12)
        {
          unsigned __int8 v9 = 1;
          goto LABEL_9;
        }
      }
    }
    uint64_t v13 = [(CPLPrequeliteStorage *)self pqStore];
    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    __int16 v15 = [v5 localIndexesInjection];
    unsigned __int8 v9 = [v13 table:v14 hasRecordsMatchingQuery:v15];

    goto LABEL_9;
  }
  unsigned __int8 v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)deleteAllChangeBatchesWithError:(id *)a3
{
  if ([(CPLPrequeliteChangePipe *)self _pushMarker]
    || [(CPLPrequeliteChangePipe *)self _pullMarker])
  {
    id v5 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v6 = [v5 pqlConnection];

    id v7 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

    if (v8)
    {
      BOOL v9 = [(CPLPrequeliteChangePipe *)self _resetPushAndPullMarkersWithError:a3];
    }
    else if (a3)
    {
      [v6 lastCPLError];
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    *(NSString **)((char *)&self->_logDomain + 4) = 0;
    return 1;
  }
  return v9;
}

- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CPLPrequeliteChangePipe *)self _pushMarker]
    || [(CPLPrequeliteChangePipe *)self _pullMarker])
  {
    id v7 = v6;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    BOOL v9 = [v8 pqlConnection];

    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v11 = [v7 localIndexesInjection];
    unsigned __int8 v12 = [v9 cplExecute:@"DELETE FROM %@ WHERE %@", v10, v11];

    if (v12)
    {
      BOOL v13 = [(CPLPrequeliteChangePipe *)self _resetPushAndPullMarkersIfEmptyWithError:a4];
    }
    else if (a4)
    {
      [v9 lastCPLError];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    *(NSString **)((char *)&self->_logDomain + 4) = 0;
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)compactChangeBatchesWithError:(id *)a3
{
  id v5 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  if (!v5) {
    return 1;
  }
  id v6 = v5;
  if ((NSString *)[(CPLPrequeliteChangePipe *)self _pushMarker] != v5)
  {
    if (*(NSString **)((char *)&self->_logDomain + 4) < v6)
    {
      id v7 = [(CPLPrequeliteStorage *)self pqStore];
      unsigned __int8 v8 = [v7 pqlConnection];

      BOOL v9 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE batch_marker < %lu", v9, v6];

      if (a3 && (v10 & 1) == 0)
      {
        *a3 = [v8 lastCPLError];
      }
      *(NSString **)((char *)&self->_logDomain + 4) = v6;

      return v10;
    }
    return 1;
  }
  return [(CPLPrequeliteChangePipe *)self deleteAllChangeBatchesWithError:a3];
}

- (id)allChangeBatches
{
  id v25 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  unint64_t v5 = [(CPLPrequeliteChangePipe *)self _pullMarker];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [v4 cplFetch:@"SELECT batch_marker, scopeIndex, serializedRecord FROM %@ WHERE batch_marker >= %lu", v6, v5];

  if ([v7 next])
  {
    BOOL v24 = v4;
    unsigned __int8 v8 = 0;
    uint64_t v9 = -1;
    unsigned __int8 v10 = &_CPLSilentLogging;
    unsigned __int8 v11 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
    do
    {
      unsigned __int8 v12 = [v7 cplChangeAtIndex:2];
      id v13 = [v7 integerAtIndex:1];
      [v12 setScopeIndex:v13];
      id v14 = [v7 unsignedIntegerAtIndex:0];
      if (v14 != (id)v9)
      {
        uint64_t v15 = (uint64_t)v14;
        if (v8) {
          [v25 addObject:v8];
        }
        id v16 = objc_alloc_init((Class)v11[69]);

        uint64_t v9 = v15;
        unsigned __int8 v8 = v16;
      }
      if ([(CPLPrequeliteStorage *)self isLocalScopeIndexValid:v13])
      {
        [v12 setScopeIndex:0];
        [v8 addRecord:v12];
      }
      else if (!*v10)
      {
        __int16 v17 = sub_1001A8F2C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v18 = [(CPLPrequeliteChangePipe *)self abstractObject];
          [v18 name];
          uint64_t v26 = v9;
          int64_t v19 = self;
          id v20 = v11;
          v22 = unint64_t v21 = v10;
          *(_DWORD *)buf = 138412802;
          unint64_t v28 = v22;
          __int16 v29 = 2112;
          uint64_t v30 = v12;
          __int16 v31 = 2048;
          id v32 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ dropping %@ (scope index %ld id no longer valid)", buf, 0x20u);

          unsigned __int8 v10 = v21;
          unsigned __int8 v11 = v20;
          self = v19;
          uint64_t v9 = v26;
        }
      }
    }
    while (([v7 next] & 1) != 0);
    if (v8) {
      [v25 addObject:v8];
    }
    id v4 = v24;
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v25;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPrequeliteChangePipe;
  [(CPLPrequeliteStorage *)&v3 writeTransactionDidFail];
  *(NSString **)((char *)&self->_logDomain + 4) = 0;
}

- (id)status
{
  objc_super v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    unint64_t v6 = [(CPLPrequeliteChangePipe *)self _pullMarker];
    id v7 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = +[PQLFormatInjection formatInjection:@"batch_marker >= %lu", v6];
    id v9 = [v3 table:v7 countOfRecordsMatchingQuery:v8];

    unsigned __int8 v10 = +[NSString stringWithFormat:@"%lu changes to pop (%lu batches) - %lu total changes", v9, [(CPLPrequeliteChangePipe *)self countOfQueuedBatches], v5];
  }
  else
  {
    unsigned __int8 v10 = @"0 changes";
  }

  return v10;
}

- (id)statusPerScopeIndex
{
  objc_super v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  id v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = [v4 cplFetch:@"SELECT scopeIndex, count(scopeIndex) FROM %@ WHERE batch_marker >= %lu GROUP BY scopeIndex", v5, -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker")];

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v6 next])
  {
    do
    {
      id v8 = [v6 integerAtIndex:0];
      id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lu changes to pop", objc_msgSend(v6, "unsignedIntegerAtIndex:", 1));
      unsigned __int8 v10 = +[NSNumber numberWithInteger:v8];
      [v7 setObject:v9 forKeyedSubscript:v10];
    }
    while (([v6 next] & 1) != 0);
  }

  return v7;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v12 = [v11 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
  LOBYTE(a4) = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (a4)
  {
    id v14 = [v12 changes];
    *a5 = (int64_t)v14;
    if (v14) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = [(CPLPrequeliteChangePipe *)self _resetPushAndPullMarkersIfEmptyWithError:a6];
    }
  }
  else if (a6)
  {
    [v12 lastError];
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_deleteAllChangesWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = +[CPLErrors invalidScopeErrorWithScopedIdentifier:v6];
    unsigned __int8 v10 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unsigned __int8 v11 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v12 = [v11 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
  id v14 = [v6 identifier];
  unsigned __int8 v10 = [v12 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v13, v14, v8];

  if (v10)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v12 lastError];
  }

  if (a4)
  {
LABEL_8:
    if ((v10 & 1) == 0) {
      *a4 = v9;
    }
  }
LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_countSqlCommand + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pushGenerationVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pullGenerationVar + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end