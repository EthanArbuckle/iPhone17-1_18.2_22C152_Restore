@interface CPLCloudKitFetchSharedScopeTask
- (CPLCloudKitFetchSharedScopeTask)initWithController:(id)a3 shareURL:(id)a4 completionHandler:(id)a5;
- (id)_scopeChangeFromShareMetadata:(id)a3 currentUserID:(id)a4 error:(id *)a5;
- (void)_fetchSharedScopeWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchSharedScopeTask

- (CPLCloudKitFetchSharedScopeTask)initWithController:(id)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitFetchSharedScopeTask;
  v11 = [(CPLCloudKitTransportTask *)&v16 initWithController:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shareURL, a4);
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }
  return v12;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100084690;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)_fetchSharedScopeWithCurrentUserID:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v21];
  id v6 = v21;
  if (v5)
  {
    if (self->_shareURL)
    {
      id v7 = objc_alloc((Class)CKFetchShareMetadataOperation);
      shareURL = self->_shareURL;
      v8 = +[NSArray arrayWithObjects:&shareURL count:1];
      id v9 = [v7 initWithShareURLs:v8];

      [v9 setShouldFetchRootRecord:1];
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = sub_1000849C4;
      v19[4] = sub_1000849D4;
      id v20 = 0;
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3032000000;
      v17[3] = sub_1000849C4;
      v17[4] = sub_1000849D4;
      id v18 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000849DC;
      v13[3] = &unk_100279760;
      v15 = v17;
      objc_super v16 = v19;
      v13[4] = self;
      id v14 = v4;
      [v9 setPerShareMetadataBlock:v13];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100084C18;
      v12[3] = &unk_1002797B0;
      v12[4] = self;
      v12[5] = v17;
      v12[6] = v19;
      [v9 setFetchShareMetadataCompletionBlock:v12];
      [(CPLCloudKitTransportTask *)self launchOperation:v9 type:0 withContext:0];

      _Block_object_dispose(v17, 8);
      _Block_object_dispose(v19, 8);
    }
    else
    {
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      v11 = +[CPLErrors incorrectParametersErrorForParameter:@"shareURL"];
      completionHandler[2](completionHandler, 0, v11);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)_scopeChangeFromShareMetadata:(id)a3 currentUserID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 share];
  if (v10)
  {
    v43 = a5;
    v11 = [v8 rootRecord];
    uint64_t v12 = [v10 recordID];
    id v13 = (void *)v12;
    if (v11)
    {
      v49[0] = v12;
      v50[0] = v10;
      id v14 = [v11 recordID];
      v49[1] = v14;
      v50[1] = v11;
      v15 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    }
    else
    {
      uint64_t v47 = v12;
      v48 = v10;
      v15 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    }

    v17 = [(CPLCloudKitTransportTask *)self controller];
    id v20 = [v10 recordID];
    id v18 = [(CPLCloudKitScope *)v20 zoneID];

    v19 = [(CPLCloudKitTransportTask *)self controller];
    LODWORD(v20) = [v19 shouldIgnoreZoneWithZoneID:v18];

    v44 = v17;
    if (v20)
    {
      id v21 = v9;
      v22 = objc_msgSend(v18, "cpl_zoneName");
      id v23 = +[CPLErrors cplErrorWithCode:38, @"Zone %@ is not supported by this engine", v22 description];

      if (v43)
      {
        id v23 = v23;
        id v16 = 0;
        id *v43 = v23;
      }
      else
      {
        id v16 = 0;
      }
      id v9 = v21;
    }
    else
    {
      id v23 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v18];
      id v20 = [[CPLCloudKitScope alloc] initWithZone:v23];
      id v24 = [v17 scopeTypeForCloudKitScope:v20 proposedScopeType:0 fetchedRecords:v15 currentUserID:v9];
      if (v24)
      {
        id v25 = v24;
        v41 = [v17 scopeIdentifierFromZoneID:v18];
        id v26 = [objc_alloc((Class)CPLEngineScope) initWithScopeIdentifier:v41 scopeType:v25];
        v39 = v20;
        v27 = v20;
        v28 = v26;
        v38 = [v17 zoneIdentificationForCloudKitScope:v27 engineScope:v26];
        id v40 = v9;
        id v16 = [v38 scopeChangeFromCKRecords:v15 currentUserID:v9 previousScopeChange:0];
        v29 = [v16 share];

        if (v29)
        {
          id v9 = v40;
        }
        else
        {
          id v9 = v40;
          if (!_CPLSilentLogging)
          {
            v32 = sub_100084BC4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v16;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Scope %@ has no share after identification - ignoring", buf, 0xCu);
            }
          }
          if (v43)
          {
            uint64_t v33 = [v10 objectForKeyedSubscript:CKShareTypeKey];
            v34 = (void *)v33;
            v35 = "with";
            if (!v11) {
              v35 = "without";
            }
            id *v43 = +[CPLErrors cplErrorWithCode:38, @"Share of type %@ (%s root record) is malformed or not supported in this universe", v33, v35 description];

            id v9 = v40;
          }

          id v16 = 0;
        }

        id v20 = v39;
      }
      else if (v43)
      {
        uint64_t v30 = [v10 objectForKeyedSubscript:CKShareTypeKey];
        v31 = "with";
        if (!v11) {
          v31 = "without";
        }
        v42 = (void *)v30;
        +[CPLErrors cplErrorWithCode:38, @"Share of type %@ (%s root record) is malformed or not supported", v30, v31 description];
        id v16 = 0;
        id *v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }

      LOBYTE(v20) = 0;
    }

    if (v20)
    {
      v36 = 0;
      goto LABEL_35;
    }
  }
  else if (a5)
  {
    +[CPLErrors unknownError];
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }
  id v16 = v16;
  v36 = v16;
LABEL_35:

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end