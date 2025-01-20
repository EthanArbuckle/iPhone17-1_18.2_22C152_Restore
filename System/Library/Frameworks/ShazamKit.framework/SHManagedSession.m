@interface SHManagedSession
+ (BOOL)isLiveActivityAvailable;
- (BOOL)enableLiveActivity;
- (BOOL)isMatching;
- (BOOL)isUsingCustomCatalog:(id)a3;
- (BOOL)sendNotifications;
- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4;
- (NSUUID)sharedRequestID;
- (SHCatalog)catalog;
- (SHManagedSession)init;
- (SHManagedSession)initWithCatalog:(id)a3;
- (SHManagedSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5 serviceConnection:(id)a6;
- (SHManagedSessionDelegate)delegate;
- (SHMatcherRequest)inflightRequest;
- (SHPreparableMatcher)shazamServiceConnection;
- (SHSession)session;
- (id)completionHandler;
- (void)didCalculateSpectralData:(id)a3;
- (void)ensureCallerHasRecordTCCWithCompletionHandler:(id)a3;
- (void)finishedSession:(id)a3;
- (void)matchAmbientAudioSnippet;
- (void)matchAmbientAudioSnippetUntilDeadline:(id)a3;
- (void)matchWithCallback:(id)a3;
- (void)prepareMatchWithPreparedCallback:(id)a3 withCompletionHandler:(id)a4;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5;
- (void)session:(id)a3 didProduceResponse:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableLiveActivity:(BOOL)a3;
- (void)setInflightRequest:(id)a3;
- (void)setSendNotifications:(BOOL)a3;
- (void)singleMatchWithCompletionHandler:(id)a3;
- (void)stopMatchingAmbientAudioSnippet;
@end

@implementation SHManagedSession

- (SHManagedSession)init
{
  v3 = objc_opt_new();
  v4 = [(SHManagedSession *)self initWithCatalog:v3];

  return v4;
}

- (SHManagedSession)initWithCatalog:(id)a3
{
  id v4 = a3;
  v5 = [SHShazamKitServiceConnection alloc];
  v6 = objc_opt_new();
  v7 = [(SHShazamKitServiceConnection *)v5 initWithConnectionProvider:v6];

  if ([(SHManagedSession *)self isUsingCustomCatalog:v4])
  {
    v8 = [[SHManagedSessionCustomCatalogDriver alloc] initWithServiceConnection:v7];
    v9 = [[SHManagedSessionCustomCatalogMatcher alloc] initWithCustomCatalog:v4];
    v10 = [(SHManagedSession *)self initWithCatalog:v4 matcher:v9 sessionDriver:v8 serviceConnection:v7];
  }
  else
  {
    v10 = [(SHManagedSession *)self initWithCatalog:v4 matcher:v7 sessionDriver:0 serviceConnection:v7];
  }

  return v10;
}

- (SHManagedSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5 serviceConnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SHManagedSession;
  v14 = [(SHManagedSession *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_shazamServiceConnection, a6);
    v16 = [[SHSession alloc] initWithCatalog:v10 matcher:v11 sessionDriver:v12];
    session = v15->_session;
    v15->_session = v16;

    [(SHSession *)v15->_session setDelegate:v15];
    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    sharedRequestID = v15->_sharedRequestID;
    v15->_sharedRequestID = (NSUUID *)v18;
  }
  return v15;
}

+ (BOOL)isLiveActivityAvailable
{
  return 1;
}

- (BOOL)isMatching
{
  v2 = [(SHManagedSession *)self inflightRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)matchAmbientAudioSnippet
{
  BOOL v3 = [(SHManagedSession *)self inflightRequest];

  if (v3)
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B4B000, v4, OS_LOG_TYPE_DEFAULT, "Can't start a new match attempt when there is an existing attempt already running.", buf, 2u);
    }
  }
  else
  {
    v5 = [(SHManagedSession *)self session];
    v6 = [v5 catalog];
    BOOL v7 = [(SHManagedSession *)self isUsingCustomCatalog:v6];

    if (v7)
    {
      v8 = [(SHManagedSession *)self sharedRequestID];
      uint64_t v9 = +[SHMatcherRequest requestSignatureGenerationOnceForRequestID:v8];
    }
    else
    {
      if ([(SHManagedSession *)self enableLiveActivity])
      {
        v8 = [(SHManagedSession *)self sharedRequestID];
        +[SHMatcherRequest requestOnceWithAppIntentForRequestID:v8];
      }
      else
      {
        BOOL v10 = [(SHManagedSession *)self sendNotifications];
        v8 = [(SHManagedSession *)self sharedRequestID];
        +[SHMatcherRequest requestOnceWithNotifications:v10 forRequestID:v8];
      uint64_t v9 = };
    }
    id v11 = (void *)v9;
    [(SHManagedSession *)self setInflightRequest:v9];

    id v13 = [(SHManagedSession *)self shazamServiceConnection];
    id v12 = [(SHManagedSession *)self inflightRequest];
    [v13 startRecognitionForRequest:v12];
  }
}

