@interface _LTPreflightChecker
+ (id)_sharedQueue;
- (_LTPreflightChecker)init;
- (_LTPreflightCheckerDelegate)delegate;
- (_LTPreflightLocaleResolving)localeResolver;
- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)_checkTranslationSupportForConfiguration:(id)a3 completion:(id)a4;
- (void)_resolveLocalePairingForConfiguration:(id)a3 completion:(id)a4;
- (void)_resolveSourceLocaleIfNeeded:(id)a3 completion:(id)a4;
- (void)_resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4;
- (void)preflightConfiguration:(id)a3 completion:(id)a4;
- (void)resolveSourceLocaleForConfiguration:(id)a3 completion:(id)a4;
- (void)resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocaleResolver:(id)a3;
@end

@implementation _LTPreflightChecker

- (_LTPreflightChecker)init
{
  v8.receiver = self;
  v8.super_class = (Class)_LTPreflightChecker;
  v2 = [(_LTPreflightChecker *)&v8 init];
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_localeResolver, v2);
    uint64_t v4 = [(id)objc_opt_class() _sharedQueue];
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_sharedQueue_sharedQueue;

  return v2;
}

- (void)preflightConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = self->_queue;
  objc_super v8 = (void *)[a3 copy];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke;
  block[3] = &unk_2651DC0C8;
  objc_copyWeak(&v16, &location);
  id v13 = v8;
  v14 = v7;
  id v15 = v6;
  id v9 = v6;
  v10 = v7;
  id v11 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_checkTranslationSupportForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  id v9 = [(_LTPreflightChecker *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v9 isTranslationSupportedOnCurrentDeviceForPreflightChecker:self])
  {
    v10 = (void *)[v6 copy];
    [v10 setDeviceSupportsTranslation:0];
    id v11 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_LTPreflightChecker _checkTranslationSupportForConfiguration:completion:]();
    }
    v12 = (void *)MEMORY[0x263F087E8];
    id v13 = [v10 effectiveSourceLocale];
    v14 = [v10 effectiveTargetLocale];
    id v15 = objc_msgSend(v12, "lt_unsupportedPairingErrorWithSource:target:", v13, v14);

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75___LTPreflightChecker__checkTranslationSupportForConfiguration_completion___block_invoke;
    v16[3] = &unk_2651DC0F0;
    v17 = v8;
    id v18 = v7;
    [(_LTPreflightChecker *)self _callDelegateOrGiveError:v15 forConfiguration:v10 completion:v16];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_LTPreflightChecker *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    uint64_t v12 = [v9 nextStep];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke;
    v14[3] = &unk_2651DC140;
    objc_copyWeak(&v16, &location);
    id v15 = v10;
    [v11 preflightChecker:self continueCheckingFromStep:v12 forConfiguration:v9 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LTPreflightChecker _callDelegateOrGiveError:forConfiguration:completion:]();
    }
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v8);
  }
}

- (void)_resolveSourceLocaleIfNeeded:(id)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  id v9 = [v6 resolvedSourceLocale];
  if (!v9)
  {
    uint64_t v10 = [v6 requestedSourceLocale];
    id v11 = (void *)v10;
    if (v10)
    {
      uint64_t v12 = (void *)MEMORY[0x263EFF960];
      v31[0] = v10;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      v14 = [v6 supportedLocales];
      id v15 = objc_msgSend(v12, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v13, v14);

      id v16 = (void (*)(void *, void *))v7[2];
      v17 = v7;
      if (v15)
      {
        id v18 = v15;
LABEL_19:
        v16(v17, v18);
        goto LABEL_20;
      }
    }
    else
    {
      v19 = [v6 lowConfidenceLocales];

      if (v19)
      {
        v20 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24639B000, v20, OS_LOG_TYPE_INFO, "Previously determined low confidence LID on configuration, no need to ask the localeResolver to do LID again", buf, 2u);
        }
        ((void (*)(void *, void))v7[2])(v7, 0);
        goto LABEL_21;
      }
      id v15 = [(_LTPreflightChecker *)self localeResolver];
      if (v15)
      {
        v21 = [v6 sourceStrings];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          v23 = [(_LTPreflightChecker *)self localeResolver];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke;
          v26[3] = &unk_2651DC1B0;
          v27 = v8;
          id v28 = v6;
          v29 = v7;
          [v23 resolveSourceLocaleForConfiguration:v28 completion:v26];

LABEL_20:
LABEL_21:

          goto LABEL_22;
        }
        v25 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[_LTPreflightChecker _resolveSourceLocaleIfNeeded:completion:]();
        }
      }
      else
      {
        v24 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_LTPreflightChecker _resolveSourceLocaleIfNeeded:completion:]();
        }
      }
      id v16 = (void (*)(void *, void *))v7[2];
      v17 = v7;
    }
    id v18 = 0;
    goto LABEL_19;
  }
  ((void (*)(void *, void *))v7[2])(v7, v9);
