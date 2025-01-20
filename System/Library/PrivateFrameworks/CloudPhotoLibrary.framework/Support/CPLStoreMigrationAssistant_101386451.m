@interface CPLStoreMigrationAssistant_101386451
- (BOOL)_isCloudScopedIdentifier:(id)a3 aSuspiciousRemappingToCloudScopedIdentifier:(id)a4 primaryScope:(id)a5;
- (BOOL)_isSuspiciousAsset:(id)a3 isBadAsset:(BOOL *)a4;
- (BOOL)_performMigrationForRemappedRecord:(id)a3 primaryScope:(id)a4 sharingScope:(id)a5 revertedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)_performMigrationWithPrimaryScope:(id)a3 sharingScope:(id)a4 error:(id *)a5;
- (BOOL)_revertRecordWithLocalScopedIdentifier:(id)a3 class:(Class)a4 revertedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)performMigrationWithError:(id *)a3;
- (CPLStoreMigrationAssistant_101386451)initWithStore:(id)a3;
- (NSString)migrationDescription;
- (int64_t)checkPushedChange:(id)a3;
@end

@implementation CPLStoreMigrationAssistant_101386451

- (CPLStoreMigrationAssistant_101386451)initWithStore:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CPLStoreMigrationAssistant_101386451;
  v5 = [(CPLStoreMigrationAssistant_101386451 *)&v25 initWithStore:v4];
  if (v5)
  {
    uint64_t v6 = [v4 scopes];
    scopes = v5->_scopes;
    v5->_scopes = (CPLEngineScopeStorage *)v6;

    uint64_t v8 = [v4 remappedRecords];
    remappedRecords = v5->_remappedRecords;
    v5->_remappedRecords = (CPLEngineRemappedRecords *)v8;

    uint64_t v10 = [v4 idMapping];
    idMapping = v5->_idMapping;
    v5->_idMapping = (CPLEngineIDMapping *)v10;

    uint64_t v12 = [v4 revertRecords];
    revertRecords = v5->_revertRecords;
    v5->_revertRecords = (CPLEngineRevertRecords *)v12;

    uint64_t v14 = [v4 cloudCache];
    cloudCache = v5->_cloudCache;
    v5->_cloudCache = (CPLEngineCloudCache *)v14;

    uint64_t v16 = [v4 pushRepository];
    pushRepository = v5->_pushRepository;
    v5->_pushRepository = (CPLEnginePushRepository *)v16;

    uint64_t v18 = [v4 pullQueue];
    pullQueue = v5->_pullQueue;
    v5->_pullQueue = (CPLEngineChangePipe *)v18;

    uint64_t v20 = [v4 platformObject];
    pqStore = v5->_pqStore;
    v5->_pqStore = (CPLPrequeliteStore *)v20;

    uint64_t v22 = [(CPLPrequeliteStore *)v5->_pqStore pqlConnection];
    db = v5->_db;
    v5->_db = (PQLConnection *)v22;
  }
  return v5;
}

