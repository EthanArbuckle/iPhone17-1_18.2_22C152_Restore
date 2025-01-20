@interface HDHealthRecordsLegacyIngestionManager
- (HDHealthRecordsLegacyIngestionManager)init;
- (id)_credentialedSessionSuitableForRequest:(id)a3;
- (id)logPrefix;
- (void)performDownloadRequest:(id)a3 completion:(id)a4;
@end

@implementation HDHealthRecordsLegacyIngestionManager

- (HDHealthRecordsLegacyIngestionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsLegacyIngestionManager;
  v2 = [(HDHealthRecordsLegacyIngestionManager *)&v12 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = +[NSString stringWithFormat:@"%@-IngestionQueue", v5];
    [(NSOperationQueue *)v3 setName:v6];

    [(NSOperationQueue *)v3 setQualityOfService:17];
    [(NSOperationQueue *)v3 setMaxConcurrentOperationCount:3];
    ingestionQueue = v2->_ingestionQueue;
    v2->_ingestionQueue = v3;
    v8 = v3;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    credentialedSessionByAccountIdentifier = v2->_credentialedSessionByAccountIdentifier;
    v2->_credentialedSessionByAccountIdentifier = v9;
  }
  return v2;
}

- (void)performDownloadRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [(HDHealthRecordsLegacyIngestionManager *)self logPrefix];
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    __int16 v27 = 2114;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will start executing %{public}@", buf, 0x16u);
  }
  objc_super v12 = [(HDHealthRecordsLegacyIngestionManager *)self _credentialedSessionSuitableForRequest:v7];
  id v24 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000ACD8;
  v21[3] = &unk_100014740;
  v21[4] = self;
  id v13 = v7;
  id v22 = v13;
  id v14 = v8;
  id v23 = v14;
  v15 = +[HDFHIRResourceDownloadOperation operationWithDownloadRequest:v13 session:v12 error:&v24 downloadCompletion:v21];
  id v16 = v24;
  v17 = v16;
  if (v15)
  {
    [(NSOperationQueue *)self->_ingestionQueue addOperation:v15];
  }
  else
  {
    if (!v16)
    {
      v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2, self, @"HDHealthRecordsLegacyIngestionManager.m", 68, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    }
    _HKInitializeLogging();
    v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_10000BE54(v18, self, (uint64_t)v17);
    }
    id v19 = [objc_alloc((Class)HKFHIRResourceDownloadRequestResult) initWithError:v17];
    (*((void (**)(id, id))v14 + 2))(v14, v19);
  }
}

- (id)_credentialedSessionSuitableForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 context];
  v6 = [v5 accountInformation];
  id v7 = [v6 accountIdentifier];

  id v8 = [(NSMutableDictionary *)self->_credentialedSessionByAccountIdentifier objectForKeyedSubscript:v7];
  if (!v8)
  {
    v9 = [HDFHIRSpecification alloc];
    v10 = [v4 context];
    v11 = [v10 accountInformation];
    objc_super v12 = [(HDFHIRSpecification *)v9 initWithConnectionInformation:v11];

    id v13 = [v4 context];
    id v14 = [v13 accountInformation];
    v15 = [v14 authorization];

    id v16 = [[HDFHIRCredentialVendor alloc] initWithCredential:v15];
    [(HDFHIRCredentialVendor *)v16 setCredentialResultDidUpdateHandler:&stru_100014780];
    id v8 = [[HDFHIRCredentialedSession alloc] initWithSpecification:v12 credentialVendor:v16];
    [(NSMutableDictionary *)self->_credentialedSessionByAccountIdentifier setObject:v8 forKeyedSubscript:v7];
  }

  return v8;
}

- (id)logPrefix
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialedSessionByAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_ingestionQueue, 0);
}

@end