@interface CPLPrequeliteRecordComputeStatePushQueue
- (BOOL)addComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 discardedFileStorageIdentifiers:(id *)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4;
- (BOOL)hasSomeComputeStateWithFileStorageIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 discardedFileStorageIdentifier:(id *)a6 error:(id *)a7;
- (BOOL)updateFileURLForComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 hasUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5;
- (id)status;
- (unint64_t)countOfComputeStates;
@end

@implementation CPLPrequeliteRecordComputeStatePushQueue

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteRecordComputeStatePushQueue;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,localIdentifier TEXT NOT NULL,fileStorageIdentifier TEXT NOT NULL,version TEXT NOT NULL,adjustmentFingerprint TEXT,lastUpdatedDate TIMESTAMP NOT NULL,state INTEGER NOT NULL DEFAULT 0" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"localIdentifier, scopeIndex" unique:1 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
        if (v3)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"fileStorageIdentifier" error:0];
          if (v3) {
            LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"state" withDefinition:@"state, scopeIndex" unique:0 error:0];
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CPLPrequeliteRecordComputeStatePushQueue;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v16, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 != 89)
  {
    if (a3 == 88) {
      return [(CPLPrequeliteStorage *)self createStorage];
    }
    return 1;
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    v6 = sub_1001AF35C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(CPLPrequeliteStorage *)self mainTable];
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = 89;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding adjustmentFingerprint column, renaming date column, and dropping fileURL column", buf, 0x16u);
    }
  }
  v8 = [(CPLPrequeliteStorage *)self pqStore];
  v9 = [v8 pqlConnection];

  v10 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v11 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN adjustmentFingerprint TEXT DEFAULT NULL", v10];

  if (v11
    && ([(CPLPrequeliteStorage *)self mainTable],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v9 cplExecute:@"ALTER TABLE %@ RENAME COLUMN date TO lastUpdatedDate", v12], v12, v13))
  {
    v14 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v5 = [v9 cplExecute:@"ALTER TABLE %@ DROP COLUMN fileURL", v14];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)addComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 itemScopedIdentifier];
  int64_t v10 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v9];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = a4;
    v49 = a5;
    int64_t v12 = v10;
    unsigned int v13 = [(CPLPrequeliteStorage *)self pqStore];
    v14 = [v13 pqlConnection];

    v15 = [(CPLPrequeliteStorage *)self mainTable];
    v50 = v9;
    objc_super v16 = [v9 identifier];
    uint64_t v17 = [v8 fileStorageIdentifier];
    v18 = (void *)v17;
    __int16 v19 = @"#__NONE__#";
    if (v17) {
      __int16 v19 = (__CFString *)v17;
    }
    uint64_t v20 = v19;
    [v8 version];
    v22 = v21 = v8;
    v23 = [v21 adjustmentFingerprint];
    v51 = v21;
    [v21 lastUpdatedDate];
    v24 = v47 = self;
    [v24 timeIntervalSinceReferenceDate];
    int64_t v48 = v12;
    LOBYTE(v21) = [v14 cplExecute:@"INSERT INTO %@ (scopeIndex, localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate) VALUES (%ld, %@, %@, %@, %@, %lu)", v15, v12, v16, v20, v22, v23, (unint64_t)v25];

    v26 = v14;
    v27 = [v14 lastError];
    v28 = v27;
    if (v21)
    {
      unsigned __int8 v11 = 1;
      v9 = v50;
      id v8 = v51;
LABEL_20:

      goto LABEL_21;
    }
    v29 = [v27 domain];
    if ([v29 isEqual:PQLSqliteErrorDomain])
    {
      id v30 = [v28 code];

      v9 = v50;
      if (v30 != (id)19)
      {
        unsigned __int8 v11 = 0;
        v44 = v49;
        goto LABEL_17;
      }
      uint64_t v31 = objc_opt_class();
      v32 = [(CPLPrequeliteStorage *)v47 mainTable];
      v33 = [v50 identifier];
      id v34 = [v14 cplFetchObjectOfClass:v31, @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v32, v12, v33 sql];
      sub_1001AF758(v34);
      id *v46 = (id)objc_claimAutoreleasedReturnValue();

      v29 = [(CPLPrequeliteStorage *)v47 mainTable];
      v35 = [v50 identifier];
      uint64_t v36 = [v51 fileStorageIdentifier];
      v37 = (void *)v36;
      v38 = @"#__NONE__#";
      if (v36) {
        v38 = (__CFString *)v36;
      }
      v39 = v38;
      v40 = [v51 version];
      v41 = [v51 adjustmentFingerprint];
      v42 = [v51 lastUpdatedDate];
      [v42 timeIntervalSinceReferenceDate];
      unsigned __int8 v11 = [v14 cplExecute:@"REPLACE INTO %@ (scopeIndex, localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate) VALUES (%ld, %@, %@, %@, %@, %lu)", v29, v48, v35, v39, v40, v41, (unint64_t)v43];

      v26 = v14;
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
    v44 = v49;

    v9 = v50;
LABEL_17:
    id v8 = v51;
    if (v44 && (v11 & 1) == 0)
    {
      [v26 lastError];
      unsigned __int8 v11 = 0;
      id *v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_20;
  }
  if (a5)
  {
    +[CPLErrors invalidScopeErrorWithScopedIdentifier:v9];
    unsigned __int8 v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
LABEL_21:

  return v11;
}

- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5
{
  id v8 = [a3 itemScopedIdentifier];
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v8];
      unsigned __int8 v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    int64_t v11 = v9;
    int64_t v12 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v13 = [v12 pqlConnection];

    v14 = [(CPLPrequeliteStorage *)self mainTable];
    v15 = [v8 identifier];
    unsigned __int8 v10 = [v13 cplExecute:@"UPDATE OR FAIL %@ SET state = %ld WHERE scopeIndex = %ld AND localIdentifier = %@", v14, a4, v11, v15];

    if (a5 && (v10 & 1) == 0)
    {
      *a5 = [v13 lastError];
    }
  }
  return v10;
}

