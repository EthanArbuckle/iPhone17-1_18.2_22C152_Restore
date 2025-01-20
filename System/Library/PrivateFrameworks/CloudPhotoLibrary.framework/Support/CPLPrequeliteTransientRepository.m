@interface CPLPrequeliteTransientRepository
- (BOOL)_appendChange:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5;
- (BOOL)_markChangesWithScopedIdentifiersAsMingled:(id)a3 error:(id *)a4;
- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteAllRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3;
- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasUnmingledChanges;
- (BOOL)hasUnmingledChangesForScope:(id)a3;
- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4;
- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6;
- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteTransientRepository)initWithAbstractObject:(id)a3;
- (id)_allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)_enumeratorForRecordsWithScopeIndex:(unint64_t)a3 maximumCount:(unint64_t)a4;
- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 class:(Class)a5 maximumCount:(unint64_t)a6;
- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 maximumCount:(unint64_t)a5;
- (id)_recordWithTransientType:(int)a3 scopedIdentifier:(id)a4;
- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledChangesWithScopeIdentifier:(id)a3;
- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)status;
- (id)unmingledChangeWithScopedIdentifier:(id)a3;
- (unint64_t)countOfStashedRecords;
- (unint64_t)countOfUnmingledRecords;
@end

@implementation CPLPrequeliteTransientRepository

- (CPLPrequeliteTransientRepository)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteTransientRepository;
  v3 = [(CPLPrequeliteStorage *)&v10 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    v5 = [v4 objectForKey:@"CPLIgnoredPulledIdentifiers"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 componentsSeparatedByString:@","];

      v5 = (void *)v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        return (CPLPrequeliteTransientRepository *)v3;
      }
    }
    if (v5)
    {
      id v7 = [objc_alloc((Class)NSSet) initWithArray:v5];
      v8 = *(void **)(v3 + 36);
      *(void *)(v3 + 36) = v7;

      goto LABEL_7;
    }
  }
  return (CPLPrequeliteTransientRepository *)v3;
}

- (BOOL)initializeStorage
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPrequeliteTransientRepository;
  BOOL v3 = [(CPLPrequeliteStorage *)&v8 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"transientType INTEGER NOT NULL,class TEXT NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,relatedIdentifier TEXT,mingled INTEGER NOT NULL,dequeueOrder INTEGER DEFAULT 0,serializedRecord DATA NOT NULL" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"scopeIndex, identifier" unique:1 error:0];
      if (v3)
      {
        unsigned int v4 = [(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier" withDefinition:@"scopeIndex, relatedIdentifier" unique:0 error:0];
        LOBYTE(v3) = 0;
        if (v4)
        {
          unsigned int v5 = [(CPLPrequeliteStorage *)self createIndexWithName:@"pop" withDefinition:@"transientType, mingled, class, scopeIndex" unique:0 error:0];
          LOBYTE(v3) = 0;
          if (v5)
          {
            unsigned int v6 = [(CPLPrequeliteStorage *)self createIndexWithName:@"class" withDefinition:@"class, scopeIndex" unique:0 error:0];
            LOBYTE(v3) = 0;
            if (v6) {
              LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"mingled" withDefinition:@"mingled, scopeIndex" unique:0 error:0];
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
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteTransientRepository;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v10, "upgradeStorageToVersion:");
  if (a3 != 19 && v5)
  {
    LOBYTE(v5) = 1;
    if (a3 <= 54)
    {
      if (a3 == 39)
      {
        if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
        {
          LOBYTE(v5) = [(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"transientType, class, scopeIndex, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord" oldFields:@"transientType, class, 1, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord" error:0];
          return v5;
        }
        goto LABEL_25;
      }
      if (a3 == 53)
      {
        if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
          goto LABEL_25;
        }
        BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"relatedIdentifier" error:0];
        if (v5)
        {
          CFStringRef v6 = @"relatedScopedIdentifier";
          CFStringRef v7 = @"scopeIndex, relatedIdentifier";
          goto LABEL_14;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case '7':
          if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
            goto LABEL_25;
          }
          BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"class" error:0];
          if (v5) {
            LOBYTE(v5) = [(CPLPrequeliteStorage *)self dropIndexWithName:@"transientType" error:0];
          }
          break;
        case ';':
          if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
            goto LABEL_25;
          }
          BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"pop" error:0];
          if (v5)
          {
            unsigned int v8 = [(CPLPrequeliteStorage *)self createIndexWithName:@"pop" withDefinition:@"transientType, mingled, class, scopeIndex" unique:0 error:0];
            LOBYTE(v5) = 0;
            if (v8)
            {
              BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"mingled" error:0];
              if (v5)
              {
                CFStringRef v6 = @"mingled";
                CFStringRef v7 = @"mingled, scopeIndex";
                goto LABEL_14;
              }
            }
          }
          break;
        case 'E':
          if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
          {
            CFStringRef v6 = @"class";
            CFStringRef v7 = @"class, scopeIndex";
LABEL_14:
            LOBYTE(v5) = [(CPLPrequeliteStorage *)self createIndexWithName:v6 withDefinition:v7 unique:0 error:0];
            return v5;
          }
LABEL_25:
          LOBYTE(v5) = 1;
          break;
      }
    }
  }
  return v5;
}

