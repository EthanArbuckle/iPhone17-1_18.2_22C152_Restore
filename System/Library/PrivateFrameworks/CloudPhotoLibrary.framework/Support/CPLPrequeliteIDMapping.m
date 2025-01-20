@interface CPLPrequeliteIDMapping
- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasPendingIdentifiers;
- (BOOL)initializeStorage;
- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4;
- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeMappingForLocalScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteIDMapping)initWithAbstractObject:(id)a3;
- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)scopeIndexColumnName;
- (id)status;
- (void)_cacheLocalScopedIdentifier:(id)a3 cloudScopedIdentifier:(id)a4 isFinal:(BOOL)a5;
- (void)_clearScopedIdentifiersCache;
- (void)transactionDidFinish;
@end

@implementation CPLPrequeliteIDMapping

- (CPLPrequeliteIDMapping)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteIDMapping;
  v3 = [(CPLPrequeliteStorage *)&v11 initWithAbstractObject:a3];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v4;

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v6;

    id v8 = objc_alloc_init((Class)NSMutableSet);
    v9 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v8;
  }
  return (CPLPrequeliteIDMapping *)v3;
}

- (void)_clearScopedIdentifiersCache
{
  [*(id *)(&self->super._shouldUpgradeSchema + 1) removeAllObjects];
  [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeAllObjects];
  v3 = *(NSMutableDictionary **)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4);
  [v3 removeAllObjects];
}

