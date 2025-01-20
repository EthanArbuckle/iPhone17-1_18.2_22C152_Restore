@interface CPLCloudKitSetupTask
- (BOOL)shouldUpdateDisabledFeatures;
- (CPLCloudKitSetupTask)initWithController:(id)a3 updateDisabledFeatures:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchDerivativesFilter;
- (void)fetchDisabledFeatures;
- (void)fetchUserRecord;
- (void)runOperations;
@end

@implementation CPLCloudKitSetupTask

- (CPLCloudKitSetupTask)initWithController:(id)a3 updateDisabledFeatures:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CPLCloudKitSetupTask;
  v9 = [(CPLCloudKitBaseSetupTask *)&v13 initWithController:a3];
  if (v9)
  {
    id v10 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v10;

    v9->_shouldUpdateDisabledFeatures = a4;
  }

  return v9;
}

- (void)fetchDisabledFeatures
{
  id v12 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v12];
  id v4 = v12;
  if (v3)
  {
    v5 = +[NSUserDefaults standardUserDefaults];
    v6 = [v5 arrayForKey:@"CPLDisabledFeatures"];

    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        v7 = sub_10004B168();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v6 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412290;
          v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Forcing disabled features: (%@)", buf, 0xCu);
        }
      }
      (*((void (**)(void))self->_completionHandler + 2))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v9 = sub_10004B168();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching list of disabled features from server", buf, 2u);
        }
      }
      id v10 = objc_alloc_init(CPLCKCheckFeatureAvailabilityOperation);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10004B1BC;
      v11[3] = &unk_100277D58;
      v11[4] = self;
      [(CPLCKCheckFeatureAvailabilityOperation *)v10 setFeatureCheckAvailabilityCompletionBlock:v11];
      [(CPLCloudKitTransportTask *)self launchOperation:v10 type:1 withContext:0];
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)fetchDerivativesFilter
{
  id v7 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v7];
  id v4 = v7;
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004B484;
    v6[3] = &unk_100277D80;
    v6[4] = self;
    v5 = +[CPLCKResourceDownloadOperation fetchDerivativesUploadConfigurationWithCompletionBlock:v6];
    [(CPLCloudKitTransportTask *)self launchOperation:v5 type:1 withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)fetchUserRecord
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004B6EC;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self fetchUserRecordIDFetchWithCompletionHandler:v2];
}

- (void)runOperations
{
}

- (BOOL)shouldUpdateDisabledFeatures
{
  return self->_shouldUpdateDisabledFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedUserRecordID, 0);
  objc_storeStrong((id *)&self->_derivativesFilter, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end