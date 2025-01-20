@interface HDMedicalDownloadableAttachmentStoreServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDMedicalDownloadableAttachmentStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 attachmentManager:(id)a7;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_unitTesting_remote_triggerDownloadableAttachmentDidChange:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)downloadableAttachmentDidChangeState:(id)a3;
- (void)remote_fetchAttachmentWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_insertDownloadableAttachment:(id)a3 completion:(id)a4;
- (void)remote_markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 completion:(id)a5;
- (void)remote_markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 completion:(id)a5;
- (void)remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5;
- (void)remote_pingWithCompletion:(id)a3;
- (void)remote_processAttachmentWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_removeAllAttachmentsFromMedicalRecord:(id)a3 completion:(id)a4;
- (void)remote_runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3;
- (void)remote_triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 completion:(id)a7;
- (void)remote_updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 completion:(id)a6;
- (void)remote_updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 completion:(id)a5;
@end

@implementation HDMedicalDownloadableAttachmentStoreServer

- (HDMedicalDownloadableAttachmentStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 attachmentManager:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HDMedicalDownloadableAttachmentStoreServer;
  v14 = [(HDMedicalDownloadableAttachmentStoreServer *)&v17 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attachmentManager, a7);
    [(HDMedicalDownloadableAttachmentManager *)v15->_attachmentManager addDownloadableAttachmentStateObserver:v15];
  }

  return v15;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  v16 = [v15 profile];
  objc_super v17 = [v16 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];

  v18 = [v17 downloadableAttachmentManager];
  if (v18)
  {
    id v19 = [objc_alloc((Class)a1) initWithUUID:v12 configuration:v13 client:v15 delegate:v14 attachmentManager:v18];
  }
  else
  {
    v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    v22 = [v15 profile];

    +[NSError hk_assignError:a7, 100, @"Cannot use %@ on profile without downloadable attachment manager: %@", v21, v22 code format];
    id v19 = 0;
    id v15 = (id)v21;
  }

  return v19;
}

- (void)dealloc
{
  [(HDMedicalDownloadableAttachmentManager *)self->_attachmentManager removeDownloadableAttachmentStateObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDMedicalDownloadableAttachmentStoreServer;
  [(HDMedicalDownloadableAttachmentStoreServer *)&v3 dealloc];
}

- (void)remote_updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 completion:(id)a6
{
  attachmentManager = self->_attachmentManager;
  id v14 = 0;
  v10 = (void (**)(id, uint64_t, void))a6;
  LODWORD(a4) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager updateRetryCountForAttachmentWithIdentifier:a3 retryCount:a4 nextRetryDate:a5 error:&v14];
  id v11 = v14;
  if (a4)
  {
    uint64_t v12 = 1;
    id v13 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = v11;
  }
  ((void (**)(id, uint64_t, id))v10)[2](v10, v12, v13);
}

- (void)remote_updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 completion:(id)a5
{
  attachmentManager = self->_attachmentManager;
  id v12 = 0;
  v8 = (void (**)(id, uint64_t, void))a5;
  LODWORD(a3) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager updateStatusAndClearErrorForAttachmentWithIdentifier:a3 status:a4 error:&v12];
  id v9 = v12;
  if (a3)
  {
    uint64_t v10 = 1;
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = v9;
  }
  ((void (**)(id, uint64_t, id))v8)[2](v8, v10, v11);
}

- (void)remote_updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 completion:(id)a7
{
  attachmentManager = self->_attachmentManager;
  id v16 = 0;
  id v12 = (void (**)(id, uint64_t, void))a7;
  LODWORD(a5) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager updateErrorStatusAndRetryCountForAttachmentWithIdentifier:a3 errorStatus:a4 lastError:a5 retryCount:a6 error:&v16];
  id v13 = v16;
  if (a5)
  {
    uint64_t v14 = 1;
    id v15 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = v13;
  }
  ((void (**)(id, uint64_t, id))v12)[2](v12, v14, v15);
}

- (void)remote_markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 completion:(id)a5
{
  attachmentManager = self->_attachmentManager;
  id v12 = 0;
  v8 = (void (**)(id, uint64_t, void))a5;
  LODWORD(a3) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager markDownloadCompleteForAttachmentWithIdentifier:a3 fileURL:a4 error:&v12];
  id v9 = v12;
  if (a3)
  {
    uint64_t v10 = 1;
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = v9;
  }
  ((void (**)(id, uint64_t, id))v8)[2](v8, v10, v11);
}

