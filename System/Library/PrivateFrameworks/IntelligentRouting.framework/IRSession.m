@interface IRSession
+ (id)_createNSXPCConnectionWithExportedObject:(id)a3 queue:(id)a4;
+ (id)_createResumedTemporaryNSXPCConnection;
+ (void)createServiceWithParameters:(id)a3 reply:(id)a4;
+ (void)databaseExportwithReply:(id)a3;
+ (void)deleteDatabaseWithReply:(id)a3;
+ (void)deleteService:(id)a3;
+ (void)getServiceTokensWithReply:(id)a3;
- (BOOL)_isCandidateValid:(id)a3;
- (BOOL)interrupted;
- (IRConfiguration)configuration;
- (IRSession)init;
- (IRSessionDelegate)delegate;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (int)token;
- (void)_checkAndRecoverIfNeeded;
- (void)_didSpotOnLocationComplete:(id)a3;
- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3;
- (void)_didUpdateContext:(id)a3;
- (void)_manageSessionAvailableNotificationObservation:(BOOL)a3;
- (void)_notifySessionHasFailed:(int64_t)a3 desc:(id)a4;
- (void)_serverConnectionInterrupted;
- (void)_serverConnectionInvalidated;
- (void)_sessionDidFailWithError:(id)a3;
- (void)addEvent:(id)a3 forCandidate:(id)a4;
- (void)dealloc;
- (void)deleteCandidate:(id)a3;
- (void)invalidate;
- (void)requestCurrentContext;
- (void)requestCurrentContextWithBundleID:(id)a3;
- (void)runWithConfiguration:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSpotOnLocationWithParameters:(id)a3;
- (void)setToken:(int)a3;
- (void)updateCandidate:(id)a3;
- (void)updateCandidates:(id)a3;
@end

@implementation IRSession

- (void)_didUpdateContext:(id)a3
{
  id v4 = a3;
  v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_25417E000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: contexts were updated", v7, 2u);
  }
  v6 = [(IRSession *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 session:self didUpdateContext:v4];
  }
}

- (IRSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IRSessionDelegate *)WeakRetained;
}

- (void)runWithConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(IRSession *)self connection];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(IRSession *)self configuration];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(IRSession *)self configuration];
    v10 = [v9 serviceToken];
    v11 = [v4 serviceToken];
    char v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
LABEL_4:
      v13 = (void *)IRLogObject;
      if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
        [(IRSession *)v13 runWithConfiguration:v4];
      }
      [(IRSession *)self _notifySessionHasFailed:-12889 desc:@"couldn't run with configuration"];
      goto LABEL_11;
    }
  }
  else
  {
  }
  v14 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_25417E000, v14, OS_LOG_TYPE_DEFAULT, "[IRSession]: running with configuration: %@", (uint8_t *)&v18, 0xCu);
  }
  v15 = (void *)[v4 copy];
  [(IRSession *)self setConfiguration:v15];

  v16 = [(IRSession *)self connection];
  v17 = [v16 remoteObjectProxy];
  [v17 _runWithConfiguration:v4];

LABEL_11:
}

- (IRConfiguration)configuration
{
  return self->_configuration;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConfiguration:(id)a3
{
}

- (IRSession)init
{
  v20.receiver = self;
  v20.super_class = (Class)IRSession;
  v2 = [(IRSession *)&v20 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.IntelligentRouting", v3);
    [(IRSession *)v2 setQueue:v4];

    uint64_t v5 = objc_opt_class();
    v6 = [[IRXPCSessionClient alloc] initWithDelegate:v2];
    uint64_t v7 = [(IRSession *)v2 queue];
    v8 = [v5 _createNSXPCConnectionWithExportedObject:v6 queue:v7];
    [(IRSession *)v2 setConnection:v8];

    objc_initWeak(&location, v2);
    v9 = [(IRSession *)v2 connection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __17__IRSession_init__block_invoke;
    v17[3] = &unk_26539E640;
    objc_copyWeak(&v18, &location);
    [v9 setInterruptionHandler:v17];

    v10 = [(IRSession *)v2 connection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __17__IRSession_init__block_invoke_2;
    v15[3] = &unk_26539E640;
    objc_copyWeak(&v16, &location);
    [v10 setInvalidationHandler:v15];

    v11 = [(IRSession *)v2 connection];
    [v11 resume];

    IRSetupLogging();
    [(IRSession *)v2 _manageSessionAvailableNotificationObservation:1];
    char v12 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_25417E000, v12, OS_LOG_TYPE_DEFAULT, "[IRSession]: new session created", v14, 2u);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __17__IRSession_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInterrupted];
}

void __17__IRSession_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInvalidated];
}