- (void)matchAmbientAudioSnippetUntilDeadline:(id)a3
{
  id v4 = a3;
  v5 = [(SHManagedSession *)self inflightRequest];

  if (v5)
  {
    v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_224B4B000, v6, OS_LOG_TYPE_DEFAULT, "Can't start a new match attempt when there is an existing attempt already running.", v17, 2u);
    }
  }
  else
  {
    BOOL v7 = [(SHManagedSession *)self session];
    v8 = [v7 catalog];
    BOOL v9 = [(SHManagedSession *)self isUsingCustomCatalog:v8];

    if (v9)
    {
      BOOL v10 = [(SHManagedSession *)self sharedRequestID];
      id v11 = +[SHMatcherRequest requestSignatureGenerationUntilDeadline:v4 forRequestID:v10];
      [(SHManagedSession *)self setInflightRequest:v11];
    }
    else
    {
      BOOL v12 = [(SHManagedSession *)self sendNotifications];
      id v13 = [(SHManagedSession *)self sharedRequestID];
      v14 = +[SHMatcherRequest requestToMatchUntilDeadline:v4 sendNotifications:v12 forRequestID:v13];
      [(SHManagedSession *)self setInflightRequest:v14];
    }
    v15 = [(SHManagedSession *)self shazamServiceConnection];
    v16 = [(SHManagedSession *)self inflightRequest];
    [v15 startRecognitionForRequest:v16];
  }
}

- (BOOL)isUsingCustomCatalog:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)stopMatchingAmbientAudioSnippet
{
  id v3 = [(SHManagedSession *)self shazamServiceConnection];
  id v4 = [(SHManagedSession *)self sharedRequestID];
  [v3 stopRecognitionForRequestID:v4];

  [(SHManagedSession *)self setInflightRequest:0];

  [(SHManagedSession *)self setCompletionHandler:0];
}

- (void)ensureCallerHasRecordTCCWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263EF9320];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SHManagedSession_ensureCallerHasRecordTCCWithCompletionHandler___block_invoke;
  v6[3] = &unk_2646EF990;
  id v7 = v3;
  id v5 = v3;
  [v4 requestRecordPermissionWithCompletionHandler:v6];
}

uint64_t __66__SHManagedSession_ensureCallerHasRecordTCCWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SHManagedSession_prepareWithCompletionHandler___block_invoke;
  v6[3] = &unk_2646EF9B8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SHManagedSession *)self ensureCallerHasRecordTCCWithCompletionHandler:v6];
}

void __49__SHManagedSession_prepareWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) shazamServiceConnection];
    id v3 = [*(id *)(a1 + 32) sharedRequestID];
    [v5 prepareMatcherForRequestID:v3 completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B4B000, v4, OS_LOG_TYPE_ERROR, "Prepare call ignored, the caller does not have record permission", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)singleMatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_224B4B000, v5, OS_LOG_TYPE_DEBUG, "Calling single match with completion handler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SHManagedSession_singleMatchWithCompletionHandler___block_invoke;
  v6[3] = &unk_2646EF838;
  objc_copyWeak(&v7, buf);
  [(SHManagedSession *)self prepareMatchWithPreparedCallback:v6 withCompletionHandler:v4];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __53__SHManagedSession_singleMatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained matchAmbientAudioSnippet];
}

- (void)matchWithCallback:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SHManagedSession_matchWithCallback___block_invoke;
  v5[3] = &unk_2646EF838;
  objc_copyWeak(&v6, &location);
  [(SHManagedSession *)self prepareMatchWithPreparedCallback:v5 withCompletionHandler:v4];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__SHManagedSession_matchWithCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263EFF910] distantFuture];
  [WeakRetained matchAmbientAudioSnippetUntilDeadline:v1];
}

