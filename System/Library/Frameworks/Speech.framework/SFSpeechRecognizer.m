@interface SFSpeechRecognizer
+ (NSSet)supportedLocales;
+ (SFSpeechRecognizerAuthorizationStatus)authorizationStatus;
+ (void)_fetchSupportedForcedOfflineLocalesWithCompletion:(id)a3;
+ (void)initialize;
+ (void)requestAuthorization:(void *)handler;
- (BOOL)_isAvailableForForcedOfflineRecognition;
- (BOOL)isAvailable;
- (NSLocale)locale;
- (NSOperationQueue)queue;
- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request delegate:(id)delegate;
- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request resultHandler:(void *)resultHandler;
- (SFSpeechRecognitionTaskHint)defaultTaskHint;
- (SFSpeechRecognizer)init;
- (SFSpeechRecognizer)initWithLocale:(NSLocale *)locale;
- (id)delegate;
- (uint64_t)_informDelegateOfAvailabilityChange;
- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 completion:(id)a4;
- (void)_requestOfflineDictationSupportForClientIdentifier:(id)a3 completion:(id)a4;
- (void)_requestOfflineDictationSupportWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDefaultTaskHint:(SFSpeechRecognitionTaskHint)defaultTaskHint;
- (void)setDelegate:(id)delegate;
- (void)setQueue:(NSOperationQueue *)queue;
- (void)setSupportsOnDeviceRecognition:(BOOL)supportsOnDeviceRecognition;
@end

@implementation SFSpeechRecognizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferencesObserver, 0);
  objc_storeStrong((id *)&self->_foregroundObserver, 0);
  objc_storeStrong((id *)&self->_facetimeObserver, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setDefaultTaskHint:(SFSpeechRecognitionTaskHint)defaultTaskHint
{
  self->_defaultTaskHint = defaultTaskHint;
}

- (SFSpeechRecognitionTaskHint)defaultTaskHint
{
  return self->_defaultTaskHint;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setSupportsOnDeviceRecognition:(BOOL)supportsOnDeviceRecognition
{
  self->_supportsOnDeviceRecognition = supportsOnDeviceRecognition;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (uint64_t)_informDelegateOfAvailabilityChange
{
  if (result)
  {
    v1 = *(void **)(result + 88);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __57__SFSpeechRecognizer__informDelegateOfAvailabilityChange__block_invoke;
    v2[3] = &unk_1E61557A0;
    v2[4] = result;
    return [v1 addOperationWithBlock:v2];
  }
  return result;
}

void __57__SFSpeechRecognizer__informDelegateOfAvailabilityChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "speechRecognizer:availabilityDidChange:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAvailable"));
  }
}

- (void)setQueue:(NSOperationQueue *)queue
{
  v4 = queue;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ queue must not be nil", objc_opt_class() format];
  }
  v5 = self->_queue;
  self->_queue = v4;
}

- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request delegate:(id)delegate
{
  id v6 = delegate;
  v7 = request;
  id v8 = [[_SFSpeechRecognitionDelegateTask alloc] _initWithRequest:v7 queue:self->_queue languageCode:self->_languageCode taskHint:self->_defaultTaskHint delegate:v6];

  return (SFSpeechRecognitionTask *)v8;
}

- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request resultHandler:(void *)resultHandler
{
  id v6 = request;
  v7 = resultHandler;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Result handler must be non-null"];
  }
  id v8 = [[_SFSpeechRecognitionBlockTask alloc] _initWithRequest:v6 queue:self->_queue languageCode:self->_languageCode taskHint:self->_defaultTaskHint resultHandler:v7];

  return (SFSpeechRecognitionTask *)v8;
}

- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[SFUtilities defaultClientID];
  [(SFSpeechRecognizer *)self _prepareToRecognizeWithTaskHint:a3 clientIdentifier:v7 completion:v6];
}

- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__SFSpeechRecognizer__prepareToRecognizeWithTaskHint_clientIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6154E48;
  id v15 = v9;
  int64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(NSOperationQueue *)queue addOperationWithBlock:v13];
}