- (void)dealloc
{
  [(IRSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IRSession;
  [(IRSession *)&v3 dealloc];
}

+ (void)createServiceWithParameters:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  IRSetupLogging();
  uint64_t v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: creating service", buf, 2u);
  }
  v8 = +[IRSession _createResumedTemporaryNSXPCConnection];
  v9 = [v8 remoteObjectProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__IRSession_createServiceWithParameters_reply___block_invoke;
  v12[3] = &unk_26539E668;
  id v13 = v8;
  id v14 = v5;
  id v10 = v8;
  id v11 = v5;
  [v9 _createServiceWithParameters:v6 reply:v12];
}

void __47__IRSession_createServiceWithParameters_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"No";
    if (!v6) {
      v8 = @"Yes";
    }
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: service created: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)deleteService:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  dispatch_queue_t v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting service", v7, 2u);
  }
  id v5 = +[IRSession _createResumedTemporaryNSXPCConnection];
  id v6 = [v5 remoteObjectProxy];
  [v6 _deleteService:v3];
}

+ (void)databaseExportwithReply:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  dispatch_queue_t v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: exporting DB", buf, 2u);
  }
  id v5 = +[IRSession _createResumedTemporaryNSXPCConnection];
  id v6 = [v5 remoteObjectProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__IRSession_databaseExportwithReply___block_invoke;
  v9[3] = &unk_26539E690;
  id v10 = v5;
  id v11 = v3;
  id v7 = v5;
  id v8 = v3;
  [v6 _databaseExportwithReply:v9];
}

void __37__IRSession_databaseExportwithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"No";
    if (!v6) {
      id v8 = @"Yes";
    }
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: DB exported: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)deleteDatabaseWithReply:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  dispatch_queue_t v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting DB", buf, 2u);
  }
  id v5 = +[IRSession _createResumedTemporaryNSXPCConnection];
  id v6 = [v5 remoteObjectProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__IRSession_deleteDatabaseWithReply___block_invoke;
  v9[3] = &unk_26539E6B8;
  id v10 = v5;
  id v11 = v3;
  id v7 = v5;
  id v8 = v3;
  [v6 _deleteDatabaseWithReply:v9];
}

void __37__IRSession_deleteDatabaseWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_queue_t v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"No";
    if (!v3) {
      id v5 = @"Yes";
    }
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: DB deleted: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)getServiceTokensWithReply:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  dispatch_queue_t v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: getting all service tokens", buf, 2u);
  }
  id v5 = +[IRSession _createResumedTemporaryNSXPCConnection];
  int v6 = [v5 remoteObjectProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__IRSession_getServiceTokensWithReply___block_invoke;
  v9[3] = &unk_26539E690;
  id v10 = v5;
  id v11 = v3;
  id v7 = v5;
  id v8 = v3;
  [v6 _getServiceTokensWithReply:v9];
}

void __39__IRSession_getServiceTokensWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"No";
    if (!v6) {
      id v8 = @"Yes";
    }
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: got tokens: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

- (void)updateCandidate:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(IRSession *)self updateCandidates:v4];
}

- (void)updateCandidates:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IRSession *)self configuration];

  if (v4 && v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (!-[IRSession _isCandidateValid:](self, "_isCandidateValid:", v11, (void)v17))
          {
            id v16 = (void *)IRLogObject;
            if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
              [(IRSession *)v11 updateCandidates:self];
            }

            goto LABEL_20;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    char v12 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_25417E000, v12, OS_LOG_TYPE_DEFAULT, "[IRSession]: updating candidates: %@", buf, 0xCu);
    }
    [(IRSession *)self _checkAndRecoverIfNeeded];
    id v13 = [(IRSession *)self connection];
    id v14 = [v13 remoteObjectProxy];
    [v14 _updateCandidates:v6];
  }
  else
  {
    v15 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
      [(IRSession *)(uint64_t)v4 updateCandidates:self];
    }
    [(IRSession *)self _notifySessionHasFailed:-12891 desc:@"Updating candidate has failed"];
  }
