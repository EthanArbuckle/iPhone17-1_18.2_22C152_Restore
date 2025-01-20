@interface INSExtensionService
- (BOOL)_errorImpliesCloudRelay:(id)a3;
- (BOOL)_isVoiceShortcutsRemoteExecutionUnavailable:(id)a3;
- (BOOL)_prewarmExtensionWithIntent:(id)a3 applicationIdentifier:(id)a4 command:(id)a5 completionHandler:(id)a6;
- (BOOL)_shouldPrepareAudioSessionForCommand:(id)a3 intent:(id)a4;
- (INExtensionContext)extensionContext;
- (INSExtensionService)init;
- (INSExtensionService)initWithOptions:(id)a3;
- (INSExtensionServiceDelegate)delegate;
- (NSArray)airPlayRouteIdentifiers;
- (NSArray)commandIdentifiers;
- (NSDictionary)options;
- (NSString)groupIdentifier;
- (id)_connectionForIntent:(id)a3;
- (id)_extensionInputItems;
- (id)_siriLanguageCode;
- (id)_updatedEventContextWithExtensionLoadType:(id)a3 wasPrewarmed:(BOOL)a4;
- (id)analytics:(id)a3 contextDictionaryForCommand:(id)a4;
- (id)analytics:(id)a3 contextDictionaryForError:(id)a4;
- (id)completionHandlerForAppLaunchCommand:(id)a3 withCompletion:(id)a4;
- (void)_extensionRequestDidFinishForIntent:(id)a3 error:(id)a4;
- (void)_extensionRequestWillStartForIntent:(id)a3;
- (void)_logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5;
- (void)_logPrewarmDidEndWithCommand:(id)a3 applicationIdentifier:(id)a4 wasPrewarmed:(BOOL)a5 completionHandler:(id)a6;
- (void)_requiresHandlingCommand:(id)a3 completion:(id)a4;
- (void)analytics:(id)a3 needsToLogEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6;
- (void)handleCommand:(id)a3 completionHandler:(id)a4;
- (void)handleCommand:(id)a3 fromRemoteDevice:(id)a4 completionHandler:(id)a5;
- (void)resetExternalResources;
- (void)setAirPlayRouteIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation INSExtensionService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_currentBundleIdForDisplay, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_requestDelegateQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (INSExtensionServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INSExtensionServiceDelegate *)WeakRetained;
}

- (NSDictionary)options
{
  return self->_options;
}

- (id)completionHandlerForAppLaunchCommand:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__INSExtensionService_completionHandlerForAppLaunchCommand_withCompletion___block_invoke;
  v11[3] = &unk_26427E348;
  id v12 = v5;
  id v13 = v6;
  id v7 = v5;
  id v8 = v6;
  v9 = (void *)MEMORY[0x2166CBB50](v11);

  return v9;
}

uint64_t __75__INSExtensionService_completionHandlerForAppLaunchCommand_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F64830]);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = +[INSAnalytics sharedAnalytics];
    id v7 = [v6 contextDictionaryForCommand:v5];

    id v8 = +[INSAnalytics sharedAnalytics];
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "ins_analyticsEndEventType");
    v10 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
    v11 = IFMergeDictionaries();
    objc_msgSend(v8, "logEventWithType:context:contextNoCopy:", v9, v11, 1, v7, 0);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }

  return MEMORY[0x270F9A790]();
}