void __82__SFSpeechRecognizer__prepareToRecognizeWithTaskHint_clientIdentifier_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    +[SFUtilities taskNameFromTaskHint:](SFUtilities, "taskNameFromTaskHint:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 && [*(id *)(a1 + 32) supportsOnDeviceRecognition])
    {
      v2 = objc_opt_new();
      [v2 preloadRecognizerForLanguage:*(void *)(*(void *)(a1 + 32) + 16) task:v4 clientID:*(void *)(a1 + 40) recognitionOverrides:0 modelOverrideURL:0 completion:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

- (void)_requestOfflineDictationSupportWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SFUtilities defaultClientID];
  [(SFSpeechRecognizer *)self _requestOfflineDictationSupportForClientIdentifier:v5 completion:v4];
}

- (void)_requestOfflineDictationSupportForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    id v8 = [[SFEntitledAssetConfig alloc] initWithLanguage:self->_languageCode taskHint:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__SFSpeechRecognizer__requestOfflineDictationSupportForClientIdentifier_completion___block_invoke;
    v9[3] = &unk_1E6154DD0;
    id v10 = v7;
    +[SFSpeechAssetManager fetchAssetWithConfig:v8 clientIdentifier:v6 progress:0 completion:v9];
  }
  else
  {
    [(AFDictationConnection *)self->_dictationConnection requestOfflineDictationSupportForLanguage:self->_languageCode completion:v7];
  }
}

uint64_t __84__SFSpeechRecognizer__requestOfflineDictationSupportForClientIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (BOOL)_isAvailableForForcedOfflineRecognition
{
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    languageCode = v3;
    if (!v3) {
      languageCode = self->_languageCode;
    }
    id v5 = languageCode;

    id v6 = [[SFEntitledAssetConfig alloc] initWithLanguage:v5 taskHint:1];
    id v7 = +[SFUtilities defaultClientID];
    id v8 = +[SFSpeechAssetManager pathToAssetWithConfig:v6 clientIdentifier:v7];

    if (!v8)
    {
      uint64_t v9 = [(SFEntitledAssetConfig *)v6 assetType];
      if ((unint64_t)(v9 - 1) > 6) {
        id v10 = @"Unknown";
      }
      else {
        id v10 = off_1E6154988[v9 - 1];
      }
      id v14 = v10;
      id v15 = [(SFEntitledAssetConfig *)v6 language];
      NSLog(&cfstr_NoAssetForLang.isa, v14, v15);
    }
    return v8 != 0;
  }
  else
  {
    dictationConnection = self->_dictationConnection;
    id v12 = self->_languageCode;
    return [(AFDictationConnection *)dictationConnection forcedOfflineDictationIsAvailableForLanguage:v12];
  }
}

- (BOOL)isAvailable
{
  return [(AFDictationConnection *)self->_dictationConnection dictationIsAvailableForLanguage:self->_languageCode synchronous:1];
}

- (void)dealloc
{
  [(AFDictationConnection *)self->_dictationConnection endSession];
  [(AFDictationConnection *)self->_dictationConnection cancelAvailabilityMonitoring];
  if (self->_facetimeObserver)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_facetimeObserver];
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_foregroundObserver];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self->_preferencesObserver];

  +[SFLocalSpeechRecognitionClient cleanupCacheWithCompletion:&__block_literal_global_17];
  v6.receiver = self;
  v6.super_class = (Class)SFSpeechRecognizer;
  [(SFSpeechRecognizer *)&v6 dealloc];
}

