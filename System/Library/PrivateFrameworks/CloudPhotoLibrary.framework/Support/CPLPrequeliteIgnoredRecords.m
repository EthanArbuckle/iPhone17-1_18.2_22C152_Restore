@interface CPLPrequeliteIgnoredRecords
- (BOOL)_isEmpty;
- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4;
- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteIgnoredRecords)initWithAbstractObject:(id)a3;
- (id)ignoredRecordWithScopedIdentifier:(id)a3;
- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)recordsDesignation;
- (id)status;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteIgnoredRecords

- (CPLPrequeliteIgnoredRecords)initWithAbstractObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPrequeliteIgnoredRecords;
  v3 = [(CPLPrequeliteStorage *)&v8 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = +[CPLPrequeliteVariable variableWithName:@"isEmpty" type:v4];
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;
  }
  return (CPLPrequeliteIgnoredRecords *)v3;
}

- (BOOL)_isEmpty
{
  v2 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B079C;
  v6[3] = &unk_10027F8B8;
  v6[4] = self;
  v3 = [v2 valueWithConstructor:v6];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)initializeStorage
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteIgnoredRecords;
  if (![(CPLPrequeliteStorage *)&v10 initializeStorage]
    || ![(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,serializedRecord DATA NOT NULL,ignoredDate TIMESTAMP NOT NULL,otherScopeIndex INTEGER NOT NULL,shadowed INTEGER NOT NULL" error:0]|| ![(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0]|| ![(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"scopeIndex, identifier" unique:1 error:0]|| ![(CPLPrequeliteStorage *)self createIndexOnColumn:@"otherScopeIndex" error:0]|| ![(CPLPrequeliteStorage *)self createIndexOnColumn:@"shadowed" error:0])
  {
    return 0;
  }
  v3 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v4 = [v3 pqlConnection];

  uint64_t v5 = [(CPLPrequeliteStorage *)self mainTable];
  v6 = +[CPLPrequeliteVariable indexVariableForVariableWithName:@"ignoredDate" forTable:v5];

  v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v4 cplExecute:@"CREATE INDEX %@ ON %@ (scopeIndex, ignoredDate ASC) WHERE shadowed != 0", v6, v7];

  return v8;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v55.receiver = self;
  v55.super_class = (Class)CPLPrequeliteIgnoredRecords;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v55, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  switch(a3)
  {
    case 'I':
      return [(CPLPrequeliteStorage *)self createStorage];
    case 'J':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        v7 = [(CPLPrequeliteStorage *)self pqStore];
        unsigned __int8 v8 = [v7 pqlConnection];

        v9 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned int v10 = [v8 cplExecute:@"ALTER TABLE %@ ADD COLUMN shadowed INTEGER DEFAULT 1", v9];

        if (!v10) {
          goto LABEL_18;
        }
        unsigned __int8 v5 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"shadowed" error:0];
        goto LABEL_19;
      }
      return v5;
    case 'L':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v12 = v11;
        v13 = [(CPLPrequeliteStorage *)self pqStore];
        unsigned __int8 v8 = [v13 pqlConnection];

        v14 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned int v15 = [v8 cplExecute:@"ALTER TABLE %@ ADD COLUMN ignoredDate TIMESTAMP DEFAULT 0", v14];

        if (v15
          && ([(CPLPrequeliteStorage *)self mainTable],
              v16 = objc_claimAutoreleasedReturnValue(),
              unsigned int v17 = [v8 cplExecute:@"UPDATE %@ SET ignoredDate = %ld", v16, (unint64_t)v12], v16, v17))
        {
          v18 = [(CPLPrequeliteStorage *)self mainTable];
          v19 = +[CPLPrequeliteVariable indexVariableForVariableWithName:@"ignoredDate" forTable:v18];

          v20 = [(CPLPrequeliteStorage *)self mainTable];
          unsigned __int8 v5 = [v8 cplExecute:@"CREATE INDEX %@ ON %@ (scopeIndex, ignoredDate ASC) WHERE shadowed != 0", v19, v20];
        }
        else
        {
LABEL_18:
          unsigned __int8 v5 = 0;
        }
LABEL_19:
      }
      return v5;
    case 'N':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      v21 = [(CPLPrequeliteStorage *)self pqStore];
      v22 = [v21 pqlConnection];

      v23 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v24 = [v22 cplExecute:@"ALTER TABLE %@ ADD COLUMN otherScopeIndex INTEGER DEFAULT 0", v23];

      if (!v24
        || ![(CPLPrequeliteStorage *)self createIndexOnColumn:@"otherScopeIndex" error:0])
      {
        unsigned __int8 v25 = 0;
        goto LABEL_21;
      }
      if ([(CPLPrequeliteIgnoredRecords *)self _isEmpty])
      {
        unsigned __int8 v25 = 1;
        goto LABEL_21;
      }
      v26 = [(CPLPrequeliteStorage *)self pqStore];
      v27 = [v26 abstractObject];
      v28 = [v27 scopes];

      v29 = [v28 primaryScope];
      if (!v29)
      {
        unsigned __int8 v25 = 1;
        goto LABEL_49;
      }
      v30 = [v28 sharingScopeForScope:v29];
      if (v30)
      {
        v31 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned int v32 = [v22 cplExecute:@"UPDATE %@ SET otherScopeIndex = %ld WHERE scopeIndex = %ld", v31, objc_msgSend(v29, "cloudIndex"), objc_msgSend(v30, "cloudIndex")];

        if (!v32
          || (id v33 = [v22 changes],
              [(CPLPrequeliteStorage *)self mainTable],
              v34 = objc_claimAutoreleasedReturnValue(),
              unsigned int v35 = [v22 cplExecute:@"UPDATE %@ SET otherScopeIndex = %ld WHERE scopeIndex = %ld", v34, objc_msgSend(v30, "cloudIndex"), objc_msgSend(v29, "cloudIndex")], v34, !v35))
        {
          unsigned __int8 v25 = 0;
          goto LABEL_48;
        }
        v36 = [(CPLPrequeliteStorage *)self pqStore];
        objc_msgSend(v36, "recordUpgradeEvent:", @"Updated other scope index for %lld shared records and %lld private records", v33, objc_msgSend(v22, "changes"));

        goto LABEL_30;
      }
      if ([v28 valueForFlag:16 forScope:v29])
      {
LABEL_30:
        unsigned __int8 v25 = 1;
        goto LABEL_48;
      }
      v53 = v28;
      v37 = [(CPLPrequeliteStorage *)self pqStore];
      v54 = [v37 transientPullRepository];

      id v38 = [v29 cloudIndex];
      v39 = [(CPLPrequeliteStorage *)self mainTable];
      id v51 = v38;
      id v40 = [v22 cplFetch:@"SELECT serializedRecord FROM %@ WHERE scopeIndex = %ld", v39, v38];

      id v41 = objc_alloc_init((Class)CPLChangeBatch);
      v42 = 0;
      unsigned __int8 v25 = 1;
      while ([v40 next])
      {
        v44 = [v40 cplChangeAtIndex:0];
        if (v44)
        {
          ++v42;
          [v41 addRecord:v44];
          if ((unint64_t)[v41 count] >= 0xC9)
          {
            unsigned __int8 v25 = [v54 appendBatch:v41 alreadyMingled:0 error:0];
            id v45 = objc_alloc_init((Class)CPLChangeBatch);

            id v41 = v45;
          }
        }

        if ((v25 & 1) == 0) {
          goto LABEL_47;
        }
      }
      if (v25)
      {
        if ((![v41 count]
           || [v54 appendBatch:v41 alreadyMingled:0 error:0])
          && ([(CPLPrequeliteStorage *)self mainTable],
              v46 = objc_claimAutoreleasedReturnValue(),
              unsigned int v47 = [v22 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld", v46, v51], v46, v47))
        {
          v48 = (char *)[v22 changes];
          v49 = [(CPLPrequeliteStorage *)self pqStore];
          if (v42 == v48) {
            objc_msgSend(v49, "recordUpgradeEvent:", @"Transferred %lu private records to transient pull repository", v42, v50);
          }
          else {
            objc_msgSend(v49, "recordUpgradeEvent:", @"Transferred %lu private records to transient pull repository (deleted %lld)", v42, objc_msgSend(v22, "changes"));
          }

          unsigned __int8 v25 = 1;
        }
        else
        {
          unsigned __int8 v25 = 0;
        }
      }
LABEL_47:

      v30 = 0;
      v28 = v53;
LABEL_48:

LABEL_49:
LABEL_21:

      unsigned __int8 v5 = v25 & 1;
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)ignoredRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CPLPrequeliteIgnoredRecords *)self _isEmpty]
    || (int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4], v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    v9 = [v8 pqlConnection];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001B1154;
    v14[3] = &unk_10027EE80;
    id v15 = v4;
    unsigned int v10 = [(CPLPrequeliteStorage *)self mainTable];
    double v11 = [v15 identifier];
    id v6 = [v9 cplFetchObject:v14, @"SELECT scopeIndex, identifier, serializedRecord, ignoredDate FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v10, v11, v7 sql];

    id v12 = +[NSNull null];

    if (v6 == v12)
    {

      id v6 = 0;
    }
  }
  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CPLPrequeliteIgnoredRecords *)self _isEmpty]
    || (int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4], v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    v9 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v10 = [v4 identifier];
    double v11 = +[PQLFormatInjection formatInjection:@"identifier = %@ AND scopeIndex = %ld", v10, v7];
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v6;
}

- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 scopedIdentifier];
  int64_t v13 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v12];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a6)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v12];
      unsigned __int8 v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    int64_t v15 = v13;
    v28 = a6;
    unsigned int v30 = [v10 supportsSharingScopedIdentifier];
    id v16 = [v10 copy];
    [v16 prepareForStorage];
    id v29 = v16;
    uint64_t v17 = +[CPLArchiver archivedDataWithRootObject:v16];
    [(CPLPrequeliteStorage *)self pqStore];
    v19 = v18 = v11;
    v20 = [v19 pqlConnection];

    v21 = [(CPLPrequeliteStorage *)self mainTable];
    v22 = [v12 identifier];
    [v18 timeIntervalSinceReferenceDate];
    int64_t v27 = a5;
    unsigned int v24 = (void *)v17;
    unsigned __int8 v14 = [v20 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, identifier, serializedRecord, shadowed, ignoredDate, otherScopeIndex) VALUES (%ld, %@, %@, %d, %ld, %ld)", v21, v15, v22, v17, v30, (uint64_t)v23, v27];

    if (v14)
    {
      [*(id *)(&self->super._shouldUpgradeSchema + 1) setValue:&__kCFBooleanFalse];
      unsigned __int8 v25 = v29;
      id v11 = v18;
    }
    else
    {
      unsigned __int8 v25 = v29;
      id v11 = v18;
      if (v28)
      {
        id *v28 = [v20 lastCPLError];
      }
    }
  }
  return v14;
}

- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CPLPrequeliteIgnoredRecords *)self _isEmpty])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    int64_t v8 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v6];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        +[CPLErrors invalidScopeErrorWithScopedIdentifier:v6];
        unsigned __int8 v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      int64_t v9 = v8;
      id v10 = [(CPLPrequeliteStorage *)self pqStore];
      id v11 = [v10 pqlConnection];

      id v12 = [(CPLPrequeliteStorage *)self mainTable];
      int64_t v13 = [v6 identifier];
      unsigned __int8 v7 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v12, v9, v13];

      if (a4 && (v7 & 1) == 0)
      {
        *a4 = [v11 lastCPLError];
      }
      [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
    }
  }

  return v7;
}

- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v9];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = &__NSArray0__struct;
  }
  else
  {
    int64_t v12 = v10;
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
    unsigned __int8 v14 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v15 = [v14 pqlConnection];

    id v16 = [(CPLPrequeliteStorage *)self mainTable];
    [v8 timeIntervalSinceReferenceDate];
    int64_t v27 = v15;
    id v18 = [v15 cplFetch:@"SELECT scopeIndex, identifier, serializedRecord, ignoredDate FROM %@ WHERE shadowed != 0 AND scopeIndex = %ld AND ignoredDate < %ld LIMIT %ld", v16, v12, (uint64_t)v17, a5];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001B18C4;
    v28[3] = &unk_10027F5C8;
    id v29 = v9;
    int64_t v30 = v12;
    v19 = [v18 enumerateObjects:v28];
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          unsigned int v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          unsigned __int8 v25 = +[NSNull null];

          if (v24 != v25) {
            [v13 addObject:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }

    id v11 = [v13 copy];
  }

  return v11;
}

- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v9];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
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
  }
  else
  {
    int64_t v12 = v10;
    id v13 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v14 = [v13 pqlConnection];

    int64_t v15 = [(CPLPrequeliteStorage *)self mainTable];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v17 = (uint64_t)v16;
    id v18 = [v9 identifier];
    unsigned __int8 v11 = [v14 cplExecute:@"UPDATE %@ SET ignoredDate = %ld WHERE scopeIndex = %ld AND identifier = %@", v15, v17, v12, v18];

    if (a5 && (v11 & 1) == 0)
    {
      *a5 = [v14 lastCPLError];
    }
  }
  return v11;
}

- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v11 = [(CPLPrequeliteStorage *)self mainTable];
    [v6 timeIntervalSinceReferenceDate];
    id v13 = +[PQLFormatInjection formatInjection:@"shadowed != 0 AND scopeIndex = %ld AND ignoredDate < %ld", v9, (uint64_t)v12];
    unsigned __int8 v8 = [v10 table:v11 hasRecordsMatchingQuery:v13];
  }
  return v8;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = [(CPLPrequeliteStorage *)self pqStore];
  double v12 = [v11 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }
  else if (a6)
  {
    *a6 = [v12 lastError];
  }
  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];

  return v14;
}

- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v11 = [v10 pqlConnection];

  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
  id v13 = objc_alloc_init((Class)NSMutableIndexSet);
  unsigned int v14 = [(CPLPrequeliteStorage *)self mainTable];
  id v15 = [v11 cplFetch:@"SELECT rowid, scopeIndex, identifier FROM %@ WHERE otherScopeIndex = %ld LIMIT %lu", v14, a4, a5];

  if ([v15 next])
  {
    id v16 = 0;
    uint64_t v17 = 0;
    do
    {
      objc_msgSend(v13, "addIndex:", objc_msgSend(v15, "integerAtIndex:", 0));
      id v18 = [v15 integerAtIndex:1];
      if (v18 != v16)
      {
        v19 = [(CPLPrequeliteIgnoredRecords *)self abstractObject];
        id v20 = [v19 engineStore];
        id v21 = [v20 scopes];

        uint64_t v22 = [v21 scopeIdentifierForCloudScopeIndex:v18];

        if (v22)
        {
          double v23 = [v21 scopeWithIdentifier:v22];
          if (!v23 || [v21 valueForFlag:16 forScope:v23])
          {

            uint64_t v22 = 0;
          }
        }
        uint64_t v17 = v22;
        id v16 = v18;
      }
      if (v17)
      {
        id v24 = objc_alloc((Class)CPLScopedIdentifier);
        unsigned __int8 v25 = [v15 stringAtIndex:2];
        id v26 = [v24 initWithScopeIdentifier:v17 identifier:v25 scopeIndex:v18];

        [v12 addObject:v26];
      }
    }
    while (([v15 next] & 1) != 0);
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1001B20AC;
  v43 = sub_1001B20BC;
  id v44 = 0;
  if ([v13 count])
  {
    int64_t v27 = [(CPLPrequeliteStorage *)self mainTable];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1001B20C4;
    v34[3] = &unk_10027EE58;
    v37 = &v45;
    id v35 = v11;
    id v28 = v27;
    id v36 = v28;
    id v38 = &v39;
    [v13 enumerateIndexesUsingBlock:v34];
  }
  if (*((unsigned char *)v46 + 24))
  {
    *a3 = [v12 copy];
    *a6 = (int64_t)[v13 count];
  }
  else if (a7)
  {
    *a7 = (id) v40[5];
  }
  char v29 = *((unsigned char *)v46 + 24);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v29;
}

- (id)recordsDesignation
{
  return @"ignored records";
}

- (id)status
{
  v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  int64_t v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    id v6 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = +[PQLFormatInjection formatInjection:@"shadowed = 1"];
    int64_t v9 = [v6 table:v7 countOfRecordsMatchingQuery:v8];

    if (v5 == v9)
    {
      int64_t v10 = [(CPLPrequeliteIgnoredRecords *)self recordsDesignation];
      +[NSString stringWithFormat:@"%lu %@ (all shadowed)", v5, v10, v16, v17];
    }
    else
    {
      uint64_t v11 = [(CPLPrequeliteIgnoredRecords *)self recordsDesignation];
      int64_t v10 = (void *)v11;
      if (v9)
      {
        id v16 = v9;
        int64_t v17 = v5 - v9;
        unsigned int v14 = v5;
        uint64_t v15 = v11;
        CFStringRef v12 = @"%lu %@ (%lu shadowed - %lu split)";
      }
      else
      {
        unsigned int v14 = v5;
        uint64_t v15 = v11;
        CFStringRef v12 = @"%lu %@ (all split)";
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v14, v15, v16, v17);
    }
    int64_t v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPrequeliteIgnoredRecords;
  [(CPLPrequeliteStorage *)&v3 writeTransactionDidFail];
  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
}

- (void).cxx_destruct
{
}

@end