- (void)_cacheLocalScopedIdentifier:(id)a3 cloudScopedIdentifier:(id)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  id v9 = a4;
  id v11 = a3;
  [v8 setObject:v9 forKeyedSubscript:v11];
  [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) setObject:v11 forKeyedSubscript:v9];

  v10 = *(NSMutableDictionary **)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4);
  if (v5) {
    [v10 removeObject:v11];
  }
  else {
    [v10 addObject:v11];
  }
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteIDMapping;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"stableScopeIndex INTEGER NOT NULL,cloudIdentifier TEXT NOT NULL,localIdentifier TEXT NOT NULL,mappingState INTEGER NOT NULL,addTimestamp TIMESTAMP NOT NULL,addDirection INTEGER NOT NULL,deleteTimestamp TIMESTAMP,deleteDirection INTEGER" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedCloudIdentifier" withDefinition:@"stableScopeIndex, cloudIdentifier" unique:1 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedLocalIdentifier" withDefinition:@"stableScopeIndex, localIdentifier" unique:1 error:0];
        if (v3) {
          LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"mappingState" error:0];
        }
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CPLPrequeliteIDMapping;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v18, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 == 45)
  {
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return 1;
    }
    v15 = self;
    CFStringRef v16 = @"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection";
    return [(CPLPrequeliteStorage *)v15 recreateMainTableWithCopyInstructions:@"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection" oldFields:v16 error:0];
  }
  if (a3 == 39)
  {
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return 1;
    }
    CFStringRef v16 = @"3, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection";
    v15 = self;
    return [(CPLPrequeliteStorage *)v15 recreateMainTableWithCopyInstructions:@"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection" oldFields:v16 error:0];
  }
  if (a3 != 37) {
    return 1;
  }
  objc_super v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v8 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN addTimestamp TIMESTAMP NOT NULL DEFAULT -2147483648", v7];

  if (!v8) {
    goto LABEL_16;
  }
  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v10 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN addDirection INTEGER NOT NULL DEFAULT 0", v9];

  if (!v10) {
    goto LABEL_16;
  }
  id v11 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v12 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN deleteTimestamp TIMESTAMP DEFAULT NULL", v11];

  if (v12)
  {
    v13 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v14 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN deleteDirection INTEGER DEFAULT NULL", v13];
  }
  else
  {
LABEL_16:
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [*(id *)(&self->super._shouldUpgradeSchema + 1) objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = (id)v7;
    *a4 = [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) containsObject:v6] ^ 1;
  }
  else
  {
    *a4 = 0;
    id v9 = [v6 scopeIdentifier];
    int64_t v10 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v9];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0;
    }
    else
    {
      id v11 = [(CPLPrequeliteStorage *)self pqStore];
      unsigned int v12 = [v11 pqlConnection];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10019E37C;
      v18[3] = &unk_10027F5C8;
      v20 = a4;
      id v13 = v6;
      id v19 = v13;
      unsigned __int8 v14 = [(CPLPrequeliteStorage *)self mainTable];
      v15 = [v13 identifier];
      id v16 = [v12 cplFetchObject:v18, @"SELECT cloudIdentifier, mappingState FROM %@ WHERE stableScopeIndex = %ld AND localIdentifier = %@", v14, v10, v15 sql];

      if (v16) {
        [(CPLPrequeliteIDMapping *)self _cacheLocalScopedIdentifier:v13 cloudScopedIdentifier:v16 isFinal:*a4];
      }
      id v8 = v16;
    }
  }

  return v8;
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = (id)v7;
    *a4 = [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) containsObject:v7] ^ 1;
  }
  else
  {
    id v9 = [v6 scopeIdentifier];
    int64_t v10 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v9];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0;
    }
    else
    {
      *a4 = 0;
      id v11 = [(CPLPrequeliteStorage *)self pqStore];
      unsigned int v12 = [v11 pqlConnection];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10019E5FC;
      v18[3] = &unk_10027F5C8;
      v20 = a4;
      id v13 = v6;
      id v19 = v13;
      unsigned __int8 v14 = [(CPLPrequeliteStorage *)self mainTable];
      v15 = [v13 identifier];
      id v16 = [v12 cplFetchObject:v18, @"SELECT localIdentifier, mappingState FROM %@ WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v14, v10, v15 sql];

      if (v16) {
        [(CPLPrequeliteIDMapping *)self _cacheLocalScopedIdentifier:v16 cloudScopedIdentifier:v13 isFinal:*a4];
      }
      id v8 = v16;
    }
  }

  return v8;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  unsigned __int8 v14 = [v13 scopeIdentifier];
  int64_t v15 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v14];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v18 = [(CPLPrequeliteStorage *)self pqStore];
    [v18 pqlConnection];
    v20 = unint64_t v19 = a6;

    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v22 = (uint64_t)v21;
    v23 = [(CPLPrequeliteStorage *)self mainTable];
    v47 = v12;
    v24 = [v12 identifier];
    uint64_t v25 = [v13 identifier];
    BOOL v26 = v9;
    v27 = (void *)v25;
    unint64_t v45 = v19;
    BOOL v46 = v26;
    LOBYTE(v19) = [v20 cplExecute:@"INSERT OR IGNORE INTO %@ (stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection) VALUES (%ld, %@, %@, %i, %ld, %ld)", v23, v15, v24, v25, v26, v22, v19];

    if (v19)
    {
      v28 = v20;
      if ([v20 changes])
      {
LABEL_7:
        [(CPLPrequeliteIDMapping *)self _cacheLocalScopedIdentifier:v13 cloudScopedIdentifier:v47 isFinal:v46];
        BOOL v17 = 1;
LABEL_39:

        id v12 = v47;
        goto LABEL_40;
      }
      char v48 = 0;
      v29 = [(CPLPrequeliteIDMapping *)self cloudScopedIdentifierForLocalScopedIdentifier:v13 isFinal:&v48];
      v30 = v29;
      if (v29 && (!v47 || ([v29 isEqual:v47] & 1) == 0))
      {
        if (!_CPLSilentLogging)
        {
          v31 = sub_10019EB80();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v30;
            __int16 v51 = 2112;
            id v52 = v13;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Removing stale mapping of cloud identifier %@ to local identifier %@", buf, 0x16u);
          }
        }
        v28 = v20;
        if (![(CPLPrequeliteIDMapping *)self removeMappingForCloudScopedIdentifier:v30 error:a7])goto LABEL_36; {
      }
        }
      v20 = v28;
      v32 = [(CPLPrequeliteIDMapping *)self localScopedIdentifierForCloudScopedIdentifier:v47 isFinal:&v48];
      if (!v32) {
        goto LABEL_31;
      }
      v33 = v32;
      if (v13 && ([v32 isEqual:v13] & 1) != 0)
      {
        v44 = v30;
        if (!_CPLSilentLogging)
        {
          v34 = sub_10019EB80();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v47;
            __int16 v51 = 2112;
            id v52 = v13;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Mapping cloud identifier %@ to local identifier %@ is already known", buf, 0x16u);
          }
        }
        v28 = v20;
        goto LABEL_32;
      }
      if (!_CPLSilentLogging)
      {
        v35 = sub_10019EB80();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v33;
          __int16 v51 = 2112;
          id v52 = v47;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing stale mapping of local identifier %@ to cloud identifier %@", buf, 0x16u);
        }
      }
      unsigned __int8 v36 = [(CPLPrequeliteIDMapping *)self removeMappingForLocalScopedIdentifier:v33 error:a7];

      if (v36)
      {
LABEL_31:
        v44 = v30;
        v37 = [(CPLPrequeliteStorage *)self mainTable];
        v38 = [v47 identifier];
        v39 = [v13 identifier];
        v28 = v20;
        unsigned __int8 v40 = [v20 cplExecute:@"INSERT INTO %@ (stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection) VALUES (%ld, %@, %@, %i, %ld, %ld)", v37, v15, v38, v39, v46, v22, v45];

        if (v40)
        {
LABEL_32:

          goto LABEL_7;
        }
        v41 = [v28 lastCPLError];
        v42 = v41;
        if (a7) {
          *a7 = v41;
        }

        v30 = v44;
LABEL_36:

        BOOL v17 = 0;
        goto LABEL_39;
      }
    }
    else if (a7)
    {
      v28 = v20;
      [v20 lastCPLError];
      BOOL v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    BOOL v17 = 0;
    v28 = v20;
    goto LABEL_39;
  }
  if (a7)
  {
    id v16 = [v13 scopeIdentifier];
    *a7 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v16];
  }
  BOOL v17 = 0;
