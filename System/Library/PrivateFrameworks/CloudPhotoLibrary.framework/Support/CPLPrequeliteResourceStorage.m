@interface CPLPrequeliteResourceStorage
- (BOOL)_refreshLargestResourceSizeWithError:(id *)a3;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)releaseIdentity:(id)a3 lastReference:(BOOL *)a4 isTrackedOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)retainIdentity:(id)a3 isTrackedOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteResourceStorage)initWithAbstractObject:(id)a3;
- (id)status;
- (unint64_t)retainCountForIdentity:(id)a3;
- (unint64_t)totalOriginalResourceSize;
- (unint64_t)totalResourceSize;
- (void)enumerateIdentitiesWithBlock:(id)a3;
@end

@implementation CPLPrequeliteResourceStorage

- (CPLPrequeliteResourceStorage)initWithAbstractObject:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteResourceStorage;
  v3 = [(CPLPrequeliteStorage *)&v14 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = [v3 variableWithName:@"totalSize" type:v4];
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = +[CPLPrequeliteType integerType];
    uint64_t v8 = [v3 variableWithName:@"totalOriginalSize" type:v7];
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;

    v10 = +[CPLPrequeliteType integerType];
    uint64_t v11 = [v3 variableWithName:@"largestResourceSize" type:v10];
    v12 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v11;
  }
  return (CPLPrequeliteResourceStorage *)v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteResourceStorage;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"identifierForStorage TEXT UNIQUE NOT NULL,retainCount INTEGER NOT NULL,size INTEGER,CHECK(retainCount > 0)" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:&off_100292178 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4) defaultValue:&off_100292178 error:0];
        if (v3)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4) defaultValue:&off_100292178 error:0];
          if (v3)
          {
            BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"identifierForStorage" error:0];
            if (v3) {
              LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"size" withDefinition:@"size DESC" condition:@"size IS NOT NULL" unique:0 error:0];
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
  v17.receiver = self;
  v17.super_class = (Class)CPLPrequeliteResourceStorage;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v17, "upgradeStorageToVersion:");
  if (v5)
  {
    if (a3 != 91)
    {
      if (a3 != 25)
      {
        if (a3 == 20)
        {
          v6 = [(CPLPrequeliteStorage *)self pqStore];
          v7 = [(CPLPrequeliteStorage *)self mainTable];
          id v8 = [v6 tableCountOfRecords:v7];

          if (v8)
          {
            if (!_CPLSilentLogging)
            {
              v9 = sub_1001A6618();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Upgrading store to version 20 and Resource Storage is not empty. We must trigger a reset sync", buf, 2u);
              }
            }
            v10 = [(CPLPrequeliteStorage *)self pqStore];
            [v10 triggerResetAfterUpgrade:0 withReason:@"Upgrade to version 20"];
          }
        }
        goto LABEL_18;
      }
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        LOBYTE(v5) = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4) defaultValue:&off_100292178 error:0];
        return v5;
      }
LABEL_18:
      LOBYTE(v5) = 1;
      return v5;
    }
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      goto LABEL_18;
    }
    BOOL v5 = [(CPLPrequeliteStorage *)self createVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4) defaultValue:&off_100292178 error:0];
    if (v5)
    {
      uint64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
      v12 = [v11 pqlConnection];

      v13 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned int v14 = [v12 execute:@"ALTER TABLE %@ ADD COLUMN size INTEGER DEFAULT NULL", v13];

      if (v14) {
        LOBYTE(v5) = [(CPLPrequeliteStorage *)self createIndexWithName:@"size" withDefinition:@"size DESC" condition:@"size IS NOT NULL" unique:0 error:0];
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (BOOL)openWithError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteResourceStorage;
  BOOL v4 = [(CPLPrequeliteStorage *)&v12 openWithError:a3];
  if (v4)
  {
    BOOL v5 = [(CPLPrequeliteResourceStorage *)self abstractObject];
    v6 = [v5 engineStore];

    v7 = +[NSNumber numberWithUnsignedLongLong:[(CPLPrequeliteResourceStorage *)self totalResourceSize]];
    [v6 predictSyncSessionValue:v7 ofType:CPLSyncSessionPredictionTypeUploadResourceSize];

    uint64_t v8 = [(CPLPrequeliteStorage *)self valueForVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4)];
    v9 = (void *)v8;
    if (v8) {
      v10 = (_UNKNOWN **)v8;
    }
    else {
      v10 = &off_100292178;
    }
    [v6 predictSyncSessionValue:v10 ofType:CPLSyncSessionPredictionTypeLargestResourceSize];
  }
  return v4;
}

