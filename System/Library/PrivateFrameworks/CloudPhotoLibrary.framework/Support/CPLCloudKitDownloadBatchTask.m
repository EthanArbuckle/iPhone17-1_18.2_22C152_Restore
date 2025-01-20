@interface CPLCloudKitDownloadBatchTask
+ (BOOL)forceUpdatePrimarySyncStateOnce;
+ (void)setForceUpdatePrimarySyncStateOnce:(BOOL)a3;
- (CKFetchRecordZoneChangesOperation)currentFetchRecordZoneChangesOperation;
- (CKServerChangeToken)syncAnchor;
- (CPLCloudKitDownloadBatchTask)initWithController:(id)a3 syncAnchor:(id)a4 scope:(id)a5 transportScopeMapping:(id)a6 currentScopeChange:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLScopeChange)currentScopeChange;
- (id)_partnerScopesNeedingToPullChangesFromZoneIDsWithSyncObligations:(id)a3;
- (void)_downloadBatchWithCurrentUserID:(id)a3;
- (void)addPartnerScope:(id)a3 mostCurrentSyncAnchor:(id)a4;
- (void)runOperations;
- (void)runWithinSyncSession:(id)a3;
- (void)sendProgressBatch:(id)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 updatedSyncAnchor:(id)a6 zoneIDsWithSyncObligations:(id)a7;
- (void)setCurrentFetchRecordZoneChangesOperation:(id)a3;
@end

@implementation CPLCloudKitDownloadBatchTask

+ (BOOL)forceUpdatePrimarySyncStateOnce
{
  return byte_1002CE668;
}

+ (void)setForceUpdatePrimarySyncStateOnce:(BOOL)a3
{
  byte_1002CE668 = a3;
}

- (CPLCloudKitDownloadBatchTask)initWithController:(id)a3 syncAnchor:(id)a4 scope:(id)a5 transportScopeMapping:(id)a6 currentScopeChange:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v29 = a5;
  id v17 = a6;
  id v28 = a7;
  id v18 = a8;
  id v19 = a9;
  v34.receiver = self;
  v34.super_class = (Class)CPLCloudKitDownloadBatchTask;
  v20 = [(CPLCloudKitTransportTask *)&v34 initWithController:v15];
  if (v20)
  {
    objc_initWeak(&location, v20);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005A5CC;
    v30[3] = &unk_100278520;
    objc_copyWeak(&v32, &location);
    id v31 = v19;
    id v21 = [v30 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v21;

    id v23 = [v18 copy];
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = v23;

    if (v16)
    {
      uint64_t v25 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v16 class:objc_opt_class()];
      syncAnchor = v20->_syncAnchor;
      v20->_syncAnchor = (CKServerChangeToken *)v25;
    }
    [(CPLCloudKitTransportTask *)v20 setTransportScopeMapping:v17];
    objc_storeStrong((id *)&v20->_scope, a5);
    objc_storeStrong((id *)&v20->_currentScopeChange, a7);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v20;
}

- (void)runWithinSyncSession:(id)a3
{
  id v4 = a3;
  [(CPLCloudKitDownloadBatchTask *)self hash];
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)CPLCloudKitDownloadBatchTask;
  [(CPLCloudKitTransportTask *)&v5 runWithinSyncSession:v4];
}