- (BOOL)hasUnmingledChanges
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned int v4 = [(CPLPrequeliteStorage *)self mainTable];
  BOOL v5 = +[PQLFormatInjection formatInjection:@"mingled = %i", 0];
  unsigned __int8 v6 = [v3 table:v4 hasRecordsMatchingQuery:v5];

  return v6;
}

- (BOOL)hasUnmingledChangesForScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [v4 localIndex];

  unsigned int v8 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND mingled = %i", v7, 0];
  unsigned __int8 v9 = [v5 table:v6 hasRecordsMatchingQuery:v8];

  return v9;
}

- (BOOL)_appendChange:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = [v8 scopedIdentifier];
  objc_super v10 = v9;
  v11 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  if (v11)
  {
    v12 = [v9 identifier];
    unsigned __int8 v13 = [v11 containsObject:v12];

    if (v13)
    {
      unsigned __int8 v14 = 1;
      goto LABEL_51;
    }
  }
  v15 = [v10 scopeIdentifier];
  int64_t v16 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v15];

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [v8 realIdentifier];

    int64_t v60 = v16;
    if (v17)
    {
      uint64_t v18 = 1;
    }
    else if ([v8 changeType] == (id)1024)
    {
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v18 = 3;
    }
    v19 = [v10 identifier];
    v20 = [v8 relatedIdentifier];
    v21 = +[CPLArchiver archivedDataWithRootObject:v8];
    if (!v21)
    {
      if (!_CPLSilentLogging)
      {
        v34 = sub_1001A2DC8();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v8;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }
      id v35 = [objc_alloc((Class)NSString) initWithFormat:@"can't serialize %@", objc_opt_class()];
      if (a5)
      {
        +[CPLErrors invalidCloudCacheErrorWithReason:v35];
        unsigned __int8 v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
      goto LABEL_50;
    }
    v55 = v10;
    v57 = a5;
    v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    [(CPLPrequeliteStorage *)self pqStore];
    v24 = v21;
    v25 = v20;
    v27 = v26 = v19;
    [v27 pqlConnection];
    v29 = uint64_t v28 = v18;

    v30 = [(CPLPrequeliteStorage *)self mainTable];
    v58 = v24;
    v59 = v26;
    v51 = v24;
    BOOL v54 = v6;
    v31 = v25;
    v56 = (void *)v23;
    uint64_t v50 = v23;
    v32 = v29;
    unsigned int v33 = [v29 cplExecute:@"INSERT OR IGNORE INTO %@ (transientType, class, scopeIndex, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord) VALUES (%i, %@, %ld, %@, %@, %i, %ld, %@)", v30, v28, v50, v60, v26, v25, v6, objc_msgSend(v8, "dequeueOrder"), v51];

    if (v33)
    {
      if (![v29 changes])
      {
        v38 = [v8 realIdentifier];

        v20 = v25;
        unsigned int v39 = [v8 isDelete];
        objc_super v10 = v55;
        if (v39) {
          goto LABEL_36;
        }
        if (v38) {
          goto LABEL_36;
        }
        if ([v8 isFullRecord]) {
          goto LABEL_36;
        }
        v40 = [(CPLPrequeliteTransientRepository *)self recordWithScopedIdentifier:v55];
        if (!v40) {
          goto LABEL_36;
        }
        v53 = v40;
        id v41 = [v40 mergeRecordChangeWithNewRecordChange:v8 direction:2];
        if (!_CPLSilentLogging)
        {
          v52 = sub_1001A2DC8();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v62 = v8;
            __int16 v63 = 2112;
            v64 = v53;
            __int16 v65 = 2112;
            id v66 = v41;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Merging %@ and %@: %@", buf, 0x20u);
          }
        }
        if (!v41) {
LABEL_36:
        }
          id v41 = v8;
        uint64_t v42 = +[CPLArchiver archivedDataWithRootObject:v41];
        if (v42)
        {
          if (v39) {
            unsigned int v43 = 2;
          }
          else {
            unsigned int v43 = 3;
          }
          if (v38) {
            uint64_t v44 = 1;
          }
          else {
            uint64_t v44 = v43;
          }
          v45 = [(CPLPrequeliteStorage *)self mainTable];
          v46 = (void *)v42;
          unsigned __int8 v14 = [v32 cplExecute:@"UPDATE %@ SET transientType = %i, mingled = %i, dequeueOrder = %ld, serializedRecord = %@ WHERE scopeIndex = %ld AND identifier = %@", v45, v44, v54, objc_msgSend(v8, "dequeueOrder"), v42, v60, v59];

          if (v57)
          {
            v19 = v59;
            id v35 = v56;
            if ((v14 & 1) == 0)
            {
              [v32 lastCPLError];
              unsigned __int8 v14 = 0;
              id *v57 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v19 = v59;
            id v35 = v56;
          }
        }
        else
        {
          v46 = 0;
          id v35 = v56;
          if (!_CPLSilentLogging)
          {
            v48 = sub_1001A2DC8();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v62 = v41;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
            }
          }
          id v49 = [objc_alloc((Class)NSString) initWithFormat:@"can't serialize %@", objc_opt_class()];
          if (v57)
          {
            id *v57 = +[CPLErrors invalidCloudCacheErrorWithReason:v49];
          }

          unsigned __int8 v14 = 1;
          v19 = v59;
        }

        v21 = v58;
        goto LABEL_49;
      }
      unsigned __int8 v14 = 1;
    }
    else
    {
      v36 = v29;
      if (!v57)
      {
        unsigned __int8 v14 = 0;
        v21 = v58;
        v19 = v26;
        v20 = v31;
        id v35 = v56;
        v32 = v36;
        goto LABEL_48;
      }
      v37 = v29;
      [v29 lastCPLError];
      unsigned __int8 v14 = 0;
      id *v57 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v37;
    }
    v21 = v58;
    v19 = v26;
    v20 = v31;
    id v35 = v56;