LABEL_40:

  return v17;
}

- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [v9 scopeIdentifier];
  int64_t v11 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v10];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a5)
    {
      unsigned __int8 v14 = 0;
      goto LABEL_12;
    }
    id v12 = [v9 scopeIdentifier];
    id v13 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v12];
    unsigned __int8 v14 = 0;
    goto LABEL_10;
  }
  int64_t v15 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v15 pqlConnection];

  id v16 = [(CPLPrequeliteStorage *)self mainTable];
  BOOL v17 = [v8 identifier];
  objc_super v18 = [v9 identifier];
  unsigned __int8 v14 = [v12 cplExecute:@"UPDATE %@ SET cloudIdentifier = %@, mappingState = %i WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v16, v17, 1, v11, v18];

  if (v14)
  {
    unint64_t v19 = [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v9];
    if (v19)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v9];
      [(CPLPrequeliteIDMapping *)self _cacheLocalScopedIdentifier:v19 cloudScopedIdentifier:v8 isFinal:1];
    }

    goto LABEL_11;
  }
  if (a5)
  {
    id v13 = [v12 lastCPLError];
LABEL_10:
    *a5 = v13;
  }
LABEL_11:

LABEL_12:
  return v14;
}

- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
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
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v11 = [v10 pqlConnection];

    id v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET mappingState = %i WHERE stableScopeIndex = %ld AND mappingState = %i", v12, 1, v9, 0];

    if (v8)
    {
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeAllObjects];
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (BOOL)hasPendingIdentifiers
{
  if ([*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) count]) {
    return 1;
  }
  id v4 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = +[PQLFormatInjection formatInjection:@"mappingState = %i", 0];
  unsigned __int8 v7 = [v4 table:v5 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
    {
      unsigned __int8 v11 = 0;
      goto LABEL_12;
    }
    int64_t v9 = [v6 scopeIdentifier];
    id v10 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v9];
    unsigned __int8 v11 = 0;
    goto LABEL_10;
  }
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v9 = [v12 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v14 = [v6 identifier];
  unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v13, v8, v14];

  if (v11)
  {
    int64_t v15 = [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6];
    if (v15)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v6];
      [*(id *)(&self->super._shouldUpgradeSchema + 1) removeObjectForKey:v15];
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeObject:v15];
    }

    goto LABEL_11;
  }
  if (a4)
  {
    id v10 = [v9 lastCPLError];
LABEL_10:
    *a4 = v10;
  }
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = [v8 scopeIdentifier];
  int64_t v10 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a5)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_10;
    }
    unsigned __int8 v11 = [v8 scopeIdentifier];
    id v12 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v11];
    unsigned __int8 v13 = 0;
  }
  else
  {
    unsigned __int8 v14 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v11 = [v14 pqlConnection];

    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v16 = (uint64_t)v15;
    BOOL v17 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v18 = [v8 identifier];
    unsigned __int8 v13 = [v11 cplExecute:@"UPDATE OR IGNORE %@ SET deleteTimestamp = %ld, deleteDirection = %ld WHERE stableScopeIndex = %ld AND localIdentifier = %@ AND (deleteTimestamp IS NULL OR (deleteTimestamp <= addTimestamp))", v17, v16, a4, v10, v18];

    if (!a5 || (v13 & 1) != 0) {
      goto LABEL_8;
    }
    id v12 = [v11 lastCPLError];
  }
  *a5 = v12;