- (BOOL)retainIdentity:(id)a3 isTrackedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(CPLPrequeliteStorage *)self pqStore];
  v10 = [v9 pqlConnection];

  uint64_t v11 = [v8 identityForStorage];
  id v12 = [v8 fileSize];
  if (v12 <= +[CPLResource largeResourceSizeThreshold])
  {
    v13 = 0;
  }
  else
  {
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 fileSize]);
  }
  unsigned int v14 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v15 = [v10 cplExecute:@"INSERT OR IGNORE INTO %@ VALUES (%@, 1, %@)", v14, v11, v13];

  if (!v15)
  {
    if (!a5)
    {
      unsigned __int8 v17 = 0;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (![v10 changes])
  {
    v18 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v17 = [v10 cplExecute:@"UPDATE %@ SET retainCount = retainCount + 1 WHERE identifierForStorage = %@", v18, v11];

    if (!a5 || (v17 & 1) != 0) {
      goto LABEL_14;
    }
LABEL_13:
    [v10 lastCPLError];
    unsigned __int8 v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  int v16 = sub_1001A6930((uint64_t)self, (unint64_t)[v8 fileSize], (uint64_t)a5);
  unsigned __int8 v17 = v16;
  if (v6 && v16) {
    unsigned __int8 v17 = sub_1001A69C0((char *)self, (uint64_t)[v8 fileSize], (uint64_t)a5);
  }
LABEL_14:

  return v17;
}

- (BOOL)releaseIdentity:(id)a3 lastReference:(BOOL *)a4 isTrackedOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v11 pqlConnection];

  v13 = [v10 identityForStorage];
  unsigned int v14 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v15 = [v12 cplExecute:@"UPDATE OR IGNORE %@ SET retainCount = retainCount - 1 WHERE identifierForStorage = %@", v14, v13];

  if (!v15) {
    goto LABEL_9;
  }
  if (![v12 changes])
  {
    unsigned __int8 v17 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v18 = [v12 cplExecute:@"DELETE FROM %@ WHERE identifierForStorage = %@", v17, v13];

    if (v18)
    {
      int v19 = sub_1001A6BC4((uint64_t)self, (unint64_t)[v10 fileSize], (uint64_t)a6);
      if (v7 && v19)
      {
        if ((sub_1001A6E5C((uint64_t)self, (unint64_t)[v10 fileSize], (uint64_t)a6) & 1) == 0)goto LABEL_13; {
LABEL_12:
        }
        BOOL v16 = 1;
        *a4 = 1;
        goto LABEL_14;
      }
      if (v19) {
        goto LABEL_12;
      }
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }
LABEL_9:
    if (a6)
    {
      [v12 lastCPLError];
      BOOL v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *a4 = 0;
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (unint64_t)retainCountForIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];

  BOOL v7 = [v4 identityForStorage];

  uint64_t v8 = objc_opt_class();
  v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = [v6 cplFetchObjectOfClass:v8, @"SELECT retainCount FROM %@ WHERE identifierForStorage = %@", v9, v7 sql];

  id v11 = [v10 unsignedIntegerValue];
  return (unint64_t)v11;
}

- (void)enumerateIdentitiesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];

  BOOL v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [v6 cplFetch:@"SELECT identifierForStorage FROM %@", v7];

  if (v8)
  {
    unsigned int v18 = v6;
    [v8 enumerateObjectsOfClass:objc_opt_class()];
    char v23 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          unsigned int v15 = +[CPLResourceIdentity identityFromStoredIdentity:v14];
          if (v15)
          {
            v4[2](v4, v15, &v23);
            if (v23)
            {
              [v9 close];

              goto LABEL_20;
            }
          }
          else if (!_CPLSilentLogging)
          {
            BOOL v16 = sub_1001A6618();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't read identity from storage: %@", buf, 0xCu);
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v11);
    }
LABEL_20:

    BOOL v6 = v18;
    goto LABEL_21;
  }
  if (!_CPLSilentLogging)
  {
    v9 = sub_1001A6618();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v17 = [v6 lastCPLError];
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't get an enumerator for retained identifies: %@", buf, 0xCu);
    }
LABEL_21:
  }
}

- (BOOL)_refreshLargestResourceSizeWithError:(id *)a3
{
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];

  uint64_t v7 = objc_opt_class();
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  v9 = (_UNKNOWN **)[v6 fetchObjectOfClass:v7, @"SELECT MAX(size) FROM %@ WHERE size IS NOT NULL", v8 sql];

  BOOL v10 = [(CPLPrequeliteStorage *)self setValue:v9 forVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4) error:a3];
  if (v10)
  {
    id v11 = [(CPLPrequeliteResourceStorage *)self abstractObject];
    uint64_t v12 = [v11 engineStore];
    v13 = v12;
    if (v9) {
      unsigned int v14 = v9;
    }
    else {
      unsigned int v14 = &off_100292178;
    }
    [v12 predictSyncSessionValue:v14 ofType:CPLSyncSessionPredictionTypeLargestResourceSize];
  }
  return v10;
}

- (unint64_t)totalResourceSize
{
  v2 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (unint64_t)totalOriginalResourceSize
{
  v2 = [(CPLPrequeliteStorage *)self valueForVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4)];
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (BOOL)resetWithError:(id *)a3
{
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v6 = [v5 pqlConnection];
  uint64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

  if (v8)
  {
    if (sub_1001A755C((uint64_t)self, 0, (uint64_t)a3)) {
      [(CPLPrequeliteStorage *)self setValue:&off_100292178 forVariable:*(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4) error:a3];
    }
  }
  else if (a3)
  {
    v9 = [(CPLPrequeliteStorage *)self pqStore];
    BOOL v10 = [v9 pqlConnection];
    *a3 = [v10 lastError];
  }
  return v8;
}

- (id)status
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  unint64_t v5 = (unint64_t)[v3 tableCountOfRecords:v4];

  unint64_t v6 = [(CPLPrequeliteResourceStorage *)self totalResourceSize];
  if (v5 | v6)
  {
    uint64_t v7 = +[NSByteCountFormatter stringFromByteCount:v6 countStyle:1];
    unsigned __int8 v8 = +[NSString stringWithFormat:@"%lu cached resources - %@", v5, v7];
  }
  else
  {
    unsigned __int8 v8 = @"0 cached resources";
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_totalOriginalSizeVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_totalSizeVar + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end