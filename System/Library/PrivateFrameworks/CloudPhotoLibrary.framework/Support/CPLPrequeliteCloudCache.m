@interface CPLPrequeliteCloudCache
- (BOOL)_deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_hasRecordWithScopedIdentifier:(id)a3 isStaged:(BOOL *)a4;
- (BOOL)_insertFinalRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 confirmed:(BOOL)a9 error:(id *)a10;
- (BOOL)_insertStagedRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 error:(id *)a9;
- (BOOL)_updateFinalRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 confirmed:(BOOL)a8 error:(id *)a9;
- (BOOL)_updateStagedRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 error:(id *)a8;
- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)confirmAllRecordsWithError:(id *)a3;
- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5;
- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteCloudCache)initWithAbstractObject:(id)a3;
- (id)_recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5;
- (id)_relatedIdentifierForRecordWithIdentifier:(id)a3;
- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4;
- (id)allRecordsIsFinal:(BOOL)a3;
- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5;
- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 isConfirmed:(BOOL *)a5;
- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (int64_t)_otherScopeIndexForRecord:(id)a3;
- (unint64_t)_countOfUnconfirmedRecords;
- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (unint64_t)countOfUnacknowledgesRecords;
- (void)_updateOtherScopeIdentifierInRecord:(id)a3 otherScopeIndex:(int64_t)a4;
- (void)transactionDidFinish;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteCloudCache

- (CPLPrequeliteCloudCache)initWithAbstractObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteCloudCache;
  return [(CPLPrequeliteStorage *)&v4 initWithAbstractObject:a3];
}

- (BOOL)initializeStorage
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteCloudCache;
  BOOL v3 = [(CPLPrequeliteStorage *)&v11 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"state INTEGER DEFAULT 0,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,serializedRecord DATA DEFAULT NULL,stagedRelatedIdentifier TEXT,stagedSecondaryIdentifier TEXT,stagedSerializedRecord DATA DEFAULT NULL,localScopeIndex INTEGER DEFAULT 0,otherScopeIndex INTEGER DEFAULT 0,stagedOtherScopeIndex INTEGER DEFAULT 0,confirmed INTEGER NOT NULL DEFAULT 1" error:0];
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
            unsigned int v7 = [(CPLPrequeliteStorage *)self createIndexWithName:@"stagedRelatedScopedIdentifier" withDefinition:@"stagedRelatedIdentifier, scopeIndex" unique:0 error:0];
            LOBYTE(v3) = 0;
            if (v7)
            {
              unsigned int v8 = [(CPLPrequeliteStorage *)self createIndexWithName:@"stagedSecondaryScopedIdentifier" withDefinition:@"stagedSecondaryIdentifier, scopeIndex" unique:0 error:0];
              LOBYTE(v3) = 0;
              if (v8)
              {
                unsigned int v9 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedState" withDefinition:@"state, scopeIndex" unique:0 error:0];
                LOBYTE(v3) = 0;
                if (v9)
                {
                  BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"confirmed" error:0];
                  if (v3)
                  {
                    BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"class" error:0];
                    if (v3)
                    {
                      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
                      if (v3)
                      {
                        BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"localScopeIndex" error:0];
                        if (v3)
                        {
                          BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"otherScopeIndex" error:0];
                          if (v3) {
                            LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"stagedOtherScopeIndex" error:0];
                          }
                        }
                      }
                    }
                  }
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
  v63.receiver = self;
  v63.super_class = (Class)CPLPrequeliteCloudCache;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v63, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 51)
  {
    if (a3 == 20)
    {
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v5;
      }
      CFStringRef v20 = @"class";
      return [(CPLPrequeliteStorage *)self createIndexOnColumn:v20 error:0];
    }
    if (a3 != 22)
    {
      if (a3 != 39) {
        return v5;
      }
      if (!_CPLSilentLogging)
      {
        unsigned int v7 = sub_1001958F0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v8 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138412546;
          v66 = v8;
          __int16 v67 = 2048;
          uint64_t v68 = 39;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding scopeIndex column", buf, 0x16u);
        }
      }
      unsigned int v9 = [(CPLPrequeliteStorage *)self pqStore];
      v10 = [v9 pqlConnection];

      objc_super v11 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned __int8 v5 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 2", v11];

LABEL_70:
      return v5;
    }
    if (!_CPLSilentLogging)
    {
      v49 = sub_1001958F0();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = [(CPLPrequeliteStorage *)self mainTable];
        *(_DWORD *)buf = 138412546;
        v66 = v50;
        __int16 v67 = 2048;
        uint64_t v68 = 22;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding confirmed column", buf, 0x16u);
      }
    }
    v51 = [(CPLPrequeliteStorage *)self pqStore];
    v10 = [v51 pqlConnection];

    v52 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v53 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN confirmed INTEGER DEFAULT 1", v52];

    if (v53)
    {
      CFStringRef v19 = @"confirmed";
      goto LABEL_68;
    }
