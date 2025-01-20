@interface FeedbackLoggerFBFClient
- (FeedbackLoggerDaemonXPC)fbf;
- (FeedbackLoggerFBFClient)init;
- (NSDistributedNotificationCenter)notificationCenter;
- (NSXPCConnection)daemonConnection;
- (OS_os_log)log;
- (void)requestSandboxExtensionForBundleID:(id)a3 completion:(id)a4;
- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4;
- (void)setDaemonConnection:(id)a3;
- (void)setFbf:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation FeedbackLoggerFBFClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setFbf:(id)a3
{
}

- (FeedbackLoggerDaemonXPC)fbf
{
  return self->_fbf;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void)requestSandboxExtensionForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FeedbackLoggerFBFClient *)self fbf];
  [v8 requestSandboxExtensionForBundleID:v7 completion:v6];
}

- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FeedbackLoggerFBFClient *)self notificationCenter];
  [v8 postNotificationName:@"FLCloseAllStores" object:0];

  v9 = [(FeedbackLoggerFBFClient *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_INFO, "Waiting 2s for sqlite connections to close.", buf, 2u);
  }

  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__FeedbackLoggerFBFClient_scheduleImmediateUploadWithHeaders_completion___block_invoke;
  block[3] = &unk_1E6208A28;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_after(v10, v11, block);
}

void __73__FeedbackLoggerFBFClient_scheduleImmediateUploadWithHeaders_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BA2B8000, v2, OS_LOG_TYPE_INFO, "Telling FBF to upload immediately.", v4, 2u);
  }

  v3 = [*(id *)(a1 + 32) fbf];
  [v3 scheduleImmediateUploadWithHeaders:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (FeedbackLoggerFBFClient)init
{
  v20.receiver = self;
  v20.super_class = (Class)FeedbackLoggerFBFClient;
  v2 = [(FeedbackLoggerFBFClient *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v4 = flLogForObject(v2);
    objc_storeStrong((id *)&v3->_log, v4);
    uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = (NSDistributedNotificationCenter *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.feedbacklogger" options:0];
    daemonConnection = v3->_daemonConnection;
    v3->_daemonConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13BF658];
    [(NSXPCConnection *)v3->_daemonConnection setRemoteObjectInterface:v9];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31__FeedbackLoggerFBFClient_init__block_invoke;
    v18[3] = &unk_1E62089D8;
    id v10 = v4;
    id v19 = v10;
    [(NSXPCConnection *)v3->_daemonConnection setInvalidationHandler:v18];
    [(NSXPCConnection *)v3->_daemonConnection setExportedObject:v3];
    [(NSXPCConnection *)v3->_daemonConnection resume];
    v11 = v3->_daemonConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__FeedbackLoggerFBFClient_init__block_invoke_50;
    v16[3] = &unk_1E6208A00;
    id v17 = v10;
    id v12 = v10;
    uint64_t v13 = [(NSXPCConnection *)v11 synchronousRemoteObjectProxyWithErrorHandler:v16];
    fbf = v3->_fbf;
    v3->_fbf = (FeedbackLoggerDaemonXPC *)v13;
  }
  return v3;
}

void __31__FeedbackLoggerFBFClient_init__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BA2B8000, v1, OS_LOG_TYPE_INFO, "XPC connection to parsec-fbf invalidated", v2, 2u);
  }
}

void __31__FeedbackLoggerFBFClient_init__block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    uint64_t v5 = [a2 localizedDescription];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, "parsec-fbf remote object proxy failed with error %@", (uint8_t *)&v6, 0xCu);
  }
}

@end