- (SFSpeechRecognizer)initWithLocale:(NSLocale *)locale
{
  id v4 = locale;
  id v5 = [(NSLocale *)v4 localeIdentifier];
  objc_super v6 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v5];

  if (!v6 || ([(id)sSupportedLocaleIdentifiers_875 containsObject:v6] & 1) == 0)
  {
    AFDictationLanguageForKeyboardLanguage();
    id v7 = (SFSpeechRecognizer *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      NSLog(&cfstr_CannotMakeReco.isa, v6, sSupportedLocaleIdentifiers_875);
      goto LABEL_9;
    }
    uint64_t v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];

    id v4 = (NSLocale *)v8;
  }
  v35.receiver = self;
  v35.super_class = (Class)SFSpeechRecognizer;
  uint64_t v9 = [(SFSpeechRecognizer *)&v35 init];
  if (v9)
  {
    uint64_t v10 = [(NSLocale *)v4 copy];
    id v11 = v9->_locale;
    v9->_locale = (NSLocale *)v10;

    id v12 = NSString;
    v13 = [(NSLocale *)v4 objectForKey:*MEMORY[0x1E4F1C438]];
    id v14 = [(NSLocale *)v4 objectForKey:*MEMORY[0x1E4F1C400]];
    uint64_t v15 = [v12 stringWithFormat:@"%@-%@", v13, v14];
    languageCode = v9->_languageCode;
    v9->_languageCode = (NSString *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28F08] mainQueue];
    queue = v9->_queue;
    v9->_queue = (NSOperationQueue *)v17;

    v19 = (AFDictationConnection *)objc_alloc_init(MEMORY[0x1E4F4E450]);
    dictationConnection = v9->_dictationConnection;
    v9->_dictationConnection = v19;

    [(AFDictationConnection *)v9->_dictationConnection setDelegate:v9];
    [(AFDictationConnection *)v9->_dictationConnection beginAvailabilityMonitoring];
    objc_initWeak(&location, v9);
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v22 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v23 = *MEMORY[0x1E4F4E328];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __37__SFSpeechRecognizer_initWithLocale___block_invoke;
    v32[3] = &unk_1E6154DA8;
    objc_copyWeak(&v33, &location);
    uint64_t v24 = [v21 addObserverForName:v23 object:0 queue:v22 usingBlock:v32];
    preferencesObserver = v9->_preferencesObserver;
    v9->_preferencesObserver = v24;

    v26 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F19198]);
    callObserver = v9->_callObserver;
    v9->_callObserver = v26;

    v28 = v9->_callObserver;
    uint64_t v29 = MEMORY[0x1E4F14428];
    id v30 = MEMORY[0x1E4F14428];
    [(CXCallObserver *)v28 setDelegate:v9 queue:v29];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  self = v9;
  id v7 = self;
LABEL_9:

  return v7;
}

uint64_t __37__SFSpeechRecognizer_initWithLocale___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[11];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__SFSpeechRecognizer__informDelegateOfPreferencesChange__block_invoke;
    v5[3] = &unk_1E61557A0;
    v5[4] = v2;
    [v3 addOperationWithBlock:v5];
  }

  return MEMORY[0x1F41817F8]();
}

void __56__SFSpeechRecognizer__informDelegateOfPreferencesChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "speechRecognizer:availabilityDidChange:", *(void *)(a1 + 32), objc_msgSend(MEMORY[0x1E4F4E450], "dictationIsEnabled"));
  }
}

- (SFSpeechRecognizer)init
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(SFSpeechRecognizer *)self initWithLocale:v3];

  return v4;
}

+ (void)_fetchSupportedForcedOfflineLocalesWithCompletion:(id)a3
{
  id v3 = a3;
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke;
    v10[3] = &unk_1E6154DF8;
    id v4 = &v11;
    id v11 = v3;
    id v5 = v3;
    +[SFSpeechAssetManager installedLanguagesForTaskHint:1 completion:v10];
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x1E4F4E450];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke_2;
    v8[3] = &unk_1E6154E20;
    id v4 = &v9;
    id v9 = v3;
    id v7 = v3;
    [v6 getForcedOfflineDictationSupportedLanguagesWithCompletion:v8];
  }
}

void __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v4, 0);
  }
}

void __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v4, 0);
  }
}

+ (void)requestAuthorization:(void *)handler
{
  id v3 = handler;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    TCCAccessRequest();
  }
}

uint64_t __43__SFSpeechRecognizer_requestAuthorization___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    [*(id *)(a1 + 40) authorizationStatus];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

+ (SFSpeechRecognizerAuthorizationStatus)authorizationStatus
{
  int v2 = TCCAccessPreflight();
  if (v2 == 2) {
    return 0;
  }
  if (!v2) {
    return 3;
  }
  if (TCCAccessRestricted()) {
    return 2;
  }
  return 1;
}

+ (NSSet)supportedLocales
{
  return (NSSet *)(id)sSupportedLocales_897;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SFUtilities supportedLocalesWithCompletion:&__block_literal_global_899];
  }
}

void __32__SFSpeechRecognizer_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 copy];
  uint64_t v6 = (void *)sSupportedLocales_897;
  sSupportedLocales_897 = v5;

  uint64_t v7 = [v4 copy];
  uint64_t v8 = (void *)sSupportedLocaleIdentifiers_875;
  sSupportedLocaleIdentifiers_875 = v7;
}

@end