- (void)remote_markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 completion:(id)a5
{
  attachmentManager = self->_attachmentManager;
  id v12 = 0;
  v8 = (void (**)(id, uint64_t, void))a5;
  LODWORD(a3) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager markDataAvailableForAttachmentWithIdentifier:a3 attachmentContent:a4 error:&v12];
  id v9 = v12;
  if (a3)
  {
    uint64_t v10 = 1;
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = v9;
  }
  ((void (**)(id, uint64_t, id))v8)[2](v8, v10, v11);
}

- (void)remote_fetchAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  attachmentManager = self->_attachmentManager;
  id v12 = 0;
  id v9 = [(HDMedicalDownloadableAttachmentManager *)attachmentManager fetchAttachmentWithIdentifier:v6 error:&v12];
  id v10 = v12;
  id v11 = v10;
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    if (!v10)
    {
      id v11 = +[NSError hk_error:118, @"HKMedicalDownloadableAttachment for identifier %@ not found", v6 format];
    }
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
  }
}

- (void)remote_processAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  attachmentManager = self->_attachmentManager;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t, void))a4;
  LODWORD(attachmentManager) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager processDownloadableAttachmentWithIdentifier:a3 error:&v10];
  id v7 = v10;
  if (attachmentManager)
  {
    uint64_t v8 = 1;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = v7;
  }
  ((void (**)(id, uint64_t, id))v6)[2](v6, v8, v9);
}

- (void)remote_runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3
{
}

- (void)remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5
{
}

- (void)remote_triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 completion:(id)a4
{
  attachmentManager = self->_attachmentManager;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t, void))a4;
  LODWORD(attachmentManager) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager triggerAttachmentRetryForMedicalRecordWithIdentifier:a3 error:&v10];
  id v7 = v10;
  if (attachmentManager)
  {
    uint64_t v8 = 1;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = v7;
  }
  ((void (**)(id, uint64_t, id))v6)[2](v6, v8, v9);
}

- (void)remote_pingWithCompletion:(id)a3
{
}

- (void)remote_insertDownloadableAttachment:(id)a3 completion:(id)a4
{
  attachmentManager = self->_attachmentManager;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t, void))a4;
  LODWORD(attachmentManager) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager insertDownloadableAttachment:a3 error:&v10];
  id v7 = v10;
  if (attachmentManager)
  {
    uint64_t v8 = 1;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = v7;
  }
  ((void (**)(id, uint64_t, id))v6)[2](v6, v8, v9);
}

- (void)remote_removeAllAttachmentsFromMedicalRecord:(id)a3 completion:(id)a4
{
  attachmentManager = self->_attachmentManager;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t, void))a4;
  LODWORD(attachmentManager) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager removeAllAttachmentsFromMedicalRecord:a3 error:&v10];
  id v7 = v10;
  if (attachmentManager)
  {
    uint64_t v8 = 1;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = v7;
  }
  ((void (**)(id, uint64_t, id))v6)[2](v6, v8, v9);
}

- (void)_unitTesting_remote_triggerDownloadableAttachmentDidChange:(id)a3 completion:(id)a4
{
  attachmentManager = self->_attachmentManager;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t, void))a4;
  LODWORD(attachmentManager) = [(HDMedicalDownloadableAttachmentManager *)attachmentManager _unitTesting_triggerDownloadableAttachmentDidChange:a3 error:&v10];
  id v7 = v10;
  if (attachmentManager)
  {
    uint64_t v8 = 1;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = v7;
  }
  ((void (**)(id, uint64_t, id))v6)[2](v6, v8, v9);
}

- (id)exportedInterface
{
  return (id)_HKMedicalDownloadableAttachmentStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKMedicalDownloadableAttachmentStoreClientInterface(self, a2);
}

+ (id)taskIdentifier
{
  return +[HKClinicalDocumentStore taskIdentifier];
}

- (void)downloadableAttachmentDidChangeState:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AFB90((uint64_t)self, v5, v4);
  }
  id v6 = [(HDMedicalDownloadableAttachmentStoreServer *)self client];
  id v7 = [v6 connection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5B470;
  v9[3] = &unk_111BF8;
  v9[4] = self;
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v9];

  objc_msgSend(v8, "clientRemote_downloadableAttachmentDidChangeState:", v4);
}

- (void).cxx_destruct
{
}

@end