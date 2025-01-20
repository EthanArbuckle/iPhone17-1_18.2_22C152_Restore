@interface _LTLanguageAvailability
- (BOOL)allowOnlineTranslation;
- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3;
- (_LTLanguageAvailability)init;
- (_LTLanguageAvailabilityDelegate)delegate;
- (_LTPreflightLocaleResolving)localeResolver;
- (_LTTextSessionLocaleProviding)localeProvider;
- (id)_uniqueLocalesFromSupportedPairs:(id)a3;
- (void)_cachedLocaleStatusWithCompletion:(id)a3;
- (void)_checkStatusWithSourceLanguage:(id)a3 targetLanguage:(id)a4 sourceSample:(id)a5 completion:(id)a6;
- (void)_didUpdateCachedValues;
- (void)_installedLocalesWithCompletion:(id)a3;
- (void)_supportedLocalePairsWithCompletion:(id)a3;
- (void)_updateCachedValues;
- (void)currentlyInstalledLocalesWithCompletion:(id)a3;
- (void)localeProviderSupportedLocalePairsWithCompletion:(id)a3;
- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6;
- (void)setAllowOnlineTranslation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleProvider:(id)a3;
- (void)setLocaleResolver:(id)a3;
- (void)statusForSourceSample:(id)a3 toLanguage:(id)a4 completion:(id)a5;
- (void)statusFromLanguage:(id)a3 toLanguage:(id)a4 completion:(id)a5;
- (void)supportedLanguagesWithCompletion:(id)a3;
@end

@implementation _LTLanguageAvailability

- (_LTLanguageAvailability)init
{
  v17.receiver = self;
  v17.super_class = (Class)_LTLanguageAvailability;
  v2 = [(_LTLanguageAvailability *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v2->_localeProvider, v2);
    v4 = objc_alloc_init(_LTPreflightChecker);
    preflightChecker = v3->_preflightChecker;
    v3->_preflightChecker = v4;

    [(_LTPreflightChecker *)v3->_preflightChecker setDelegate:v3];
    objc_initWeak(&location, v3);
    v6 = [_LTLanguageStatus alloc];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __31___LTLanguageAvailability_init__block_invoke;
    v14 = &unk_2651DBAC0;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [(_LTLanguageStatus *)v6 initWithObservationType:1 useDedicatedMachPort:1 observations:&v11];
    languageStatusListener = v3->_languageStatusListener;
    v3->_languageStatusListener = (_LTLanguageStatus *)v7;

    [(_LTLanguageAvailability *)v3 _updateCachedValues];
    v9 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)supportedLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60___LTLanguageAvailability_supportedLanguagesWithCompletion___block_invoke;
  v6[3] = &unk_2651DBAE8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_LTLanguageAvailability *)self _supportedLocalePairsWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)statusFromLanguage:(id)a3 toLanguage:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68___LTLanguageAvailability_statusFromLanguage_toLanguage_completion___block_invoke;
  v10[3] = &unk_2651DBB10;
  id v11 = v8;
  id v9 = v8;
  [(_LTLanguageAvailability *)self _checkStatusWithSourceLanguage:a3 targetLanguage:a4 sourceSample:0 completion:v10];
}

- (void)statusForSourceSample:(id)a3 toLanguage:(id)a4 completion:(id)a5
{
}

- (void)_checkStatusWithSourceLanguage:(id)a3 targetLanguage:(id)a4 sourceSample:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke;
  v18[3] = &unk_2651DBBD8;
  objc_copyWeak(&v23, &location);
  id v14 = v12;
  id v19 = v14;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  [(_LTLanguageAvailability *)self _supportedLocalePairsWithCompletion:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)setLocaleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_localeProvider, a3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45___LTLanguageAvailability_setLocaleProvider___block_invoke;
  v4[3] = &unk_2651DBC00;
  v4[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __45___LTLanguageAvailability_setLocaleProvider___block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(&self->_lock);
  [(_LTLanguageAvailability *)self _updateCachedValues];
}

- (void)setLocaleResolver:(id)a3
{
}

- (_LTPreflightLocaleResolving)localeResolver
{
  return [(_LTPreflightChecker *)self->_preflightChecker localeResolver];
}

- (void)_updateCachedValues
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__17;
  id v20 = __Block_byref_object_dispose__18;
  id v21 = 0;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v12 = __46___LTLanguageAvailability__updateCachedValues__block_invoke;
  id v13 = &unk_2651DBA98;
  id v14 = self;
  id v15 = &v16;
  id v4 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v4);

  os_unfair_lock_unlock(p_lock);
  objc_initWeak(&location, (id)v17[5]);
  objc_initWeak(&from, self);
  id v5 = (void *)v17[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46___LTLanguageAvailability__updateCachedValues__block_invoke_2;
  v6[3] = &unk_2651DBC50;
  objc_copyWeak(&v7, &from);
  objc_copyWeak(&v8, &location);
  [v5 localeProviderSupportedLocalePairsWithCompletion:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

- (void)_didUpdateCachedValues
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v8 = __49___LTLanguageAvailability__didUpdateCachedValues__block_invoke;
  id v9 = &unk_2651DBC78;
  id v10 = self;
  id v11 = &v19;
  id v12 = &v13;
  id v4 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v4);

  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = v14[5];
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v20[5]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained languageAvailabilityDidUpdate:self];
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (id)_uniqueLocalesFromSupportedPairs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "sourceLocale", (void)v15);
        [v4 addObject:v11];

        id v12 = [v10 targetLocale];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v4 allObjects];

  return v13;
}

