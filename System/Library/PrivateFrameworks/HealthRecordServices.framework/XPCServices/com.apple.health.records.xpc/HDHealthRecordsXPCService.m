@interface HDHealthRecordsXPCService
- (HDHealthRecordDocumentProcessor)FHIRProcessor;
- (HDHealthRecordDocumentTypeConfiguration)healthDocumentConfiguration;
- (HDHealthRecordsXPCService)initWithHealthRecordDocumentConfiguration:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 completion:(id)a5;
- (void)remote_executeFHIRExtractionRequest:(id)a3 completion:(id)a4;
- (void)remote_executeFHIRReferenceExtractionRequest:(id)a3 completion:(id)a4;
- (void)remote_extractAttachmentContentFromFHIRResource:(id)a3 completion:(id)a4;
- (void)remote_fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4;
- (void)remote_indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4;
- (void)remote_optInDataForFHIRDocumentWithRequest:(id)a3 redactor:(id)a4 completion:(id)a5;
- (void)remote_preprocessSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_preprocessSignedClinicalDataFHIRResourceObject:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_processSignedClinicalDataContextCollection:(id)a3 completion:(id)a4;
- (void)remote_reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_rulesVersionForFHIRDocumentExtractionWithCompletion:(id)a3;
- (void)remote_supportedFHIRConfigurationWithCompletion:(id)a3;
- (void)setFHIRProcessor:(id)a3;
- (void)setHealthDocumentConfiguration:(id)a3;
@end

@implementation HDHealthRecordsXPCService

- (HDHealthRecordsXPCService)initWithHealthRecordDocumentConfiguration:(id)a3
{
  id v5 = a3;
  v6 = [(HDHealthRecordsXPCService *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthDocumentConfiguration, a3);
  }

  return v7;
}

- (void)remote_rulesVersionForFHIRDocumentExtractionWithCompletion:(id)a3
{
  v8 = (void (**)(id, void *, void))a3;
  if (!v8)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDHealthRecordsXPCService.m", 38, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v5 = [(HDHealthRecordsXPCService *)self FHIRProcessor];
  v6 = [v5 extractionRulesetVersion];
  v8[2](v8, v6, 0);
}

- (void)remote_supportedFHIRConfigurationWithCompletion:(id)a3
{
  v8 = (void (**)(id, void *, void))a3;
  if (!v8)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDHealthRecordsXPCService.m", 43, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v5 = [(HDHealthRecordsXPCService *)self FHIRProcessor];
  v6 = [v5 supportedFHIRConfiguration];
  v8[2](v8, v6, 0);
}

- (void)remote_executeFHIRReferenceExtractionRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    id v8 = v6;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

- (void)remote_compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = v7;
    id v11 = v8;
    id v12 = v9;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

- (void)remote_executeFHIRExtractionRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    id v8 = v6;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

- (void)remote_extractAttachmentContentFromFHIRResource:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    id v8 = v6;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

- (void)remote_optInDataForFHIRDocumentWithRequest:(id)a3 redactor:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = v7;
    id v11 = v8;
    id v12 = v9;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

- (void)remote_preprocessSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_preprocessSignedClinicalDataFHIRResourceObject:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_processSignedClinicalDataContextCollection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)remote_fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (HDHealthRecordDocumentProcessor)FHIRProcessor
{
  v3 = self;
  objc_sync_enter(v3);
  if (!v3->_FHIRProcessor)
  {
    healthDocumentConfiguration = v3->_healthDocumentConfiguration;
    if (healthDocumentConfiguration)
    {
      id v5 = healthDocumentConfiguration;
      id v6 = 0;
    }
    else
    {
      id v11 = 0;
      id v5 = +[HDHealthRecordDocumentTypeConfiguration configurationWithError:&v11];
      id v6 = v11;
      if (!v5)
      {
        id v10 = +[NSAssertionHandler currentHandler];
        [v10 handleFailureInMethod:a2, v3, @"HDHealthRecordsXPCService.m", 243, @"Error loading pipeline configuration: %@", v6 object file lineNumber description];

        id v5 = 0;
      }
    }
    id v7 = [objc_alloc((Class)HDHealthRecordDocumentProcessor) initWithConfiguration:v5];
    [(HDHealthRecordsXPCService *)v3 setFHIRProcessor:v7];
  }
  objc_sync_exit(v3);

  FHIRProcessor = v3->_FHIRProcessor;

  return FHIRProcessor;
}

- (id)exportedInterface
{
  return (id)_HDHealthRecordsXPCServiceInterface(self, a2);
}

- (id)remoteInterface
{
  id v2 = objc_alloc_init((Class)NSXPCInterface);

  return v2;
}

- (void)setFHIRProcessor:(id)a3
{
}

- (HDHealthRecordDocumentTypeConfiguration)healthDocumentConfiguration
{
  return self->_healthDocumentConfiguration;
}

- (void)setHealthDocumentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthDocumentConfiguration, 0);

  objc_storeStrong((id *)&self->_FHIRProcessor, 0);
}

@end