- (id)analytics:(id)a3 contextDictionaryForError:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(INSExtensionService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 extensionService:self contextDictionaryForError:v5];
  }
  else
  {
    id v8 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[INSExtensionService analytics:contextDictionaryForError:]";
      _os_log_error_impl(&dword_2163DF000, v8, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:contextDictionaryForError:", (uint8_t *)&v10, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)analytics:(id)a3 contextDictionaryForCommand:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(INSExtensionService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 extensionService:self contextDictionaryForCommand:v5];
  }
  else
  {
    id v8 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[INSExtensionService analytics:contextDictionaryForCommand:]";
      _os_log_error_impl(&dword_2163DF000, v8, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:contextDictionaryForCommand:", (uint8_t *)&v10, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)analytics:(id)a3 needsToLogEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
}

- (BOOL)_shouldPrepareAudioSessionForCommand:(id)a3 intent:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 extensionBundleId];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [v6 extensionBundleId];
    int v10 = [v9 isEqualToString:@"com.apple.siri.SiriAudioInternal.AudioInternalIntentExtension"];

    if (v10)
    {
      v11 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        v15 = "-[INSExtensionService _shouldPrepareAudioSessionForCommand:intent:]";
        _os_log_impl(&dword_2163DF000, v11, OS_LOG_TYPE_INFO, "%s Suppressing audio session preparation for internal media extension", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_8;
  }
  char v12 = objc_msgSend(v6, "ins_shouldPrepareAudioSession");
LABEL_8:

  return v12;
}

- (void)_requiresHandlingCommand:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INSExtensionService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 extensionService:self requiresHandlingCommand:v6 completion:v7];
  }
  else
  {
    uint64_t v9 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[INSExtensionService _requiresHandlingCommand:completion:]";
      _os_log_error_impl(&dword_2163DF000, v9, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:requiresHandlingCommand:completion:", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_siriLanguageCode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(INSExtensionService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 siriLanguageCodeForExtensionService:self];
  }
  else
  {
    id v5 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[INSExtensionService _siriLanguageCode]";
      _os_log_error_impl(&dword_2163DF000, v5, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to siriLanguageCodeForExtensionService:", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (void)_logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [(INSExtensionService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v9 extensionService:self logEventWithType:a3 context:v8 contextNoCopy:v5];
  }
  else
  {
    int v10 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[INSExtensionService _logEventWithType:context:contextNoCopy:]";
      _os_log_error_impl(&dword_2163DF000, v10, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:logEventWithType:context:contextNoCopy:", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_logPrewarmDidEndWithCommand:(id)a3 applicationIdentifier:(id)a4 wasPrewarmed:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  int v10 = (void (**)(id, id, void))a6;
  int v11 = [a4 isEqualToString:*MEMORY[0x263F50298]];
  uint64_t v12 = objc_msgSend(v19, "ins_afAnalyticsContext");
  if (v11)
  {
    uint64_t v13 = [(INSExtensionService *)self _updatedEventContextWithExtensionLoadType:v12 wasPrewarmed:v7];

    uint64_t v12 = (void *)v13;
  }
  id v14 = objc_alloc_init(MEMORY[0x263F64830]);
  if (v10) {
    v10[2](v10, v14, 0);
  }
  v15 = +[INSAnalytics sharedAnalytics];
  uint64_t v16 = [v15 contextDictionaryForCommand:v14];

  uint64_t v17 = objc_msgSend(v19, "ins_analyticsEndEventType");
  v18 = IFMergeDictionaries();
  -[INSExtensionService _logEventWithType:context:contextNoCopy:](self, "_logEventWithType:context:contextNoCopy:", v17, v18, 1, v16, 0);

  kdebug_trace();
}

- (BOOL)_prewarmExtensionWithIntent:(id)a3 applicationIdentifier:(id)a4 command:(id)a5 completionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v15 = (os_log_t *)MEMORY[0x263F0F810];
  if (isKindOfClass)
  {
    kdebug_trace();
    uint64_t v16 = [v10 identifier];

    if (!v16)
    {
      uint64_t v17 = [MEMORY[0x263F08C38] UUID];
      v18 = [v17 UUIDString];

      os_log_t v19 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
      {
        log = v19;
        v20 = [v10 _className];
        uint64_t v21 = [v10 launchId];
        v22 = (void *)v21;
        v23 = @"no launchId";
        if (v21) {
          v23 = (__CFString *)v21;
        }
        uint64_t v24 = objc_msgSend(v10, "extensionBundleId", v23);
        v25 = (void *)v24;
        *(_DWORD *)buf = 136316162;
        v26 = @"no extensionBundleId";
        v40 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]";
        __int16 v41 = 2112;
        if (v24) {
          v26 = (__CFString *)v24;
        }
        v42 = v20;
        __int16 v43 = 2112;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        v46 = v26;
        __int16 v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_2163DF000, log, OS_LOG_TYPE_INFO, "%s About to prewarm an extension for %@ (%@:%@) without an identifier. Assigning a new identifier: %@", buf, 0x34u);

        v15 = (os_log_t *)MEMORY[0x263F0F810];
      }
      [v10 setIdentifier:v18];
    }
    v27 = (void *)[objc_alloc(MEMORY[0x263F502A8]) initWithIntent:v10];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke;
    v33[3] = &unk_26427E320;
    id v34 = v12;
    id v38 = v13;
    id v35 = v10;
    v36 = self;
    id v37 = v11;
    [v27 resumeWithCompletionHandler:v33];
  }
  v28 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
  {
    v29 = @"NO";
    if (isKindOfClass) {
      v29 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    v40 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]";
    __int16 v41 = 2112;
    v42 = v29;
    _os_log_impl(&dword_2163DF000, v28, OS_LOG_TYPE_INFO, "%s Is prewarm: %@.", buf, 0x16u);
  }

  return isKindOfClass & 1;
}

void __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (os_log_t *)MEMORY[0x263F0F810];
  id v8 = (void *)*MEMORY[0x263F0F810];
  uint64_t v9 = *MEMORY[0x263F0F810];
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v8;
      v18 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_error_impl(&dword_2163DF000, v17, OS_LOG_TYPE_ERROR, "%s Error finding extension for prewarming: %@", buf, 0x16u);
    }
    id v15 = a1[4];
    uint64_t v16 = INSExtensionServiceTraceCompletionHandlerWithCode(a1[8], 722470936);
    objc_msgSend(v15, "ins_invokeErrorCompletionHandler:forUnderlyingError:", v16, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = v8;
    id v11 = [v5 _extension];
    *(_DWORD *)buf = 136315394;
    v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2163DF000, v10, OS_LOG_TYPE_INFO, "%s Prewarmed extension: %@", buf, 0x16u);
  }
  int v12 = objc_msgSend(a1[5], "ins_shouldPrewarmApp");
  id v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    __int16 v26 = 1024;
    LODWORD(v27) = v12;
    _os_log_impl(&dword_2163DF000, v13, OS_LOG_TYPE_INFO, "%s Should prewarm app: %hhd", buf, 0x12u);
  }
  if (!v12)
  {
    [a1[6] _logPrewarmDidEndWithCommand:a1[4] applicationIdentifier:a1[7] wasPrewarmed:1 completionHandler:a1[8]];
    uint64_t v16 = [v5 _connection];
    [v16 reset];
LABEL_12:

    goto LABEL_13;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke_66;
  v19[3] = &unk_26427E2F8;
  id v14 = a1[5];
  v19[4] = a1[6];
  id v20 = a1[4];
  id v21 = a1[7];
  id v23 = a1[8];
  id v22 = v5;
  [v22 prewarmAppWithIntent:v14 completionHandler:v19];

LABEL_13:
}