LABEL_69:
    unsigned __int8 v5 = 0;
    goto LABEL_70;
  }
  if (a3 > 62)
  {
    if (a3 == 63)
    {
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if (!_CPLSilentLogging)
        {
          v21 = sub_1001958F0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [(CPLPrequeliteStorage *)self mainTable];
            *(_DWORD *)buf = 138412546;
            v66 = v22;
            __int16 v67 = 2048;
            uint64_t v68 = 63;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding localScopeIndex column", buf, 0x16u);
          }
        }
        v23 = [(CPLPrequeliteStorage *)self pqStore];
        v24 = [v23 pqlConnection];

        v25 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned int v26 = [v24 cplExecute:@"ALTER TABLE %@ ADD COLUMN localScopeIndex INTEGER DEFAULT 0", v25];

        if (v26
          && [(CPLPrequeliteStorage *)self createIndexOnColumn:@"localScopeIndex" error:0])
        {
          v27 = [(CPLPrequeliteCloudCache *)self abstractObject];
          v28 = [v27 engineStore];
          v29 = [v28 scopes];

          v30 = [(CPLPrequeliteCloudCache *)self abstractObject];
          v31 = [v30 engineStore];
          v32 = [v31 idMapping];
          v33 = [v32 platformObject];
          v58 = [v33 mainTable];

          v34 = [(CPLPrequeliteStorage *)self pqStore];
          v35 = [v34 clientCache];
          v57 = [v35 mainTable];

          v36 = [(CPLPrequeliteStorage *)self mainTable];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id obj = [v29 enumeratorForScopesIncludeInactive:0];
          id v37 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
          if (v37)
          {
            id v38 = v37;
            v55 = v29;
            uint64_t v39 = *(void *)v60;
            while (2)
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v60 != v39) {
                  objc_enumerationMutation(obj);
                }
                v41 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                id v43 = [v41 localIndex];
                if (![v24 execute:@"UPDATE %@ SET localScopeIndex = %ld WHERE identifier IN (SELECT cloudIdentifier FROM %@, %@ WHERE scopeIndex = %ld AND localIdentifier = identifier AND stableScopeIndex = %ld) AND scopeIndex = %ld", v36, v43, v58, v57, v43, objc_msgSend(v41, "stableIndex"), objc_msgSend(v41, "cloudIndex")])
                {
                  int v48 = 0;
                  goto LABEL_74;
                }
                uint64_t v44 = (uint64_t)[v24 changes];
                if (v44 >= 1)
                {
                  uint64_t v45 = v44;
                  v46 = [(CPLPrequeliteStorage *)self pqStore];
                  v47 = [v41 scopeIdentifier];
                  [v46 recordUpgradeEvent:@"Acknowledged %lld records in cloud cache for %@", v45, v47];
                }
              }
              id v38 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
              if (v38) {
                continue;
              }
              break;
            }
            int v48 = 1;
LABEL_74:
            v29 = v55;
          }
          else
          {
            int v48 = 1;
          }
        }
        else
        {
          int v48 = 0;
        }

        return v48 != 0;
      }
      return v5;
    }
    if (a3 != 72 || ![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    if (!_CPLSilentLogging)
    {
      v12 = sub_1001958F0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(CPLPrequeliteStorage *)self mainTable];
        *(_DWORD *)buf = 138412546;
        v66 = v13;
        __int16 v67 = 2048;
        uint64_t v68 = 72;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding otherScopeIndex and stagedOtherScopeIndex columns", buf, 0x16u);
      }
    }
    v14 = [(CPLPrequeliteStorage *)self pqStore];
    v10 = [v14 pqlConnection];

    v15 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v16 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN otherScopeIndex INTEGER DEFAULT 0", v15];

    if (v16)
    {
      if ([(CPLPrequeliteStorage *)self createIndexOnColumn:@"otherScopeIndex" error:0])
      {
        v17 = [(CPLPrequeliteStorage *)self mainTable];
        unsigned int v18 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN stagedOtherScopeIndex INTEGER DEFAULT 0", v17];

        if (v18)
        {
          CFStringRef v19 = @"stagedOtherScopeIndex";
LABEL_68:
          unsigned __int8 v5 = [(CPLPrequeliteStorage *)self createIndexOnColumn:v19 error:0];
          goto LABEL_70;
        }
      }
    }
    goto LABEL_69;
  }
  if (a3 == 52)
  {
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return v5;
    }
    CFStringRef v20 = @"scopeIndex";
    return [(CPLPrequeliteStorage *)self createIndexOnColumn:v20 error:0];
  }
  if (a3 != 53 || ![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    return v5;
  }
  if (![(CPLPrequeliteStorage *)self dropIndexWithName:@"identifier" error:0]
    || ![(CPLPrequeliteStorage *)self dropIndexWithName:@"relatedIdentifier" error:0]|| ![(CPLPrequeliteStorage *)self dropIndexWithName:@"secondaryIdentifier" error:0]|| ![(CPLPrequeliteStorage *)self dropIndexWithName:@"stagedRelatedIdentifier" error:0]|| ![(CPLPrequeliteStorage *)self dropIndexWithName:@"stagedSecondaryIdentifier" error:0]
    || ![(CPLPrequeliteStorage *)self dropIndexWithName:@"state" error:0])
  {
    return 0;
  }
  unsigned __int8 v5 = 0;
  if ([(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:0 error:0])
  {
    unsigned __int8 v5 = 0;
    if ([(CPLPrequeliteStorage *)self createIndexWithName:@"relatedScopedIdentifier" withDefinition:@"relatedIdentifier, scopeIndex" unique:0 error:0])
    {
      unsigned __int8 v5 = 0;
      if ([(CPLPrequeliteStorage *)self createIndexWithName:@"secondaryScopedIdentifier" withDefinition:@"secondaryIdentifier, scopeIndex" unique:0 error:0])
      {
        unsigned __int8 v5 = 0;
        if ([(CPLPrequeliteStorage *)self createIndexWithName:@"stagedRelatedScopedIdentifier" withDefinition:@"stagedRelatedIdentifier, scopeIndex" unique:0 error:0])
        {
          return [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedState" withDefinition:@"state, scopeIndex" unique:0 error:0];
        }
      }
    }
  }
  return v5;
}

- (BOOL)_hasRecordWithScopedIdentifier:(id)a3 isStaged:(BOOL *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    v10 = [(CPLPrequeliteStorage *)self pqStore];
    objc_super v11 = [v10 pqlConnection];

    *a4 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100195A78;
    v16[3] = &unk_10027F338;
    v16[4] = a4;
    v12 = [(CPLPrequeliteStorage *)self mainTable];
    v13 = [v6 identifier];
    id v14 = [v11 cplFetchObject:v16, @"SELECT identifier, state FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9 sql];

    BOOL v8 = v14 != 0;
  }

  return v8;
}

- (int64_t)_otherScopeIndexForRecord:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSharingScopedIdentifier]
    && ([v4 sharingScopeIdentifier], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    [v4 setSharingScopeIdentifier:0];
    if (*(void *)(&self->super._shouldUpgradeSchema + 1) && objc_msgSend(v6, "isEqualToString:"))
    {
      int64_t v7 = *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4);
    }
    else
    {
      objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), v6);
      int64_t v8 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v6];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v7 = 0;
      }
      else {
        int64_t v7 = (NSString *)v8;
      }
      *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = v7;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return (int64_t)v7;
}