- (void)addPartnerScope:(id)a3 mostCurrentSyncAnchor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_scopesBySupplementalZoneID)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    scopesBySupplementalZoneID = self->_scopesBySupplementalZoneID;
    self->_scopesBySupplementalZoneID = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    supplementalChangeTokenByZoneID = self->_supplementalChangeTokenByZoneID;
    self->_supplementalChangeTokenByZoneID = v11;
  }
  v13 = [v7 scopeIdentifier];
  v14 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v13];

  if (!v14) {
    sub_1001C8800((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  id v15 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v8 class:objc_opt_class()];
  if (v15)
  {
    uint64_t v16 = [v14 zoneID];
    if (!v16) {
      sub_1001C88E8((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
    }
    id v17 = (void *)v16;
    [(NSMutableDictionary *)self->_supplementalChangeTokenByZoneID setObject:v15 forKeyedSubscript:v16];
    [(NSMutableDictionary *)self->_scopesBySupplementalZoneID setObject:v7 forKeyedSubscript:v17];
  }
  else if (!_CPLSilentLogging)
  {
    id v18 = sub_10005A914();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid sync obligation change token for %@: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (id)_partnerScopesNeedingToPullChangesFromZoneIDsWithSyncObligations:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_supplementalChangeTokenByZoneID count]
    && (id v5 = [v4 count]) != 0)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v13 = [(NSMutableDictionary *)self->_supplementalChangeTokenByZoneID objectForKeyedSubscript:v12];

          if (v13)
          {
            v14 = [(NSMutableDictionary *)self->_scopesBySupplementalZoneID objectForKeyedSubscript:v12];
            if (v14)
            {
              if (!_CPLSilentLogging)
              {
                id v15 = sub_10005A914();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v24 = v14;
                  __int16 v25 = 2114;
                  uint64_t v26 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ needs to pull changes (sync obligation on %{public}@)", buf, 0x16u);
                }
              }
              [v6 addObject:v14];
            }
            [(NSMutableDictionary *)self->_supplementalChangeTokenByZoneID removeObjectForKey:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }

    id v16 = [v6 copy];
    id v4 = v18;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)sendProgressBatch:(id)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 updatedSyncAnchor:(id)a6 zoneIDsWithSyncObligations:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v14)
  {
    id v16 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v14];
    if (!v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v16 = 0;
  if (v12)
  {
LABEL_3:
    [v19 addRecord:v12];
    objc_storeStrong((id *)&self->_currentScopeChange, a4);
  }
LABEL_4:
  id progressHandler = (void (**)(id, id, id, void *, void *))self->_progressHandler;
  id v18 = [(CPLCloudKitDownloadBatchTask *)self _partnerScopesNeedingToPullChangesFromZoneIDsWithSyncObligations:v15];
  progressHandler[2](progressHandler, v19, v13, v16, v18);
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005AD44;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)_downloadBatchWithCurrentUserID:(id)a3
{
  id v46 = a3;
  id v95 = 0;
  unsigned __int8 v4 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v95];
  id v45 = v95;
  if (v4)
  {
    scope = self->_scope;
    if (scope)
    {
      id v6 = [(CPLEngineScope *)scope scopeIdentifier];
      v44 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v6];

      if (v44)
      {
        v41 = [v44 zoneID];
        id v42 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
        [v42 setPreviousServerChangeToken:self->_syncAnchor];
        [v42 setResultsLimit:200];
        id v7 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
        v100 = v41;
        id v8 = +[NSArray arrayWithObjects:&v100 count:1];
        v98 = v41;
        id v99 = v42;
        id v9 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        id v10 = [v7 initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v9];

        [v10 setFetchAllChanges:1];
        supplementalChangeTokenByZoneID = self->_supplementalChangeTokenByZoneID;
        if (supplementalChangeTokenByZoneID)
        {
          id v12 = [(NSMutableDictionary *)supplementalChangeTokenByZoneID copy];
          [v10 setSupplementalChangeTokenByZoneID:v12];
        }
        v93[0] = 0;
        v93[1] = v93;
        v93[2] = 0x3032000000;
        v93[3] = sub_10005B814;
        v93[4] = sub_10005B824;
        id v94 = objc_alloc_init((Class)CPLChangeBatch);
        v91[0] = 0;
        v91[1] = v91;
        v91[2] = 0x3032000000;
        v91[3] = sub_10005B814;
        v91[4] = sub_10005B824;
        id v92 = 0;
        v89[0] = 0;
        v89[1] = v89;
        v89[2] = 0x3032000000;
        v89[3] = sub_10005B814;
        v89[4] = sub_10005B824;
        id v90 = 0;
        v88[0] = 0;
        v88[1] = v88;
        v88[2] = 0x2020000000;
        v88[3] = 0;
        v86[0] = 0;
        v86[1] = v86;
        v86[2] = 0x2020000000;
        char v87 = 0;
        v84[0] = 0;
        v84[1] = v84;
        v84[2] = 0x3032000000;
        v84[3] = sub_10005B814;
        v84[4] = sub_10005B824;
        id v85 = 0;
        [v10 setShouldFetchAssetContents:0];
        id v13 = +[CPLRecordChange assetTransferOptionsByRecordTypeAndKey];
        [v10 setAssetTransferOptionsByRecordTypeAndKey:v13];

        v82[0] = 0;
        v82[1] = v82;
        v82[2] = 0x3032000000;
        v82[3] = sub_10005B814;
        v82[4] = sub_10005B824;
        v83 = self->_syncAnchor;
        v80[0] = 0;
        v80[1] = v80;
        v80[2] = 0x2020000000;
        char v81 = 0;
        id v14 = [(CPLCloudKitTransportTask *)self controller];
        id v15 = [v14 zoneIdentificationForCloudKitScope:v44 engineScope:self->_scope];

        id v16 = [(CPLEngineScope *)self->_scope scopeIdentifier];
        if (+[CPLCloudKitDownloadBatchTask forceUpdatePrimarySyncStateOnce])
        {
          id v17 = [(CPLCloudKitTransportTask *)self controller];
          id v18 = [v17 mainScopeIdentifier];
          unsigned int v19 = [v16 isEqualToString:v18];

          if (v19)
          {
            if (!_CPLSilentLogging)
            {
              long long v20 = sub_10005A914();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                long long v21 = self->_scope;
                *(_DWORD *)buf = 138412290;
                v97 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Forcing update of library state for %@", buf, 0xCu);
              }
            }
            id v22 = objc_alloc((Class)CKRecord);
            id v23 = [v15 recordIDWithRecordName:@"PrimarySync-0000-ZS"];
            id v24 = [v22 initWithRecordType:@"CPLZoneState" recordID:v23];

            __int16 v25 = [v15 updatedScopeChangeFromScopeChange:self->_currentScopeChange currentUserID:v46 withCKRecord:v24];
            if (v25)
            {
              id v26 = objc_alloc_init((Class)CPLChangeBatch);
              [(CPLCloudKitDownloadBatchTask *)self sendProgressBatch:v26 updatedScopeChange:v25 updatedFlags:0 updatedSyncAnchor:self->_syncAnchor zoneIDsWithSyncObligations:0];
            }
            +[CPLCloudKitDownloadBatchTask setForceUpdatePrimarySyncStateOnce:](CPLCloudKitDownloadBatchTask, "setForceUpdatePrimarySyncStateOnce:", 0, v41);
          }
        }
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_10005B82C;
        v71[3] = &unk_100278548;
        v76 = v88;
        v75 = v80;
        v71[4] = self;
        id v27 = v16;
        id v72 = v27;
        id v28 = v46;
        id v73 = v28;
        id v29 = v15;
        id v74 = v29;
        v77 = v93;
        v78 = v91;
        v79 = v89;
        [v10 setRecordWasChangedBlock:v71];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_10005BCAC;
        v62[3] = &unk_100278570;
        v66 = v80;
        v67 = v88;
        v62[4] = self;
        v68 = v91;
        id v30 = v29;
        id v63 = v30;
        id v64 = v28;
        v69 = v89;
        id v31 = v27;
        id v65 = v31;
        v70 = v93;
        [v10 setRecordWithIDWasDeletedBlock:v62];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10005BEF8;
        v61[3] = &unk_1002785C0;
        v61[4] = self;
        v61[5] = v80;
        v61[6] = v84;
        v61[7] = v82;
        v61[8] = v86;
        id v32 = objc_retainBlock(v61);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10005C1AC;
        v60[3] = &unk_1002785E8;
        v60[4] = self;
        v60[5] = v80;
        v60[6] = v88;
        v60[7] = v82;
        v60[8] = v93;
        v60[9] = v91;
        v60[10] = v89;
        v33 = objc_retainBlock(v60);
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10005C3F8;
        v55[3] = &unk_100278610;
        v59 = v80;
        id v34 = v41;
        id v56 = v34;
        v57 = self;
        v35 = v33;
        id v58 = v35;
        [v10 setRecordZoneChangeTokensUpdatedBlock:v55];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10005C574;
        v47[3] = &unk_100278638;
        v51 = v80;
        id v36 = v34;
        SEL v54 = a2;
        id v48 = v36;
        v49 = self;
        v37 = v35;
        id v50 = v37;
        v52 = v84;
        v53 = v86;
        [v10 setRecordZoneFetchCompletionBlock:v47];
        [v10 setFetchRecordZoneChangesCompletionBlock:v32];
        [(CPLCloudKitDownloadBatchTask *)self setCurrentFetchRecordZoneChangesOperation:v10];
        [(CPLCloudKitTransportTask *)self launchOperation:v10 type:CPLCloudKitOperationTypeForScope(v44) withContext:0];

        _Block_object_dispose(v80, 8);
        _Block_object_dispose(v82, 8);

        _Block_object_dispose(v84, 8);
        _Block_object_dispose(v86, 8);
        _Block_object_dispose(v88, 8);
        _Block_object_dispose(v89, 8);

        _Block_object_dispose(v91, 8);
        _Block_object_dispose(v93, 8);
      }
      else
      {
        id completionHandler = self->_completionHandler;
        id v36 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
        (*((void (**)(id, void, void, void, id))completionHandler + 2))(completionHandler, 0, 0, 0, v36);
      }
    }
    else
    {
      id v38 = self->_completionHandler;
      v39 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required scope"];
      (*((void (**)(id, void, void, void, void *))v38 + 2))(v38, 0, 0, 0, v39);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CKServerChangeToken)syncAnchor
{
  return self->_syncAnchor;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLScopeChange)currentScopeChange
{
  return self->_currentScopeChange;
}

- (CKFetchRecordZoneChangesOperation)currentFetchRecordZoneChangesOperation
{
  return self->_currentFetchRecordZoneChangesOperation;
}

- (void)setCurrentFetchRecordZoneChangesOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFetchRecordZoneChangesOperation, 0);
  objc_storeStrong((id *)&self->_currentScopeChange, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_scopesBySupplementalZoneID, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end