void __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke_66(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F0F810];
  BOOL v7 = *MEMORY[0x263F0F810];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v6, OS_LOG_TYPE_INFO, "%s Prewarmed app completed successfully", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    id v10 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_error_impl(&dword_2163DF000, v6, OS_LOG_TYPE_ERROR, "%s Prewarmed app failed with error: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _logPrewarmDidEndWithCommand:*(void *)(a1 + 40) applicationIdentifier:*(void *)(a1 + 48) wasPrewarmed:1 completionHandler:*(void *)(a1 + 64)];
  id v8 = [*(id *)(a1 + 56) _connection];
  [v8 reset];
}

- (id)_connectionForIntent:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v4 = (INCExtensionConnection *)a3;
  id v5 = (os_log_t *)MEMORY[0x263F0F810];
  id v6 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    int v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_2163DF000, v6, OS_LOG_TYPE_INFO, "%s Getting connection for intent: %@", (uint8_t *)&v31, 0x16u);
  }
  if (!v4)
  {
    os_log_t v19 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      p_currentConnection = (id *)&self->_currentConnection;
      goto LABEL_16;
    }
    currentConnection = self->_currentConnection;
    int v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    __int16 v33 = 2112;
    id v34 = currentConnection;
    id v21 = "%s Using the current connection %@ because the intent is nil.";
LABEL_22:
    _os_log_error_impl(&dword_2163DF000, v19, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v31, 0x16u);
    goto LABEL_12;
  }
  BOOL v7 = [(INCExtensionConnection *)v4 identifier];

  if (!v7)
  {
    os_log_t v19 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v30 = self->_currentConnection;
    int v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    __int16 v33 = 2112;
    id v34 = v30;
    id v21 = "%s Using the current connection %@ because the intent identifier is nil.";
    goto LABEL_22;
  }
  int v9 = self->_currentConnection;
  p_currentConnection = (id *)&self->_currentConnection;
  id v10 = [(INCExtensionConnection *)v9 intent];
  __int16 v11 = [v10 identifier];
  id v12 = [(INCExtensionConnection *)v4 identifier];
  char v13 = [v11 isEqualToString:v12];

  os_log_t v14 = *v5;
  BOOL v15 = os_log_type_enabled(*v5, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = (INCExtensionConnection *)*p_currentConnection;
      uint64_t v17 = v14;
      v18 = [(INCExtensionConnection *)v4 identifier];
      int v31 = 136315650;
      v32 = "-[INSExtensionService _connectionForIntent:]";
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2163DF000, v17, OS_LOG_TYPE_INFO, "%s Using the current connection %@ because the intent identifier matches intent identifier: %@.", (uint8_t *)&v31, 0x20u);
    }
    [*p_currentConnection setIntent:v4];
  }
  else
  {
    if (v15)
    {
      id v22 = (INCExtensionConnection *)*p_currentConnection;
      id v23 = v14;
      uint64_t v24 = [(INCExtensionConnection *)v4 identifier];
      int v31 = 136315650;
      v32 = "-[INSExtensionService _connectionForIntent:]";
      __int16 v33 = 2112;
      id v34 = v22;
      __int16 v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_2163DF000, v23, OS_LOG_TYPE_INFO, "%s Replacing the current connection %@ because the intent identifier is %@.", (uint8_t *)&v31, 0x20u);
    }
    [*p_currentConnection reset];
    uint64_t v25 = [objc_alloc(MEMORY[0x263F502A8]) initWithIntent:v4];
    id v26 = *p_currentConnection;
    id *p_currentConnection = (id)v25;
  }
LABEL_16:
  v27 = (INCExtensionConnection *)*p_currentConnection;
  uint64_t v28 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    int v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    __int16 v33 = 2112;
    id v34 = v27;
    _os_log_impl(&dword_2163DF000, v28, OS_LOG_TYPE_INFO, "%s Returning connection: %@", (uint8_t *)&v31, 0x16u);
  }

  return v27;
}

- (id)_updatedEventContextWithExtensionLoadType:(id)a3 wasPrewarmed:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = NSString;
  if (a4) {
    id v5 = @"Warm";
  }
  else {
    id v5 = @"Cold";
  }
  id v6 = a3;
  BOOL v7 = [v4 stringWithFormat:@"%@.%@", @"Extension", v5];
  id v8 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[INSExtensionService _updatedEventContextWithExtensionLoadType:wasPrewarmed:]";
    __int16 v13 = 2112;
    os_log_t v14 = v7;
    _os_log_impl(&dword_2163DF000, v8, OS_LOG_TYPE_INFO, "%s Extension load type = %@", buf, 0x16u);
  }
  int v9 = (void *)[v6 mutableCopy];

  [v9 setObject:v7 forKey:@"ExtensionLoadType"];

  return v9;
}

