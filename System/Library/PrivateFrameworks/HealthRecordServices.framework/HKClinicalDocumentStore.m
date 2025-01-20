@interface HKClinicalDocumentStore
- (HKClinicalDocumentStore)initWithHealthStore:(id)a3;
- (void)_establishProxyConnection;
- (void)_establishProxyConnectionIfNoObserversArePresent;
- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_unitTesting_triggerDownloadableAttachmentDidChange:(id)a3 completion:(id)a4;
- (void)addClinicalDocumentStateChangeListener:(id)a3;
- (void)clientRemote_downloadableAttachmentDidChangeState:(id)a3;
- (void)fetchAttachmentWithIdentifier:(id)a3 completion:(id)a4;
- (void)insertDownloadableAttachment:(id)a3 completion:(id)a4;
- (void)markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 completion:(id)a5;
- (void)markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 completion:(id)a5;
- (void)notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5;
- (void)pingWithCompletion:(id)a3;
- (void)processAttachmentWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllAttachmentsFromMedicalRecord:(id)a3 completion:(id)a4;
- (void)removeClinicalDocumentStateChangeListener:(id)a3;
- (void)runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3;
- (void)triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 completion:(id)a7;
- (void)updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 completion:(id)a6;
- (void)updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 completion:(id)a5;
@end

@implementation HKClinicalDocumentStore

- (HKClinicalDocumentStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKClinicalDocumentStore;
  v5 = [(HKClinicalDocumentStore *)&v17 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKTaskServerProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    id v11 = objc_alloc(MEMORY[0x263F0A5A8]);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithName:v13 loggingCategory:*MEMORY[0x263F09908]];
    stateChangeListeners = v5->_stateChangeListeners;
    v5->_stateChangeListeners = (HKObserverSet *)v14;
  }
  return v5;
}

- (void)updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a6];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke;
  v18[3] = &unk_2645EE608;
  int64_t v22 = a4;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke_2;
  v16[3] = &unk_2645EE630;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  id v15 = v10;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateRetryCountForAttachmentWithIdentifier:retryCount:nextRetryDate:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke;
  v14[3] = &unk_2645EE658;
  id v15 = v8;
  int64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateStatusAndClearErrorForAttachmentWithIdentifier:status:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a7];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke;
  v20[3] = &unk_2645EE680;
  id v21 = v12;
  id v22 = v13;
  int64_t v24 = a4;
  int64_t v25 = a6;
  id v23 = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke_2;
  v18[3] = &unk_2645EE630;
  id v19 = v23;
  id v15 = v23;
  id v16 = v13;
  id v17 = v12;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:completion:", a1[4], a1[7], a1[5], a1[8], a1[6]);
}

uint64_t __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke;
  v16[3] = &unk_2645EE6A8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDownloadCompleteForAttachmentWithIdentifier:fileURL:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke;
  v16[3] = &unk_2645EE6A8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDataAvailableForAttachmentWithIdentifier:attachmentContent:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAttachmentWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_processAttachmentWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke;
  v8[3] = &unk_2645EE6F8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_runMedicalDownloadableAttachmentPipelineWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke;
  v16[3] = &unk_2645EE6A8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers:requestBatchSize:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAttachmentRetryForMedicalRecordWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke;
  v8[3] = &unk_2645EE6F8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addClinicalDocumentStateChangeListener:(id)a3
{
  id v4 = a3;
  [(HKClinicalDocumentStore *)self _establishProxyConnectionIfNoObserversArePresent];
  [(HKObserverSet *)self->_stateChangeListeners registerObserver:v4 queue:0];
}

- (void)removeClinicalDocumentStateChangeListener:(id)a3
{
}

- (void)insertDownloadableAttachment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertDownloadableAttachment:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllAttachmentsFromMedicalRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeAllAttachmentsFromMedicalRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_unitTesting_triggerDownloadableAttachmentDidChange:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke;
  v12[3] = &unk_2645EE6D0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_unitTesting_remote_triggerDownloadableAttachmentDidChange:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  if (![(HKObserverSet *)self->_stateChangeListeners count])
  {
    [(HKClinicalDocumentStore *)self _establishProxyConnection];
  }
}

- (void)_establishProxyConnection
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_2645EE748;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_282;
  v2[3] = &unk_2645EE770;
  v2[4] = self;
  [(HKClinicalDocumentStore *)self _fetchServerProxyWithHandler:v3 errorHandler:v2];
}

uint64_t __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2;
  v3[3] = &unk_2645EE720;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_pingWithCompletion:", v3);
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2_cold_1();
    }
  }
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_282(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_282_cold_1();
  }
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)clientRemote_downloadableAttachmentDidChangeState:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
    [(HKClinicalDocumentStore *)(uint64_t)self clientRemote_downloadableAttachmentDidChangeState:v4];
  }
  stateChangeListeners = self->_stateChangeListeners;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__HKClinicalDocumentStore_clientRemote_downloadableAttachmentDidChangeState___block_invoke;
  v8[3] = &unk_2645EE798;
  id v9 = v4;
  id v7 = v4;
  [(HKObserverSet *)stateChangeListeners notifyObservers:v8];
}

uint64_t __77__HKClinicalDocumentStore_clientRemote_downloadableAttachmentDidChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 downloadableAttachmentDidChangeState:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeListeners, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221D38000, v0, v1, "%{public}@: error executing a ping: %{public}@");
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_282_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221D38000, v0, v1, "%{public}@: error establishing proxy connection: %{public}@");
}

- (void)clientRemote_downloadableAttachmentDidChangeState:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 identifier];
  id v7 = NSStringFromAttachmentStatus([a3 status]);
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  id v11 = v6;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_debug_impl(&dword_221D38000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: downloadable attachment with identifier %{public}@ did change, status: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end