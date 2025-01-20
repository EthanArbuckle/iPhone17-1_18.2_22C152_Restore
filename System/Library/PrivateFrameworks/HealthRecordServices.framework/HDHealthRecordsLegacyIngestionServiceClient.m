@interface HDHealthRecordsLegacyIngestionServiceClient
- (HDHealthRecordsLegacyIngestionServiceClient)init;
- (HDHealthRecordsLegacyIngestionServiceClient)initWithListenerEndpoint:(id)a3;
- (id)_objectCompletionOnClientQueue:(id)a3;
- (id)_objectReturnOnClientQueue:(id)a3;
- (id)exportedInterface;
- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)dealloc;
- (void)performDownloadRequest:(id)a3 completion:(id)a4;
- (void)pingWithCompletion:(id)a3;
@end

@implementation HDHealthRecordsLegacyIngestionServiceClient

- (HDHealthRecordsLegacyIngestionServiceClient)init
{
  return [(HDHealthRecordsLegacyIngestionServiceClient *)self initWithListenerEndpoint:0];
}

- (HDHealthRecordsLegacyIngestionServiceClient)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsLegacyIngestionServiceClient;
  v5 = [(HDHealthRecordsLegacyIngestionServiceClient *)&v12 init];
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
      uint64_t v9 = [v8 initWithServiceName:@"com.apple.health.records.legacy-ingestion"];
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
  v3.super_class = (Class)HDHealthRecordsLegacyIngestionServiceClient;
  [(HDHealthRecordsLegacyIngestionServiceClient *)&v3 dealloc];
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = [(HDHealthRecordsLegacyIngestionServiceClient *)self _objectCompletionOnClientQueue:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke;
  v8[3] = &unk_2645EE7C0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HDHealthRecordsLegacyIngestionServiceClient *)self _performWithProxyHandler:v8 errorHandler:v6];
}

uint64_t __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performDownloadRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HDHealthRecordsLegacyIngestionServiceClient *)self _objectReturnOnClientQueue:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke;
  v12[3] = &unk_2645EE7E8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsLegacyIngestionServiceClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performDownloadRequest:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[HKFHIRResourceDownloadRequestResult alloc] initWithError:v3];

  (*(void (**)(uint64_t, HKFHIRResourceDownloadRequestResult *))(v2 + 16))(v2, v4);
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  id v7 = (void (**)(id, void *))a3;
  id v6 = [(_HKXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a4];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (id)_objectReturnOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke;
  v8[3] = &unk_2645EE838;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke_2;
  v7[3] = &unk_2645EE810;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_2645EE888;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_2645EE860;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
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