- (void)prepareMatchWithPreparedCallback:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *, void *))a4;
  v8 = [(SHManagedSession *)self inflightRequest];

  if (v8)
  {
    BOOL v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_224B4B000, v9, OS_LOG_TYPE_DEBUG, "Cancelling this new attempt as there's an attempt already running", (uint8_t *)buf, 2u);
    }

    BOOL v10 = objc_opt_new();
    id v11 = +[SHError errorWithCode:202 underlyingError:0];
    v7[2](v7, 0, v10, v11);
  }
  else
  {
    objc_initWeak(buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__SHManagedSession_prepareMatchWithPreparedCallback_withCompletionHandler___block_invoke;
    v12[3] = &unk_2646EF9E0;
    v12[4] = self;
    id v13 = v7;
    objc_copyWeak(&v15, buf);
    id v14 = v6;
    [(SHManagedSession *)self ensureCallerHasRecordTCCWithCompletionHandler:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __75__SHManagedSession_prepareMatchWithPreparedCallback_withCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setCompletionHandler:v3];

    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
  else
  {
    id v6 = objc_opt_new();
    uint64_t v11 = *MEMORY[0x263F07F80];
    v12[0] = @"Record permission is required";
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v8 = +[SHError errorWithCode:202 underlyingError:0 keyOverrides:v7];
    (*(void (**)(uint64_t, void, void *, void *))(v3 + 16))(v3, 0, v6, v8);

    BOOL v9 = *(void **)(a1 + 32);
    BOOL v10 = [v9 session];
    [v9 finishedSession:v10];
  }
}

- (SHMatcherRequest)inflightRequest
{
  return self->_inflightRequest;
}

- (void)setInflightRequest:(id)a3
{
}

- (SHCatalog)catalog
{
  v2 = [(SHManagedSession *)self session];
  uint64_t v3 = [v2 catalog];

  return (SHCatalog *)v3;
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SHManagedSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(SHManagedSession *)self delegate];
    [v9 session:v13 didFindMatch:v6];
  }
  BOOL v10 = [(SHManagedSession *)self completionHandler];

  if (v10)
  {
    uint64_t v11 = [(SHManagedSession *)self completionHandler];
    BOOL v12 = [v6 querySignature];
    ((void (**)(void, id, void *, void))v11)[2](v11, v6, v12, 0);
  }
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(SHManagedSession *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    BOOL v12 = [(SHManagedSession *)self delegate];
    [v12 session:v15 didNotFindMatchForSignature:v8 error:v9];
  }
  id v13 = [(SHManagedSession *)self completionHandler];

  if (v13)
  {
    id v14 = [(SHManagedSession *)self completionHandler];
    ((void (**)(void, void, id, id))v14)[2](v14, 0, v8, v9);
  }
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHManagedSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    BOOL v10 = [(SHManagedSession *)self delegate];
    char v11 = [v10 session:v6 shouldAttemptToMatchSignature:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)session:(id)a3 didProduceResponse:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SHManagedSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(SHManagedSession *)self delegate];
    [v9 session:v10 didProduceResponse:v6];
  }
}

- (void)finishedSession:(id)a3
{
  id v10 = a3;
  [(SHManagedSession *)self setInflightRequest:0];
  [(SHManagedSession *)self setCompletionHandler:0];
  id v4 = [(SHManagedSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SHManagedSession *)self delegate];
    [v6 finishedSession:v10];
  }
  id v7 = [(SHManagedSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(SHManagedSession *)self delegate];
    [v9 finishedManagedSession:self];
  }
}

- (void)didCalculateSpectralData:(id)a3
{
  id v7 = a3;
  id v4 = [(SHManagedSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SHManagedSession *)self delegate];
    [v6 didCalculateSpectralData:v7];
  }
}

- (SHManagedSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHManagedSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableLiveActivity
{
  return self->_enableLiveActivity;
}

- (void)setEnableLiveActivity:(BOOL)a3
{
  self->_enableLiveActivity = a3;
}

- (NSUUID)sharedRequestID
{
  return self->_sharedRequestID;
}

- (SHSession)session
{
  return self->_session;
}

- (SHPreparableMatcher)shazamServiceConnection
{
  return self->_shazamServiceConnection;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)sendNotifications
{
  return self->_sendNotifications;
}

- (void)setSendNotifications:(BOOL)a3
{
  self->_sendNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_shazamServiceConnection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sharedRequestID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_inflightRequest, 0);
}

@end