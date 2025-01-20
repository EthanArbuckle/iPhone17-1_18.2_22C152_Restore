@interface HRTFEnrollmentAssetDownloadSession
- (HRTFEnrollmentAssetDownloadSession)initWithOptions:(AssetDownloadOptions)a3 progressCallback:(id)a4 completion:(id)a5;
- (void)assetDownloadSessionProgressUpdate:(id)a3;
- (void)cancel;
- (void)start;
@end

@implementation HRTFEnrollmentAssetDownloadSession

- (HRTFEnrollmentAssetDownloadSession)initWithOptions:(AssetDownloadOptions)a3 progressCallback:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HRTFEnrollmentAssetDownloadSession;
  v10 = [(HRTFEnrollmentAssetDownloadSession *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_options = a3;
    uint64_t v12 = MEMORY[0x230FB1110](v8);
    id progressCallback = v11->_progressCallback;
    v11->_id progressCallback = (id)v12;

    uint64_t v14 = MEMORY[0x230FB1110](v9);
    id completion = v11->_completion;
    v11->_id completion = (id)v14;
  }
  return v11;
}

- (void)start
{
  v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HRTFEnrollmentAssetDownloadSession_start__block_invoke;
  block[3] = &unk_2649FC810;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__HRTFEnrollmentAssetDownloadSession_start__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  if (connection)
  {
    v3 = [(NSXPCConnection *)connection remoteObjectProxy];
    [v3 cancelAssetDownloadSession];
  }
  objc_sync_exit(obj);
}

- (void)assetDownloadSessionProgressUpdate:(id)a3
{
  id progressCallback = (void (**)(id, id))self->_progressCallback;
  if (progressCallback) {
    progressCallback[2](progressCallback, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressCallback, 0);
}

@end