@interface CPLCloudKitFetchTransportScopeTask
- (BOOL)shouldCreateScopeIfNecessary;
- (CPLCloudKitFetchTransportScopeTask)initWithController:(id)a3 scope:(id)a4 cloudKitScope:(id)a5 completionHandler:(id)a6;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (void)_callCompletionWithZone:(id)a3;
- (void)_updateCloudKitScopeWithZone:(id)a3;
- (void)createRecordZoneWithID:(id)a3;
- (void)runOperations;
- (void)setShouldCreateScopeIfNecessary:(BOOL)a3;
@end

@implementation CPLCloudKitFetchTransportScopeTask

- (CPLCloudKitFetchTransportScopeTask)initWithController:(id)a3 scope:(id)a4 cloudKitScope:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CPLCloudKitFetchTransportScopeTask;
  v14 = [(CPLCloudKitTransportTask *)&v21 initWithController:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scope, a4);
    objc_storeStrong((id *)&v15->_cloudKitScope, a5);
    v16 = (CPLEngineScopeFlagsUpdate *)objc_alloc_init((Class)CPLEngineScopeFlagsUpdate);
    fetchedFlags = v15->_fetchedFlags;
    v15->_fetchedFlags = v16;

    id v18 = objc_retainBlock(v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v18;

    v15->_options = 0;
  }

  return v15;
}

- (void)_updateCloudKitScopeWithZone:(id)a3
{
  cloudKitScope = self->_cloudKitScope;
  id v5 = a3;
  v6 = [CPLCloudKitScope alloc];
  if (cloudKitScope) {
    unint64_t options = self->_options | [(CPLCloudKitScope *)self->_cloudKitScope options];
  }
  else {
    unint64_t options = self->_options;
  }
  id v12 = [(CPLCloudKitScope *)v6 initWithZone:v5 options:options];

  v8 = [(CPLCloudKitTransportTask *)self controller];
  v9 = [v8 zoneIdentificationForCloudKitScope:v12 engineScope:self->_scope];

  v10 = [v9 cloudKitScope];
  id v11 = self->_cloudKitScope;
  self->_cloudKitScope = v10;
}

- (void)_callCompletionWithZone:(id)a3
{
  [(CPLCloudKitFetchTransportScopeTask *)self _updateCloudKitScopeWithZone:a3];
  if (!_CPLSilentLogging)
  {
    v4 = sub_100035B48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(CPLCloudKitScope *)self->_cloudKitScope zoneID];
      v6 = objc_msgSend(v5, "cpl_zoneName");
      int64_t v7 = [(CPLCloudKitScope *)self->_cloudKitScope options];
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2048;
      int64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetched zone %{public}@ with options 0x%lx", (uint8_t *)&v10, 0x16u);
    }
  }
  id completionHandler = (void (**)(id, void *, CPLEngineScopeFlagsUpdate *, void))self->_completionHandler;
  v9 = [(CPLCloudKitScope *)self->_cloudKitScope transportScope];
  completionHandler[2](completionHandler, v9, self->_fetchedFlags, 0);
}