- (void)_updateOtherScopeIdentifierInRecord:(id)a3 otherScopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = v6;
  if (a4)
  {
    id v10 = v6;
    id v6 = [v6 supportsSharingScopedIdentifier];
    int64_t v7 = v10;
    if (v6)
    {
      if (*(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) != (NSString *)a4)
      {
        *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = (NSString *)a4;
        uint64_t v8 = [(CPLPrequeliteStorage *)self scopeIdentifierForCloudScopeIndex:a4];
        int64_t v9 = *(void **)(&self->super._shouldUpgradeSchema + 1);
        *(void *)(&self->super._shouldUpgradeSchema + 1) = v8;

        int64_t v7 = v10;
      }
      id v6 = [v7 setSharingScopeIdentifier:*(void *)(&self->super._shouldUpgradeSchema + 1)];
      int64_t v7 = v10;
    }
  }
  _objc_release_x1(v6, v7);
}

- (BOOL)_updateFinalRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 confirmed:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  char v14 = (char)a9;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  int64_t v19 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v15];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a9)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v15];
      char v14 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int64_t v20 = v19;
    id v36 = v17;
    id v21 = v16;
    v22 = [v15 scopeIdentifier];
    int64_t v23 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v22];

    if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
      sub_1001D1FC8(v15, a2, self);
    }
    v24 = [(CPLPrequeliteStorage *)self pqStore];
    v25 = [v24 pqlConnection];

    unsigned int v26 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v27 = [v15 identifier];
    v28 = (void *)v27;
    int64_t v34 = v23;
    id v16 = v21;
    if (v9) {
      unsigned __int8 v29 = [v25 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@, otherScopeIndex = %ld, localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v26, v18, v21, v36, a6, v34, v27, v20];
    }
    else {
      unsigned __int8 v29 = [v25 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@, otherScopeIndex = %ld, confirmed = 0, localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v26, v18, v21, v36, a6, v34, v27, v20];
    }
    unsigned __int8 v30 = v29;

    if (v30)
    {
      char v14 = 1;
      id v17 = v36;
    }
    else
    {
      id v17 = v36;
      if (!_CPLSilentLogging)
      {
        v31 = sub_1001958F0();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = [v25 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v39 = v15;
          __int16 v40 = 2112;
          v41 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to update final record with identifier %@: %@", buf, 0x16u);
        }
      }
      if (a9)
      {
        [v25 lastCPLError];
        char v14 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v14 = 0;
      }
    }
  }
  return v14;
}

- (BOOL)_updateStagedRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int64_t v18 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v14];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a8)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v14];
      unsigned __int8 v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    int64_t v20 = v18;
    id v21 = [(CPLPrequeliteStorage *)self pqStore];
    v22 = [v21 pqlConnection];

    int64_t v23 = [(CPLPrequeliteStorage *)self mainTable];
    v24 = [v14 identifier];
    unsigned __int8 v19 = [v22 cplExecute:@"UPDATE %@ SET stagedSerializedRecord = %@, stagedRelatedIdentifier = %@, stagedSecondaryIdentifier = %@, stagedOtherScopeIndex = %ld, state = %d WHERE identifier = %@ AND scopeIndex = %ld", v23, v17, v15, v16, a6, 0, v24, v20];

    if ((v19 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v25 = sub_1001958F0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          unsigned int v26 = [v22 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v29 = v14;
          __int16 v30 = 2112;
          v31 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to update staged record with identifier %@: %@", buf, 0x16u);
        }
      }
      if (a8)
      {
        *a8 = [v22 lastCPLError];
      }
    }
  }
  return v19;
}

- (BOOL)_insertFinalRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 confirmed:(BOOL)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  int64_t v21 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v16];
  if (v21 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a10)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v16];
      unsigned __int8 v22 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v22 = 0;
    }
  }
  else
  {
    int64_t v23 = v21;
    id v36 = v19;
    id v37 = v18;
    id v24 = v17;
    v25 = [v16 scopeIdentifier];
    int64_t v26 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v25];

    if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
      sub_1001D20C8(v16, a2, self);
    }
    uint64_t v27 = [(CPLPrequeliteStorage *)self pqStore];
    v28 = [v27 pqlConnection];

    id v29 = [(CPLPrequeliteStorage *)self mainTable];
    __int16 v30 = [v16 identifier];
    int64_t v34 = v26;
    id v17 = v24;
    unsigned __int8 v22 = [v28 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord, state, confirmed, otherScopeIndex, localScopeIndex) VALUES (%ld, %@, %@, %@, %@, %@, %d, %d, %ld, %ld)", v29, v23, v30, v24, v37, v36, v20, 1, a9, a7, v34];

    if ((v22 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v31 = sub_1001958F0();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = [v28 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v39 = v16;
          __int16 v40 = 2112;
          v41 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to insert final record with identifier %@: %@", buf, 0x16u);
        }
      }
      if (a10)
      {
        *a10 = [v28 lastCPLError];
      }
    }

    id v19 = v36;
    id v18 = v37;
  }

  return v22;
}

- (BOOL)_insertStagedRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  int64_t v20 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v15];
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a9)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v15];
      unsigned __int8 v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v21 = 0;
    }
  }
  else
  {
    int64_t v22 = v20;
    int64_t v23 = [(CPLPrequeliteStorage *)self pqStore];
    id v24 = [v23 pqlConnection];

    v25 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v26 = [v15 identifier];
    unsigned __int8 v21 = [v24 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedSerializedRecord, stagedOtherScopeIndex, confirmed) VALUES (%ld, %@, %@, %@, %@, %@, %ld, 1)", v25, v22, v26, v16, v17, v18, v19, a7];

    if ((v21 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v27 = sub_1001958F0();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [v24 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v31 = v15;
          __int16 v32 = 2112;
          v33 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to insert staged record with identifier %@: %@", buf, 0x16u);
        }
      }
      if (a9)
      {
        *a9 = [v24 lastCPLError];
      }
    }
  }
  return v21;
}