- (id)_extensionInputItems
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = (void *)MEMORY[0x263F08910];
  id v5 = [(INSExtensionService *)self extensionContext];
  id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, *MEMORY[0x263F101F8]);
  BOOL v7 = [(INSExtensionService *)self _siriLanguageCode];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, *MEMORY[0x263F10200]);

  id v8 = objc_alloc_init(MEMORY[0x263F08810]);
  [v8 setUserInfo:v3];
  v11[0] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  return v9;
}

- (void)_extensionRequestDidFinishForIntent:(id)a3 error:(id)a4
{
  id v5 = a4;
  requestDelegateQueue = self->_requestDelegateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__INSExtensionService__extensionRequestDidFinishForIntent_error___block_invoke;
  v8[3] = &unk_26427E2D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(requestDelegateQueue, v8);
}

void __65__INSExtensionService__extensionRequestDidFinishForIntent_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extensionService:*(void *)(a1 + 32) extensionRequestDidFinishForApplication:*(void *)(*(void *)(a1 + 32) + 32) error:*(void *)(a1 + 40)];
}

- (void)_extensionRequestWillStartForIntent:(id)a3
{
  id v4 = a3;
  requestDelegateQueue = self->_requestDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__INSExtensionService__extensionRequestWillStartForIntent___block_invoke;
  v7[3] = &unk_26427E2D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestDelegateQueue, v7);
}

void __59__INSExtensionService__extensionRequestWillStartForIntent___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_intents_bundleIdForDisplay");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 extensionService:*(void *)(a1 + 32) extensionRequestWillStartForApplication:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (BOOL)_isVoiceShortcutsRemoteExecutionUnavailable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  id v5 = _INVCVoiceShortcutErrorDomain();
  if ([v4 isEqualToString:v5]) {
    BOOL v6 = [v3 code] == 9001;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_errorImpliesCloudRelay:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F0F768]]) {
    BOOL v5 = [v3 code] == 2005;
  }
  else {
    BOOL v5 = 0;
  }

  BOOL v6 = [v3 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F0F758]]) {
    BOOL v7 = [v3 code] == 3001;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7 || v5;

  return v8;
}

- (NSArray)airPlayRouteIdentifiers
{
  uint64_t v2 = [(INSExtensionService *)self extensionContext];
  id v3 = [v2 _airPlayRouteIdentifiers];

  return (NSArray *)v3;
}

- (void)setAirPlayRouteIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(INSExtensionService *)self extensionContext];
  [v5 _setAirPlayRouteIdentifiers:v4];
}

- (INExtensionContext)extensionContext
{
  extensionContext = self->_extensionContext;
  if (!extensionContext)
  {
    id v4 = (INExtensionContext *)objc_alloc_init(MEMORY[0x263F0FAF0]);
    id v5 = self->_extensionContext;
    self->_extensionContext = v4;

    extensionContext = self->_extensionContext;
  }

  return extensionContext;
}

