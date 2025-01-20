@interface _LTTextSession
+ (OS_dispatch_queue)synchronizationQueue;
- (BOOL)allowOnlineTranslation;
- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (_LTPreflightChecker)preflightChecker;
- (_LTPreflightLocaleResolving)localeResolver;
- (_LTTextSession)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (_LTTextSessionDelegate)delegate;
- (_LTTextSessionLocaleProviding)localeProvider;
- (_LTTextSessionTranslating)textTranslator;
- (void)_beginBatchRequest:(id)a3;
- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)_checkDownloadStatusForConfiguration:(id)a3 completion:(id)a4;
- (void)_didFinishMultiParagraphRequestWithUUID:(id)a3;
- (void)_invocationCancelledSELFLogging;
- (void)_invocationStartedSELFLogging:(id)a3;
- (void)_prepareRequest:(id)a3;
- (void)_supportedLocalePairsWithCompletionHandler:(id)a3;
- (void)_translateRequest:(id)a3 perItemHandler:(id)a4;
- (void)cancel;
- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6;
- (void)prepareDownloadsWithCompletion:(id)a3;
- (void)setAllowOnlineTranslation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleProvider:(id)a3;
- (void)setLocaleResolver:(id)a3;
- (void)setTextTranslator:(id)a3;
- (void)translateBatch:(id)a3 itemHandler:(id)a4 completionHandler:(id)a5;
- (void)translateRequest:(id)a3 forSession:(id)a4 perItemHandler:(id)a5;
- (void)translateString:(id)a3 completionHandler:(id)a4;
@end

@implementation _LTTextSession

+ (OS_dispatch_queue)synchronizationQueue
{
  if (synchronizationQueue_onceToken != -1) {
    dispatch_once(&synchronizationQueue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)synchronizationQueue_synchronizationQueue;

  return (OS_dispatch_queue *)v2;
}

- (_LTTextSession)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_LTTextSession;
  v9 = [(_LTTextSession *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    inProgressMultiParagraphRequestByUUID = v10->_inProgressMultiParagraphRequestByUUID;
    v10->_inProgressMultiParagraphRequestByUUID = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(_LTTranslator);
    translator = v10->_translator;
    v10->_translator = v13;

    uint64_t v15 = [(_LTTranslator *)v10->_translator startTranslationSession];
    translationSession = v10->_translationSession;
    v10->_translationSession = (_LTTranslationSession *)v15;

    v17 = objc_alloc_init(_LTPreflightChecker);
    preflightChecker = v10->_preflightChecker;
    v10->_preflightChecker = v17;

    [(_LTPreflightChecker *)v10->_preflightChecker setDelegate:v10];
    objc_storeWeak((id *)&v10->_textTranslator, v10);
    v19 = objc_alloc_init(_LTLanguageAvailability);
    languageAvailability = v10->_languageAvailability;
    v10->_languageAvailability = v19;

    uint64_t v21 = [MEMORY[0x263EFF9C0] set];
    ongoingRequestInvocationIDs = v10->_ongoingRequestInvocationIDs;
    v10->_ongoingRequestInvocationIDs = (NSMutableSet *)v21;

    v23 = v10;
  }

  return v10;
}

- (void)translateString:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v6 length];
    _os_log_impl(&dword_24639B000, v9, OS_LOG_TYPE_DEFAULT, "Client asked to translate single string: of length %zu", buf, 0xCu);
  }
  v10 = [[_LTTextInput alloc] initWithSourceText:v6 clientIdentifier:0];
  uint64_t v15 = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52___LTTextSession_translateString_completionHandler___block_invoke;
  v13[3] = &unk_2651DC280;
  id v14 = v7;
  id v12 = v7;
  [(_LTTextSession *)self translateBatch:v11 itemHandler:0 completionHandler:v13];
}

- (void)translateBatch:(id)a3 itemHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[_LTTextSessionRequest alloc] initWithBatch:v10 sourceLocale:self->_sourceLocale targetLocale:self->_targetLocale itemHandler:v9 completionHandler:v8];

  [(_LTTextSession *)self _prepareRequest:v11];
}

