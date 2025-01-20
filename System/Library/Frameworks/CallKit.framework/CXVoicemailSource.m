@interface CXVoicemailSource
- (BOOL)isConnected;
- (BOOL)isPermittedToUsePrivateAPI;
- (CXVoicemailProviderVendorProtocol)vendorProtocolDelegate;
- (CXVoicemailSource)init;
- (CXVoicemailSourceDelegate)delegate;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSURL)bundleURL;
- (OS_dispatch_queue)queue;
- (id)bundle;
- (int)processIdentifier;
- (void)actionCompleted:(id)a3 completionHandler:(id)a4;
- (void)beginWithCompletionHandler:(id)a3;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)registerWithConfiguration:(id)a3;
- (void)reportNewVoicemailsWithUpdates:(id)a3;
- (void)reportVoicemailsRemovedWithUUIDs:(id)a3;
- (void)reportVoicemailsUpdated:(id)a3;
- (void)requestTransaction:(id)a3 completionHandler:(id)a4;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CXVoicemailSource

- (CXVoicemailSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailSource;
  v2 = [(CXVoicemailSource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.voicemailsource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSString)description
{
  dispatch_queue_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXVoicemailSource *)self identifier];
  objc_super v6 = [v3 stringWithFormat:@"<%@ %p identifier=%@ isConnected=%d processIdentifier=%d isPermittedToUsePrivateAPI=%d>", v4, self, v5, -[CXVoicemailSource isConnected](self, "isConnected"), -[CXVoicemailSource processIdentifier](self, "processIdentifier"), -[CXVoicemailSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")];

  return (NSString *)v6;
}

- (CXVoicemailProviderVendorProtocol)vendorProtocolDelegate
{
  return 0;
}

- (NSString)identifier
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSURL)bundleURL
{
  return 0;
}

- (id)bundle
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 0;
}

- (void)setConnected:(BOOL)a3
{
  if (self->_connected != a3)
  {
    BOOL v3 = a3;
    self->_connected = a3;
    v5 = [(CXVoicemailSource *)self delegate];
    id v6 = v5;
    if (v3) {
      [v5 voicemailSourceConnectionStarted:self];
    }
    else {
      [v5 voicemailSourceConnectionEnded:self];
    }
  }
}

- (void)beginWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)registerWithConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[CXVoicemailSource registerWithConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", (uint8_t *)&v8, 0x16u);
  }

  if (![(CXVoicemailSource *)self isPermittedToUsePrivateAPI])
  {
    uint64_t v6 = [v4 sanitizedCopy];

    id v4 = (id)v6;
  }
  v7 = [(CXVoicemailSource *)self delegate];
  [v7 voicemailSource:self registeredWithConfiguration:v4];
}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CXVoicemailSource requestTransaction:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if ([(CXVoicemailSource *)self isPermittedToUsePrivateAPI])
  {
    v9 = [(CXVoicemailSource *)self delegate];
    [v9 voicemailSource:self requestedTransaction:v6 completion:v7];
  }
  else
  {
    __int16 v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CXVoicemailSource requestTransaction:completionHandler:]((uint64_t)self, v10);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke;
    v11[3] = &unk_1E5CAE408;
    id v12 = v7;
    __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke((uint64_t)v11);
    v9 = v12;
  }
}

void __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_requestTransactionErrorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportNewVoicemailsWithUpdates:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXVoicemailSource reportNewVoicemailsWithUpdates:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with updates: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CXVoicemailSource *)self delegate];
  [v6 voicemailSource:self reportNewVoicemailsWithUpdates:v4];
}

- (void)reportVoicemailsUpdated:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXVoicemailSource reportVoicemailsUpdated:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with updates: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CXVoicemailSource *)self delegate];
  [v6 voicemailSource:self reportVoicemailsUpdated:v4];
}

- (void)reportVoicemailsRemovedWithUUIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXVoicemailSource reportVoicemailsRemovedWithUUIDs:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with UUIDs: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CXVoicemailSource *)self delegate];
  [v6 voicemailSource:self reportVoicemailsRemovedWithUUIDs:v4];
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  int v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[CXVoicemailSource actionCompleted:completionHandler:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", (uint8_t *)&v11, 0x16u);
  }

  if (![(CXVoicemailSource *)self isPermittedToUsePrivateAPI])
  {
    uint64_t v9 = [v6 sanitizedCopy];

    id v6 = (id)v9;
  }
  id v10 = [(CXVoicemailSource *)self delegate];
  [v10 voicemailSource:self actionCompleted:v6];

  v7[2](v7, 0);
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(CXVoicemailSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CXVoicemailSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__CXVoicemailSource_commitTransaction___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    int v7 = "-[CXVoicemailSource commitTransaction:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 commitTransaction:v5];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  v5 = [(CXVoicemailSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CXVoicemailSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__CXVoicemailSource_handleActionTimeout___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    int v7 = "-[CXVoicemailSource handleActionTimeout:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 handleActionTimeout:v5];
}

- (CXVoicemailSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXVoicemailSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)requestTransaction:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Provider source is not entitled to use private API: %@", (uint8_t *)&v2, 0xCu);
}

@end