- (void)resetExternalResources
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__INSExtensionService_resetExternalResources__block_invoke;
  block[3] = &unk_26427E370;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__INSExtensionService_resetExternalResources__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) reset];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)handleCommand:(id)a3 fromRemoteDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke;
  v15[3] = &unk_26427E3E0;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke(id *a1)
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v2 = (os_log_t *)MEMORY[0x263F0F810];
  id v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    id v4 = a1[4];
    *(_DWORD *)buf = 136315394;
    v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    __int16 v91 = 2112;
    uint64_t v92 = (uint64_t)v4;
    _os_log_impl(&dword_2163DF000, v3, OS_LOG_TYPE_INFO, "%s Received handleCommand: %@", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = a1[4];
  }
  else {
    id v5 = 0;
  }
  id v6 = a1[5];
  uint64_t v7 = objc_msgSend(v5, "ins_analyticsBeginEventType");
  id v8 = objc_msgSend(v5, "ins_afAnalyticsContext");
  [v6 _logEventWithType:v7 context:v8 contextNoCopy:1];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_msgSend(v5, "ins_aceIntent");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 hashedRouteUIDs];
      __int16 v11 = [v9 airPlayRouteIds];
      id v12 = [a1[5] extensionContext];
      id v13 = [v12 _airPlayRouteIdentifiers];

      id v14 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v11;
        __int16 v93 = 2112;
        v94 = v10;
        __int16 v95 = 2112;
        uint64_t v96 = (uint64_t)v13;
        _os_log_debug_impl(&dword_2163DF000, v14, OS_LOG_TYPE_DEBUG, "%s Examining AirPlay routes passed with INPlayMediaIntent airPlayRouteIds: %@, hashedRouteUIDs: %@, extensionContextAirPlayRouteIdentifiers: %@", buf, 0x2Au);
      }
      if ([v10 count] || objc_msgSend(v11, "count"))
      {
        id v15 = 0;
      }
      else
      {
        v57 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
          __int16 v91 = 2112;
          uint64_t v92 = (uint64_t)v13;
          _os_log_debug_impl(&dword_2163DF000, v57, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds from extension context: %@", buf, 0x16u);
        }
        id v15 = v13;
      }
    }
    else
    {
      uint64_t v16 = [v9 airPlayRouteIds];
      uint64_t v17 = (void *)v16;
      if (v16) {
        id v18 = (void *)v16;
      }
      else {
        id v18 = (void *)MEMORY[0x263EFFA68];
      }
      id v19 = [a1[5] extensionContext];
      id v20 = [v19 _airPlayRouteIdentifiers];
      id v15 = [v18 arrayByAddingObjectsFromArray:v20];

      id v21 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v15;
        _os_log_debug_impl(&dword_2163DF000, v21, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds for non-INPlayMediaIntent: %@", buf, 0x16u);
      }
    }
    id v22 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v15;
      _os_log_debug_impl(&dword_2163DF000, v22, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds: %@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x263EFFA08] setWithArray:v15];
    uint64_t v24 = [v23 allObjects];

    [v9 _setAirPlayRouteIds:v24];
    uint64_t v25 = [a1[5] extensionContext];
    id v26 = [v25 _recordRoute];
    [v9 _setRecordRoute:v26];

    v27 = [a1[5] extensionContext];
    uint64_t v28 = [v27 _recordDeviceUID];
    [v9 _setRecordDeviceUID:v28];

    v29 = [a1[5] extensionContext];
    v30 = [v29 _recordDeviceIdentifier];
    [v9 _setRecordDeviceIdentifier:v30];

    int v31 = [a1[5] extensionContext];
    objc_msgSend(v9, "_setAudioSessionID:", objc_msgSend(v31, "_audioSessionID"));

    if (![v9 _executionContext]) {
      [v9 _setExecutionContext:1];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = [a1[5] _connectionForIntent:0];
      [v32 setIntent:v9];
      id v33 = a1[4];
      id v34 = [v33 userActivityIdentifier];
      objc_msgSend(v33, "ins_launchAppWithConnection:userActivityIdentifier:delegate:completionHandler:", v32, v34, a1[5], a1[7]);

      goto LABEL_70;
    }
    __int16 v35 = *v2;
    v36 = *v2;
    if (!v9)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v73 = a1[4];
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v73;
        _os_log_error_impl(&dword_2163DF000, v35, OS_LOG_TYPE_ERROR, "%s Unable to get INIntent from command %@", buf, 0x16u);
      }
      INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v32, 1303, 0);
      goto LABEL_70;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v9;
      _os_log_impl(&dword_2163DF000, v35, OS_LOG_TYPE_INFO, "%s Generated intent object %@", buf, 0x16u);
      __int16 v35 = *v2;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = v35;
      id v38 = [v9 backingStore];
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v38;
      _os_log_impl(&dword_2163DF000, v37, OS_LOG_TYPE_INFO, "%s Raw intent = %@", buf, 0x16u);
    }
    v39 = [v9 launchId];
    uint64_t v88 = 0;
    INExtractAppInfoFromSiriLaunchId();
    id v32 = 0;

    if ([a1[5] _prewarmExtensionWithIntent:v9 applicationIdentifier:v32 command:v5 completionHandler:a1[7]])
    {
LABEL_70:

      goto LABEL_71;
    }
    v40 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v40, OS_LOG_TYPE_INFO, "%s Not prewarm, continuing...", buf, 0xCu);
    }
    if (a1[6] && [v9 _type] == 2)
    {
      __int16 v41 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        _os_log_impl(&dword_2163DF000, v41, OS_LOG_TYPE_INFO, "%s This is a remote device, and the intent type is custom. Checking for version incompatibility if the intent is sent from a remote device...", buf, 0xCu);
      }
      v42 = [v9 typeName];
      uint64_t v86 = 0;
      uint64_t v87 = 0;
      __int16 v43 = INSchemaWithTypeName();
      id v44 = 0;
      id v45 = 0;

      v46 = [v9 _className];
      __int16 v47 = [v43 intentCodableDescriptionWithIntentClassName:v46];

      v79 = v47;
      v48 = [v47 versioningHash];
      uint64_t v78 = [v48 unsignedLongValue];

      uint64_t v49 = [v9 _metadata];
      uint64_t v50 = [v49 versioningHash];

      uint64_t v51 = *MEMORY[0x263F65100];
      float v52 = INSGetAceVersionNumberFromString((void *)*MEMORY[0x263F65100]);
      v53 = [a1[6] aceVersion];
      float v54 = INSGetAceVersionNumberFromString(v53);

      if (v52 != 0.0 && v54 != 0.0 && v78 && v50 && v78 != v50 && (float)(v52 - v54) >= 2.0)
      {
        v55 = (void *)*MEMORY[0x263F0F810];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
        {
          v74 = v55;
          id v75 = a1[6];
          v77 = v74;
          v76 = [v75 aceVersion];
          *(_DWORD *)buf = 136316418;
          v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
          __int16 v91 = 2048;
          uint64_t v92 = v50;
          __int16 v93 = 2112;
          v94 = v76;
          __int16 v95 = 2048;
          uint64_t v96 = v78;
          __int16 v97 = 2112;
          uint64_t v98 = v51;
          __int16 v99 = 2112;
          v100 = v9;
          _os_log_error_impl(&dword_2163DF000, v77, OS_LOG_TYPE_ERROR, "%s Intent was sent from an old device with (intentVersionHash=%llu, aceVersion=%@), current device has (intentVersionHash=%llu, aceVersion=%@), intent: %@", buf, 0x3Eu);
        }
        v56 = INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
        objc_msgSend(v5, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v56, 1316, 0);

LABEL_69:
        goto LABEL_70;
      }

      uint64_t v2 = (os_log_t *)MEMORY[0x263F0F810];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_log_t v58 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        v59 = v58;
        v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v61;
        _os_log_impl(&dword_2163DF000, v59, OS_LOG_TYPE_INFO, "%s ins_recordPreInteractionSignals for command: %@", buf, 0x16u);
      }
      objc_msgSend(v9, "ins_recordPreInteractionSignals");
    }
    id v62 = [NSString alloc];
    v63 = [v9 intentId];
    v64 = [v9 typeName];
    v65 = [v9 launchId];
    id v44 = (id)[v62 initWithFormat:@"%@-%@-%@", v63, v64, v65];

    id v45 = [v44 dataUsingEncoding:4];
    v66 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v44;
      _os_log_impl(&dword_2163DF000, v66, OS_LOG_TYPE_INFO, "%s Raw intent ID = %@", buf, 0x16u);
      v66 = *v2;
    }
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v66, OS_LOG_TYPE_INFO, "%s Start digesting raw intent ID with in-memory salt...", buf, 0xCu);
    }
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_15;
    v80[3] = &unk_26427E2A8;
    id v67 = v9;
    id v68 = a1[5];
    id v81 = v67;
    id v82 = v68;
    id v83 = v5;
    id v85 = a1[7];
    id v84 = a1[4];
    v69 = (void *)MEMORY[0x2166CBB50](v80);
    v70 = [a1[5] delegate];
    char v71 = objc_opt_respondsToSelector();
    v72 = *v2;
    if (v71)
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        _os_log_impl(&dword_2163DF000, v72, OS_LOG_TYPE_INFO, "%s Extension service delegate responds to extensionService:processDataUsingSHA256WithInMemorySalt:completionHandler:", buf, 0xCu);
      }
      [v70 extensionService:a1[5] processDataUsingSHA256WithInMemorySalt:v45 completionHandler:v69];
    }
    else if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_error_impl(&dword_2163DF000, v72, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:processDataUsingSHA256WithInMemorySalt:completionHandler:", buf, 0xCu);
    }

    __int16 v43 = v81;
    goto LABEL_69;
  }
  objc_msgSend(a1[4], "ins_getIntentDefinitionsWithCompletionHandler:", a1[7]);
