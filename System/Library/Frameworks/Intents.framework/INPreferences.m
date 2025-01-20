@interface INPreferences
+ (INSiriAuthorizationStatus)siriAuthorizationStatus;
+ (NSString)siriLanguageCode;
+ (id)sharedPreferences;
+ (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4;
+ (void)requestSiriAuthorization:(void *)handler;
- (BOOL)_weAreRunningAsAnExtension;
- (INPreferences)init;
- (NSString)_cachedSiriLanguageCode;
- (id)_init;
- (id)_siriLanguageCode;
- (int64_t)_siriAuthorizationStatus;
- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri;
- (void)_setCachedSiriLanguageCode:(id)a3;
- (void)_updateWithExtensionContext:(id)a3;
- (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4;
- (void)assertThisProcessHasSiriEntitlement;
- (void)requestSiriAuthorization:(id)a3;
@end

@implementation INPreferences

uint64_t __34__INPreferences_sharedPreferences__block_invoke()
{
  sSharedPreferences = [[INPreferences alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)INPreferences;
  v2 = [(INPreferences *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_INVocabularyConnection);
    assistantdConnection = v2->_assistantdConnection;
    v2->_assistantdConnection = v3;
  }
  return v2;
}

uint64_t __52__INPreferences_assertThisProcessHasSiriEntitlement__block_invoke(uint64_t a1)
{
  uint64_t result = INThisProcessHasEntitlement(@"com.apple.developer.siri", 1);
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri");
  }
  return result;
}

+ (void)requestSiriAuthorization:(void *)handler
{
  v4 = handler;
  id v5 = [a1 sharedPreferences];
  [v5 requestSiriAuthorization:v4];
}

- (void)requestSiriAuthorization:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if (+[_INSiriAuthorizationManager _isSiriAuthorizationRestricted])
    {
      v4[2](v4, 1);
    }
    else
    {
      [(INPreferences *)self assertThisProcessHasSiriEntitlement];
      id v5 = [(_INVocabularyConnection *)self->_assistantdConnection settingsService];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __42__INPreferences_requestSiriAuthorization___block_invoke;
      v6[3] = &unk_1E5518058;
      v7 = v4;
      [v5 requestSiriAuthorization:v6];
    }
  }
}

- (void)assertThisProcessHasSiriEntitlement
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__INPreferences_assertThisProcessHasSiriEntitlement__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  if (assertThisProcessHasSiriEntitlement_onlyCheckOnceToken != -1) {
    dispatch_once(&assertThisProcessHasSiriEntitlement_onlyCheckOnceToken, block);
  }
}

+ (id)sharedPreferences
{
  if (sharedPreferences_singletonToken != -1) {
    dispatch_once(&sharedPreferences_singletonToken, &__block_literal_global_29655);
  }
  v2 = (void *)sSharedPreferences;

  return v2;
}

uint64_t __42__INPreferences_requestSiriAuthorization___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __42__INPreferences_requestSiriAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__INPreferences_requestSiriAuthorization___block_invoke_2;
  v3[3] = &unk_1E5518030;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSiriLanguageCode, 0);

  objc_storeStrong((id *)&self->_assistantdConnection, 0);
}

- (void)_setCachedSiriLanguageCode:(id)a3
{
}

- (NSString)_cachedSiriLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    assistantdConnection = self->_assistantdConnection;
    id v8 = a3;
    v9 = [(_INVocabularyConnection *)assistantdConnection settingsService];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke;
    v10[3] = &unk_1E55180A8;
    id v11 = v6;
    [v9 verifyProcessCanDonateIntentWithName:v8 completion:v10];
  }
}

void __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke_2;
  v5[3] = &unk_1E55199B8;
  id v6 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_siriLanguageCode
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__29633;
  v21 = __Block_byref_object_dispose__29634;
  id v22 = (id)[(NSString *)self->_cachedSiriLanguageCode copy];
  v3 = (void *)v18[5];
  if (!v3)
  {
    if (INThisProcessIsAssistantd_onceToken != -1) {
      dispatch_once(&INThisProcessIsAssistantd_onceToken, &__block_literal_global_74918);
    }
    if (INThisProcessIsAssistantd_isAssistantd)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2050000000;
      id v4 = (void *)getAFPreferencesClass_softClass;
      uint64_t v27 = getAFPreferencesClass_softClass;
      if (!getAFPreferencesClass_softClass)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __getAFPreferencesClass_block_invoke;
        v23[3] = &unk_1E5520EB8;
        v23[4] = &v24;
        __getAFPreferencesClass_block_invoke((uint64_t)v23);
        id v4 = (void *)v25[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v24, 8);
      id v6 = [v5 sharedPreferences];
      uint64_t v7 = [v6 languageCode];
      id v8 = v18[5];
      v18[5] = v7;
    }
    else
    {
      [(INPreferences *)self assertThisProcessHasSiriEntitlement];
      v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      v10 = [(_INVocabularyConnection *)self->_assistantdConnection settingsService];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __34__INPreferences__siriLanguageCode__block_invoke;
      v14[3] = &unk_1E5518080;
      v16 = &v17;
      id v6 = v9;
      v15 = v6;
      [v10 fetchCurrentSiriLanguageCode:v14];

      dispatch_time_t v11 = dispatch_time(0, 5000000000);
      dispatch_group_wait(v6, v11);
      id v8 = v15;
    }

    v3 = (void *)v18[5];
  }
  id v12 = v3;
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __34__INPreferences__siriLanguageCode__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (int64_t)_siriAuthorizationStatus
{
  if ([(INPreferences *)self _weAreRunningAsAnExtension]) {
    return 3;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 2;
  if (+[_INSiriAuthorizationManager _isSiriAuthorizationRestricted])
  {
    int64_t v3 = 1;
  }
  else
  {
    [(INPreferences *)self assertThisProcessHasSiriEntitlement];
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    id v5 = [(_INVocabularyConnection *)self->_assistantdConnection settingsService];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__INPreferences__siriAuthorizationStatus__block_invoke;
    v9[3] = &unk_1E5518008;
    dispatch_time_t v11 = &v12;
    id v6 = v4;
    v10 = v6;
    [v5 fetchSiriAuthorization:v9];

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v6, v7);
    int64_t v3 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

void __41__INPreferences__siriAuthorizationStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri
{
  [NSString stringWithFormat:@"Use of the class %@ from an app requires the entitlement %@. Did you enable the Siri capability in your Xcode project?", self, @"com.apple.developer.siri"];
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v2);
}

- (BOOL)_weAreRunningAsAnExtension
{
  return self->_cachedSiriLanguageCode != 0;
}

- (void)_updateWithExtensionContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "inputItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) userInfo];
        v10 = [v9 objectForKey:@"Session Language"];

        if (v10)
        {
          [(INPreferences *)self _setCachedSiriLanguageCode:v10];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (INPreferences)init
{
  int64_t v3 = [(id)objc_opt_class() sharedPreferences];

  return v3;
}

+ (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedPreferences];
  [v8 _verifyProcessCanDonateIntentWithName:v7 completion:v6];
}

+ (NSString)siriLanguageCode
{
  id v2 = [a1 sharedPreferences];
  int64_t v3 = [v2 _siriLanguageCode];

  return (NSString *)v3;
}

+ (INSiriAuthorizationStatus)siriAuthorizationStatus
{
  id v2 = [a1 sharedPreferences];
  INSiriAuthorizationStatus v3 = [v2 _siriAuthorizationStatus];

  return v3;
}

@end