@interface INVoiceShortcutCenter
+ (INVoiceShortcutCenter)sharedCenter;
+ (void)initialize;
- (INVCVoiceShortcutClient)voiceShortcutClient;
- (INVoiceShortcutCenter)init;
- (id)_initWithVoiceShortcutClient:(id)a3;
- (void)_setVoiceShortcutClient:(id)a3;
- (void)getAllVoiceShortcutsWithCompletion:(void *)completionHandler;
- (void)getVoiceShortcutWithIdentifier:(NSUUID *)identifier completion:(void *)completionHandler;
- (void)setShortcutSuggestions:(NSArray *)suggestions;
@end

@implementation INVoiceShortcutCenter

- (void).cxx_destruct
{
}

- (void)_setVoiceShortcutClient:(id)a3
{
}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  return self->_voiceShortcutClient;
}

- (void)setShortcutSuggestions:(NSArray *)suggestions
{
  id v5 = [(NSArray *)suggestions if_objectsPassingTest:&__block_literal_global_42299];
  v3 = INContainingBundleIdentifierForCurrentProcess();
  v4 = _INVCVoiceShortcutClient();
  [v4 setShortcutSuggestions:v5 forAppWithBundleIdentifier:v3];
}

uint64_t __48__INVoiceShortcutCenter_setShortcutSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 intent];
  if (v3)
  {
    v4 = [v2 intent];
    uint64_t v5 = _INIsIntentValidForSuggestion(v4);
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)getVoiceShortcutWithIdentifier:(NSUUID *)identifier completion:(void *)completionHandler
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = identifier;
  v7 = completionHandler;
  v8 = [(INVoiceShortcutCenter *)self voiceShortcutClient];
  if (!v8)
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]";
      _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil and error",
        buf,
        0xCu);
    }
    v12 = @"No INVoiceShortcutClient";
    goto LABEL_10;
  }
  if (!v6)
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]";
      _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Client passed a nil voice shortcut identifier; completing with nil and error",
        buf,
        0xCu);
    }
    v12 = @"Client passed a nil voice shortcut identifier";
LABEL_10:
    v10 = _INVoiceShortcutError(7001, v12, 0);
    v7[2](v7, 0, v10);
    goto LABEL_11;
  }
  v9 = [(NSUUID *)v6 UUIDString];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__INVoiceShortcutCenter_getVoiceShortcutWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5518C30;
  v15 = v6;
  v16 = v7;
  [v8 getVoiceShortcutWithIdentifier:v9 completion:v14];

  v10 = v15;
LABEL_11:
}

void __67__INVoiceShortcutCenter_getVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[INVoiceShortcut alloc] _initWithVCVoiceShortcut:v5];
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        v16 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]_block_invoke";
        __int16 v17 = 2114;
        id v18 = v5;
        _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create an INVoiceShortcut from VCVoiceShortcut=%{public}@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      v13 = _INVoiceShortcutError(7000, @"Failed to create an INVoiceShortcut", 0);
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
    goto LABEL_12;
  }
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v14 = *(void **)(a1 + 32);
    int v15 = 136315650;
    v16 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v14;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Error from -getVoiceShortcutWithIdentifier=%{public}@: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  int v9 = dyld_program_sdk_at_least();
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v9)
  {
    _INVoiceShortcutError(7001, @"Failed to get voice shortcut", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v7);
LABEL_12:

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
LABEL_13:
}

- (void)getAllVoiceShortcutsWithCompletion:(void *)completionHandler
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = completionHandler;
  id v5 = [(INVoiceShortcutCenter *)self voiceShortcutClient];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__INVoiceShortcutCenter_getAllVoiceShortcutsWithCompletion___block_invoke;
    v7[3] = &unk_1E551D960;
    id v8 = v4;
    [v5 getVoiceShortcutsWithCompletion:v7];
  }
  else
  {
    id v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]";
      _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
    (*((void (**)(void *, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __60__INVoiceShortcutCenter_getAllVoiceShortcutsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v19 = a1;
    id v20 = v6;
    id v8 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
          id v15 = [[INVoiceShortcut alloc] _initWithVCVoiceShortcut:v14];
          if (v15)
          {
            [v8 addObject:v15];
          }
          else
          {
            v16 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]_block_invoke";
              __int16 v29 = 2114;
              v30 = v14;
              _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create an INVoiceShortcut from VCVoiceShortcut=%{public}@", buf, 0x16u);
            }
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(v19 + 32) + 16))();
    id v7 = v20;
    id v5 = v21;
  }
  else
  {
    __int16 v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]_block_invoke";
      __int16 v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Error from -getVoiceShortcutsWithCompletion: %{public}@", buf, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    id v8 = _INVoiceShortcutError(7001, @"Failed to get voice shortcuts", v7);
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v8);
  }
}

- (INVoiceShortcutCenter)init
{
  v3 = _INVCVoiceShortcutClient();
  v4 = [(INVoiceShortcutCenter *)self _initWithVoiceShortcutClient:v3];

  return v4;
}

- (id)_initWithVoiceShortcutClient:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INVoiceShortcutCenter;
  id v6 = [(INVoiceShortcutCenter *)&v9 init];
  if (v6)
  {
    if (!v5)
    {
      id v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v11 = "-[INVoiceShortcutCenter _initWithVoiceShortcutClient:]";
        _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; initing without one",
          buf,
          0xCu);
      }
    }
    objc_storeStrong((id *)&v6->_voiceShortcutClient, a3);
  }

  return v6;
}

+ (INVoiceShortcutCenter)sharedCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__INVoiceShortcutCenter_sharedCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, block);
  }
  id v2 = (void *)sharedCenter_sharedCenter;

  return (INVoiceShortcutCenter *)v2;
}

uint64_t __37__INVoiceShortcutCenter_sharedCenter__block_invoke()
{
  sharedCenter_sharedCenter = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end