LABEL_71:
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(NSString, "if_hexStringFromData:", a2);
  uint64_t v7 = (NSObject **)MEMORY[0x263F0F810];
  id v8 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_2163DF000, v8, OS_LOG_TYPE_INFO, "%s Finished digesting raw intent ID with in-memory salt.", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_16;
  block[3] = &unk_26427E280;
  id v9 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = v12;
  id v22 = *(id *)(a1 + 64);
  id v21 = *(id *)(a1 + 56);
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  id v14 = *v7;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_2163DF000, v14, OS_LOG_TYPE_INFO, "%s Submitting pkdBlock", buf, 0xCu);
  }
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 8), v13);
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (os_log_t *)MEMORY[0x263F0F810];
  id v4 = *MEMORY[0x263F0F810];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v47 = 2112;
      v48 = v2;
      _os_log_impl(&dword_2163DF000, v4, OS_LOG_TYPE_INFO, "%s Set facade intent identifier = %@", buf, 0x16u);
      uint64_t v2 = *(void **)(a1 + 32);
    }
    [*(id *)(a1 + 40) setIdentifier:v2];
  }
  else if (v5)
  {
    id v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315394;
    v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    __int16 v47 = 2112;
    v48 = v6;
    _os_log_impl(&dword_2163DF000, v4, OS_LOG_TYPE_INFO, "%s Unable to generate facade intent ID due to %@", buf, 0x16u);
  }
  uint64_t v7 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_2163DF000, v7, OS_LOG_TYPE_INFO, "%s About to prepare intent...", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 56) delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 extensionService:*(void *)(a1 + 56) prepareIntent:*(void *)(a1 + 40)];
  }
  id v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_2163DF000, v9, OS_LOG_TYPE_INFO, "%s Finished preparing intent", buf, 0xCu);
  }
  id v10 = [*(id *)(a1 + 56) _connectionForIntent:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(a1 + 64), "ins_launchAppWithConnection:delegate:completionHandler:", v10, *(void *)(a1 + 56), *(void *)(a1 + 80));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(*(id *)(a1 + 64), "ins_resolveAppForIntent:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 80));
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 56) _extensionInputItems];
      id v12 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v47 = 2112;
        v48 = v11;
        _os_log_impl(&dword_2163DF000, v12, OS_LOG_TYPE_INFO, "%s Setting extension input items: %@", buf, 0x16u);
      }
      dispatch_block_t v13 = [v10 extensionInputItems];
      BOOL v14 = v13 == 0;

      if (v14) {
        [v10 setExtensionInputItems:v11];
      }
      objc_initWeak(&location, v10);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_21;
      v37[3] = &unk_26427E140;
      objc_copyWeak(&v43, &location);
      v37[4] = *(void *)(a1 + 56);
      id v38 = *(id *)(a1 + 40);
      id v39 = *(id *)(a1 + 72);
      id v42 = *(id *)(a1 + 80);
      id v15 = v8;
      id v40 = v15;
      id v41 = *(id *)(a1 + 64);
      [v10 setTimeoutHandler:v37];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_24;
      v32[3] = &unk_26427E168;
      v32[4] = *(void *)(a1 + 56);
      id v33 = *(id *)(a1 + 40);
      id v34 = *(id *)(a1 + 64);
      id v36 = *(id *)(a1 + 80);
      id v16 = v15;
      id v35 = v16;
      [v10 setInterruptionHandler:v32];
      id v17 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
        _os_log_impl(&dword_2163DF000, v17, OS_LOG_TYPE_INFO, "%s Configured timeout and interruption handlers", buf, 0xCu);
      }
      kdebug_trace();
      [*(id *)(a1 + 56) _extensionRequestWillStartForIntent:*(void *)(a1 + 40)];
      id v18 = *(void **)(a1 + 56);
      uint64_t v19 = objc_msgSend(*(id *)(a1 + 64), "ins_afAnalyticsContext");
      [v18 _logEventWithType:601 context:v19 contextNoCopy:0];

      id v20 = *v3;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 136315394;
        v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        __int16 v47 = 2112;
        v48 = v21;
        _os_log_impl(&dword_2163DF000, v20, OS_LOG_TYPE_INFO, "%s Resuming connection for intent with identifier: %@", buf, 0x16u);
      }
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_25;
      v25[3] = &unk_26427E258;
      id v22 = *(id *)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 56);
      uint64_t v24 = *(void **)(a1 + 64);
      id v26 = v22;
      uint64_t v27 = v23;
      id v28 = v24;
      id v31 = *(id *)(a1 + 80);
      id v29 = v16;
      id v30 = *(id *)(a1 + 72);
      [v10 resumeWithCompletionHandler:v25];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
  }
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [*(id *)(a1 + 32) _extensionRequestDidFinishForIntent:*(void *)(a1 + 40) error:v3];
  BOOL v5 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    dispatch_block_t v13 = v5;
    [WeakRetained requestTimeoutInterval];
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    id v17 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    __int16 v18 = 2050;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_error_impl(&dword_2163DF000, v13, OS_LOG_TYPE_ERROR, "%s Extension Request timed out after %{public}f seconds for command %@", buf, 0x20u);
  }
  INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 72), 722470908);
  id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc_init(MEMORY[0x263F64820]);
  ((void (**)(void, id, id))v6)[2](v6, v7, v3);

  [*(id *)(a1 + 56) extensionService:*(void *)(a1 + 32) suspendTimeout:0];
  id v8 = *(void **)(a1 + 32);
  id v9 = objc_msgSend(*(id *)(a1 + 64), "ins_afAnalyticsContext");
  id v10 = +[INSAnalytics sharedAnalytics];
  uint64_t v11 = [v10 contextDictionaryForError:v3];
  id v12 = IFMergeDictionaries();
  objc_msgSend(v8, "_logEventWithType:context:contextNoCopy:", 605, v12, 0, v11, 0);
}