LABEL_22:
}

- (void)resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke;
  block[3] = &unk_2651DC0C8;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  v14 = v8;
  id v15 = v7;
  id v9 = v7;
  uint64_t v10 = v8;
  id v11 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v6 resolvedTargetLocale];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    uint64_t v9 = [v6 requestedTargetLocale];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      id v11 = (void *)MEMORY[0x263EFF960];
      v23[0] = v9;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      id v13 = [v6 supportedLocales];
      objc_msgSend(v11, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v12, v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        id v15 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[_LTPreflightChecker _resolveTargetLocaleIfNeeded:completion:](v15, v10);
        }
      }
      v7[2](v7, v14);
    }
    else
    {
      id v16 = [v6 systemLocale];
      v17 = v16;
      if (v16)
      {
        id v14 = v16;
      }
      else
      {
        id v18 = objc_msgSend(MEMORY[0x263EFF960], "lt_preferredLocales");
        id v14 = [v18 firstObject];
      }
      v19 = (void *)MEMORY[0x263EFF960];
      v20 = [v6 resolvedSourceLocale];
      v21 = [v6 supportedLocales];
      uint64_t v22 = objc_msgSend(v19, "lt_defaultTargetForSource:systemLocale:availableLocales:targetMap:", v20, v14, v21, 0);

      v7[2](v7, v22);
    }
  }
}

- (void)_resolveLocalePairingForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  uint64_t v9 = [v6 resolvedSourceLocale];
  if (v9)
  {
    uint64_t v10 = [v6 resolvedTargetLocale];
    if (v10)
    {
      id v11 = [[_LTLocalePair alloc] initWithSourceLocale:v9 targetLocale:v10];
      uint64_t v12 = [v6 supportedLocalePairs];
      char v13 = [v12 containsObject:v11];

      if (v13)
      {
        v7[2](v7, 0);
      }
      else
      {
        id v18 = objc_msgSend(MEMORY[0x263F087E8], "lt_unsupportedPairingErrorWithSource:target:", v9, v10);
        v19 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_LTPreflightChecker _resolveLocalePairingForConfiguration:completion:](v19, v11);
        }
        ((void (**)(id, void *))v7)[2](v7, v18);
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      v17 = [v6 effectiveTargetLocale];
      objc_msgSend(v16, "lt_unsupportedTargetLanguageError:", v17);
      id v11 = (_LTLocalePair *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, _LTLocalePair *))v7)[2](v7, v11);
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    id v15 = [v6 effectiveSourceLocale];
    uint64_t v10 = objc_msgSend(v14, "lt_unsupportedSourceLanguageError:", v15);

    ((void (**)(id, void *))v7)[2](v7, v10);
  }
}

- (void)resolveSourceLocaleForConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 sourceStrings];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70___LTPreflightChecker_resolveSourceLocaleForConfiguration_completion___block_invoke;
  v10[3] = &unk_2651DC1D8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[_LTTranslator languagesForText:v7 usingModel:0 useDedicatedTextMachPort:1 completion:v10];
}

- (_LTPreflightCheckerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTPreflightCheckerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_LTPreflightLocaleResolving)localeResolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localeResolver);

  return (_LTPreflightLocaleResolving *)WeakRetained;
}

- (void)setLocaleResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localeResolver);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_checkTranslationSupportForConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_24639B000, v0, v1, "Delegate says translation isn't supported on the current device, showing error to the user", v2, v3, v4, v5, v6);
}

- (void)_callDelegateOrGiveError:forConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_24639B000, v0, v1, "Delegate doesn't implement selector for continuing validation, can't proceed with translation", v2, v3, v4, v5, v6);
}

- (void)_resolveSourceLocaleIfNeeded:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
}

- (void)_resolveSourceLocaleIfNeeded:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_24639B000, v0, v1, "Can't resolve source locale since there's no source strings to use with LID", v2, v3, v4, v5, v6);
}

- (void)_resolveTargetLocaleIfNeeded:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 _ltLocaleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v3, v5, "Failed to find a valid version of the requested target locale %{public}@; giving error to client",
    v6);
}

- (void)_resolveLocalePairingForConfiguration:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 combinedLocaleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v3, v5, "Client requested pair with valid source and target, but the pairing isn't supported: %{public}@", v6);
}

@end