- (BOOL)updateFileURLForComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 hasUpdated:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  int64_t v12 = [v11 itemScopedIdentifier];
  int64_t v13 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v12];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v15 = v13;
    objc_super v16 = [v11 fileStorageIdentifier];

    if (!v16) {
      sub_1001D3284((uint64_t)v11, (uint64_t)a2, (uint64_t)self);
    }
    v33 = a5;
    uint64_t v17 = [(CPLPrequeliteStorage *)self pqStore];
    v18 = [v17 pqlConnection];

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [(CPLPrequeliteStorage *)self mainTable];
    v21 = [v12 identifier];
    id v22 = [v18 cplFetchObjectOfClass:v19, @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v20, v15, v21 sql];
    sub_1001AF758(v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v23 = [v11 adjustmentFingerprint];

    v24 = [(CPLPrequeliteStorage *)self mainTable];
    double v25 = [v11 fileStorageIdentifier];
    v26 = [v12 identifier];
    uint64_t v27 = [v11 version];
    v28 = (void *)v27;
    if (v23)
    {
      v29 = [v11 adjustmentFingerprint];
      unsigned __int8 v30 = [v18 cplExecute:@"UPDATE OR FAIL %@ SET fileStorageIdentifier = %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint = %@", v24, v25, v15, v26, v28, v29];

      if (v30)
      {
LABEL_7:
        BOOL *v33 = (uint64_t)[v18 changes] > 0;
        BOOL v14 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      unsigned int v31 = [v18 cplExecute:@"UPDATE OR FAIL %@ SET fileStorageIdentifier = %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint IS NULL", v24, v25, v15, v26, v27];

      if (v31) {
        goto LABEL_7;
      }
    }
    if (a6)
    {
      [v18 lastError];
      BOOL v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_13;
  }
  if (a6)
  {
    +[CPLErrors invalidScopeErrorWithScopedIdentifier:v12];
    BOOL v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_14:

  return v14;
}

- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 discardedFileStorageIdentifier:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int64_t v15 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v12];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v17 = v15;
    v39 = a6;
    v18 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v19 = [v18 pqlConnection];

    uint64_t v20 = objc_opt_class();
    v21 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v22 = [v12 identifier];
    v23 = (void *)v22;
    id v40 = v13;
    if (v14)
    {
      id v37 = v13;
      id v38 = v14;
      int64_t v34 = v17;
      uint64_t v36 = v22;
      v33 = v21;
      CFStringRef v24 = @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint = %@";
    }
    else
    {
      uint64_t v36 = v22;
      id v37 = v13;
      v33 = v21;
      int64_t v34 = v17;
      CFStringRef v24 = @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint IS NULL";
    }
    double v25 = v19;
    id v26 = objc_msgSend(v19, "cplFetchObjectOfClass:sql:", v20, v24, v33, v34, v36, v37, v38);

    if (v26)
    {
      sub_1001AF758(v26);
      id *v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [(CPLPrequeliteStorage *)self mainTable];
      v28 = [v12 identifier];
      int64_t v35 = v17;
      v29 = v25;
      unsigned __int8 v16 = [v25 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v27, v35, v28];

      if (a7)
      {
        id v13 = v40;
        if ((v16 & 1) == 0)
        {
          [v29 lastError];
          unsigned __int8 v16 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        unsigned __int8 v30 = sub_1001AF35C();
        v29 = v19;
        id v13 = v40;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v31 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138413058;
          id v42 = v12;
          __int16 v43 = 2112;
          id v44 = v40;
          __int16 v45 = 2112;
          id v46 = v14;
          __int16 v47 = 2112;
          int64_t v48 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No payload found with localScopedIdentifier: %@ version: %@ and adjustmentFingerprint: %@ to be removed from %@", buf, 0x2Au);
        }
        unsigned __int8 v16 = 1;
        goto LABEL_18;
      }
      unsigned __int8 v16 = 1;
      v29 = v19;
    }
    id v13 = v40;
LABEL_18:

    goto LABEL_19;
  }
  if (a7)
  {
    +[CPLErrors invalidScopeErrorWithScopedIdentifier:v12];
    unsigned __int8 v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v16 = 0;
  }
