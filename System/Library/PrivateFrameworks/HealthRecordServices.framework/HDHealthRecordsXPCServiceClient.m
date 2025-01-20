@interface HDHealthRecordsXPCServiceClient
- (HDHealthRecordsXPCServiceClient)init;
- (HDHealthRecordsXPCServiceClient)initWithListenerEndpoint:(id)a3;
- (id)_actionCompletionOnClientQueue:(id)a3;
- (id)_objectCompletionOnClientQueue:(id)a3;
- (id)exportedInterface;
- (id)rulesVersionForFHIRDocumentExtractionWithError:(id *)a3;
- (id)supportedFHIRConfigurationWithError:(id *)a3;
- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)executeFHIRExtractionRequest:(id)a3 completion:(id)a4;
- (void)executeFHIRReferenceExtractionRequest:(id)a3 completion:(id)a4;
- (void)extractAttachmentContentFromFHIRResource:(id)a3 completion:(id)a4;
- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4;
- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4;
- (void)optInDataForFHIRDocumentWithRequest:(id)a3 redactor:(id)a4 completion:(id)a5;
- (void)preprocessSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)preprocessSignedClinicalDataFHIRResourceObject:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)processSignedClinicalDataContextCollection:(id)a3 completion:(id)a4;
- (void)reprocessOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation HDHealthRecordsXPCServiceClient

- (HDHealthRecordsXPCServiceClient)init
{
  return [(HDHealthRecordsXPCServiceClient *)self initWithListenerEndpoint:0];
}

- (HDHealthRecordsXPCServiceClient)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsXPCServiceClient;
  v5 = [(HDHealthRecordsXPCServiceClient *)&v12 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc(MEMORY[0x263F0AA40]);
    if (v4) {
      uint64_t v9 = [v8 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v9 = [v8 initWithServiceName:@"com.apple.health.records"];
    }
    connection = v5->_connection;
    v5->_connection = (_HKXPCConnection *)v9;

    [(_HKXPCConnection *)v5->_connection setExportedObject:v5];
    [(_HKXPCConnection *)v5->_connection resume];
  }

  return v5;
}

- (void)dealloc
{
  [(_HKXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHealthRecordsXPCServiceClient;
  [(HDHealthRecordsXPCServiceClient *)&v3 dealloc];
}

- (id)rulesVersionForFHIRDocumentExtractionWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke;
  v10[3] = &unk_2645EF4E0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_3;
  v9[3] = &unk_2645EE518;
  v9[4] = &v11;
  [(HDHealthRecordsXPCServiceClient *)self _synchronousPerformWithProxyHandler:v10 errorHandler:v9];
  id v4 = (void *)v18[5];
  if (!v4)
  {
    id v5 = (id)v12[5];
    uint64_t v6 = v5;
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v4 = (void *)v18[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_2;
  v3[3] = &unk_2645EF4B8;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_rulesVersionForFHIRDocumentExtractionWithCompletion:", v3);
}

void __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)supportedFHIRConfigurationWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke;
  v10[3] = &unk_2645EF4E0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_3;
  v9[3] = &unk_2645EE518;
  v9[4] = &v11;
  [(HDHealthRecordsXPCServiceClient *)self _synchronousPerformWithProxyHandler:v10 errorHandler:v9];
  long long v4 = (void *)v18[5];
  if (!v4)
  {
    id v5 = (id)v12[5];
    id v6 = v5;
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }

    long long v4 = (void *)v18[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_2;
  v3[3] = &unk_2645EF508;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_supportedFHIRConfigurationWithCompletion:", v3);
}

void __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)executeFHIRReferenceExtractionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_executeFHIRReferenceExtractionRequest:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeFHIRExtractionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_executeFHIRExtractionRequest:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke;
  v16[3] = &unk_2645EF558;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v16 errorHandler:v14];
}

uint64_t __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_compareExistingPatientResourceData:incomingPatientResourceData:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)extractAttachmentContentFromFHIRResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_extractAttachmentContentFromFHIRResource:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)optInDataForFHIRDocumentWithRequest:(id)a3 redactor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke;
  v16[3] = &unk_2645EF558;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v16 errorHandler:v14];
}

uint64_t __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_optInDataForFHIRDocumentWithRequest:redactor:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preprocessSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke;
  v14[3] = &unk_2645EF580;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v14 errorHandler:v12];
}

uint64_t __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_preprocessSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preprocessSignedClinicalDataFHIRResourceObject:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke;
  v14[3] = &unk_2645EF580;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v14 errorHandler:v12];
}

uint64_t __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_preprocessSignedClinicalDataFHIRResourceObject:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reprocessOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v14[3] = &unk_2645EF580;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v14 errorHandler:v12];
}

uint64_t __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reprocessOriginalRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v14[3] = &unk_2645EF580;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v14 errorHandler:v12];
}

uint64_t __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_processOriginalSignedClinicalDataRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processSignedClinicalDataContextCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_processSignedClinicalDataContextCollection:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_indexClinicalDocumentsWithRequest:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthRecordsXPCServiceClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke;
  v12[3] = &unk_2645EF530;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsXPCServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSpotlightSearchResultsForQueryString:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, void *))a3;
  id v6 = [(_HKXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a4];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, void *))a3;
  id v6 = [(_HKXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:a4];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_2645EE888;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_2645EE860;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_2645EF5D0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_2645EF5A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end