- (void)_supportedLocalePairsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  p_lock = &self->_lock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  long long v15 = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke;
  long long v16 = &unk_2651DBA98;
  long long v17 = self;
  long long v18 = &v19;
  uint64_t v6 = v14;
  os_unfair_lock_lock(&self->_lock);
  v15((uint64_t)v6);

  os_unfair_lock_unlock(&self->_lock);
  if (v20[5])
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v9 = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_2;
    id v10 = &unk_2651DBCC8;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    uint64_t v7 = v8;
    os_unfair_lock_lock(p_lock);
    v9((uint64_t)v7);

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v19, 8);
}

- (void)_cachedLocaleStatusWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  p_lock = &self->_lock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  long long v15 = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke;
  long long v16 = &unk_2651DBA98;
  long long v17 = self;
  long long v18 = &v19;
  uint64_t v6 = v14;
  os_unfair_lock_lock(&self->_lock);
  v15((uint64_t)v6);

  os_unfair_lock_unlock(&self->_lock);
  if (v20[5])
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v9 = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_2;
    id v10 = &unk_2651DBCC8;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    uint64_t v7 = v8;
    os_unfair_lock_lock(p_lock);
    v9((uint64_t)v7);

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v19, 8);
}

- (void)_installedLocalesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  long long v15 = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke;
  long long v16 = &unk_2651DBA98;
  long long v17 = self;
  long long v18 = &v19;
  id v5 = v14;
  os_unfair_lock_lock(&self->_lock);
  v15((uint64_t)v5);

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, (id)v20[5]);
  objc_initWeak(&from, self);
  uint64_t v6 = (void *)v20[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_2;
  v8[3] = &unk_2651DBD18;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 currentlyInstalledLocalesWithCompletion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);
}

- (void)localeProviderSupportedLocalePairsWithCompletion:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76___LTLanguageAvailability_localeProviderSupportedLocalePairsWithCompletion___block_invoke;
  v5[3] = &unk_2651DBD40;
  id v6 = v3;
  id v4 = v3;
  +[_LTTranslator availableLocalePairsForTask:5 useDedicatedMachPort:1 completion:v5];
}

- (void)currentlyInstalledLocalesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67___LTLanguageAvailability_currentlyInstalledLocalesWithCompletion___block_invoke;
  v6[3] = &unk_2651DBAE8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_LTLanguageAvailability *)self _cachedLocaleStatusWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  if (a4 == 2)
  {
    id v14 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LTLanguageAvailability preflightChecker:continueCheckingFromStep:forConfiguration:completion:](v14);
    }
    long long v15 = (void *)MEMORY[0x263F087E8];
    long long v16 = [v10 effectiveSourceLocale];
    long long v17 = [v10 effectiveTargetLocale];
    uint64_t v13 = objc_msgSend(v15, "lt_unsupportedPairingErrorWithSource:target:", v16, v17);

    if (v13) {
      goto LABEL_6;
    }
LABEL_10:
    v11[2](v11, v10, 0);
    goto LABEL_11;
  }
  if (a4) {
    goto LABEL_10;
  }
  id v12 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[_LTLanguageAvailability preflightChecker:continueCheckingFromStep:forConfiguration:completion:](v12);
  }
  uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:21 userInfo:0];
  if (!v13) {
    goto LABEL_10;
  }
LABEL_6:
  ((void (**)(id, id, void *))v11)[2](v11, 0, v13);

LABEL_11:
}

- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3
{
  return 1;
}

- (_LTTextSessionLocaleProviding)localeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localeProvider);

  return (_LTTextSessionLocaleProviding *)WeakRetained;
}

- (_LTLanguageAvailabilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTLanguageAvailabilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowOnlineTranslation
{
  return self->_allowOnlineTranslation;
}

- (void)setAllowOnlineTranslation:(BOOL)a3
{
  self->_allowOnlineTranslation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_localeProvider);
  objc_storeStrong((id *)&self->_preflightChecker, 0);
  objc_storeStrong((id *)&self->_languageStatusListener, 0);
  objc_storeStrong(&self->_languageStatusCompletionHandler, 0);
  objc_storeStrong(&self->_supportedLocalePairsCompletionHandler, 0);

  objc_storeStrong((id *)&self->_cachedSupportedLocalePairs, 0);
}

- (void)preflightChecker:(os_log_t)log continueCheckingFromStep:forConfiguration:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Preflight checks were unable to automatically determine the source language for a language availability check; won't"
    " ask user to disambiguate",
    v1,
    2u);
}

- (void)preflightChecker:(os_log_t)log continueCheckingFromStep:forConfiguration:completion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Preflight checks showed translation isn't supported on the current device, but can't show error to user, so reporting unsupported pairing", v1, 2u);
}

@end