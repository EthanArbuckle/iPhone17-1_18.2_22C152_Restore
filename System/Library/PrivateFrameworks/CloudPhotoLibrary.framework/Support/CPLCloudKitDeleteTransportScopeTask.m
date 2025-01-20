@interface CPLCloudKitDeleteTransportScopeTask
- (BOOL)forced;
- (CPLCloudKitDeleteTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 completionHandler:(id)a6;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (id)_errorForDeleteError:(id)a3;
- (void)_didFinishDeleteWithError:(id)a3;
- (void)runOperations;
- (void)setForced:(BOOL)a3;
@end

@implementation CPLCloudKitDeleteTransportScopeTask

- (CPLCloudKitDeleteTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPLCloudKitDeleteTransportScopeTask;
  v14 = [(CPLCloudKitTransportTask *)&v18 initWithController:a3];
  if (v14)
  {
    id v15 = [v13 copy];
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = v15;

    objc_storeStrong((id *)&v14->_cloudKitScope, a4);
    objc_storeStrong((id *)&v14->_scope, a5);
  }

  return v14;
}

- (id)_errorForDeleteError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[CPLCloudKitErrors realErrorForError:v4];

    v6 = [v5 domain];
    unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

    if (v7 && ([v5 code] == (id)26 || objc_msgSend(v5, "code") == (id)28))
    {
      v8 = 0;
LABEL_8:

      goto LABEL_10;
    }
    if (v5)
    {
      uint64_t v9 = [(CPLCloudKitTransportTask *)self lastOperationRequestUUIDs];
      v8 = +[CPLCloudKitErrors CPLErrorForCloudKitError:v5 withRequestUUIDs:v9 description:@"Failed to delete zone"];

      v5 = (void *)v9;
      goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (void)_didFinishDeleteWithError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_forced && ([v4 isCPLOperationCancelledError] & 1) == 0)
  {
    cloudKitScope = self->_cloudKitScope;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000521B4;
    v7[3] = &unk_100278088;
    id v8 = v5;
    uint64_t v9 = self;
    [(CPLCloudKitTransportTask *)self fetchZoneForScope:cloudKitScope completionHandler:v7];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v39 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v39];
  id v4 = v39;
  if (v3)
  {
    if ([(CPLEngineScope *)self->_scope scopeType])
    {
      cloudKitScope = self->_cloudKitScope;
      if (!cloudKitScope)
      {
        v6 = [(CPLCloudKitTransportTask *)self controller];
        unsigned int v7 = [(CPLEngineScope *)self->_scope scopeIdentifier];
        id v8 = [v6 zoneIDFromScopeIdentifier:v7];

        uint64_t v9 = [[CPLCloudKitScope alloc] initWithZoneID:v8 options:0];
        v10 = self->_cloudKitScope;
        self->_cloudKitScope = v9;

        cloudKitScope = self->_cloudKitScope;
      }
      id v11 = [(CPLCloudKitScope *)cloudKitScope zoneID];
      if (!v11)
      {
        id completionHandler = (void (**)(id, void *))self->_completionHandler;
        v20 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
        completionHandler[2](completionHandler, v20);
LABEL_42:

        goto LABEL_43;
      }
      if (!self->_forced
        && +[CPLCloudKitZoneIdentification shouldProtectZoneIDFromDeletion:v11])
      {
        if (!_CPLSilentLogging)
        {
          id v12 = sub_1000523BC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v13 = [(CPLEngineScope *)self->_scope scopeIdentifier];
            v14 = objc_msgSend(v11, "cpl_zoneName");
            *(_DWORD *)buf = 138543618;
            v43 = v13;
            __int16 v44 = 2114;
            v45 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Asked to delete %{public}@ (zone %{public}@) - protecting against that", buf, 0x16u);
          }
        }
        (*((void (**)(void))self->_completionHandler + 2))();
        goto LABEL_43;
      }
      v19 = [(CPLCloudKitTransportTask *)self controller];
      v20 = [v19 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope];

      if ([v20 supportsZoneDelete])
      {
        id v21 = objc_alloc((Class)CKModifyRecordZonesOperation);
        v41 = v11;
        v22 = +[NSArray arrayWithObjects:&v41 count:1];
        id v23 = [v21 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v22];

        if (!_CPLSilentLogging)
        {
          v24 = sub_1000523BC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = (CPLEngineScope *)v11;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Deleting zone %@", buf, 0xCu);
          }
        }
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100052AFC;
        v38[3] = &unk_1002780B0;
        v38[4] = self;
        [v23 setModifyRecordZonesCompletionBlock:v38];
        id v25 = [v20 cloudKitScope];
        [(CPLCloudKitTransportTask *)self launchOperation:v23 type:CPLCloudKitOperationTypeForScope(v25) withContext:0];
      }
      else
      {
        id v23 = [v20 shareRecordIDToDelete];
        if (v23)
        {
          if (!_CPLSilentLogging)
          {
            v27 = sub_1000523BC();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = (CPLEngineScope *)v23;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deleting share record %{public}@", buf, 0xCu);
            }
          }
          id v28 = objc_alloc((Class)CKModifyRecordsOperation);
          id v40 = v23;
          v29 = +[NSArray arrayWithObjects:&v40 count:1];
          id v25 = [v28 initWithRecordsToSave:0 recordIDsToDelete:v29];

          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100052C58;
          v37[3] = &unk_1002780B0;
          v37[4] = self;
          [v25 setModifyRecordsCompletionBlock:v37];
          v30 = [v20 cloudKitScope];
          [(CPLCloudKitTransportTask *)self launchOperation:v25 type:CPLCloudKitOperationTypeForScope(v30) withContext:0];
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v31 = sub_1000523BC();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v36 = [v20 cloudKitScope];
              v35 = [v36 zoneID];
              objc_msgSend(v35, "cpl_zoneName");
              v32 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue();
              v33 = +[CPLScopeChange descriptionForScopeType:[(CPLEngineScope *)self->_scope scopeType]];
              *(_DWORD *)buf = 138543618;
              v43 = v32;
              __int16 v44 = 2112;
              v45 = v33;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Trying to delete %{public}@ that does not provide ways to do so (scope type: %@)", buf, 0x16u);
            }
          }
          if (!self->_forced)
          {
            [(CPLCloudKitDeleteTransportScopeTask *)self _didFinishDeleteWithError:0];
            goto LABEL_41;
          }
          v34 = (void (**)(id, id))self->_completionHandler;
          id v25 = +[CPLErrors notImplementedError];
          v34[2](v34, v25);
        }
      }

LABEL_41:
      goto LABEL_42;
    }
    if (!_CPLSilentLogging)
    {
      id v15 = sub_1000523BC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        scope = self->_scope;
        *(_DWORD *)buf = 138412290;
        v43 = scope;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Trying to delete a zone with an unknown type: %@", buf, 0xCu);
      }
    }
    BOOL forced = self->_forced;
    objc_super v18 = (void (**)(id, void *))self->_completionHandler;
    if (forced)
    {
      id v11 = +[CPLErrors notImplementedError];
      v18[2](v18, v11);
LABEL_43:

      goto LABEL_44;
    }
    v18[2](v18, 0);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
LABEL_44:
}

- (BOOL)forced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_BOOL forced = a3;
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
  objc_storeStrong(&self->_completionHandler, 0);
}

@end