LABEL_48:
    objc_super v10 = v55;
LABEL_49:

LABEL_50:
    goto LABEL_51;
  }
  if (a5)
  {
    +[CPLErrors invalidScopeErrorWithScopedIdentifier:v10];
    unsigned __int8 v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v14 = 0;
  }
LABEL_51:

  return v14;
}

- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = a3;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[CPLPrequeliteTransientRepository _appendChange:alreadyMingled:error:](self, "_appendChange:alreadyMingled:error:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, a5, (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_markChangesWithScopedIdentifiersAsMingled:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 count]) {
    goto LABEL_12;
  }
  v26 = a4;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10) {
    goto LABEL_11;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
  id v25 = v6;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned __int8 v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      long long v16 = [v14 scopeIdentifier];
      int64_t v17 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v16];

      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = [v14 scopeIdentifier];
        id v21 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v23];

LABEL_15:

        if (v26)
        {
          id v21 = v21;
          BOOL v22 = 0;
          id *v26 = v21;
        }
        else
        {
          BOOL v22 = 0;
        }
        id v6 = v25;
        goto LABEL_19;
      }
      long long v18 = [(CPLPrequeliteStorage *)self mainTable];
      v19 = [v14 identifier];
      unsigned __int8 v20 = [v8 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v18, 1, v17, v19];

      if ((v20 & 1) == 0)
      {
        id v21 = [v8 lastError];
        goto LABEL_15;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    id v6 = v25;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_12:
  id v21 = 0;
  BOOL v22 = 1;
LABEL_19:

  return v22;
}