LABEL_19:

  return v16;
}

- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  id v8 = a3;
  int64_t v9 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = &__NSArray0__struct;
  }
  else
  {
    int64_t v11 = v9;
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    id v13 = [v12 pqlConnection];

    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v27 = v13;
    id v15 = [v13 cplFetch:@"SELECT localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate FROM %@ WHERE scopeIndex = %ld AND state = %ld LIMIT %ld", v14, v11, a4, a5];

    if ([v15 next])
    {
      do
      {
        v29 = [v15 stringAtIndex:0];
        v28 = [v15 stringAtIndex:1];
        unsigned __int8 v16 = [v15 stringAtIndex:2];
        int64_t v17 = [v15 stringAtIndex:3];
        v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v15 integerAtIndex:4]);
        id v19 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v8 identifier:v29 scopeIndex:v11];
        int64_t v20 = v11;
        id v21 = v8;
        id v22 = objc_alloc((Class)CPLRecordComputeState);
        sub_1001AF758(v28);
        CFStringRef v24 = v23 = v10;
        id v25 = [v22 initWithItemScopedIdentifier:v19 fileStorageIdentifier:v24 version:v16 fileURL:0 adjustmentFingerprint:v17 lastUpdatedDate:v18];

        id v10 = v23;
        [v23 addObject:v25];

        id v8 = v21;
        int64_t v11 = v20;
      }
      while (([v15 next] & 1) != 0);
    }
  }
  return v10;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v11 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld", v9];
    unsigned __int8 v8 = [v10 table:v6 hasRecordsMatchingQuery:v11];
  }
  return v8;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self mainTable];
  LOBYTE(self) = [(CPLPrequeliteRecordComputeStatePushQueue *)self hasChangesInScopeWithIdentifier:v4 table:v5];

  return (char)self;
}

- (BOOL)hasSomeComputeStateWithFileStorageIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  int64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [v6 cplFetch:@"SELECT fileStorageIdentifier FROM %@ WHERE fileStorageIdentifier = %@", v7, v4];

  LOBYTE(v7) = [v8 next];
  return (char)v7;
}

- (id)status
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteRecordComputeStatePushQueue;
  v2 = [(CPLPrequeliteStorage *)&v5 status];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 discardedFileStorageIdentifiers:(id *)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableIndexSet);
  id v15 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v16 = [v15 pqlConnection];

  int64_t v17 = [(CPLPrequeliteStorage *)self mainTable];
  id v18 = [v16 cplFetch:@"SELECT rowID, fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v17, a3, a5];
  while (1)
  {

    if (![v18 next]) {
      break;
    }
    objc_msgSend(v14, "addIndex:", objc_msgSend(v18, "integerAtIndex:", 0));
    id v19 = [v18 stringAtIndex:1];
    int64_t v17 = sub_1001AF758(v19);

    if (v17) {
      [v13 addObject:v17];
    }
  }
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_11;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001B0534;
  v23[3] = &unk_10027F2F8;
  id v26 = &v27;
  id v20 = v16;
  id v24 = v20;
  id v25 = self;
  [v14 enumerateIndexesUsingBlock:v23];
  if (a7 && !*((unsigned char *)v28 + 24))
  {
    *a7 = [v20 lastError];
  }

  if (*((unsigned char *)v28 + 24))
  {
    *a6 = (int64_t)[v14 count];
    *a4 = v13;
    BOOL v21 = *((unsigned char *)v28 + 24) != 0;
  }
  else
  {
LABEL_11:
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (unint64_t)countOfComputeStates
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [v3 tableCountOfRecords:v4];

  return (unint64_t)v5;
}

@end