LABEL_20:
}

- (void)deleteCandidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IRSession *)self configuration];

  id v6 = IRLogObject;
  if (v4 && v5)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_25417E000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting candidate: %@", (uint8_t *)&v9, 0xCu);
    }
    [(IRSession *)self _checkAndRecoverIfNeeded];
    uint64_t v7 = [(IRSession *)self connection];
    uint64_t v8 = [v7 remoteObjectProxy];
    [v8 _deleteCandidate:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
      [(IRSession *)(uint64_t)v4 deleteCandidate:self];
    }
    [(IRSession *)self _notifySessionHasFailed:-12892 desc:@"Deleting candidate has failed"];
  }
}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IRSession *)self configuration];
  if (v6 && v8)
  {

    if (v7)
    {
      BOOL v9 = [(IRSession *)self _isCandidateValid:v7];
      id v10 = IRLogObject;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v20 = 138412546;
          *(void *)&v20[4] = v6;
          *(_WORD *)&v20[12] = 2112;
          *(void *)&v20[14] = v7;
          _os_log_impl(&dword_25417E000, v10, OS_LOG_TYPE_DEFAULT, "[IRSession]: adding event: %@, for candidate: %@", v20, 0x16u);
        }
        [(IRSession *)self _checkAndRecoverIfNeeded];
        uint64_t v11 = [(IRSession *)self connection];
        char v12 = [v11 remoteObjectProxy];
        [v12 _addEvent:v6 forCandidate:v7];
      }
      else if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      {
        id v14 = v10;
        v15 = [(IRSession *)self connection];
        id v16 = @"NO";
        *(_DWORD *)long long v20 = 138412802;
        *(void *)&v20[4] = v6;
        *(_WORD *)&v20[12] = 2112;
        if (!v15) {
          id v16 = @"YES";
        }
        *(void *)&v20[14] = v7;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_error_impl(&dword_25417E000, v14, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession add event error] [IRSession]: cant add event %@ for corrupted candidate %@, isSessionInvalidated: %@", v20, 0x20u);
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v13 = (void *)IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
  {
    long long v17 = v13;
    long long v18 = [(IRSession *)self connection];
    long long v19 = @"NO";
    *(_DWORD *)long long v20 = 138412802;
    *(void *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2112;
    if (!v18) {
      long long v19 = @"YES";
    }
    *(void *)&v20[14] = v7;
    __int16 v21 = 2112;
    id v22 = v19;
    _os_log_error_impl(&dword_25417E000, v17, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession add event error] [IRSession]: cant add event: %@ for candidate: %@, session was never run, isSessionInvalidated: %@", v20, 0x20u);
  }
  [(IRSession *)self _notifySessionHasFailed:-12893, @"Add event for candidate has failed", *(_OWORD *)v20 desc];
LABEL_11:
}

- (void)requestCurrentContext
{
  id v3 = a1;
  id v4 = [a2 connection];
  OUTLINED_FUNCTION_1(&dword_25417E000, v5, v6, "[ErrorId - IRSession request context error] [IRSession]: cant request current context, session was never run, isSessionInvalidated: %@", v7, v8, v9, v10, 2u);
}

- (void)requestCurrentContextWithBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(IRSession *)self configuration];

  if (!v5)
  {
    uint64_t v9 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
      -[IRSession requestCurrentContextWithBundleID:](v9, self);
    }
    uint64_t v10 = @"Requesting current context with bundleID has failed";
    goto LABEL_12;
  }
  uint64_t v6 = IRLogObject;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
      -[IRSession requestCurrentContextWithBundleID:](v6);
    }
    uint64_t v10 = @"requestCurrentContextWithBundleID has failed";