- (void)prepareDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[_LTTextSessionRequest alloc] initForDownloadRequestWithSourceLocale:self->_sourceLocale targetLocale:self->_targetLocale completionHandler:v4];

  [(_LTTextSession *)self _prepareRequest:v5];
}

- (void)cancel
{
  objc_initWeak(&location, self);
  v2 = [(id)objc_opt_class() synchronizationQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __24___LTTextSession_cancel__block_invoke;
  v3[3] = &unk_2651DBA48;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setAllowOnlineTranslation:(BOOL)a3
{
}

- (BOOL)allowOnlineTranslation
{
  return [(_LTLanguageAvailability *)self->_languageAvailability allowOnlineTranslation];
}

- (void)setLocaleProvider:(id)a3
{
}

- (_LTTextSessionLocaleProviding)localeProvider
{
  return [(_LTLanguageAvailability *)self->_languageAvailability localeProvider];
}

- (void)_prepareRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 batch];
  id v6 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v5 count];
    _os_log_impl(&dword_24639B000, v7, OS_LOG_TYPE_DEFAULT, "Client asked to translate batch of %zu inputs", buf, 0xCu);
  }
  id v8 = [(id)objc_opt_class() synchronizationQueue];
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34___LTTextSession__prepareRequest___block_invoke;
  v11[3] = &unk_2651DC2C8;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v4;
  id v13 = v8;
  id v14 = self;
  id v9 = v8;
  id v10 = v4;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_beginBatchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() synchronizationQueue];
  id v6 = dispatch_group_create();
  id v7 = [v4 batch];
  id v8 = (char *)[v7 count];

  if (v8)
  {
    id v9 = v8;
    do
    {
      dispatch_group_enter(v6);
      --v9;
    }
    while (v9);
  }
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37___LTTextSession__beginBatchRequest___block_invoke;
  v17[3] = &unk_2651DC340;
  objc_copyWeak(&v21, &location);
  id v10 = v5;
  uint64_t v18 = v10;
  id v11 = v4;
  id v19 = v11;
  id v12 = v6;
  v20 = v12;
  [(_LTTextSession *)self _translateRequest:v11 perItemHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37___LTTextSession__beginBatchRequest___block_invoke_21;
  v14[3] = &unk_2651DC250;
  objc_copyWeak(v16, &location);
  v16[1] = v8;
  id v15 = v11;
  id v13 = v11;
  dispatch_group_notify(v12, v10, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)translateRequest:(id)a3 forSession:(id)a4 perItemHandler:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v31 = a4;
  id v9 = a5;
  id v10 = [_LTLocalePair alloc];
  id v11 = [v8 resolvedSourceLocale];
  id v12 = [v8 resolvedTargetLocale];
  id v13 = [(_LTLocalePair *)v10 initWithSourceLocale:v11 targetLocale:v12];

  id v14 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  id v15 = [v8 batch];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke;
  v37[3] = &unk_2651DC390;
  v32 = &v41;
  objc_copyWeak(&v41, &location);
  v16 = v13;
  v38 = v16;
  id v17 = v9;
  id v40 = v17;
  id v18 = v14;
  id v39 = v18;
  [v15 enumerateObjectsUsingBlock:v37];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v23, "setSourceOrigin:", 3, v31, v32, (void)v33);
        v24 = [v8 logIdentifier];
        [v23 setLogIdentifier:v24];

        objc_msgSend(v23, "setForcedOfflineTranslation:", -[_LTTextSession allowOnlineTranslation](self, "allowOnlineTranslation") ^ 1);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v20);
  }

  objc_super v25 = [v8 batch];
  uint64_t v26 = [v25 count];

  if ([v19 count])
  {
    v27 = +[_LTTranslator interruptionController];
    [v27 addObserver:v8];

    v28 = (id)_LTOSLogTextAPI();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[_LTTextSession translateRequest:forSession:perItemHandler:](buf, [v19 count], v26, v28);
    }

    v29 = [v8 logIdentifier];
    [(_LTTranslationSession *)self->_translationSession setLogIdentifier:v29];

    [(_LTTranslationSession *)self->_translationSession translate:v19 useDedicatedTextMachPort:1];
  }
  else
  {
    v30 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v44 = v26;
      _os_log_impl(&dword_24639B000, v30, OS_LOG_TYPE_INFO, "Didn't create any paragraph requests from %zu inputs, all inputs were likely whitespace only", buf, 0xCu);
    }
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(id)objc_opt_class() synchronizationQueue];
  objc_initWeak(&location, self);
  id v14 = (void *)[v11 copy];
  id v15 = v14;
  if (a4)
  {
    if (a4 != 2) {
      goto LABEL_4;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    id v17 = [v14 effectiveSourceLocale];
    id v18 = [v15 effectiveTargetLocale];
    id v19 = objc_msgSend(v16, "lt_unsupportedPairingErrorWithSource:target:", v17, v18);

    if (!v19) {
      goto LABEL_4;
    }
LABEL_6:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke;
    block[3] = &unk_2651DC0C8;
    objc_copyWeak(&v30, &location);
    id v27 = v19;
    id v28 = v15;
    id v29 = v12;
    id v20 = v19;
    dispatch_async(v13, block);

    objc_destroyWeak(&v30);
    goto LABEL_7;
  }
  id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:20 userInfo:0];
  if (v19) {
    goto LABEL_6;
  }