- (BOOL)_deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v6];
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
    objc_super v11 = [v10 pqlConnection];

    v12 = [(CPLPrequeliteStorage *)self mainTable];
    v13 = [v6 identifier];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if ((v8 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_1001958F0();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = [v11 lastCPLError];
          *(_DWORD *)buf = 138412546;
          id v18 = v6;
          __int16 v19 = 2112;
          int64_t v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to delete final record with identifier %@: %@", buf, 0x16u);
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

- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int64_t v9 = [v8 scopedIdentifier];
  id v10 = [v8 relatedIdentifier];
  objc_super v11 = [v8 secondaryIdentifier];
  id v12 = [v8 copy];
  [v12 clearIdentifiers];
  [v12 prepareForStorage];
  int64_t v13 = [(CPLPrequeliteCloudCache *)self _otherScopeIndexForRecord:v12];
  id v14 = +[CPLArchiver archivedDataWithRootObject:v12];
  if (v14)
  {
    buf[0] = 0;
    if ([(CPLPrequeliteCloudCache *)self _hasRecordWithScopedIdentifier:v9 isStaged:buf])
    {
      if (v6) {
        unsigned __int8 v15 = [(CPLPrequeliteCloudCache *)self _updateFinalRecordWithScopedIdentifer:v9 relatedIdentifier:v10 secondaryIdentifier:v11 otherScopeIndex:v13 serializedRecord:v14 confirmed:0 error:a5];
      }
      else {
        unsigned __int8 v15 = [(CPLPrequeliteCloudCache *)self _updateStagedRecordWithScopedIdentifer:v9 relatedIdentifier:v10 secondaryIdentifier:v11 otherScopeIndex:v13 serializedRecord:v14 error:a5];
      }
      BOOL v18 = v15;
    }
    else
    {
      int64_t v26 = v10;
      __int16 v19 = (objc_class *)objc_opt_class();
      int64_t v20 = NSStringFromClass(v19);
      if (v6)
      {
        if ([v8 supportsResources])
        {
          v25 = [v8 resources];
          BOOL v21 = [v25 count] == 0;
        }
        else
        {
          BOOL v21 = 1;
        }
        LOBYTE(v24) = v21;
        unsigned __int8 v22 = [(CPLPrequeliteCloudCache *)self _insertFinalRecordWithScopedIdentifier:v9 className:v20 relatedIdentifier:v26 secondaryIdentifier:v11 otherScopeIndex:v13 serializedRecord:v14 confirmed:v24 error:a5];
      }
      else
      {
        unsigned __int8 v22 = [(CPLPrequeliteCloudCache *)self _insertStagedRecordWithScopedIdentifier:v9 className:v20 relatedIdentifier:v26 secondaryIdentifier:v11 otherScopeIndex:v13 serializedRecord:v14 error:a5];
      }
      BOOL v18 = v22;

      id v10 = v26;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = v10;
      id v17 = sub_1001958F0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
      }

      id v10 = v16;
    }
    if (a5)
    {
      +[CPLErrors invalidClientCacheErrorWithReason:0];
      BOOL v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int64_t v9 = [v8 scopedIdentifier];
  id v10 = [v8 relatedIdentifier];
  objc_super v11 = [v8 secondaryIdentifier];
  id v12 = [v8 copy];
  [v12 clearIdentifiers];
  [v12 prepareForStorage];
  int64_t v13 = [(CPLPrequeliteCloudCache *)self _otherScopeIndexForRecord:v12];
  id v14 = +[CPLArchiver archivedDataWithRootObject:v12];
  if (v14)
  {
    BOOL v15 = [(CPLPrequeliteCloudCache *)self _updateFinalRecordWithScopedIdentifer:v9 relatedIdentifier:v10 secondaryIdentifier:v11 otherScopeIndex:v13 serializedRecord:v14 confirmed:v6 error:a5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_1001958F0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
      }
    }
    if (a5)
    {
      +[CPLErrors invalidClientCacheErrorWithReason:0];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 scopedIdentifier];
  id v8 = [v6 relatedIdentifier];
  int64_t v9 = [v6 secondaryIdentifier];
  id v10 = [v6 copy];
  [v10 clearIdentifiers];
  [v10 prepareForStorage];
  int64_t v11 = [(CPLPrequeliteCloudCache *)self _otherScopeIndexForRecord:v10];
  id v12 = +[CPLArchiver archivedDataWithRootObject:v10];
  if (v12)
  {
    BOOL v13 = [(CPLPrequeliteCloudCache *)self _updateStagedRecordWithScopedIdentifer:v7 relatedIdentifier:v8 secondaryIdentifier:v9 otherScopeIndex:v11 serializedRecord:v12 error:a4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_1001958F0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Can't serialize %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if (a4)
    {
      +[CPLErrors invalidClientCacheErrorWithReason:0];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  char v13 = 0;
  unsigned int v9 = [(CPLPrequeliteCloudCache *)self _hasRecordWithScopedIdentifier:v8 isStaged:&v13];
  if (v6)
  {
    if (v9)
    {
      if (v13) {
        unsigned __int8 v10 = [(CPLPrequeliteCloudCache *)self _updateFinalRecordWithScopedIdentifer:v8 relatedIdentifier:0 secondaryIdentifier:0 otherScopeIndex:0 serializedRecord:0 confirmed:1 error:a5];
      }
      else {
        unsigned __int8 v10 = [(CPLPrequeliteCloudCache *)self _deleteRecordWithScopedIdentifier:v8 error:a5];
      }
      goto LABEL_9;
    }
  }
  else if (v9)
  {
    unsigned __int8 v10 = [(CPLPrequeliteCloudCache *)self _updateStagedRecordWithScopedIdentifer:v8 relatedIdentifier:0 secondaryIdentifier:0 otherScopeIndex:0 serializedRecord:0 error:a5];
LABEL_9:
    BOOL v11 = v10;
    goto LABEL_10;
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 isConfirmed:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    int64_t v11 = v9;
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    char v13 = [v12 pqlConnection];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100197074;
    v18[3] = &unk_10027F360;
    BOOL v22 = a4;
    id v19 = v8;
    int64_t v20 = self;
    BOOL v21 = a5;
    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    BOOL v15 = [v19 identifier];
    id v10 = [v13 cplFetchObject:v18, @"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, confirmed FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v11 sql];

    id v16 = +[NSNull null];

    if (v10 == v16)
    {

      id v10 = 0;
    }
  }
  return v10;
}

- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    int64_t v11 = v9;
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    char v13 = [v12 pqlConnection];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10019739C;
    v18[3] = &unk_10027F388;
    BOOL v21 = a5;
    BOOL v22 = a4;
    id v19 = v8;
    int64_t v20 = self;
    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    BOOL v15 = [v19 identifier];
    id v10 = [v13 cplFetchObject:v18, @"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, confirmed FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v11 sql];

    id v16 = +[NSNull null];

    if (v10 == v16)
    {

      id v10 = 0;
    }
  }
  return v10;
}

- (id)_recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  id v8 = a3;
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  int64_t v11 = v9;
  uint64_t v27 = [v8 scopeIdentifier];
  id v12 = [v8 identifier];
  char v13 = [(CPLPrequeliteStorage *)self pqStore];
  id v14 = [v13 pqlConnection];

  BOOL v15 = [(CPLPrequeliteStorage *)self mainTable];
  id v16 = [v8 identifier];
  id v17 = [v8 identifier];
  int64_t v26 = v14;
  id v18 = [v14 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex FROM %@ WHERE (relatedIdentifier = %@ AND scopeIndex = %ld) OR (stagedRelatedIdentifier = %@ AND scopeIndex = %ld)", v15, v16, v11, v17, v11];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100197800;
  v28[3] = &unk_10027F3B0;
  BOOL v34 = a5;
  Class v32 = a4;
  id v19 = v12;
  id v29 = v19;
  id v20 = v27;
  int64_t v33 = v11;
  id v30 = v20;
  id v31 = self;
  uint64_t v21 = [v18 enumerateObjects:v28];
  if (v21)
  {
    BOOL v22 = v21;
    id v10 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v21];
    int64_t v23 = v26;
  }
  else
  {
    if (_CPLSilentLogging)
    {
      id v10 = 0;
      int64_t v23 = v26;
      goto LABEL_10;
    }
    BOOL v22 = sub_1001958F0();
    int64_t v23 = v26;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v26 lastCPLError];
      *(_DWORD *)buf = 138412546;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records with related identifier %@: %@", buf, 0x16u);
    }
    id v10 = 0;
  }

LABEL_10:
LABEL_11:

  return v10;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  return [(CPLPrequeliteCloudCache *)self _recordsWithRelatedScopedIdentifier:a3 class:0 isFinal:a4];
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  return [(CPLPrequeliteCloudCache *)self _recordsWithRelatedScopedIdentifier:a3 class:a4 isFinal:a5];
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
    goto LABEL_12;
  }
  int64_t v9 = v7;
  id v10 = [v6 scopeIdentifier];
  int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v11 pqlConnection];

  if (v4)
  {
    uint64_t v13 = objc_opt_class();
    id v14 = [(CPLPrequeliteStorage *)self mainTable];
    BOOL v15 = [v6 identifier];
    id v16 = [v12 cplFetchObjectOfClass:v13, @"SELECT relatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v9 sql];
  }
  else
  {
    id v17 = [(CPLPrequeliteStorage *)self mainTable];
    id v18 = [v6 identifier];
    id v16 = [v12 cplFetchObject:&stru_10027F3F0, @"SELECT relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v17, v18, v9 sql];

    id v19 = +[NSNull null];

    if (v16 == v19)
    {
      id v8 = 0;
      goto LABEL_10;
    }
  }
  if (v16)
  {
    id v8 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v10 identifier:v16 scopeIndex:v9];
LABEL_10:

    goto LABEL_11;
  }
  id v8 = 0;
LABEL_11:

LABEL_12:
  return v8;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v4 identifier];
    int64_t v11 = +[PQLFormatInjection formatInjection:@"identifier = %@ AND scopeIndex = %ld", v10, v7];
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v6;
}

- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [v4 identifier];
    int64_t v11 = +[PQLFormatInjection formatInjection:@"relatedIdentifier = %@ AND scopeIndex = %ld", v10, v7];
    if ([v8 table:v9 hasRecordsMatchingQuery:v11])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      id v12 = [v4 identifier];
      uint64_t v13 = +[PQLFormatInjection formatInjection:@"secondaryIdentifier = %@ AND scopeIndex = %ld", v12, v7];
      unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v13];
    }
  }

  return v6;
}

- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    int64_t v8 = v6;
    int64_t v9 = [v5 scopeIdentifier];
    int64_t v10 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v9];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = sub_1001D21C8(v5, a2, self);
      return sub_100198004(v17, v18);
    }
    int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
    id v12 = [v11 pqlConnection];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100198004;
    v19[3] = &unk_10027F418;
    int64_t v22 = v10;
    id v20 = v5;
    uint64_t v21 = self;
    uint64_t v13 = [(CPLPrequeliteStorage *)self mainTable];
    id v14 = [v20 identifier];
    id v7 = [v12 cplFetchObject:v19, @"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, localScopeIndex FROM %@ WHERE (identifier = %@ AND scopeIndex = %ld)", v13, v14, v8 sql];

    id v15 = +[NSNull null];

    if (v7 == v15)
    {

      id v7 = 0;
    }
  }
  return v7;
}

- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
LABEL_8:

    return v7;
  }
  int64_t v8 = v6;
  int64_t v9 = [v5 scopeIdentifier];
  id v10 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v9];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
    id v12 = [v11 pqlConnection];
    uint64_t v13 = objc_opt_class();
    id v14 = [v5 identifier];
    id v15 = [v12 cplFetchObjectOfClass:v13, @"SELECT localScopeIndex FROM cloudCache WHERE identifier = %@ AND scopeIndex = %ld", v14, v8 sql];

    if (v15) {
      BOOL v7 = [v15 integerValue] == v10;
    }
    else {
      BOOL v7 = 0;
    }

    goto LABEL_8;
  }
  uint64_t v17 = (CPLPrequeliteCloudCache *)sub_1001D22C8(v5, a2, self);
  return [(CPLPrequeliteCloudCache *)v17 recordsAcknowledgedByClientWithRelatedScopedIdentifier:v19 class:v20];
}

- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  int64_t v8 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v7];
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  int64_t v11 = v8;
  id v12 = [v7 scopeIdentifier];
  int64_t v13 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v12];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sub_1001D23C8(v7, a2, self);
    goto LABEL_16;
  }
  id v14 = [v7 scopeIdentifier];
  a2 = [v7 identifier];
  id v15 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v15 pqlConnection];

  id v16 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v9 = (uint64_t)[v12 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, localScopeIndex FROM %@ WHERE (relatedIdentifier = %@ AND scopeIndex = %ld)", v16, a2, v11];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001984DC;
  v21[3] = &unk_10027F440;
  int64_t v24 = v13;
  Class v25 = a4;
  a4 = v14;
  int64_t v26 = v11;
  Class v22 = a4;
  int64_t v23 = self;
  uint64_t v17 = [(id)v9 enumerateObjects:v21];
  if (!v17)
  {
    if (!_CPLSilentLogging)
    {
      SEL v18 = sub_1001958F0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v12 lastCPLError];
        *(_DWORD *)buf = 138412546;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records with related identifier %@: %@", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_10;
    }
LABEL_16:
    id v10 = 0;
    goto LABEL_11;
  }
  SEL v18 = v17;
  id v10 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v17];
LABEL_10:

LABEL_11:
LABEL_12:

  return v10;
}

- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  int64_t v8 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
LABEL_5:

    return (unint64_t)v9;
  }
  int64_t v10 = v8;
  int64_t v11 = [v7 scopeIdentifier];
  int64_t v12 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v11];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v13 = [v7 identifier];
    id v14 = [(CPLPrequeliteStorage *)self pqStore];
    id v15 = [(CPLPrequeliteStorage *)self mainTable];
    id v16 = NSStringFromClass(a4);
    uint64_t v17 = +[PQLFormatInjection formatInjection:@"(relatedIdentifier = %@ AND scopeIndex = %ld) AND (localScopeIndex = %ld AND class = %@)", v13, v10, v12, v16];
    id v9 = [v14 table:v15 countOfRecordsMatchingQuery:v17];

    goto LABEL_5;
  }
  id v19 = (CPLPrequeliteCloudCache *)sub_1001D24C8(v7, a2, self);
  return [(CPLPrequeliteCloudCache *)v19 ackownledgeRecordWithScopedIdentifier:v21 error:v22];
}

- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    int64_t v8 = v6;
    id v9 = [v5 scopeIdentifier];
    int64_t v10 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v9];

    int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v12 = [v11 pqlConnection];

    int64_t v13 = [(CPLPrequeliteStorage *)self mainTable];
    id v14 = [v5 identifier];
    unsigned __int8 v7 = [v12 cplExecute:@"UPDATE %@ SET localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v13, v10, v14, v8];
  }
  return v7;
}

- (BOOL)confirmAllRecordsWithError:(id *)a3
{
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v6 = [v5 pqlConnection];

  unsigned __int8 v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET confirmed = 1 WHERE confirmed = 0", v7];

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1001958F0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int64_t v10 = [v6 lastCPLError];
        *(_DWORD *)buf = 138412290;
        int64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to mark all records as confirmed: %@", buf, 0xCu);
      }
    }
    if (a3)
    {
      *a3 = [v6 lastCPLError];
    }
  }

  return v8;
}

- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v11 = [v10 pqlConnection];

    int64_t v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v13 = [v11 cplExecute:@"DELETE FROM %@ WHERE stagedSerializedRecord IS NULL AND state = %i AND scopeIndex = %ld", v12, 0, v9];

    if (!v13
      || ([(CPLPrequeliteStorage *)self mainTable],
          id v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = 1,
          unsigned __int8 v15 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET serializedRecord = stagedSerializedRecord, relatedIdentifier = stagedRelatedIdentifier, secondaryIdentifier = stagedSecondaryIdentifier, otherScopeIndex = stagedOtherScopeIndex, stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d, confirmed = 1 WHERE state = %d AND scopeIndex = %ld", v14, 1, 0, v9], v14, (v15 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_1001958F0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v11 lastCPLError];
          *(_DWORD *)buf = 138412290;
          SEL v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to commit changes: %@", buf, 0xCu);
        }
      }
      if (a4)
      {
        [v11 lastCPLError];
        BOOL v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  return v8;
}

- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v11 = [v10 pqlConnection];

    int64_t v12 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v13 = [v11 cplExecute:@"DELETE FROM %@ WHERE serializedRecord IS NULL AND state = %d AND scopeIndex = %ld", v12, 0, v9];

    if (!v13
      || ([(CPLPrequeliteStorage *)self mainTable],
          id v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = 1,
          unsigned __int8 v15 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d WHERE state = %d AND scopeIndex = %ld", v14, 1, 0, v9], v14, (v15 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_1001958F0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v11 lastCPLError];
          *(_DWORD *)buf = 138412290;
          SEL v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to discard changes: %@", buf, 0xCu);
        }
      }
      if (a4)
      {
        [v11 lastCPLError];
        BOOL v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  return v8;
}

- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v8 = [v7 pqlConnection];

  int64_t v9 = [v6 cloudIndexesInjection];

  int64_t v10 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v11 = [v8 cplExecute:@"DELETE FROM %@ WHERE serializedRecord IS NULL AND state = %d AND %@", v10, 0, v9];

  if (!v11
    || ([(CPLPrequeliteStorage *)self mainTable],
        int64_t v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = 1,
        unsigned __int8 v14 = [v8 cplExecute:@"UPDATE OR FAIL %@ SET stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d WHERE state = %d AND %@", v12, 1, 0, v9], v12, (v14 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v15 = sub_1001958F0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = [v8 lastCPLError];
        *(_DWORD *)buf = 138412290;
        id v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to discard staged changes: %@", buf, 0xCu);
      }
    }
    if (a4)
    {
      [v8 lastCPLError];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v8];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v8];
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
    BOOL v13 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v14 = [v13 pqlConnection];

    unsigned __int8 v15 = [(CPLPrequeliteStorage *)self mainTable];
    id v16 = [v9 identifier];
    uint64_t v17 = [v8 identifier];
    unsigned int v18 = [v14 cplExecute:@"UPDATE %@ SET identifier = %@ WHERE identifier = %@ AND scopeIndex = %ld", v15, v16, v17, v12];

    if (!v18) {
      goto LABEL_9;
    }
    id v19 = [(CPLPrequeliteStorage *)self mainTable];
    SEL v20 = [v9 identifier];
    id v21 = [v8 identifier];
    unsigned int v22 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET relatedIdentifier = %@ WHERE relatedIdentifier = %@ AND scopeIndex = %ld", v19, v20, v21, v12];

    if (!v22) {
      goto LABEL_9;
    }
    int64_t v23 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v24 = [v9 identifier];
    Class v25 = [v8 identifier];
    unsigned int v26 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET secondaryIdentifier = %@ WHERE secondaryIdentifier = %@ AND scopeIndex = %ld", v23, v24, v25, v12];

    if (!v26) {
      goto LABEL_9;
    }
    uint64_t v27 = [(CPLPrequeliteStorage *)self mainTable];
    id v28 = [v9 identifier];
    __int16 v29 = [v8 identifier];
    unsigned int v30 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET stagedRelatedIdentifier = %@ WHERE stagedRelatedIdentifier = %@ AND scopeIndex = %ld", v27, v28, v29, v12];

    if (v30)
    {
      id v31 = [(CPLPrequeliteStorage *)self mainTable];
      Class v32 = [v9 identifier];
      int64_t v33 = [v8 identifier];
      unsigned __int8 v11 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET stagedSecondaryIdentifier = %@ WHERE stagedSecondaryIdentifier = %@ AND scopeIndex = %ld", v31, v32, v33, v12];
    }
    else
    {
LABEL_9:
      unsigned __int8 v11 = 0;
    }
    if (a5 && (v11 & 1) == 0)
    {
      *a5 = [v14 lastCPLError];
    }
  }
  return v11;
}

- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4
{
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  int64_t v10 = NSStringFromClass(a3);
  id v11 = [v8 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, scopeIndex FROM %@ WHERE class = %@", v9, v10];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100199438;
  v17[3] = &unk_10027F468;
  BOOL v18 = a4;
  v17[4] = self;
  uint64_t v12 = [v11 enumerateObjects:v17];
  if (v12)
  {
    BOOL v13 = v12;
    unsigned __int8 v14 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v12];
LABEL_7:

    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    BOOL v13 = sub_1001958F0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v15 = [v8 lastCPLError];
      *(_DWORD *)buf = 138412546;
      Class v20 = a3;
      __int16 v21 = 2112;
      unsigned int v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records with class %@: %@", buf, 0x16u);
    }
    unsigned __int8 v14 = 0;
    goto LABEL_7;
  }
  unsigned __int8 v14 = 0;
LABEL_8:

  return v14;
}

- (id)allRecordsIsFinal:(BOOL)a3
{
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  int64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [v6 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, scopeIndex FROM %@", v7];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001997B0;
  v14[3] = &unk_10027F468;
  BOOL v15 = a3;
  v14[4] = self;
  uint64_t v9 = [v8 enumerateObjects:v14];
  if (v9)
  {
    int64_t v10 = v9;
    id v11 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v9];
LABEL_7:

    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    int64_t v10 = sub_1001958F0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v6 lastCPLError];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to create enumerator for records: %@", buf, 0xCu);
    }
    id v11 = 0;
    goto LABEL_7;
  }
  id v11 = 0;
LABEL_8:

  return v11;
}

- (void)writeTransactionDidSucceed
{
  v2.receiver = self;
  v2.super_class = (Class)CPLPrequeliteCloudCache;
  [(CPLPrequeliteStorage *)&v2 writeTransactionDidSucceed];
}

- (void)writeTransactionDidFail
{
  v2.receiver = self;
  v2.super_class = (Class)CPLPrequeliteCloudCache;
  [(CPLPrequeliteStorage *)&v2 writeTransactionDidFail];
}

- (void)transactionDidFinish
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteCloudCache;
  [(CPLPrequeliteStorage *)&v4 transactionDidFinish];
  *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = 0;
  BOOL v3 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  *(void *)(&self->super._shouldUpgradeSchema + 1) = 0;
}