uint64_t __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_24(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _extensionRequestDidFinishForIntent:*(void *)(a1 + 40) error:a2];
  id v3 = *(void **)(a1 + 48);
  id v4 = INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 64), 722470912);
  objc_msgSend(v3, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v4, 1306, 0);

  BOOL v5 = *(void **)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);

  return [v5 extensionService:v6 suspendTimeout:0];
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_25(id *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2;
  v40[3] = &unk_26427E190;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v41 = v7;
  id v42 = v8;
  id v43 = v9;
  id v44 = a1[9];
  uint64_t v10 = MEMORY[0x2166CBB50](v40);
  uint64_t v11 = (void *)v10;
  if (!v5 || v6)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }
  else
  {
    id v12 = (void *)*MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      id v13 = a1[4];
      uint64_t v14 = v12;
      uint64_t v15 = [v13 identifier];
      *(_DWORD *)buf = 136315394;
      v46 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      __int16 v47 = 2112;
      v48 = v15;
      _os_log_impl(&dword_2163DF000, v14, OS_LOG_TYPE_INFO, "%s Resumed connection for intent with identifier: %@", buf, 0x16u);
    }
    kdebug_trace();
    id v16 = a1[5];
    id v17 = objc_msgSend(a1[6], "ins_afAnalyticsContext");
    [v16 _logEventWithType:602 context:v17 contextNoCopy:0];

    objc_msgSend(a1[7], "extensionService:suspendTimeout:", a1[5], objc_msgSend(v5, "_isExtensionBeingDebugged"));
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_26;
    v37[3] = &unk_26427E1B8;
    id v18 = a1[7];
    id v19 = a1[5];
    id v38 = v18;
    id v39 = v19;
    [v5 setImageProcessingHandler:v37];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2_28;
    block[3] = &unk_26427E280;
    id v20 = a1[6];
    void block[4] = a1[5];
    id v31 = v20;
    id v32 = a1[4];
    id v33 = v5;
    id v34 = a1[8];
    id v35 = a1[7];
    id v36 = a1[9];
    dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    if ([a1[5] _shouldPrepareAudioSessionForCommand:a1[8] intent:a1[4]])
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_3;
      v25[3] = &unk_26427E230;
      id v22 = a1[4];
      id v23 = a1[5];
      id v26 = v22;
      id v27 = v23;
      id v29 = v21;
      id v28 = a1[7];
      uint64_t v24 = (void *)MEMORY[0x2166CBB50](v25);
      [a1[7] extensionService:a1[5] prepareForStartPlaybackWithDestination:1 intent:a1[4] completion:v24];
    }
    else
    {
      dispatch_async(*((dispatch_queue_t *)a1[5] + 1), v21);
    }
  }
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = v4;
    id v16 = [v14 identifier];
    int v17 = 136315650;
    id v18 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    __int16 v19 = 2112;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_error_impl(&dword_2163DF000, v15, OS_LOG_TYPE_ERROR, "%s Error resuming connection for intent with id: %@ - %@", (uint8_t *)&v17, 0x20u);
  }
  [*(id *)(a1 + 40) _extensionRequestDidFinishForIntent:*(void *)(a1 + 32) error:v3];
  if (!v3)
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 56), 722470900);
    id v8 = v6;
    id v9 = v7;
    id v10 = 0;
    goto LABEL_10;
  }
  id v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x263F0F768]])
  {
    uint64_t v11 = [v3 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F0F758]];

    if (v12) {
      goto LABEL_8;
    }
    id v13 = *(void **)(a1 + 48);
    id v7 = INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 56), 722470896);
    id v8 = v13;
    id v9 = v7;
    id v10 = v3;