LABEL_4:
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_29;
  v21[3] = &unk_2651DC3E0;
  objc_copyWeak(&v25, &location);
  v22 = v13;
  id v24 = v12;
  id v23 = v15;
  [(_LTTextSession *)self _checkDownloadStatusForConfiguration:v23 completion:v21];

  objc_destroyWeak(&v25);
LABEL_7:

  objc_destroyWeak(&location);
}

- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3
{
  return 1;
}

- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = [(id)objc_opt_class() synchronizationQueue];
  dispatch_assert_queue_V2(v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained needsUserInterventionForTextSession:self configuration:v9 completion:v10];
  }
  else
  {
    id v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LTTextSession _callDelegateOrGiveError:forConfiguration:completion:]((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);
    }
    v10[2](v10, 0, v8);
  }
}

- (void)_checkDownloadStatusForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(id)objc_opt_class() synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke;
  block[3] = &unk_2651DC0C8;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() synchronizationQueue];
  languageAvailability = self->_languageAvailability;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke;
  v9[3] = &unk_2651DC480;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(_LTLanguageAvailability *)languageAvailability supportedLocalePairsWithCompletion:v9];
}

- (void)_translateRequest:(id)a3 perItemHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() synchronizationQueue];
  if ([v6 isForDownloadRequest])
  {
    id v9 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24639B000, v9, OS_LOG_TYPE_INFO, "Finished preflight checks for download-only request and everything was installed already", buf, 2u);
    }
  }
  else
  {
    id v10 = [(_LTTextSession *)self textTranslator];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51___LTTextSession__translateRequest_perItemHandler___block_invoke;
    v11[3] = &unk_2651DC4D0;
    id v12 = v8;
    id v13 = v7;
    [v10 translateRequest:v6 forSession:self perItemHandler:v11];
  }
}

- (void)_didFinishMultiParagraphRequestWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(id)objc_opt_class() synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___LTTextSession__didFinishMultiParagraphRequestWithUUID___block_invoke;
  block[3] = &unk_2651DBA20;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setLocaleResolver:(id)a3
{
  id v4 = a3;
  id v5 = [(_LTTextSession *)self preflightChecker];
  [v5 setLocaleResolver:v4];
}

- (_LTPreflightLocaleResolving)localeResolver
{
  v2 = [(_LTTextSession *)self preflightChecker];
  v3 = [v2 localeResolver];

  return (_LTPreflightLocaleResolving *)v3;
}