- (unint64_t)_countOfUnconfirmedRecords
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = +[PQLFormatInjection formatInjection:@"confirmed = 0"];
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (unint64_t)countOfUnacknowledgesRecords
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  BOOL v3 = [(CPLPrequeliteCloudCache *)self abstractObject];
  objc_super v4 = [v3 engineStore];
  id v5 = [v4 scopes];

  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100199BF8;
  v11[3] = &unk_10027F490;
  id v8 = v5;
  id v12 = v8;
  BOOL v13 = &v14;
  [v6 table:v7 enumerateCountGroupedByProperty:@"localScopeIndex" block:v11];

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)status
{
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_100199E58;
  uint64_t v16 = sub_100199E68;
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteCloudCache;
  BOOL v3 = [(CPLPrequeliteStorage *)&v11 status];
  id v17 = [v3 mutableCopy];

  unint64_t v4 = [(CPLPrequeliteCloudCache *)self countOfUnacknowledgesRecords];
  if (v4) {
    objc_msgSend((id)v13[5], "appendFormat:", @" (%lu not matched with client)", v4);
  }
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100199E70;
  v10[3] = &unk_10027F4B8;
  v10[4] = &v12;
  [v5 table:v6 enumerateCountGroupedByProperty:@"class" block:v10];

  unint64_t v7 = [(CPLPrequeliteCloudCache *)self _countOfUnconfirmedRecords];
  if (v7) {
    objc_msgSend((id)v13[5], "appendFormat:", @"\n%lu unconfirmed!", v7);
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)statusDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v4 = [(CPLPrequeliteStorage *)self pqStore];
  id v5 = [(CPLPrequeliteStorage *)self mainTable];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019A044;
  v11[3] = &unk_10027F4E0;
  id v6 = v3;
  id v12 = v6;
  [v4 table:v5 enumerateCountGroupedByProperty:@"class" block:v11];

  if ([(CPLPrequeliteCloudCache *)self countOfUnacknowledgesRecords])
  {
    unint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    [v6 setObject:v7 forKeyedSubscript:@"unacknowledged"];
  }
  unint64_t v8 = [(CPLPrequeliteCloudCache *)self _countOfUnconfirmedRecords];
  if (v8)
  {
    unint64_t v9 = +[NSNumber numberWithUnsignedInteger:v8];
    [v6 setObject:v9 forKeyedSubscript:@"unconfirmed"];
  }
  return v6;
}

- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4
{
  unint64_t v7 = [(CPLPrequeliteCloudCache *)self abstractObject];
  unint64_t v8 = [v7 engineStore];
  unint64_t v9 = [v8 scopes];
  int64_t v10 = [v9 scopeWithCloudScopeIndex:a3];

  if (v10)
  {
    id v11 = [v10 localIndex];
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    BOOL v13 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v14 = +[PQLFormatInjection formatInjection:@"localScopeIndex = %ld", v11];
    BOOL v15 = (char *)[v12 table:v13 countOfRecordsMatchingQuery:v14];

    if ((unint64_t)v15 < a4)
    {
      id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lu not matched with client", a4 - (void)v15);
LABEL_6:
      id v17 = v16;
      goto LABEL_8;
    }
    if ((unint64_t)v15 > a4)
    {
      id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lu extra records matched with client!", &v15[-a4]);
      goto LABEL_6;
    }
  }
  id v17 = 0;
LABEL_8:

  return v17;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteCloudCache;
  objc_super v2 = [(CPLPrequeliteStorage *)&v4 statusPerScopeIndexWithGroupProperty:@"class" valueDescription:&stru_10027F520];
  return v2;
}

- (id)_relatedIdentifierForRecordWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  unint64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [v6 cplFetchObject:&stru_10027F540, @"SELECT relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE identifier = %@", v7, v4 sql];

  id v9 = +[NSNull null];

  if (v8 == v9)
  {

    id v8 = 0;
  }

  return v8;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = [(CPLPrequeliteStorage *)self pqStore];
  id v12 = [v11 pqlConnection];

  BOOL v13 = [(CPLPrequeliteStorage *)self mainTable];
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

- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
  id v11 = [v10 pqlConnection];

  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
  id v13 = objc_alloc_init((Class)NSMutableIndexSet);
  id v39 = self;
  unsigned int v14 = [(CPLPrequeliteStorage *)self mainTable];
  id v15 = [v11 cplFetch:@"SELECT rowid, scopeIndex, identifier, relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE otherScopeIndex = %ld OR stagedOtherScopeIndex = %ld LIMIT %lu", v14, a4, a4, a5];

  if ([v15 next])
  {
    id v16 = 0;
    id v17 = 0;
    do
    {
      objc_msgSend(v13, "addIndex:", objc_msgSend(v15, "integerAtIndex:", 0));
      id v18 = [v15 integerAtIndex:1];
      if (v18 != v16)
      {
        id v19 = [(CPLPrequeliteCloudCache *)v39 abstractObject];
        Class v20 = [v19 engineStore];
        __int16 v21 = [v20 scopes];

        unsigned int v22 = [v21 scopeIdentifierForCloudScopeIndex:v18];

        if (v22)
        {
          int64_t v23 = [v21 scopeWithIdentifier:v22];
          if (!v23 || [v21 valueForFlag:16 forScope:v23])
          {

            unsigned int v22 = 0;
          }
        }
        id v17 = v22;
        id v16 = v18;
      }
      if (v17)
      {
        id v24 = objc_alloc((Class)CPLScopedIdentifier);
        Class v25 = [v15 stringAtIndex:2];
        id v26 = [v24 initWithScopeIdentifier:v17 identifier:v25 scopeIndex:v18];

        [v12 addObject:v26];
        uint64_t v27 = [v15 stringAtIndex:3];
        if (v27)
        {
          id v28 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v17 identifier:v27 scopeIndex:v18];

          [v12 addObject:v28];
          id v26 = v28;
        }
        __int16 v29 = [v15 stringAtIndex:4];
        unsigned int v30 = v29;
        if (v29 && (!v27 || ([v29 isEqual:v27] & 1) == 0))
        {
          id v31 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v17 identifier:v30 scopeIndex:v18];

          [v12 addObject:v31];
          id v26 = v31;
        }
      }
    }
    while (([v15 next] & 1) != 0);
  }
  else
  {
    id v17 = 0;
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  int v48 = sub_100199E58;
  v49 = sub_100199E68;
  id v50 = 0;
  if ([v13 count])
  {
    Class v32 = [(CPLPrequeliteStorage *)v39 mainTable];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10019A93C;
    v40[3] = &unk_10027EE58;
    id v43 = &v51;
    id v41 = v11;
    id v33 = v32;
    id v42 = v33;
    uint64_t v44 = &v45;
    [v13 enumerateIndexesUsingBlock:v40];
  }
  if (*((unsigned char *)v52 + 24))
  {
    *a3 = [v12 copy];
    *a6 = (int64_t)[v13 count];
  }
  else if (a7)
  {
    *a7 = (id) v46[5];
  }
  char v34 = *((unsigned char *)v52 + 24);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v34;
}

- (void).cxx_destruct
{
}

@end