- (id)_enumeratorForRecordsWithScopeIndex:(unint64_t)a3 maximumCount:(unint64_t)a4
{
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  uint64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = (void *)v9;
  if (a4 == -1) {
    id v11 = [v8 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND scopeIndex = %lu", v9, 0, a3, v16];
  }
  else {
    id v11 = [v8 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND scopeIndex = %lu LIMIT %lu", v9, 0, a3, a4];
  }
  uint64_t v12 = v11;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A32D8;
  v17[3] = &unk_10027F678;
  v17[4] = self;
  BOOL v13 = [v12 enumerateObjects:v17];
  unsigned __int8 v14 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v13];

  return v14;
}

- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [v9 pqlConnection];

  uint64_t v11 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v12 = (void *)v11;
  if (a5 == -1) {
    id v13 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND scopeIndex = %lu", v11, v7, 0, a4, v18];
  }
  else {
    id v13 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND scopeIndex = %lu LIMIT %lu", v11, v7, 0, a4, a5];
  }
  unsigned __int8 v14 = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A34A8;
  v19[3] = &unk_10027F678;
  v19[4] = self;
  long long v15 = [v14 enumerateObjects:v19];
  uint64_t v16 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v15];

  return v16;
}

- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 class:(Class)a5 maximumCount:(unint64_t)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v12 = [v11 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v14 = NSStringFromClass(a5);
  long long v15 = (void *)v14;
  if (a6 == -1) {
    id v16 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND class = %@ AND scopeIndex = %lu", v13, v9, 0, v14, a4, v21];
  }
  else {
    id v16 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND class = %@ AND scopeIndex = %lu LIMIT %lu", v13, v9, 0, v14, a4, a6];
  }
  int64_t v17 = v16;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001A369C;
  v22[3] = &unk_10027F678;
  v22[4] = self;
  uint64_t v18 = [v17 enumerateObjects:v22];
  v19 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v18];

  return v19;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopeIdentifier];
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v9 = [v8 pqlConnection];

    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v11 = [v4 identifier];
    id v7 = [v9 cplFetchObject:&stru_10027F698, @"SELECT serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v6, v11 sql];
  }
  return v7;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopeIdentifier];
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v4 identifier];
    uint64_t v11 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND identifier = %@", v6, v10];
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v7;
}

- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopeIdentifier];
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v4 identifier];
    uint64_t v11 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND identifier = %@ AND mingled = %i", v6, v10, 2];
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v7;
}

- (id)_recordWithTransientType:(int)a3 scopedIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned __int8 v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v11 = [v10 pqlConnection];

    uint64_t v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [v6 identifier];
    id v9 = [v11 cplFetchObject:&stru_10027F6B8, @"SELECT serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@ AND +transientType = %i AND +mingled = %i", v12, v8, v13, v4, 0 sql];
  }
  return v9;
}

- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  if (a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = -1;
  }
  id v8 = objc_alloc_init((Class)CPLChangeBatch);
  unsigned __int8 v20 = self;
  -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:](self, "_enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:", 1, [v6 localIndex], v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v23;
    unint64_t v21 = v7 - 1;
LABEL_6:
    uint64_t v14 = 0;
    uint64_t v15 = v21 - v12;
    v12 += (uint64_t)v11;
    while (1)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
      [v8 addRecord:v16];
      int64_t v17 = [v16 scopedIdentifier];

      if (!v17) {
        sub_1001D2D30((uint64_t)v16, (uint64_t)a2, (uint64_t)v20);
      }
      if (v15 == v14) {
        break;
      }
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  return v8;
}

- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6
{
  id v8 = a4;
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = -1;
  }
  id v10 = objc_alloc_init((Class)CPLChangeBatch);
  id v11 = objc_alloc((Class)NSMutableSet);
  if (v9 >= 0x14) {
    uint64_t v12 = 20;
  }
  else {
    uint64_t v12 = v9;
  }
  id v13 = objc_msgSend(v11, "initWithCapacity:", v12, a2);
  v32 = v8;
  unsigned int v33 = self;
  -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:](self, "_enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:", 1, [v8 localIndex], v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v35;
    unint64_t v30 = v9 - 1;
LABEL_9:
    uint64_t v19 = 0;
    uint64_t v20 = v30 - v17;
    v17 += (uint64_t)v16;
    while (1)
    {
      if (*(void *)v35 != v18) {
        objc_enumerationMutation(v14);
      }
      unint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
      [v10 addRecord:v21];
      long long v22 = [v21 scopedIdentifier];

      if (!v22) {
        sub_1001D2E18((uint64_t)v21, v28, (uint64_t)v33);
      }
      long long v23 = [v21 scopedIdentifier];
      [v13 addObject:v23];

      if (v20 == v19) {
        break;
      }
      if (v16 == (id)++v19)
      {
        id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v16) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  unsigned int v24 = [(CPLPrequeliteTransientRepository *)v33 _markChangesWithScopedIdentifiersAsMingled:v13 error:a6];
  if (v24)
  {
    id v25 = [v10 count];
    if (v25) {
      id v25 = v10;
    }
    *a3 = v25;
  }

  return v24;
}

- (id)unmingledChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopeIdentifier];
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    unint64_t v9 = [v8 pqlConnection];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A40F0;
    v14[3] = &unk_10027F678;
    v14[4] = self;
    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    id v11 = [v4 identifier];
    id v7 = [v9 cplFetchObject:v14, @"SELECT scopeIndex, serializedRecord, mingled FROM %@ WHERE identifier = %@ AND scopeIndex = %lu", v10, v11, v6 sql];

    id v12 = +[NSNull null];

    if (v7 == v12)
    {

      id v7 = 0;
    }
  }
  return v7;
}

