@interface CPLPrequeliteClientCache
- (BOOL)_deleteBadRelations;
- (BOOL)_updateRelatedIdentifier:(id)a3 forRecordWithIdentifier:(id)a4;
- (BOOL)addRecord:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasRecordWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)updateRecord:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteClientCache)initWithAbstractObject:(id)a3;
- (id)_badContainerRelationsIdentifiers;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)recordsWithRelatedScopedIdentifier:(id)a3;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (void)fillRelatedIdentifiersInChange:(id)a3;
@end

@implementation CPLPrequeliteClientCache

- (CPLPrequeliteClientCache)initWithAbstractObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteClientCache;
  return [(CPLPrequeliteStorage *)&v4 initWithAbstractObject:a3];
}

- (BOOL)initializeStorage
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteClientCache;
  BOOL v3 = [(CPLPrequeliteStorage *)&v10 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,serializedRecord DATA NOT NULL" error:0];
    if (v3)
    {
      unsigned int v4 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:0 error:0];
      LOBYTE(v3) = 0;
      if (v4)
      {
        unsigned int v5 = [(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier" withDefinition:@"relatedIdentifier, scopeIndex" unique:0 error:0];
        LOBYTE(v3) = 0;
        if (v5)
        {
          unsigned int v6 = [(CPLPrequeliteStorage *)self createIndexWithName:@"secondaryScopedIdentifier" withDefinition:@"secondaryIdentifier, scopeIndex" unique:0 error:0];
          LOBYTE(v3) = 0;
          if (v6)
          {
            unsigned int v7 = [(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier.class" withDefinition:@"relatedIdentifier, scopeIndex, class" unique:0 error:0];
            LOBYTE(v3) = 0;
            if (v7)
            {
              unsigned int v8 = [(CPLPrequeliteStorage *)self createIndexWithName:@"secondaryScopedIdentifier.class" withDefinition:@"secondaryIdentifier, scopeIndex, class" unique:0 error:0];
              LOBYTE(v3) = 0;
              if (v8)
              {
                BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"class" error:0];
                if (v3) {
                  LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
                }
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
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteClientCache;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v12, "upgradeStorageToVersion:");
  if (!v5) {
    return v5;
  }
  LOBYTE(v5) = 1;
  if (a3 <= 51)
  {
    if (a3 != 20)
    {
      if (a3 == 39) {
        LOBYTE(v5) = [(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord" oldFields:@"1, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord" error:0];
      }
      return v5;
    }
    if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
    {
      CFStringRef v10 = @"class";
LABEL_23:
      LOBYTE(v5) = [(CPLPrequeliteStorage *)self createIndexOnColumn:v10 error:0];
      return v5;
    }
    goto LABEL_24;
  }
  if (a3 == 52)
  {
    if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
    {
      CFStringRef v10 = @"scopeIndex";
      goto LABEL_23;
    }
LABEL_24:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (a3 != 53) {
    return v5;
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    goto LABEL_24;
  }
  BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"identifier" error:0];
  if (v5)
  {
    BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"relatedIdentifier" error:0];
    if (v5)
    {
      BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"secondaryIdentifier" error:0];
      if (v5)
      {
        BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"relatedIdentifier.class" error:0];
        if (v5)
        {
          BOOL v5 = [(CPLPrequeliteStorage *)self dropIndexWithName:@"secondaryIdentifier.class" error:0];
          if (v5)
          {
            unsigned int v6 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:0 error:0];
            LOBYTE(v5) = 0;
            if (v6)
            {
              unsigned int v7 = [(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier" withDefinition:@"relatedIdentifier, scopeIndex" unique:0 error:0];
              LOBYTE(v5) = 0;
              if (v7)
              {
                unsigned int v8 = [(CPLPrequeliteStorage *)self createIndexWithName:@"secondaryScopedIdentifier" withDefinition:@"secondaryIdentifier, scopeIndex" unique:0 error:0];
                LOBYTE(v5) = 0;
                if (v8)
                {
                  unsigned int v9 = [(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier.class" withDefinition:@"relatedIdentifier, scopeIndex, class" unique:0 error:0];
                  LOBYTE(v5) = 0;
                  if (v9) {
                    LOBYTE(v5) = [(CPLPrequeliteStorage *)self createIndexWithName:@"secondaryScopedIdentifier.class" withDefinition:@"secondaryIdentifier, scopeIndex, class" unique:0 error:0];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 scopedIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v7];
      unsigned __int8 v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    int64_t v10 = v8;
    v11 = [v6 relatedIdentifier];
    objc_super v12 = [v6 secondaryIdentifier];
    id v13 = [v6 copy];
    [v13 clearIdentifiers];
    [v13 prepareForStorage];
    v14 = +[CPLArchiver archivedDataWithRootObject:v13];
    if (v14)
    {
      id v28 = v13;
      v15 = [(CPLPrequeliteStorage *)self pqStore];
      [v15 pqlConnection];
      v17 = v16 = a4;

      v18 = [(CPLPrequeliteStorage *)self mainTable];
      v19 = [v7 identifier];
      v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      v22 = v12;
      v23 = (void *)v21;
      v29 = v22;
      unsigned __int8 v9 = [v17 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord) VALUES (%ld, %@, %@, %@, %@, %@)", v18, v10, v19, v21, v11, v22, v14];

      if ((v9 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v24 = sub_1001AC8A8();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = [v17 lastCPLError];
            *(_DWORD *)buf = 138412546;
            id v31 = v7;
            __int16 v32 = 2112;
            v33 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to add record with identifier %@: %@", buf, 0x16u);
          }
        }
        if (v16)
        {
          id *v16 = [v17 lastCPLError];
        }
      }

      objc_super v12 = v29;
      id v13 = v28;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v26 = sub_1001AC8A8();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v6;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }
      if (a4)
      {
        +[CPLErrors invalidClientCacheErrorWithReason:0];
        unsigned __int8 v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
  }
  return v9;
}

- (BOOL)updateRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 scopedIdentifier];
  int64_t v8 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v7];
      unsigned __int8 v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    int64_t v10 = v8;
    v11 = [v6 relatedIdentifier];
    objc_super v12 = [v6 secondaryIdentifier];
    id v13 = [v6 copy];
    [v13 clearIdentifiers];
    [v13 prepareForStorage];
    v14 = +[CPLArchiver archivedDataWithRootObject:v13];
    if (v14)
    {
      id v29 = v13;
      [(CPLPrequeliteStorage *)self pqStore];
      v15 = a4;
      v16 = v14;
      v18 = v17 = v11;
      v19 = [v18 pqlConnection];

      v20 = [(CPLPrequeliteStorage *)self mainTable];
      uint64_t v21 = [v7 identifier];
      v22 = v12;
      v23 = (void *)v21;
      v30 = v22;
      id v31 = v17;
      id v28 = v17;
      v14 = v16;
      unsigned __int8 v9 = [v19 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@ WHERE identifier = %@ AND scopeIndex = %ld", v20, v16, v28, v22, v21, v10];

      if ((v9 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v24 = sub_1001AC8A8();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = [v19 lastCPLError];
            *(_DWORD *)buf = 138412546;
            id v33 = v7;
            __int16 v34 = 2112;
            v35 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to update record with identifier %@: %@", buf, 0x16u);
          }
        }
        if (v15)
        {
          id *v15 = [v19 lastCPLError];
        }
      }

      objc_super v12 = v30;
      v11 = v31;
      id v13 = v29;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v26 = sub_1001AC8A8();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v6;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }
      if (a4)
      {
        +[CPLErrors invalidClientCacheErrorWithReason:0];
        unsigned __int8 v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
  }
  return v9;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4
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
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    v11 = [v10 pqlConnection];

    objc_super v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [v6 identifier];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if ((v8 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v14 = sub_1001AC8A8();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v11 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v18 = v6;
          __int16 v19 = 2112;
          v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to delete record with identifier %@: %@", buf, 0x16u);
        }
      }
      if (a4)
      {
        *a4 = [v11 lastCPLError];
      }
    }
  }
  return v8;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001ACF10;
    v13[3] = &unk_10027EE80;
    id v14 = v4;
    int64_t v10 = [(CPLPrequeliteStorage *)self mainTable];
    v11 = [v14 identifier];
    id v6 = [v9 cplFetchObject:v13, @"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v10, v11, v7 sql];
  }
  return v6;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    uint64_t v10 = objc_opt_class();
    v11 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v12 = [v4 identifier];
    id v13 = [v9 cplFetchObjectOfClass:v10, @"SELECT relatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v11, v12, v7 sql];

    if (v13)
    {
      id v14 = objc_alloc((Class)CPLScopedIdentifier);
      v15 = [v4 scopeIdentifier];
      id v6 = [v14 initWithScopeIdentifier:v15 identifier:v13];

      [v6 setScopeIndex:v7];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v10 = [v4 identifier];
    v11 = +[PQLFormatInjection formatInjection:@"identifier = %@ AND scopeIndex = %ld", v10, v7];
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v6;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [v4 scopeIdentifier];
    int64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v10 = [v9 pqlConnection];

    v11 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v12 = [v4 identifier];
    id v13 = [v10 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE relatedIdentifier = %@ AND scopeIndex = %ld", v11, v12, v7];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001AD4E8;
    v18[3] = &unk_10027F5C8;
    id v19 = v8;
    int64_t v20 = v7;
    id v14 = v8;
    unsigned __int8 v6 = [v13 enumerateObjects:v18];
    if (!v6 && !_CPLSilentLogging)
    {
      v15 = sub_1001AC8A8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [v10 lastCPLError];
        *(_DWORD *)buf = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records with related identifier %@: %@", buf, 0x16u);
      }
    }
  }
  return v6;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    uint64_t v10 = [v6 scopeIdentifier];
    v11 = [(CPLPrequeliteStorage *)self pqStore];
    objc_super v12 = [v11 pqlConnection];

    id v13 = [(CPLPrequeliteStorage *)self mainTable];
    id v14 = [v6 identifier];
    v15 = NSStringFromClass(a4);
    id v16 = [v12 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld", v13, v14, v15, v9];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001AD8F4;
    v21[3] = &unk_10027F5C8;
    id v22 = v10;
    int64_t v23 = v9;
    id v17 = v10;
    unsigned __int8 v8 = [v16 enumerateObjects:v21];
    if (!v8 && !_CPLSilentLogging)
    {
      id v18 = sub_1001AC8A8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v12 lastCPLError];
        *(_DWORD *)buf = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records with related identifier %@: %@", buf, 0x16u);
      }
    }
  }
  return v8;
}

- (BOOL)hasRecordWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    uint64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    v11 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v12 = [v6 identifier];
    id v13 = NSStringFromClass(a4);
    id v14 = +[PQLFormatInjection formatInjection:@"relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld", v12, v13, v9];
    unsigned __int8 v8 = [v10 table:v11 hasRecordsMatchingQuery:v14];
  }
  return v8;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    uint64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    v11 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v12 = [v6 identifier];
    id v13 = NSStringFromClass(a4);
    id v14 = +[PQLFormatInjection formatInjection:@"relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld", v12, v13, v9];
    id v8 = [v10 table:v11 countOfRecordsMatchingQuery:v14];
  }
  return (unint64_t)v8;
}

- (id)_badContainerRelationsIdentifiers
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  int64_t v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = (objc_class *)objc_opt_class();
  int64_t v7 = NSStringFromClass(v6);
  id v8 = [v4 cplFetch:@"SELECT identifier FROM %@ WHERE relatedIdentifier IS NULL AND class = %@", v5, v7];

  int64_t v9 = [v8 enumerateObjectsOfClass:objc_opt_class()];

  return v9;
}

- (BOOL)_deleteBadRelations
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  int64_t v5 = [(CPLPrequeliteStorage *)self mainTable];
  id v6 = (objc_class *)objc_opt_class();
  int64_t v7 = NSStringFromClass(v6);
  unsigned __int8 v8 = [v4 cplExecute:@"DELETE FROM %@ WHERE relatedIdentifier IS NULL AND class = %@", v5, v7];

  return v8;
}

- (BOOL)_updateRelatedIdentifier:(id)a3 forRecordWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v9 = [v8 pqlConnection];

  uint64_t v10 = [(CPLPrequeliteStorage *)self mainTable];
  LOBYTE(v8) = [v9 cplExecute:@"UPDATE %@ SET relatedIdentifier = %@ WHERE identifier = %@", v10, v7, v6];

  return (char)v8;
}

- (id)status
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteClientCache;
  BOOL v3 = [(CPLPrequeliteStorage *)&v11 status];
  id v4 = [v3 mutableCopy];

  int64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001ADFFC;
  v9[3] = &unk_10027F4E0;
  id v7 = v4;
  id v10 = v7;
  [v5 table:v6 enumerateCountGroupedByProperty:@"class" block:v9];

  return v7;
}

- (id)statusDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v5 = [(CPLPrequeliteStorage *)self mainTable];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001AE154;
  v8[3] = &unk_10027F4E0;
  id v6 = v3;
  id v9 = v6;
  [v4 table:v5 enumerateCountGroupedByProperty:@"class" block:v8];

  return v6;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteClientCache;
  v2 = [(CPLPrequeliteStorage *)&v4 statusPerScopeIndexWithGroupProperty:@"class" valueDescription:&stru_10027F830];
  return v2;
}

- (void)fillRelatedIdentifiersInChange:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 scopedIdentifier];
  id v6 = [v4 scopedIdentifier];
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    id v9 = [v8 pqlConnection];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001AE3A4;
    v12[3] = &unk_10027EE80;
    id v13 = v4;
    id v10 = [(CPLPrequeliteStorage *)self mainTable];
    objc_super v11 = [v5 identifier];
  }
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  objc_super v11 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v12 = [v11 pqlConnection];

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

  return v14;
}

@end