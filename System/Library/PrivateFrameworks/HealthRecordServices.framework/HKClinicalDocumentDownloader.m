@interface HKClinicalDocumentDownloader
- (HKClinicalDocumentDownloader)init;
- (HKClinicalDocumentDownloader)initWithConnection:(id)a3;
- (id)exportedInterface;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)beginOrResumeDownloadingAttachments:(id)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5;
- (void)downloadAttachment:(id)a3 completion:(id)a4;
- (void)pingDownloaderWithCompletion:(id)a3;
- (void)triggerDownloadForAttachment:(id)a3 completion:(id)a4;
@end

@implementation HKClinicalDocumentDownloader

- (HKClinicalDocumentDownloader)init
{
  v3 = +[HKHealthRecordsDaemonConnection sharedConnection];
  v4 = [(HKClinicalDocumentDownloader *)self initWithConnection:v3];

  return v4;
}

- (HKClinicalDocumentDownloader)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalDocumentDownloader;
  v5 = [(HKClinicalDocumentDownloader *)&v9 init];
  if (v5)
  {
    v6 = [[HKHealthRecordsDaemonProxyProvider alloc] initWithConnection:v4 serviceIdentifier:@"ClinicalDocumentDownloader" exportedObject:v5];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (void)beginOrResumeDownloadingAttachments:(id)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  objc_super v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke;
  v14[3] = &unk_2645EED58;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalDocumentDownloader *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_beginOrResumeDownloadingAttachments:shouldRequestMore:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadAttachment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke;
  v12[3] = &unk_2645EED80;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentDownloader *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_downloadAttachment:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingDownloaderWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke;
  v8[3] = &unk_2645EEDA8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalDocumentDownloader *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingDownloaderWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerDownloadForAttachment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke;
  v12[3] = &unk_2645EED80;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalDocumentDownloader *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadForAttachment:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (void).cxx_destruct
{
}

@end