- (id)_allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  int64_t v8 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }
  else
  {
    int64_t v10 = v8;
    id v11 = [(CPLPrequeliteStorage *)self pqStore];
    id v12 = [v11 pqlConnection];

    id v13 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v14 = NSStringFromClass(a3);
    id v15 = (void *)v14;
    if (a5 == -1) {
      id v16 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND class = %@ AND scopeIndex = %lu", v13, 0, v14, v10, v20];
    }
    else {
      id v16 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND class = %@ AND scopeIndex = %lu LIMIT %lu", v13, 0, v14, v10, a5];
    }
    uint64_t v17 = v16;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001A430C;
    v21[3] = &unk_10027F678;
    v21[4] = self;
    uint64_t v18 = [v17 enumerateObjects:v21];
    unint64_t v9 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v18];
  }
  return v9;
}

- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  return [(CPLPrequeliteTransientRepository *)self _allUnmingledChangesWithClass:a3 scopeIdentifier:a4 maximumCount:-1];
}

- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    id v7 = [(CPLPrequeliteTransientRepository *)self _enumeratorForRecordsWithTransientType:3 scopeIndex:v6 class:a3 maximumCount:-1];
  }
  return v7;
}

- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  int64_t v6 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    id v7 = [(CPLPrequeliteTransientRepository *)self _enumeratorForRecordsWithTransientType:2 scopeIndex:v6 class:a3 maximumCount:-1];
  }
  return v7;
}

- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }
  else
  {
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    id v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [v6 identifier];
    id v14 = [v11 cplFetch:@"SELECT scopeIndex, serializedRecord, mingled FROM %@ WHERE relatedIdentifier = %@ AND scopeIndex = %lu AND +mingled = %i", v12, v13, v8, 0];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001A4600;
    v17[3] = &unk_10027F6E0;
    v17[4] = self;
    void v17[5] = a3;
    id v15 = [v14 enumerateObjects:v17];
    unint64_t v9 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v15];
  }
  return v9;
}

- (id)allUnmingledChangesWithScopeIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = &__NSArray0__struct;
  }
  else
  {
    BOOL v5 = [(CPLPrequeliteTransientRepository *)self _enumeratorForRecordsWithScopeIndex:v4 maximumCount:-1];
  }
  return v5;
}

- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [v7 pqlConnection];

  unint64_t v9 = [v6 scopeIdentifier];
  int64_t v10 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      id v11 = [v6 scopeIdentifier];
      *a4 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v11];
    }
    goto LABEL_7;
  }
  id v12 = [(CPLPrequeliteStorage *)self mainTable];
  id v13 = [v6 identifier];
  BOOL v14 = 1;
  unsigned __int8 v15 = [v8 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v12, 1, v10, v13];

  if ((v15 & 1) == 0)
  {
    if (!a4)
    {
LABEL_7:
      BOOL v14 = 0;
      goto LABEL_8;
    }
    [v8 lastCPLError];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v14;
}

- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
  unint64_t v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND mingled = %i", v6, 1];
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
  unint64_t v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND mingled = %i", v6, 0];
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int64_t v6 = v4;
    id v7 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
    unint64_t v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND mingled != %i", v6, 1];
    unsigned int v5 = [v7 table:v8 hasRecordsMatchingQuery:v9] ^ 1;
  }
  return v5;
}

- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [v7 pqlConnection];

  id v9 = v6;
  unsigned __int8 v10 = [(CPLPrequeliteStorage *)self mainTable];
  id v11 = [v9 localIndexesInjection];
  unsigned __int8 v12 = [v8 cplExecute:@"UPDATE OR FAIL %@ SET mingled = %i WHERE %@ AND mingled = %i", v10, 0, v11, 1];

  if (a4 && (v12 & 1) == 0)
  {
    *a4 = [v8 lastCPLError];
  }

  return v12;
}

- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v6];
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
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    unsigned __int8 v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND mingled = %i", v12, v9, 1];

    if (v8)
    {
      uint64_t v13 = (uint64_t)[v11 changes];
      if (v13 >= 1 && !_CPLSilentLogging)
      {
        uint64_t v14 = v13;
        unsigned __int8 v15 = sub_1001A2DC8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v18 = v14;
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed %lld mingled processed changes for %@", buf, 0x16u);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  int64_t v7 = [v4 localIndexesInjection];

  unsigned __int8 v8 = +[PQLFormatInjection formatInjection:@"%@ AND mingled != %i", v7, 1];
  unsigned __int8 v9 = [v5 table:v6 hasRecordsMatchingQuery:v8];

  return v9;
}

- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 scopeIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      unsigned __int8 v9 = [v6 scopeIdentifier];
      *a4 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v9];
    }
    unsigned __int8 v10 = 0;
  }
  else
  {
    id v11 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v12 = [v11 pqlConnection];

    uint64_t v13 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v14 = [v6 identifier];
    unsigned __int8 v10 = [v12 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v13, 2, v8, v14];

    if (v10)
    {
      if ((uint64_t)[v12 changes] >= 1 && !_CPLSilentLogging)
      {
        unsigned __int8 v15 = sub_1001A2DC8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stashed %@", buf, 0xCu);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v12 lastError];
    }
  }
  return v10;
}

- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  int64_t v11 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v10];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v13 = v11;
    uint64_t v14 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v15 = [v14 pqlConnection];

    uint64_t v16 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v17 = (void *)v16;
    if (a4)
    {
      unsigned __int8 v18 = [v15 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND mingled = %i LIMIT %lu", v16, 0, v13, 2, a4];

      if (v18)
      {
        *a5 = (unint64_t)[v15 changes] >= a4;
LABEL_10:
        BOOL v12 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v19 = [v15 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND mingled = %i", v16, 0, v13, 2];

      if (v19)
      {
        *a5 = 0;
        goto LABEL_10;
      }
    }
    if (a6)
    {
      [v15 lastError];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
    goto LABEL_14;
  }
  if (a6)
  {
    +[CPLErrors invalidScopeErrorWithScopeIdentifier:v10];
    BOOL v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND mingled = %i", v6, 2];
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)deleteAllRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v6];
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
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v11 = [v10 pqlConnection];

    BOOL v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld", v12, v9];

    if (v8)
    {
      uint64_t v13 = (uint64_t)[v11 changes];
      if (v13 >= 1 && !_CPLSilentLogging)
      {
        uint64_t v14 = v13;
        unsigned __int8 v15 = sub_1001A2DC8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v18 = v14;
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Deleted %lld changes for %@", buf, 0x16u);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (unint64_t)countOfUnmingledRecords
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v5 = +[PQLFormatInjection formatInjection:@"mingled = %i", 0];
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (unint64_t)countOfStashedRecords
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v5 = +[PQLFormatInjection formatInjection:@"mingled = %i", 2];
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (id)status
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPrequeliteTransientRepository;
  BOOL v3 = [(CPLPrequeliteStorage *)&v8 status];
  id v4 = [v3 mutableCopy];

  unint64_t v5 = [(CPLPrequeliteTransientRepository *)self countOfUnmingledRecords];
  if (v5) {
    objc_msgSend(v4, "appendFormat:", @"\n\t%lu unmingled changes", v5);
  }
  unint64_t v6 = [(CPLPrequeliteTransientRepository *)self countOfStashedRecords];
  if (v6) {
    objc_msgSend(v4, "appendFormat:", @"\n\t%lu stashed changes", v6);
  }
  return v4;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v12 = [v11 pqlConnection];

  uint64_t v13 = [(CPLPrequeliteStorage *)self mainTable];
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
}

@end