- (BOOL)_isCloudScopedIdentifier:(id)a3 aSuspiciousRemappingToCloudScopedIdentifier:(id)a4 primaryScope:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)CPLScopedIdentifier);
  uint64_t v12 = [v8 scopeIdentifier];
  v13 = [v10 identifier];

  id v14 = objc_msgSend(v11, "initWithScopeIdentifier:identifier:scopeIndex:", v12, v13, objc_msgSend(v8, "cloudIndex"));
  id v15 = objc_alloc((Class)CPLScopedIdentifier);
  uint64_t v16 = [v8 scopeIdentifier];
  v17 = [v9 identifier];

  id v18 = [v8 cloudIndex];
  id v19 = [v15 initWithScopeIdentifier:v16 identifier:v17 scopeIndex:v18];

  char v24 = 0;
  uint64_t v20 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v14 isFinal:&v24];
  if (v20)
  {
    v21 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v19 isFinal:&v24];
    BOOL v22 = v21 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_isSuspiciousAsset:(id)a3 isBadAsset:(BOOL *)a4
{
  id v6 = a3;
  if ([v6 isAssetChange])
  {
    *a4 = 0;
    v7 = [v6 scopedIdentifier];
    id v8 = [v7 scopeIdentifier];
    id v9 = [(CPLEngineScopeStorage *)self->_scopes mainScopeIdentifier];
    unsigned int v10 = [v8 isEqualToString:v9];

    BOOL v11 = 0;
    if (v10)
    {
      uint64_t v12 = [(CPLEngineScopeStorage *)self->_scopes primaryScope];
      uint64_t v13 = [(CPLEngineScopeStorage *)self->_scopes sharingScopeForScope:v12];
      id v14 = (void *)v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        unsigned int v16 = 0;
      }
      else
      {
        char v37 = 0;
        uint64_t v17 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v7 isFinal:&v37];
        id v18 = (void *)v17;
        if (v17)
        {
          id v19 = objc_alloc((Class)CPLScopedIdentifier);
          uint64_t v20 = [v14 scopeIdentifier];
          v32 = v18;
          v21 = [v18 identifier];
          id v22 = objc_msgSend(v19, "initWithScopeIdentifier:identifier:scopeIndex:", v20, v21, objc_msgSend(v14, "cloudIndex"));

          v23 = [(CPLEngineRemappedRecords *)self->_remappedRecords realScopedIdentifierForRemappedScopedIdentifier:v22];
          if ([v23 isEqual:v22])
          {
            v31 = v23;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            char v24 = [(CPLEngineRemappedRecords *)self->_remappedRecords scopedIdentifiersRemappedToScopedIdentifier:v22];
            id v25 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v25)
            {
              id v26 = v25;
              v30 = v14;
              uint64_t v27 = *(void *)v34;
              while (2)
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v34 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  if ([(CPLStoreMigrationAssistant_101386451 *)self _isCloudScopedIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i) aSuspiciousRemappingToCloudScopedIdentifier:v22 primaryScope:v12])
                  {
                    unsigned int v16 = 1;
                    *a4 = 1;
                    goto LABEL_24;
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
              unsigned int v16 = 0;
LABEL_24:
              id v14 = v30;
            }
            else
            {
              unsigned int v16 = 0;
            }

            v23 = v31;
            id v18 = v32;
          }
          else
          {
            unsigned int v16 = [(CPLStoreMigrationAssistant_101386451 *)self _isCloudScopedIdentifier:v22 aSuspiciousRemappingToCloudScopedIdentifier:v23 primaryScope:v12];
          }
        }
        else
        {
          unsigned int v16 = 0;
        }
      }
      BOOL v11 = v16 != 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)checkPushedChange:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  if ([(CPLStoreMigrationAssistant_101386451 *)self _isSuspiciousAsset:v4 isBadAsset:&v8])
  {
    if (v8)
    {
      int64_t v5 = 1;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)CPLStoreMigrationAssistant_101386451;
      int64_t v5 = [(CPLStoreMigrationAssistant_101386451 *)&v7 checkPushedChange:v4];
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_revertRecordWithLocalScopedIdentifier:(id)a3 class:(Class)a4 revertedCount:(unint64_t *)a5 error:(id *)a6
{
  unsigned int v8 = [(CPLEngineRevertRecords *)self->_revertRecords addRecordsToRevertWithLocalScopedIdentifier:a3 class:a4 error:a6];
  if (v8) {
    *a5 += (unint64_t)[(PQLConnection *)self->_db changes];
  }
  return v8;
}

- (BOOL)_performMigrationForRemappedRecord:(id)a3 primaryScope:(id)a4 sharingScope:(id)a5 revertedCount:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v13 = a3;
  id v14 = a4;
  id v15 = a5;
  pqStore = self->_pqStore;
  uint64_t v17 = [v14 scopeIdentifier];
  id v18 = [v15 scopeIdentifier];
  [(CPLPrequeliteStore *)pqStore recordUpgradeEvent:@"Inspecting local state for %@ + %@", v17, v18];

  id v19 = sub_1000379A4((uint64_t)v13);
  uint64_t v20 = sub_1000379BC((uint64_t)v13);
  LODWORD(v18) = [(CPLStoreMigrationAssistant_101386451 *)self _isCloudScopedIdentifier:v19 aSuspiciousRemappingToCloudScopedIdentifier:v20 primaryScope:v14];

  if (!v18)
  {
    v30 = 0;
    goto LABEL_62;
  }
  if (!_CPLSilentLogging)
  {
    v21 = sub_100181A74();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = sub_1000379BC((uint64_t)v13);
      *(_DWORD *)buf = 138412546;
      v101 = v13;
      __int16 v102 = 2112;
      v103 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is suspicious: will make sure to drop %@ in client", buf, 0x16u);
    }
  }
  SEL log = a2;
  v83 = a6;
  id v23 = objc_alloc((Class)CPLScopedIdentifier);
  char v24 = [v14 scopeIdentifier];
  id v25 = sub_1000379BC((uint64_t)v13);
  id v26 = [v25 identifier];
  id v27 = objc_msgSend(v23, "initWithScopeIdentifier:identifier:scopeIndex:", v24, v26, objc_msgSend(v14, "cloudIndex"));

  v28 = v27;
  v29 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v27 isFinal:0];
  v30 = v29;
  v86 = v29;
  if (!v29) {
    goto LABEL_19;
  }
  if (![v29 isAssetChange])
  {
    v30 = 0;
LABEL_19:
    v85 = a7;
    char v95 = 0;
    id v42 = objc_alloc((Class)CPLScopedIdentifier);
    v43 = [v14 scopeIdentifier];
    v44 = sub_1000379A4((uint64_t)v13);
    v45 = [v44 identifier];
    id v46 = objc_msgSend(v42, "initWithScopeIdentifier:identifier:scopeIndex:", v43, v45, objc_msgSend(v14, "cloudIndex"));

    v47 = v46;
    v48 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v46 isFinal:&v95];
    -[NSObject setScopeIndex:](v48, "setScopeIndex:", [v14 localIndex]);
    v49 = [(CPLEnginePushRepository *)self->_pushRepository changeWithScopedIdentifier:v48];
    if (!v49) {
      goto LABEL_38;
    }
    v94.receiver = self;
    v94.super_class = (Class)CPLStoreMigrationAssistant_101386451;
    id v50 = [(CPLStoreMigrationAssistant_101386451 *)&v94 checkPushedChange:v49];
    if (v50 == (id)2)
    {
      v77 = v47;
      v79 = v28;
      if (!_CPLSilentLogging)
      {
        v60 = sub_100181A74();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v49;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Modifying %@ in push repository and reverting in client", buf, 0xCu);
        }
      }
      id v76 = v15;
      v61 = [(CPLEnginePushRepository *)self->_pushRepository platformObject];
      v62 = [v49 _pushContext];
      v88 = v30;
      unsigned int v63 = [v61 _overwriteChange:v49 pushContext:v62 error:&v88];
      v64 = v88;

      if (!v63)
      {
        unsigned __int8 v59 = 0;
        v30 = v64;
        v47 = v77;
        v28 = v79;
LABEL_59:
        id v15 = v76;
        goto LABEL_61;
      }
      v87 = v64;
      unsigned __int8 v59 = [(CPLStoreMigrationAssistant_101386451 *)self _revertRecordWithLocalScopedIdentifier:v48 class:objc_opt_class() revertedCount:v83 error:&v87];
      v65 = v87;
      goto LABEL_57;
    }
    if (v50 != (id)1)
    {
LABEL_38:
      unsigned __int8 v59 = 1;
      goto LABEL_61;
    }
    v77 = v47;
    if (!_CPLSilentLogging)
    {
      v51 = sub_100181A74();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v49;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Dropping %@ from push repository", buf, 0xCu);
      }
    }
    v79 = v28;
    if ([v49 isDelete]
      && [v49 isAssetChange])
    {
      id v76 = v15;
      v52 = [(CPLEnginePushRepository *)self->_pushRepository platformObject];
      id v93 = 0;
      unsigned __int8 v53 = [v52 getRelatedScopedIdentifier:&v93 forRecordWithScopedIdentifier:v48];
      v54 = v93;

      if ((v53 & 1) == 0) {
        sub_1001D082C((uint64_t)v48, (uint64_t)log, (uint64_t)self);
      }
      if (v54)
      {
        v55 = v54;
        v56 = [(CPLEnginePushRepository *)self->_pushRepository changeWithScopedIdentifier:v54];
        if ([v56 isDelete])
        {
          id v15 = v76;
          if (!_CPLSilentLogging)
          {
            loga = sub_100181A74();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v101 = v56;
              __int16 v102 = 2112;
              v103 = v48;
              _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "Also dropping %@ (master of %@) from pushRepository", buf, 0x16u);
            }
          }
          os_log_t logb = v56;
          v57 = [(CPLEnginePushRepository *)self->_pushRepository platformObject];
          v92 = v30;
          v75 = v55;
          unsigned __int8 v58 = [v57 deleteChangeWithScopedIdentifier:v55 error:&v92];
          v74 = v92;

          if ((v58 & 1) == 0)
          {

            unsigned __int8 v59 = 0;
            v47 = v77;
            v28 = v79;
            v65 = v74;
            v64 = v75;
            goto LABEL_58;
          }
          v91 = v74;
          unsigned __int8 v73 = [(CPLStoreMigrationAssistant_101386451 *)self _revertRecordWithLocalScopedIdentifier:v75 class:objc_opt_class() revertedCount:v83 error:&v91];
          v30 = v91;

          if ((v73 & 1) == 0) {
            goto LABEL_60;
          }
          goto LABEL_55;
        }
      }
      else
      {
        if (_CPLSilentLogging)
        {
          id v15 = v76;
          goto LABEL_55;
        }
        v66 = sub_100181A74();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v49;
          v55 = v66;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@ from push repository does not know its master", buf, 0xCu);
        }
        else
        {
          v55 = v66;
        }
      }
      id v15 = v76;
    }
