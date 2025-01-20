@interface _LTTranslationSession
- (NSURL)URL;
- (NSUUID)logIdentifier;
- (NSUUID)sessionID;
- (OS_dispatch_queue)translationQueue;
- (_LTRateLimiter)rateLimiter;
- (_LTTextTranslationService)service;
- (_LTTranslationSession)initWithTranslator:(id)a3 selfLoggingInvocationId:(id)a4;
- (_LTTranslator)translator;
- (id)initForFutureServiceWithSessionID:(id)a3 selfLoggingInvocationId:(id)a4;
- (void)_commonInitWithSuggestedSessionID:(id)a3;
- (void)_ensureServiceConnection:(id)a3 useDedicatedTextMachPort:(BOOL)a4;
- (void)cancelPendingWork;
- (void)markFirstParagraphComplete;
- (void)markPageComplete;
- (void)markProgressDone;
- (void)paragraphTranslation:(id)a3 result:(id)a4 error:(id)a5;
- (void)prepareWithService:(id)a3;
- (void)provideFeedback:(id)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setService:(id)a3;
- (void)setTranslationQueue:(id)a3;
- (void)setTranslator:(id)a3;
- (void)setURL:(id)a3;
- (void)translate:(id)a3;
- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4;
@end

@implementation _LTTranslationSession

- (_LTTranslationSession)initWithTranslator:(id)a3 selfLoggingInvocationId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTTranslationSession;
  v9 = [(_LTTranslationSession *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translator, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    [(_LTTranslationSession *)v10 _commonInitWithSuggestedSessionID:0];
    v11 = v10;
  }

  return v10;
}

- (id)initForFutureServiceWithSessionID:(id)a3 selfLoggingInvocationId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LTTranslationSession;
  id v8 = [(_LTTranslationSession *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_waitingForService = 1;
    objc_storeStrong((id *)&v8->_logIdentifier, a4);
    [(_LTTranslationSession *)v9 _commonInitWithSuggestedSessionID:v6];
    v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithSuggestedSessionID:(id)a3
{
  id v10 = a3;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.translation.text", 0);
  translationQueue = self->_translationQueue;
  self->_translationQueue = v4;

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  outstandingRequests = self->_outstandingRequests;
  self->_outstandingRequests = v6;

  if (v10)
  {
    id v8 = (NSUUID *)v10;
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
  }
  sessionID = self->_sessionID;
  self->_sessionID = v8;
}

- (void)prepareWithService:(id)a3
{
  self->_waitingForService = 0;
}

- (void)_ensureServiceConnection:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  id v6 = a3;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke;
  block[3] = &unk_2651DC7A8;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(translationQueue, block);
}

- (void)translate:(id)a3
{
}

- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke;
  v8[3] = &unk_2651DC840;
  id v7 = v6;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [(_LTTranslationSession *)self _ensureServiceConnection:v8 useDedicatedTextMachPort:v4];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)cancelPendingWork
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42___LTTranslationSession_cancelPendingWork__block_invoke;
  v3[3] = &unk_2651DC868;
  objc_copyWeak(&v4, &location);
  [(_LTTranslationSession *)self _ensureServiceConnection:v3 useDedicatedTextMachPort:1];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)provideFeedback:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41___LTTranslationSession_provideFeedback___block_invoke;
  v6[3] = &unk_2651DC890;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_LTTranslationSession *)self _ensureServiceConnection:v6 useDedicatedTextMachPort:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)markFirstParagraphComplete
{
  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51___LTTranslationSession_markFirstParagraphComplete__block_invoke;
  v4[3] = &unk_2651DBA48;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)markProgressDone
{
  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41___LTTranslationSession_markProgressDone__block_invoke;
  v4[3] = &unk_2651DBA48;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)markPageComplete
{
  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41___LTTranslationSession_markPageComplete__block_invoke;
  v4[3] = &unk_2651DBA48;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)paragraphTranslation:(id)a3 result:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_impl(&dword_24639B000, v11, OS_LOG_TYPE_INFO, "Received translation result for %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  translationQueue = self->_translationQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59___LTTranslationSession_paragraphTranslation_result_error___block_invoke;
  v16[3] = &unk_2651DC2C8;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(translationQueue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
}

- (_LTTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
}

- (_LTTextTranslationService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (_LTRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (OS_dispatch_queue)translationQueue
{
  return self->_translationQueue;
}

- (void)setTranslationQueue:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_logging, 0);

  objc_storeStrong((id *)&self->_outstandingRequests, 0);
}

@end