LABEL_12:
    [(IRSession *)self _notifySessionHasFailed:-12900 desc:v10];
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_25417E000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: requesting current context with bundleID: %@", (uint8_t *)&v11, 0xCu);
  }
  [(IRSession *)self _checkAndRecoverIfNeeded];
  uint64_t v7 = [(IRSession *)self connection];
  uint64_t v8 = [v7 remoteObjectProxy];
  [v8 _requestCurrentContextWithBundleID:v4];

LABEL_13:
}

- (void)setSpotOnLocationWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRSession *)self configuration];

  uint64_t v6 = IRLogObject;
  if (v4 && v5)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25417E000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: setting current location spotOnLocation", v9, 2u);
    }
    [(IRSession *)self _checkAndRecoverIfNeeded];
    uint64_t v7 = [(IRSession *)self connection];
    uint64_t v8 = [v7 remoteObjectProxy];
    [v8 _setSpotOnLocationWithParameters:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR)) {
      -[IRSession setSpotOnLocationWithParameters:](v6, self);
    }
    [(IRSession *)self _notifySessionHasFailed:-12891 desc:@"set spotOnLocation has failed"];
  }
}

- (void)invalidate
{
  id v3 = [(IRSession *)self connection];

  if (v3)
  {
    id v4 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: invalidating", v8, 2u);
    }
    uint64_t v5 = [(IRSession *)self connection];
    [v5 setInterruptionHandler:0];

    uint64_t v6 = [(IRSession *)self connection];
    [v6 setInvalidationHandler:0];

    uint64_t v7 = [(IRSession *)self connection];
    [v7 invalidate];

    [(IRSession *)self setConnection:0];
    [(IRSession *)self setConfiguration:0];
    [(IRSession *)self setInterrupted:0];
    [(IRSession *)self _manageSessionAvailableNotificationObservation:0];
  }
}

- (void)_sessionDidFailWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_25417E000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: connection the IR Daemon has failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
  [(IRSession *)self invalidate];
  uint64_t v6 = [(IRSession *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 session:self didFailWithError:v4];
  }
}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_25417E000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: bundles were updated", v7, 2u);
  }
  uint64_t v6 = [(IRSession *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 session:self didUpdateBundlesWithSignificantInteractionPattern:v4];
  }
}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25417E000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: didSpotOnLocationComplete", buf, 2u);
  }
  uint64_t v6 = [(IRSession *)self delegate];
  if (!v6)
  {
    int v7 = IRLogObject;
    if (!os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v11 = 0;
    id v8 = "[IRSession]: spotOnDelegate is nil";
    uint64_t v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v7 = IRLogObject;
    if (!os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    id v8 = "[IRSession]: spotOnDelegate does not respond to session:didSpotOnLocationComplete:";
    uint64_t v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  [v6 session:self didSpotOnLocationComplete:v4];
LABEL_11:
}

+ (id)_createNSXPCConnectionWithExportedObject:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.intelligentroutingd.xpc.media" options:4096];
  id v8 = IRMakeXPCClientInterface();
  [v7 setExportedInterface:v8];

  if (v5) {
    [v7 setExportedObject:v5];
  }
  uint64_t v9 = IRMakeXPCServerInterface();
  [v7 setRemoteObjectInterface:v9];

  if (v6) {
    [v7 _setQueue:v6];
  }

  return v7;
}

+ (id)_createResumedTemporaryNSXPCConnection
{
  v2 = [a1 _createNSXPCConnectionWithExportedObject:0 queue:0];
  [v2 resume];
  return v2;
}

- (BOOL)_isCandidateValid:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 candidateIdentifier];

    if (v5)
    {
      id v6 = [v4 nodes];
      LOBYTE(v5) = (unint64_t)[v6 count] < 0x21;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (void)_serverConnectionInvalidated
{
  id v3 = [(IRSession *)self queue];
  dispatch_assert_queue_V2(v3);

  [(IRSession *)self _notifySessionHasFailed:-12887 desc:@"This session object is invalidated. Dispose of it and create a new one instead."];
}

- (void)_serverConnectionInterrupted
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(IRSession *)self queue];
  dispatch_assert_queue_V2(v3);

  [(IRSession *)self setInterrupted:1];
  id v4 = (void *)IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(IRSession *)self configuration];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_25417E000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: interrupted with configuration: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_notifySessionHasFailed:(int64_t)a3 desc:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F08338];
  v11[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  uint64_t v9 = IRErrorWithCodeAndUserInfo(a3, (uint64_t)v8);

  [(IRSession *)self _sessionDidFailWithError:v9];
}

