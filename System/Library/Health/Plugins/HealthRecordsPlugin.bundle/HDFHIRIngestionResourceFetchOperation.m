@interface HDFHIRIngestionResourceFetchOperation
- (HDFHIRCredentialedSession)session;
- (HDFHIRIngestionResourceFetchOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5 session:(id)a6 queryMode:(int64_t)a7 resourceSchema:(id)a8;
- (HDFHIRResourceData)fetchedData;
- (NSError)fetchError;
- (NSURL)effectiveRequestURL;
- (NSURL)fullRequestURL;
- (id)_assembleDownloadRequestWithError:(id *)a3;
- (void)_accumulateMetricsFromTaskStates:(id)a3;
- (void)_handleTaskCompletedWithData:(id)a3;
- (void)_handleTaskError:(id)a3;
- (void)_handleTokenRefreshResult:(id)a3;
- (void)main;
- (void)setFullRequestURL:(id)a3;
@end

@implementation HDFHIRIngestionResourceFetchOperation

- (HDFHIRIngestionResourceFetchOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5 session:(id)a6 queryMode:(int64_t)a7 resourceSchema:(id)a8
{
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HDFHIRIngestionResourceFetchOperation;
  v17 = [(HDClinicalIngestionPerAccountOperation *)&v20 initWithTask:a3 account:a4 nextOperation:a5];
  v18 = v17;
  if (v17)
  {
    v17->_queryMode = a7;
    objc_storeStrong((id *)&v17->_resourceSchema, a8);
    objc_storeStrong((id *)&v18->_session, a6);
  }

  return v18;
}

- (void)main
{
  _HKInitializeLogging();
  v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
    v7 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
    *(_DWORD *)buf = 138543618;
    v27 = v6;
    __int16 v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to fetch %{public}@ resources", buf, 0x16u);
  }
  id v25 = 0;
  v8 = [(HDFHIRIngestionResourceFetchOperation *)self _assembleDownloadRequestWithError:&v25];
  id v9 = v25;
  if (v8)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_2F384;
    v24[3] = &unk_112B88;
    v24[4] = self;
    v10 = objc_retainBlock(v24);
    v11 = [(HDClinicalIngestionOperation *)self task];
    v12 = [v11 legacyXPCIngestionServiceClient];

    if (!v12)
    {
      objc_super v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"HDFHIRIngestionResourceFetchOperation.m" lineNumber:77 description:@"Must have legacy XPC ingestion service client"];
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2F4B4;
    v21[3] = &unk_112BB0;
    v21[4] = self;
    v14 = v10;
    id v23 = v14;
    id v15 = v13;
    v22 = v15;
    [v12 performDownloadRequest:v8 completion:v21];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    _HKInitializeLogging();
    id v16 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      v19 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ finished fetching %{public}@ resources", buf, 0x16u);
    }
  }
  else
  {
    [(HDFHIRIngestionResourceFetchOperation *)self _handleTaskError:v9];
  }
}

- (void)_handleTaskError:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    dispatch_semaphore_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDFHIRIngestionResourceFetchOperation.m", 96, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  if (objc_msgSend(v6, "hk_isHealthKitError") && objc_msgSend(v6, "code") == &stru_68.segname[5])
  {
    _HKInitializeLogging();
    v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      id v9 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      v10 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
      v11 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching %{public}@ resources was not performed. %@", buf, 0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ACD04(v12, (id *)&self->super.super.super.super.isa);
    }
    objc_storeStrong((id *)&self->_fetchError, a3);
  }
}

- (void)_handleTaskCompletedWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)HDFHIRResourceData);
    effectiveRequestURL = self->_effectiveRequestURL;
    id v11 = [(HDClinicalIngestionPerAccountOperation *)self account];
    v7 = [v11 gateway];
    v8 = [v7 FHIRVersion];
    id v9 = (HDFHIRResourceData *)[v5 initWithData:v4 sourceURL:effectiveRequestURL FHIRVersion:v8];

    fetchedData = self->_fetchedData;
    self->_fetchedData = v9;
  }
}

- (id)_assembleDownloadRequestWithError:(id *)a3
{
  id v5 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v6 = [(HDFHIRCredentialedSession *)self->_session credentialVendor];
  v7 = [v6 currentResult];
  v8 = [v7 credential];
  id v9 = [v5 connectionInformationWithCredential:v8 error:a3];

  if (v9)
  {
    id v10 = objc_alloc((Class)HKClinicalIngestionContext);
    int64_t queryMode = self->_queryMode;
    v12 = [(HDClinicalIngestionPerAccountOperation *)self account];
    dispatch_semaphore_t v13 = [v12 lastFetchDate];
    id v14 = [v10 initWithAccountConnectionInformation:v9 queryMode:queryMode options:1 lastFetchDate:v13];

    id v15 = objc_alloc((Class)HKFHIRResourceDownloadRequest);
    __int16 v16 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
    v17 = [(HDFHIREndpointSchema *)self->_resourceSchema definition];
    id v18 = [v15 initWithResourceType:v16 resourceSchemaDefinition:v17 fullRequestURL:self->_fullRequestURL context:v14];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_handleTokenRefreshResult:(id)a3
{
  id v4 = a3;
  id v8 = [(HDClinicalIngestionOperation *)self profileExtension];
  id v5 = [v8 accountManager];
  id v6 = [(HDClinicalIngestionPerAccountOperation *)self account];
  v7 = [(HDFHIRCredentialedSession *)self->_session credentialVendor];
  [v5 didRefreshCredentialForAccount:v6 credentialVendor:v7 refreshResult:v4];
}

- (void)_accumulateMetricsFromTaskStates:(id)a3
{
  id v4 = a3;
  id v7 = [(HDClinicalIngestionOperation *)self task];
  id v5 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v6 = [v5 gateway];
  [v7 accumulateIngestionAnalyticsFromTaskStates:v4 gateway:v6];
}

- (NSURL)fullRequestURL
{
  return self->_fullRequestURL;
}

- (void)setFullRequestURL:(id)a3
{
}

- (NSURL)effectiveRequestURL
{
  return self->_effectiveRequestURL;
}

- (HDFHIRResourceData)fetchedData
{
  return self->_fetchedData;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (HDFHIRCredentialedSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchedData, 0);
  objc_storeStrong((id *)&self->_effectiveRequestURL, 0);
  objc_storeStrong((id *)&self->_fullRequestURL, 0);

  objc_storeStrong((id *)&self->_resourceSchema, 0);
}

@end