LABEL_10:
    objc_msgSend(v8, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v9, 1301, v10);

    goto LABEL_11;
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "ins_invokeErrorCompletionHandler:forUnderlyingError:", *(void *)(a1 + 56), v3);
LABEL_11:
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  [v4 extensionService:v5 wantsToCacheImage:a2];
  v6[2](v6, 0);
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2_28(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  [v2 _logEventWithType:626 context:v3 contextNoCopy:0];

  id v4 = [[INSExtensionServiceIntentExecutor alloc] initWithIntent:*(void *)(a1 + 48) extensionProxy:*(void *)(a1 + 56) queue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v5 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = v5;
    id v8 = [v6 identifier];
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl(&dword_2163DF000, v7, OS_LOG_TYPE_INFO, "%s Created intent executor for intent with id %@. Sending intent for execution to execution proxy.", buf, 0x16u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_30;
  v12[3] = &unk_26427E1E0;
  uint64_t v9 = *(void *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v10;
  uint64_t v14 = v11;
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 80);
  id v18 = *(id *)(a1 + 40);
  [(INSExtensionServiceIntentExecutor *)v4 sendAceCommand:v9 completionHandler:v12];
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F0F810];
  id v4 = *MEMORY[0x263F0F810];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = v3;
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_3";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_2163DF000, v5, OS_LOG_TYPE_INFO, "%s Prepared to start playback for %@", buf, 0x16u);
    }
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 8), *(dispatch_block_t *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_error_impl(&dword_2163DF000, v3, OS_LOG_TYPE_ERROR, "%s Failed to prepare for audio playback", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_35;
    v10[3] = &unk_26427E208;
    v10[4] = v9;
    id v11 = *(id *)(a1 + 56);
    [v8 extensionService:v9 handleFailedStartPlaybackWithDestination:1 completion:v10];
  }
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_35(uint64_t a1)
{
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _connection];
  id v7 = [v6 _transaction];

  id v8 = [v7 currentIntentResponse];
  if (v8
    && [*(id *)(a1 + 40) _shouldPrepareAudioSessionForCommand:*(void *)(a1 + 48) intent:*(void *)(a1 + 56)]&& (v5 || INIntentResponseIsFailure()))
  {
    [*(id *)(a1 + 64) extensionService:*(void *)(a1 + 40) handleFailedStartPlaybackWithDestination:1 completion:&__block_literal_global_33];
  }
  [*(id *)(a1 + 40) _extensionRequestDidFinishForIntent:*(void *)(a1 + 56) error:v5];
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v12, v5);
  }
  kdebug_trace();
  kdebug_trace();
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_msgSend(*(id *)(a1 + 72), "ins_afAnalyticsContext");
  [v10 _logEventWithType:627 context:v11 contextNoCopy:0];
}

- (void)handleCommand:(id)a3 completionHandler:(id)a4
{
}

- (NSArray)commandIdentifiers
{
  v8[9] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F65950];
  v8[0] = *MEMORY[0x263F65910];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263F65928];
  v8[2] = *MEMORY[0x263F658D8];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x263F65948];
  v8[4] = *MEMORY[0x263F65930];
  void v8[5] = v4;
  uint64_t v5 = *MEMORY[0x263F65940];
  v8[6] = *MEMORY[0x263F65920];
  v8[7] = v5;
  v8[8] = *MEMORY[0x263F65900];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:9];

  return (NSArray *)v6;
}

- (NSString)groupIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F65908];
}

- (INSExtensionService)initWithOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INSExtensionService;
  id v5 = [(INSExtensionService *)&v16 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v7 = dispatch_queue_create("INSExtensionServiceQueue", v6);
    id v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    dispatch_async(*((dispatch_queue_t *)v5 + 1), &__block_literal_global_326);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.intents.INSExtensionService.request-delegate", 0);
    id v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    uint64_t v11 = [v4 copy];
    id v12 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v11;

    id v13 = +[INSAnalytics sharedAnalytics];
    [v13 addObserver:v5];

    __int16 v14 = +[INSAnalytics sharedAnalytics];
    [v14 setDataSource:v5];
  }
  return (INSExtensionService *)v5;
}

uint64_t __39__INSExtensionService_initWithOptions___block_invoke()
{
  return MEMORY[0x270EF52B8]();
}

- (INSExtensionService)init
{
  return [(INSExtensionService *)self initWithOptions:MEMORY[0x263EFFA78]];
}

@end