- (void)_checkAndRecoverIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(IRSession *)self interrupted])
  {
    id v3 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(IRSession *)self configuration];
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_25417E000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: Recovering with configuration: %@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(IRSession *)self connection];
    id v7 = [v6 remoteObjectProxy];
    id v8 = [(IRSession *)self configuration];
    [v7 _runWithConfiguration:v8];

    [(IRSession *)self setInterrupted:0];
  }
}

- (void)_manageSessionAvailableNotificationObservation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_initWeak((id *)location, self);
    id v5 = (const char *)[@"IRSessionAvailableNotification" UTF8String];
    id v6 = [(IRSession *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __60__IRSession__manageSessionAvailableNotificationObservation___block_invoke;
    handler[3] = &unk_26539E6E0;
    objc_copyWeak(&v10, (id *)location);
    notify_register_dispatch(v5, &self->_token, v6, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    notify_cancel(self->_token);
  }
  id v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"unregistered";
    if (v3) {
      id v8 = @"registered";
    }
    *(_DWORD *)id location = 138412546;
    *(void *)&location[4] = v8;
    __int16 v12 = 2112;
    uint64_t v13 = @"IRSessionAvailableNotification";
    _os_log_impl(&dword_25417E000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: %@ to %@", location, 0x16u);
  }
}

void __60__IRSession__manageSessionAvailableNotificationObservation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained queue];
    dispatch_assert_queue_V2(v3);

    id v4 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSNumber;
      id v6 = v4;
      id v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v2, "interrupted"));
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl(&dword_25417E000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: handling connection available notification, interrupted: %@", (uint8_t *)&v8, 0xCu);
    }
    [v2 _checkAndRecoverIfNeeded];
  }
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)runWithConfiguration:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = [a2 configuration];
  id v7 = [v6 serviceToken];
  int v8 = [a3 serviceToken];
  int v9 = [a2 connection];
  uint64_t v10 = @"NO";
  int v11 = 138412802;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  if (!v9) {
    uint64_t v10 = @"YES";
  }
  uint64_t v14 = v8;
  __int16 v15 = 2112;
  id v16 = v10;
  _os_log_error_impl(&dword_25417E000, v5, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession run error] [IRSession]: couldn't run with configuration. current configuration: %@, provided configuration: %@, isSessionInvalidated: %@", (uint8_t *)&v11, 0x20u);
}

- (void)updateCandidates:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 connection];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_25417E000, v6, v7, "[ErrorId - IRSession update error] [IRSession]: candidates cant be updated, session was never run: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);
}

- (void)updateCandidates:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 connection];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_25417E000, v6, v7, "[ErrorId - IRSession update error] [IRSession]: candidate cant be updated, its corrupted: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);
}

- (void)deleteCandidate:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 connection];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_25417E000, v6, v7, "[ErrorId - IRSession delete error] [IRSession]: candidate cant be deleted, session was never run: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);
}

- (void)requestCurrentContextWithBundleID:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 connection];
  OUTLINED_FUNCTION_1(&dword_25417E000, v5, v6, "[ErrorId - IRSession request context with bundleID error] [IRSession]: cant request current context, session was never run, isSessionInvalidated: %@", v7, v8, v9, v10, 2u);
}

- (void)requestCurrentContextWithBundleID:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25417E000, log, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession requestCurrentContextWithBundleID error] [IRSession]: bundleID must not be nil", v1, 2u);
}

- (void)setSpotOnLocationWithParameters:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 connection];
  OUTLINED_FUNCTION_1(&dword_25417E000, v5, v6, "[ErrorId - IRSession setSpotOnLocationWithParameters error] [IRSession]: session was never run: isSessionInvalidated: %@", v7, v8, v9, v10, 2u);
}

@end