LABEL_55:
    v67 = v30;
    v68 = [(CPLEnginePushRepository *)self->_pushRepository platformObject];
    v90 = v30;
    unsigned int v69 = [v68 deleteChangeWithScopedIdentifier:v48 error:&v90];
    v30 = v90;

    if (!v69)
    {
LABEL_60:
      unsigned __int8 v59 = 0;
      v47 = v77;
      v28 = v79;
LABEL_61:

      if ((v59 & 1) == 0)
      {
        a7 = v85;
        goto LABEL_64;
      }
LABEL_62:
      BOOL v70 = 1;
      goto LABEL_71;
    }
    id v76 = v15;
    v89 = v30;
    unsigned __int8 v59 = [(CPLStoreMigrationAssistant_101386451 *)self _revertRecordWithLocalScopedIdentifier:v48 class:objc_opt_class() revertedCount:v83 error:&v89];
    v65 = v89;
    v64 = v30;
LABEL_57:
    v47 = v77;
    v28 = v79;
LABEL_58:

    v30 = v65;
    goto LABEL_59;
  }
  if (!_CPLSilentLogging)
  {
    v31 = sub_100181A74();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v101 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ should not have been served to the client - removing it", buf, 0xCu);
    }
  }
  v32 = [(CPLEngineCloudCache *)self->_cloudCache platformObject];
  id v99 = 0;
  unsigned int v33 = [v32 _deleteRecordWithScopedIdentifier:v28 error:&v99];
  v30 = v99;

  if (!v33) {
    goto LABEL_48;
  }
  v84 = a7;
  long long v34 = [(CPLEngineChangePipe *)self->_pullQueue platformObject];
  v98 = v30;
  unsigned int v35 = [v34 _deleteAllChangesWithScopedIdentifier:v28 error:&v98];
  long long v36 = v98;

  if (v35)
  {
    buf[0] = 0;
    v78 = v28;
    char v37 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v28 isFinal:buf];
    objc_msgSend(v37, "setScopeIndex:", objc_msgSend(v14, "localIndex"));
    v38 = [(CPLEnginePushRepository *)self->_pushRepository platformObject];
    v97 = v36;
    unsigned __int8 v39 = [v38 deleteChangeWithScopedIdentifier:v37 error:&v97];
    v30 = v97;

    if (v39)
    {
      v96 = v30;
      unsigned int v40 = [(CPLStoreMigrationAssistant_101386451 *)self _revertRecordWithLocalScopedIdentifier:v37 class:[v86 recordClass] revertedCount:v83 error:&v96];
      v41 = v96;

      v30 = v41;
      a7 = v84;
      v28 = v78;
      if (!v40) {
        goto LABEL_48;
      }
      goto LABEL_19;
    }

    a7 = v84;
    v28 = v78;
  }
  else
  {
    v30 = v36;
    a7 = v84;
  }