LABEL_8:

LABEL_10:
  return v13;
}

- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = [v8 scopeIdentifier];
  int64_t v10 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      unsigned __int8 v11 = [v8 scopeIdentifier];
      *a5 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v11];
    }
    unsigned __int8 v12 = 0;
  }
  else
  {
    unsigned __int8 v13 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v14 = [v13 pqlConnection];

    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v16 = (uint64_t)v15;
    BOOL v17 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v18 = [v8 identifier];
    unsigned __int8 v12 = [v14 cplExecute:@"UPDATE OR IGNORE %@ SET addTimestamp = %ld, addDirection = %ld WHERE stableScopeIndex = %ld AND localIdentifier = %@ AND (addTimestamp <= deleteTimestamp)", v17, v16, a4, v10, v18];

    if (v12)
    {
      if ([v14 changes] && !_CPLSilentLogging)
      {
        unint64_t v19 = sub_10019EB80();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = +[CPLRecordChange descriptionForDirection:a4];
          *(_DWORD *)buf = 138412546;
          id v23 = v8;
          __int16 v24 = 2112;
          uint64_t v25 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updated 'add event' for already existing mapping of %@ (direction %@)", buf, 0x16u);
        }
      }
    }
    else if (a5)
    {
      *a5 = [v14 lastCPLError];
    }
  }
  return v12;
}

- (BOOL)removeMappingForLocalScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
    {
      unsigned __int8 v11 = 0;
      goto LABEL_12;
    }
    int64_t v9 = [v6 scopeIdentifier];
    id v10 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v9];
    unsigned __int8 v11 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v12 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v9 = [v12 pqlConnection];

  unsigned __int8 v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v14 = [v6 identifier];
  unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld AND localIdentifier = %@", v13, v8, v14];

  if (v11)
  {
    double v15 = [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6];
    if (v6)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v15];
      [*(id *)(&self->super._shouldUpgradeSchema + 1) removeObjectForKey:v6];
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeObject:v6];
    }

    goto LABEL_11;
  }
  if (a4)
  {
    id v10 = [v9 lastCPLError];
LABEL_10:
    *a4 = v10;
  }
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self stableScopeIndexForScopeIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
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
    unsigned __int8 v11 = [v10 pqlConnection];

    unsigned __int8 v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET mappingState = %i WHERE stableScopeIndex = %ld AND mappingState = %i", v12, 0, v9, 1];

    if (v8)
    {
      [(CPLPrequeliteIDMapping *)self _clearScopedIdentifiersCache];
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (id)status
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  objc_super v5 = +[PQLFormatInjection formatInjection:@"mappingState = %i", 0];
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLPrequeliteIDMapping;
    int64_t v7 = [(CPLPrequeliteStorage *)&v11 status];
    unsigned __int8 v8 = +[NSString stringWithFormat:@"%@ (%lu pending)", v7, v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLPrequeliteIDMapping;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)&v10 status];
  }
  return v8;
}

- (id)scopeIndexColumnName
{
  return @"stableScopeIndex";
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  objc_super v11 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v12 = [v11 pqlConnection];

  unsigned __int8 v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
    [(CPLPrequeliteIDMapping *)self _clearScopedIdentifiersCache];
  }
  else if (a6)
  {
    *a6 = [v12 lastError];
  }

  return v14;
}

- (void)transactionDidFinish
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPrequeliteIDMapping;
  [(CPLPrequeliteStorage *)&v3 transactionDidFinish];
  [(CPLPrequeliteIDMapping *)self _clearScopedIdentifiersCache];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4), 0);
  objc_storeStrong((id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end