- (void)createRecordZoneWithID:(id)a3
{
  id v5 = a3;
  id v17 = 0;
  unsigned __int8 v6 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v17];
  id v7 = v17;
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      v8 = sub_100035B48();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v5, "cpl_zoneName");
        *(_DWORD *)buf = 138543362;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating primary zone with zoneID %{public}@", buf, 0xCu);
      }
    }
    id v10 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v5];
    [(CPLCloudKitFetchTransportScopeTask *)self _updateCloudKitScopeWithZone:v10];
    id v11 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v18 = v10;
    __int16 v12 = +[NSArray arrayWithObjects:&v18 count:1];
    id v13 = [v11 initWithRecordZonesToSave:v12 recordZoneIDsToDelete:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100035DD8;
    v14[3] = &unk_1002775B0;
    v14[4] = self;
    id v15 = v5;
    SEL v16 = a2;
    [v13 setModifyRecordZonesCompletionBlock:v14];
    [(CPLCloudKitTransportTask *)self launchOperation:v13 type:CPLCloudKitOperationTypeForScope(self->_cloudKitScope) withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v78 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v78];
  id v4 = v78;
  if (v3)
  {
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = sub_1000369B0;
    v76 = sub_1000369C0;
    id v77 = [(CPLCloudKitScope *)self->_cloudKitScope zone];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = sub_1000369B0;
    v70 = sub_1000369C0;
    id v71 = [(id)v73[5] zoneID];
    if (v67[5])
    {
      id v5 = objc_alloc((Class)CKRecordZoneID);
      unsigned __int8 v6 = [(id)v67[5] zoneName];
      id v7 = [(id)v67[5] ownerName];
      id v8 = [v5 initWithZoneName:v6 ownerName:v7];
      v9 = (void *)v67[5];
      v67[5] = (uint64_t)v8;

      id v10 = 0;
    }
    else
    {
      id v11 = [(CPLEngineScope *)self->_scope scopeType];
      scope = self->_scope;
      if (v11 == (id)1)
      {
        id v13 = [(CPLEngineScope *)scope scopeIdentifier];
        unsigned int v14 = [v13 isEqualToString:CPLPrimaryScopeIdentifier];

        id v15 = objc_alloc((Class)CKRecordZoneID);
        [(CPLEngineScope *)self->_scope scopeIdentifier];
        if (v14) {
          SEL v16 = {;
        }
          id v17 = [v15 initWithCPLScopeIdentifier:v16];
          id v10 = 0;
          id v18 = &stru_1002775F0;
          v19 = &stru_100277630;
        }
        else {
          v28 = {;
        }
          id v29 = [v15 initWithCPLScopeIdentifier:v28];

          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100036A20;
          v64[3] = &unk_100277658;
          id v30 = v29;
          id v65 = v30;
          id v18 = objc_retainBlock(v64);
          id v10 = v30;
          SEL v16 = v65;
          v19 = &stru_100277678;
          id v17 = v10;
        }

        if (v18) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      unsigned __int8 v6 = [(CPLEngineScope *)scope scopeIdentifier];
      if (!_CPLSilentLogging)
      {
        v20 = sub_100035B48();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v21 = self->_scope;
          *(_DWORD *)buf = 138412290;
          v80 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Transport scope needs to be inferred for %@ - doing it naively for now", buf, 0xCu);
        }
      }
      uint64_t v22 = [(CPLCloudKitTransportTask *)self zoneIDFromScopeIdentifier:v6];
      v23 = (void *)v67[5];
      v67[5] = v22;

      v24 = v67;
      id v10 = (id)v67[5];
      v25 = [(id)v24[5] ownerName];
      unsigned __int8 v26 = [v25 isEqualToString:CKCurrentUserDefaultName];

      if (v26)
      {
        uint64_t v27 = 0;
      }
      else
      {
        [(CPLEngineScopeFlagsUpdate *)self->_fetchedFlags setValue:1 forFlag:1];
        uint64_t v27 = 2;
      }
      unsigned int v31 = +[CPLCloudKitZoneIdentification isSupportedZoneID:v67[5]];
      v32 = [CPLCloudKitScope alloc];
      if (v31) {
        uint64_t v33 = v27 | 4;
      }
      else {
        uint64_t v33 = v27;
      }
      v34 = [(CPLCloudKitScope *)v32 initWithZoneID:v67[5] options:v33];
      cloudKitScope = self->_cloudKitScope;
      self->_cloudKitScope = v34;

      uint64_t v36 = [(CPLCloudKitScope *)self->_cloudKitScope zone];
      id v7 = (void *)v73[5];
      v73[5] = v36;
    }

    id v17 = 0;
LABEL_23:
    if (!v67[5])
    {
      if (!_CPLSilentLogging)
      {
        v51 = sub_100035B48();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "No zoneID to validate against", buf, 2u);
        }
      }
      v52 = +[NSAssertionHandler currentHandler];
      v53 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitFetchTransportScopeTask.m"];
      [v52 handleFailureInMethod:a2 object:self file:v53 lineNumber:162 description:@"No zoneID to validate against"];

      abort();
    }
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100036A34;
    v63[3] = &unk_1002776A0;
    v63[4] = &v66;
    id v18 = objc_retainBlock(v63);
    id v37 = (id)v67[5];

    v19 = &stru_1002776C0;
    id v17 = v37;
LABEL_25:
    v38 = self->_cloudKitScope;
    if (v38) {
      uint64_t v39 = CPLCloudKitOperationTypeForScope(v38);
    }
    else {
      uint64_t v39 = 1;
    }
    if (v10)
    {
      id v40 = objc_alloc((Class)CKFetchRecordZonesOperation);
      id v83 = v10;
      v41 = +[NSArray arrayWithObjects:&v83 count:1];
      id v42 = [v40 initWithRecordZoneIDs:v41];

      if (!_CPLSilentLogging)
      {
        v43 = sub_100035B48();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "cpl_zoneName");
          v44 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue();
          v45 = self->_scope;
          *(_DWORD *)buf = 138543618;
          v80 = v44;
          __int16 v81 = 2112;
          v82 = v45;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Fetching %{public}@ for %@", buf, 0x16u);
        }
LABEL_35:
      }
    }
    else
    {
      id v42 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
      if (!_CPLSilentLogging)
      {
        v43 = sub_100035B48();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v46 = self->_scope;
          *(_DWORD *)buf = 138412290;
          v80 = v46;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Fetching all zones for %@", buf, 0xCu);
        }
        goto LABEL_35;
      }
    }
    v47 = [v42 operationID];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100036A50;
    v55[3] = &unk_100277738;
    v55[4] = self;
    v60 = &v66;
    v48 = v18;
    v58 = v48;
    v61 = &v72;
    id v49 = v47;
    SEL v62 = a2;
    id v56 = v49;
    v59 = v19;
    id v50 = v17;
    id v57 = v50;
    [v42 setFetchRecordZonesCompletionBlock:v55];
    [(CPLCloudKitTransportTask *)self launchOperation:v42 type:v39 withContext:0];

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v72, 8);

    goto LABEL_37;
  }
  (*((void (**)(void))self->_completionHandler + 2))();
LABEL_37:
}

- (BOOL)shouldCreateScopeIfNecessary
{
  return self->_shouldCreateScopeIfNecessary;
}

- (void)setShouldCreateScopeIfNecessary:(BOOL)a3
{
  self->_shouldCreateScopeIfNecessary = a3;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong((id *)&self->_fetchedFlags, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end