LABEL_48:

LABEL_64:
  if (!_CPLSilentLogging)
  {
    v71 = sub_100181A74();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v101 = v13;
      __int16 v102 = 2112;
      v103 = v30;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Failed to migrate %@: %@", buf, 0x16u);
    }
  }
  if (a7)
  {
    v30 = v30;
    BOOL v70 = 0;
    *a7 = v30;
  }
  else
  {
    BOOL v70 = 0;
  }
LABEL_71:

  return v70;
}

- (BOOL)_performMigrationWithPrimaryScope:(id)a3 sharingScope:(id)a4 error:(id *)a5
{
  v49 = (char *)a3;
  objc_super v7 = (char *)a4;
  unsigned int v8 = [(CPLEngineRemappedRecords *)self->_remappedRecords platformObject];
  [(CPLEngineIDMapping *)self->_idMapping platformObject];
  v48 = v47 = v8;
  uint64_t v58 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v9 = [v8 remappedRecordEnumeratorInScope:v7];
  unsigned int v10 = (char *)[v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
  id v43 = v10;
  BOOL v11 = 0;
  id v12 = 0;
  if (v10)
  {
    uint64_t v13 = *(void *)v55;
    id v14 = v10;
    while (2)
    {
      id v15 = 0;
      v44 = &v14[(void)v11];
      unsigned int v16 = v12;
      do
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v15);
        id v53 = v16;
        LODWORD(v17) = [(CPLStoreMigrationAssistant_101386451 *)self _performMigrationForRemappedRecord:v17 primaryScope:v49 sharingScope:v7 revertedCount:&v58 error:&v53];
        id v12 = v53;

        if (!v17)
        {

          id v23 = v12;
          id v19 = v47;
          goto LABEL_18;
        }
        [v48 _clearScopedIdentifiersCache];
        ++v15;
        unsigned int v16 = v12;
      }
      while (v14 != v15);
      id v14 = (char *)[v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
      BOOL v11 = v44;
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v19 = v47;
  if (!_CPLSilentLogging)
  {
    uint64_t v20 = sub_100181A74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v60 = v11;
      __int16 v61 = 2048;
      uint64_t v62 = v58;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Inspected %lu remapped records for migration and scheduled %lu reverted changes", buf, 0x16u);
    }
  }
  [(CPLPrequeliteStore *)self->_pqStore recordUpgradeEvent:@"Inspected %lu remapped records for migration and scheduled %lu reverted changes", v11, v58];
  if (v58)
  {
    v21 = [(CPLStoreMigrationAssistant_101386451 *)self store];
    id v52 = v12;
    unsigned int v22 = [v21 addPushPullGatekeeper:self error:&v52];
    id v23 = v52;

    if (!v43 || (v22 & 1) == 0)
    {
      if (!v22) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
    id v12 = v23;
    goto LABEL_26;
  }
  id v23 = v12;
  if (v43)
  {
LABEL_26:
    if (!_CPLSilentLogging)
    {
      id v26 = sub_100181A74();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v7;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor for %@ to ensure all remapped records have been refreshed", buf, 0xCu);
      }
    }
    [(CPLPrequeliteStore *)self->_pqStore recordUpgradeEvent:@"Resetting sync anchor for shared scope"];
    scopes = self->_scopes;
    id v51 = v12;
    unsigned __int8 v28 = [(CPLEngineScopeStorage *)scopes resetSyncAnchorForScope:v7 error:&v51];
    id v23 = v51;

    if ((v28 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_33:
  v29 = [(CPLEngineScopeStorage *)self->_scopes platformObject];
  v30 = [v29 creationDateForScope:v49];
  v31 = [v29 creationDateForScope:v7];
  v32 = +[NSUserDefaults standardUserDefaults];
  [v32 doubleForKey:@"CPLRewindForSparseRecordsInterval"];
  double v34 = v33;

  unsigned int v35 = v30;
  if (v30 && v31)
  {
    if (v34 <= 0.0) {
      double v34 = 86400.0;
    }
    [v31 timeIntervalSinceDate:v30];
    if (v36 < 0.0) {
      double v36 = -v36;
    }
    if (v36 >= v34)
    {

LABEL_51:
      BOOL v25 = 1;
      goto LABEL_52;
    }
  }
  char v37 = [(CPLEngineScopeStorage *)self->_scopes scopeChangeForScope:v49];
  if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v45 = v35;
    if (!_CPLSilentLogging)
    {
      v38 = sub_100181A74();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v49;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor for %@ to ensure we catch up with missing sparse private records and relationships to them", buf, 0xCu);
      }
    }
    [(CPLPrequeliteStore *)self->_pqStore recordUpgradeEvent:@"Resetting sync anchor for private scope"];
    unsigned __int8 v39 = self->_scopes;
    id v50 = v23;
    unsigned __int8 v40 = [(CPLEngineScopeStorage *)v39 resetSyncAnchorForScope:v49 error:&v50];
    id v41 = v50;

    id v23 = v41;
    unsigned int v35 = v45;
  }
  else
  {
    unsigned __int8 v40 = 1;
  }

  if (v40) {
    goto LABEL_51;
  }
LABEL_18:
  if (!_CPLSilentLogging)
  {
    char v24 = sub_100181A74();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (char *)v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to perform migration: %@", buf, 0xCu);
    }
  }
  if (a5)
  {
    id v23 = v23;
    BOOL v25 = 0;
    *a5 = v23;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_52:

  return v25;
}

- (BOOL)performMigrationWithError:(id *)a3
{
  int64_t v5 = [(CPLStoreMigrationAssistant_101386451 *)self store];
  id v6 = [v5 scopes];
  objc_super v7 = [v6 primaryScope];
  if (v7
    && ([v6 valueForFlag:16 forScope:v7] & 1) == 0
    && ([v6 sharingScopeForScope:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
    if (!_CPLSilentLogging)
    {
      unsigned int v10 = sub_100181A74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        unsigned int v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration is needed because store contains active %@/%@", (uint8_t *)&v13, 0x16u);
      }
    }
    if ([v5 forceApplyPendingChangeSessionUpdateWithError:a3]) {
      BOOL v11 = [(CPLStoreMigrationAssistant_101386451 *)self _performMigrationWithPrimaryScope:v7 sharingScope:v9 error:a3];
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v11 = 1;
      goto LABEL_15;
    }
    id v9 = sub_100181A74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No need to perform any migration work", (uint8_t *)&v13, 2u);
    }
    BOOL v11 = 1;
  }

LABEL_15:
  return v11;
}

- (NSString)migrationDescription
{
  return (NSString *)@"Migration-101386451";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_pqStore, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_revertRecords, 0);
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_remappedRecords, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

@end