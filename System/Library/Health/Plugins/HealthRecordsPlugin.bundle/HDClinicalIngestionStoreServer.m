@interface HDClinicalIngestionStoreServer
+ (id)taskIdentifier;
- (HDClinicalIngestionStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)ingestionManagerUnavailableErrorWithActionDescription:(id)a3;
- (id)remoteInterface;
- (void)clinicalIngestionManager:(id)a3 willChangeIngestionState:(int64_t)a4;
- (void)connectionConfigured;
- (void)registerForIngestionStateChanges;
- (void)remote_abortIngestionWithCompletion:(id)a3;
- (void)remote_ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)remote_ingestHealthRecordsWithOptions:(unint64_t)a3 reason:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6;
- (void)remote_ingestionStateWithCompletion:(id)a3;
- (void)remote_pingWithCompletion:(id)a3;
- (void)remote_resetHealthRecordsLastExtractedRowIDWithCompletion:(id)a3;
@end

@implementation HDClinicalIngestionStoreServer

- (HDClinicalIngestionStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDClinicalIngestionStoreServer;
  v11 = [(HDClinicalIngestionStoreServer *)&v16 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = [v10 profile];
    uint64_t v13 = [v12 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];
    profileExtension = v11->_profileExtension;
    v11->_profileExtension = (HDHealthRecordsProfileExtension *)v13;
  }
  return v11;
}

- (id)ingestionManagerUnavailableErrorWithActionDescription:(id)a3
{
  id v4 = a3;
  v5 = [(HDClinicalIngestionStoreServer *)self profile];
  v6 = +[NSError hk_error:100, @"Cannot %@ on profile without ingestion manager: %@", v4, v5 format];

  return v6;
}

- (void)remote_pingWithCompletion:(id)a3
{
}

- (void)registerForIngestionStateChanges
{
  v3 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];

  if (v3)
  {
    id v5 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];
    [v5 registerIngestionStateChangeObserver:self];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ACAF8(self, v4);
    }
  }
}

- (void)clinicalIngestionManager:(id)a3 willChangeIngestionState:(int64_t)a4
{
  _HKInitializeLogging();
  v6 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = HKStringFromHKClinicalIngestionState();
    *(_DWORD *)buf = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    objc_super v16 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: ingestion manager will change ingestion state to %{public}@", buf, 0x16u);
  }
  v9 = [(HDClinicalIngestionStoreServer *)self client];
  id v10 = [v9 connection];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2B33C;
  v12[3] = &unk_111BF8;
  v12[4] = self;
  v11 = [v10 remoteObjectProxyWithErrorHandler:v12];

  objc_msgSend(v11, "clientRemote_updateIngestionState:", a4);
}

- (void)remote_ingestionStateWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  v6 = (void (**)(id, id))a3;
  id v4 = [(HDHealthRecordsProfileExtension *)profileExtension ingestionManager];
  id v5 = [v4 currentIngestionState];

  v6[2](v6, v5);
}

- (void)remote_ingestHealthRecordsWithOptions:(unint64_t)a3 reason:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];

  if (v13)
  {
    v14 = [[HDClinicalIngestionTaskContext alloc] initWithOptions:a3 reason:v10];
    __int16 v15 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_2B584;
    v17[3] = &unk_112A88;
    id v18 = v12;
    [v15 performIngestionWithContext:v14 accountIdentifiers:v11 completion:v17];
  }
  else
  {
    objc_super v16 = [(HDClinicalIngestionStoreServer *)self ingestionManagerUnavailableErrorWithActionDescription:@"trigger ingestion"];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
  }
}

- (void)remote_ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];

  if (v13)
  {
    v14 = [(HDClinicalIngestionTaskContext *)[HDClinicalIngestionTaskMutableContext alloc] initWithOptions:a5 reason:@"client request, file ingestion"];
    [(HDClinicalIngestionTaskMutableContext *)v14 setInputFileHandle:v10];
    [(HDClinicalIngestionTaskMutableContext *)v14 setOptions:14];
    if (v11)
    {
      id v20 = v11;
      __int16 v15 = +[NSArray arrayWithObjects:&v20 count:1];
    }
    else
    {
      __int16 v15 = 0;
    }
    v17 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_2B778;
    v18[3] = &unk_112A88;
    id v19 = v12;
    [v17 performIngestionWithContext:v14 accountIdentifiers:v15 completion:v18];
  }
  else
  {
    objc_super v16 = [(HDClinicalIngestionStoreServer *)self ingestionManagerUnavailableErrorWithActionDescription:@"ingest FHIR document"];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
  }
}

- (void)remote_abortIngestionWithCompletion:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  id v4 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];

  if (v4)
  {
    id v5 = [(HDHealthRecordsProfileExtension *)self->_profileExtension ingestionManager];
    [v5 cancelAllIngestionTasks];
  }
  else
  {
    id v5 = [(HDClinicalIngestionStoreServer *)self ingestionManagerUnavailableErrorWithActionDescription:@"abort ingestion"];
    v6[2](v6, v5);
  }
}

- (void)remote_resetHealthRecordsLastExtractedRowIDWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  id v5 = (void (**)(id, void, id))a3;
  v6 = [(HDHealthRecordsProfileExtension *)profileExtension accountManager];

  if (v6)
  {
    id v8 = [(HDHealthRecordsProfileExtension *)self->_profileExtension accountManager];
    [v8 resetLastExtractedRowIDWithCompletion:v5];
  }
  else
  {
    v7 = [(HDClinicalIngestionStoreServer *)self profile];
    id v8 = +[NSError hk_error:100, @"Cannot reset last extracted row ID on profile without account manager: %@", v7 format];

    v5[2](v5, 0, v8);
  }
}

+ (id)taskIdentifier
{
  return +[HKClinicalIngestionStore taskIdentifier];
}

- (id)exportedInterface
{
  return (id)_HKClinicalIngestionStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKClinicalIngestionStoreClientInterface(self, a2);
}

- (void)connectionConfigured
{
}

- (id)diagnosticDescription
{
  return +[NSString stringWithFormat:@"<%@ %p on profile extension %@>", objc_opt_class(), self, self->_profileExtension];
}

- (void).cxx_destruct
{
}

@end