- (void)_invocationStartedSELFLogging:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() synchronizationQueue];
  dispatch_assert_queue_V2(v4);

  if (([v3 isForDownloadRequest] & 1) == 0)
  {
    id v5 = [v3 resolvedSourceLocale];
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:&stru_26FAADE68];
    }
    id v8 = v7;

    id v9 = [v3 resolvedTargetLocale];
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:&stru_26FAADE68];
    }
    id v12 = v11;

    id v39 = v8;
    id v13 = [[_LTLocalePair alloc] initWithSourceLocale:v8 targetLocale:v12];
    id v14 = [_LTSELFLoggingEventData alloc];
    id v15 = [v3 logIdentifier];
    id v16 = [(_LTSELFLoggingEventData *)v14 initWithType:1 invocationId:v15];

    uint64_t v17 = [_LTSELFLoggingTranslateAppContext alloc];
    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    LOBYTE(v38) = 0;
    LOBYTE(v37) = 0;
    uint64_t v19 = [(_LTSELFLoggingTranslateAppContext *)v17 initWithDisplayMode:0 localePair:v13 isGenderAlternativeEnabled:0 tabName:0 tabSessionId:v18 conversationTabView:0 isPlayTranslationsEnabled:v37 autoTranslateSessionId:0 audioChannel:0 languageIdentificationEnabled:v38];

    id v20 = [[_LTSELFLoggingInvocationOptions alloc] initWithTask:0 inputMode:1 invocationType:10 translateAppContext:v19];
    [(_LTSELFLoggingEventData *)v16 setStartInvocationOptions:v20];
    uint64_t v21 = [_LTSELFLoggingEventData alloc];
    v22 = [v3 logIdentifier];
    id v23 = [(_LTSELFLoggingEventData *)v21 initWithType:10 invocationId:v22];

    id v24 = [[_LTSELFLoggingInvocationOptions alloc] initWithTask:0 inputMode:1 invocationType:10 translateAppContext:0];
    [(_LTSELFLoggingEventData *)v23 setStartInvocationOptions:v24];
    id v25 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v26 = [v25 objectForInfoDictionaryKey:@"CFBundleIdentifier"];

    if (v26)
    {
      id v27 = _LTOSLogXPC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v41 = v26;
        _os_log_impl(&dword_24639B000, v27, OS_LOG_TYPE_INFO, "Got untrusted client identifier from Info.plist: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v28 = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v26 = [v28 processName];

      id v29 = _LTOSLogXPC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_LTTextSession _invocationStartedSELFLogging:]((uint64_t)v26, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    id v36 = v26;

    [(_LTSELFLoggingEventData *)v23 setUntrustedClientIdentifier:v36];
    +[_LTTranslator selfLoggingInvocationStartedWithData:v16 invocationStartedTier1Data:v23];
  }
}

- (void)_invocationCancelledSELFLogging
{
  id v3 = [(id)objc_opt_class() synchronizationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (id)[(NSMutableSet *)self->_ongoingRequestInvocationIDs copy];
  +[_LTTranslator selfLoggingInvocationCancelledForIDs:v4];
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (_LTTextSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTTextSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_LTTextSessionTranslating)textTranslator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textTranslator);

  return (_LTTextSessionTranslating *)WeakRetained;
}

- (void)setTextTranslator:(id)a3
{
}

- (_LTPreflightChecker)preflightChecker
{
  return self->_preflightChecker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightChecker, 0);
  objc_destroyWeak((id *)&self->_textTranslator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_installedAssets, 0);
  objc_storeStrong((id *)&self->_inProgressMultiParagraphRequestByUUID, 0);
  objc_storeStrong((id *)&self->_ongoingRequestInvocationIDs, 0);
  objc_storeStrong((id *)&self->_languageAvailability, 0);
  objc_storeStrong((id *)&self->_translationSession, 0);

  objc_storeStrong((id *)&self->_translator, 0);
}

- (void)translateRequest:(uint64_t)a3 forSession:(os_log_t)log perItemHandler:.cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_24639B000, log, OS_LOG_TYPE_DEBUG, "Translating %zu paragraphs from %zu batch items", buf, 0x16u);
}

- (void)_callDelegateOrGiveError:(uint64_t)a3 forConfiguration:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24639B000, a2, a3, "_LTTextSessionDelegate doesn't implement selector for getting user intervention so can't complete validation, returning error: %@", a5, a6, a7, a8, 2u);
}

- (void)_invocationStartedSELFLogging:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end