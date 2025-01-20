@interface AFSuggestionGenerationManager
+ (id)sharedInstance;
- (AFLocalizationManager)localizationManager;
- (BOOL)needContactAutofill:(unint64_t)a3;
- (BOOL)shouldAuthenticateToAcceptAutoFill;
- (LAContext)laContext;
- (id)_makeQueue;
- (id)generateSuggestionsForContactAutoFill:(id)a3 textPrefix:(id)a4;
- (id)initPrivate;
- (id)inputContextPredictionManager;
- (void)_authenticateIfNecessaryForCreditCardSuggestion:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6;
- (void)authenticateIfNecessaryForSuggestion:(id)a3 completionHandler:(id)a4;
- (void)authenticateIfNecessaryForSuggestion:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5;
- (void)generateAutoFillSuggestionsWithAutoFillMode:(unint64_t)a3 textPrefix:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6;
- (void)generateContactAutoFillSuggestionsWithTextPrefix:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5;
- (void)generateCreditCardAutoFillWithCompletionHandler:(id)a3;
- (void)setLaContext:(id)a3;
@end

@implementation AFSuggestionGenerationManager

+ (id)sharedInstance
{
  v2 = (void *)instance;
  if (!instance)
  {
    if (sharedInstance_onceToken != -1) {
      dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
    }
    v2 = (void *)instance;
  }
  return v2;
}

uint64_t __47__AFSuggestionGenerationManager_sharedInstance__block_invoke()
{
  instance = [[AFSuggestionGenerationManager alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v13.receiver = self;
  v13.super_class = (Class)AFSuggestionGenerationManager;
  v2 = [(AFSuggestionGenerationManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(AFSuggestionGenerationManager *)v2 _makeQueue];
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v6 = (void *)get_ICInputContextFactoryClass_softClass;
    uint64_t v18 = get_ICInputContextFactoryClass_softClass;
    if (!get_ICInputContextFactoryClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __get_ICInputContextFactoryClass_block_invoke;
      v14[3] = &unk_265247EA0;
      v14[4] = &v15;
      __get_ICInputContextFactoryClass_block_invoke((uint64_t)v14);
      v6 = (void *)v16[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);
    uint64_t v8 = [v7 predictionManager];
    inputContextPredictionManager = v3->_inputContextPredictionManager;
    v3->_inputContextPredictionManager = (_ICPredictionManaging *)v8;

    v10 = [[AFLocalizationManager alloc] initForLocalizedStrings];
    localizationManager = v3->_localizationManager;
    v3->_localizationManager = v10;
  }
  return v3;
}

- (id)inputContextPredictionManager
{
  return self->_inputContextPredictionManager;
}

- (id)_makeQueue
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.AutoFillCore.AFSuggestionGenerationManager", v2);

  return v3;
}

- (BOOL)needContactAutofill:(unint64_t)a3
{
  return a3 - 5 < 3;
}

- (void)generateAutoFillSuggestionsWithAutoFillMode:(unint64_t)a3 textPrefix:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke;
  v30 = &unk_265247DB0;
  id v13 = v11;
  id v31 = v13;
  id v14 = v12;
  id v32 = v14;
  uint64_t v15 = (void *)MEMORY[0x24C589840](&v27);
  if (a3 != 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v18 = +[AFCredentialManager sharedInstance];
      [v18 generateSignupAutoFillWithAutoFillMode:a3 documentTraits:v13 completionHandler:v14];
LABEL_5:

      goto LABEL_21;
    }
    if (a3 == 9)
    {
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:](self, "generateCreditCardAutoFillWithCompletionHandler:", v14, v27, v28, v29, v30, v31);
      goto LABEL_21;
    }
    if (!-[AFSuggestionGenerationManager needContactAutofill:](self, "needContactAutofill:", a3, v27, v28, v29, v30, v31))
    {
      if (a3 != 8)
      {
        (*((void (**)(id, void))v14 + 2))(v14, 0);
        goto LABEL_21;
      }
      uint64_t v18 = +[AFCredentialManager sharedInstance];
      [v18 generateOneTimeCodeAutoFillSuggestionsWithDocumentTraits:v13 completionHandler:v14];
      goto LABEL_5;
    }
    v19 = [v13 textInputTraits];
    v20 = [v19 textContentType];
    v21 = v20;
    if (v20 != @"email")
    {

LABEL_11:
      v22 = self;
      id v23 = v10;
      id v24 = v13;
      id v25 = v14;
LABEL_20:
      [(AFSuggestionGenerationManager *)v22 generateContactAutoFillSuggestionsWithTextPrefix:v23 documentTraits:v24 completionHandler:v25];
      goto LABEL_21;
    }
    if (v10)
    {
      uint64_t v26 = [v10 length];

      if (v26) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v22 = self;
    id v23 = v10;
    id v24 = v13;
    id v25 = v15;
    goto LABEL_20;
  }
  v16 = +[AFCredentialManager sharedInstance];
  uint64_t v17 = [v16 generateLoginAutoFillWithDocumentTraits:v13];

  (*((void (**)(id, void *))v14 + 2))(v14, v17);
LABEL_21:
}

void __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = (id)[v3 copy];
  uint64_t v4 = +[AFCredentialManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_41;
  v6[3] = &unk_265247D88;
  uint64_t v8 = v9;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v4 generateHideMyEmailAutoFillWithRenderTraits:v5 completionHandler:v6];

  _Block_object_dispose(v9, 8);
}

void __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_41(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_2;
  v8[3] = &unk_265247D60;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  AFDispatchAsync(MEMORY[0x263EF83A0], v8);
}

uint64_t __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v32 = (void (**)(id, id))a3;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  uint64_t v3 = (void *)getSFSafariCreditCardStoreClass_softClass;
  v51 = (void *)getSFSafariCreditCardStoreClass_softClass;
  if (!getSFSafariCreditCardStoreClass_softClass)
  {
    uint64_t v43 = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    v45 = __getSFSafariCreditCardStoreClass_block_invoke;
    v46 = &unk_265247EA0;
    v47 = &v48;
    __getSFSafariCreditCardStoreClass_block_invoke((uint64_t)&v43);
    uint64_t v3 = (void *)v49[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v48, 8);
  id v42 = 0;
  v33 = [v4 savedCreditCardsWithError:&v42];
  id v5 = v42;
  id v31 = v5;
  if (v33) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v33;
    uint64_t v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16, v31);
    if (v37)
    {
      uint64_t v35 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v11 = [v9 objectForKey:@"CardNumber"];
          if (v11)
          {
            [v10 setObject:v11 forKey:@"cc-number"];
            id v12 = v11;
            uint64_t v48 = 0;
            v49 = &v48;
            uint64_t v50 = 0x2020000000;
            id v13 = (uint64_t (*)(id))getWBSCreditCardTypeFromNumberSymbolLoc_ptr;
            v51 = getWBSCreditCardTypeFromNumberSymbolLoc_ptr;
            if (!getWBSCreditCardTypeFromNumberSymbolLoc_ptr)
            {
              uint64_t v43 = MEMORY[0x263EF8330];
              uint64_t v44 = 3221225472;
              v45 = __getWBSCreditCardTypeFromNumberSymbolLoc_block_invoke;
              v46 = &unk_265247EA0;
              v47 = &v48;
              id v14 = (void *)SafariCoreLibrary();
              uint64_t v15 = dlsym(v14, "WBSCreditCardTypeFromNumber");
              *(void *)(v47[1] + 24) = v15;
              getWBSCreditCardTypeFromNumberSymbolLoc_ptr = *(_UNKNOWN **)(v47[1] + 24);
              id v13 = (uint64_t (*)(id))v49[3];
            }
            _Block_object_dispose(&v48, 8);
            if (!v13) {
              goto LABEL_42;
            }
            uint64_t v16 = v13(v12);

            uint64_t v48 = 0;
            v49 = &v48;
            uint64_t v50 = 0x2020000000;
            uint64_t v17 = (void (*)(uint64_t))getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr;
            v51 = getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr;
            if (!getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr)
            {
              uint64_t v43 = MEMORY[0x263EF8330];
              uint64_t v44 = 3221225472;
              v45 = __getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_block_invoke;
              v46 = &unk_265247EA0;
              v47 = &v48;
              uint64_t v18 = (void *)SafariCoreLibrary();
              v19 = dlsym(v18, "WBSCreditCardTypeLocalizedNameForGeneratingCardNames");
              *(void *)(v47[1] + 24) = v19;
              getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr = *(_UNKNOWN **)(v47[1] + 24);
              uint64_t v17 = (void (*)(uint64_t))v49[3];
            }
            _Block_object_dispose(&v48, 8);
            if (!v17)
            {
LABEL_42:
              -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]();
              __break(1u);
            }
            v20 = v17(v16);
            if (v20) {
              [v10 setObject:v20 forKey:@"cc-type"];
            }
          }
          v21 = [v9 objectForKey:@"ExpirationDate"];
          if (v21) {
            [v10 setObject:v21 forKey:@"cc-exp"];
          }
          v22 = [v9 objectForKey:@"CardholderName"];
          if (v22) {
            [v10 setObject:v22 forKey:@"cc-name"];
          }
          id v23 = [v9 objectForKey:@"CardSecurityCode"];
          if (v23) {
            [v10 setObject:v23 forKey:@"cc-csc"];
          }
          uint64_t v24 = [v9 objectForKey:@"CardNameUIString"];
          id v25 = (void *)v24;
          uint64_t v26 = @"Credit Card";
          if (v24) {
            uint64_t v26 = (__CFString *)v24;
          }
          uint64_t v27 = v26;
          if ((unint64_t)[v11 length] < 0xB)
          {
            uint64_t v28 = 0;
          }
          else
          {
            uint64_t v28 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v11, "length") - 4);
          }
          v29 = [[AFSuggestion alloc] initWithTitle:v27 subTitle:v28 creditCardPayload:v10 customInfoType:13];

          [v36 addObject:v29];
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v37);
    }

    v30 = AFSuggestionGenerationManagerOSLogFacility();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:](v36);
    }

    v32[2](v32, v36);
  }
  else
  {
    uint64_t v7 = AFSuggestionGenerationManagerOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]((uint64_t)v31);
    }

    v32[2](v32, 0);
  }
}

- (void)generateContactAutoFillSuggestionsWithTextPrefix:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [MEMORY[0x263EFF910] date];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy_;
  long long v40 = __Block_byref_object_dispose_;
  id v41 = [MEMORY[0x263EFF980] array];
  if (_os_feature_enabled_impl())
  {
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2050000000;
    id v12 = (void *)get_ICProactiveTriggerClass_softClass;
    uint64_t v45 = get_ICProactiveTriggerClass_softClass;
    if (!get_ICProactiveTriggerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v47 = 3221225472;
      uint64_t v48 = __get_ICProactiveTriggerClass_block_invoke;
      v49 = &unk_265247EA0;
      uint64_t v50 = &v42;
      __get_ICProactiveTriggerClass_block_invoke((uint64_t)buf);
      id v12 = (void *)v43[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v42, 8);
    id v14 = [v13 alloc];
    uint64_t v15 = [v9 textInputTraits];
    uint64_t v16 = [v15 textContentType];
    uint64_t v17 = (void *)[v14 initWithContext:v8 inputContextHistory:0 contentType:v16];

    [(id)v37[5] addObject:v17];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke;
    v31[3] = &unk_265247DD8;
    id v32 = v11;
    id v35 = v10;
    v33 = self;
    id v34 = v8;
    uint64_t v18 = (void *)MEMORY[0x24C589840](v31);
    if (_os_feature_enabled_impl()) {
      int v19 = 3;
    }
    else {
      int v19 = 2;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_70;
    block[3] = &unk_265247E28;
    block[4] = self;
    uint64_t v28 = &v36;
    int v29 = 0;
    int v30 = v19;
    id v26 = v9;
    id v27 = v18;
    id v21 = v18;
    dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    AFDispatchAsync(queue, v22);
  }
  else
  {
    id v23 = AFSuggestionGenerationManagerOSLogFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s Proactive Quicktype 2 feature flag not enabled", "-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]");
      -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:](v24, buf, v23);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  _Block_object_dispose(&v36, 8);
}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v6)
  {
    double v8 = v7;
    id v9 = AFSuggestionGenerationManagerOSLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_2((uint64_t)v6, -v8);
    }
  }
  else
  {
    if ([v5 count] >= 1)
    {
      id v10 = [*(id *)(a1 + 40) generateSuggestionsForContactAutoFill:v5 textPrefix:*(void *)(a1 + 48)];
      id v11 = (void *)[v10 mutableCopy];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_7;
    }
    id v9 = AFSuggestionGenerationManagerOSLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_7:
}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_70(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) inputContextPredictionManager];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v4 = [*(id *)(a1 + 40) appId];
  id v5 = [*(id *)(a1 + 40) recipientId];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) localeIdentifier];
  unsigned int v7 = *(_DWORD *)(a1 + 64);
  unsigned int v8 = *(_DWORD *)(a1 + 68);
  id v18 = 0;
  id v9 = [v2 searchWithTriggers:v3 application:v4 recipient:v5 localeIdentifier:v6 isResponseDenyListed:0 shouldDisableAutoCaps:1 timeoutInMilliseconds:__PAIR64__(v8 resultLimit:v7) error:&v18];
  id v10 = v18;

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_2;
  v14[3] = &unk_265247E00;
  id v11 = *(id *)(a1 + 48);
  id v16 = v10;
  id v17 = v11;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  AFDispatchAsync(MEMORY[0x263EF83A0], v14);
}

uint64_t __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)generateSuggestionsForContactAutoFill:(id)a3 textPrefix:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v4 count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      id v6 = [v4 objectAtIndexedSubscript:v5 - 1];
      unsigned int v7 = [v6 identifier];
      unsigned int v8 = [v4 objectAtIndexedSubscript:v5];
      id v9 = [v8 identifier];
      int v10 = [v7 isEqualToString:v9];

      int v59 = v10;
      if ((v10 & 1) == 0) {
        break;
      }
      ++v5;
    }
    while (v5 < [v4 count]);
  }
  else
  {
    int v59 = 1;
  }
  v58 = [(AFLocalizationManager *)self->_localizationManager _truncationSentinel];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v4;
  uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v62)
  {
    uint64_t v60 = *(void *)v68;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v68 != v60) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v67 + 1) + 8 * v11);
        id v13 = [v12 operationData];
        id v14 = &stru_26FCB48F0;
        if (!v13)
        {
          id v14 = [v12 value];
        }

        uint64_t v15 = [v12 label];
        if (v15)
        {
          id v16 = (void *)v15;
          int v17 = [v12 shouldAggregate];

          if (v17)
          {
            id v18 = [(AFLocalizationManager *)self->_localizationManager localizedStringForKey:@"LOCATION_AGGREGATED_NAME_AND_ADDRESS"];
            int v19 = NSString;
            id v66 = 0;
            v20 = [v12 label];
            id v21 = [v12 value];
            dispatch_block_t v22 = [v19 stringWithValidatedFormat:v18, @"%@%@", &v66, v20, v21 validFormatSpecifiers error];
            id v23 = v66;
            uint64_t v24 = &stru_26FCB48F0;
            if (v22) {
              uint64_t v24 = v22;
            }
            id v25 = v24;

            if (v23)
            {
              id v26 = AFSuggestionGenerationManagerOSLogFacility();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]();
              }
            }
            id v14 = v25;
          }
        }
        id v27 = AFSuggestionGenerationManagerOSLogFacility();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]();
        }

        uint64_t v28 = [(AFLocalizationManager *)self->_localizationManager localizedStringForKey:@"PARENTHESIZED_LABEL"];
        unint64_t v29 = [obj count];
        int v30 = [v12 flags];
        id v31 = [v12 label];
        if ([v31 length])
        {
          if (v29 > 1) {
            int v32 = v59;
          }
          else {
            int v32 = 0;
          }
          v33 = [v12 label];
          char v34 = [v33 isEqualToString:@"unlabeled"];

          id v35 = 0;
          BOOL v36 = 0;
          if (((v32 | v30) & 1) != 0 && (v34 & 1) == 0)
          {
            uint64_t v37 = [v12 label];
            id v35 = v37;
            BOOL v36 = v37 != 0;
            if (v30)
            {
              if (v37)
              {
                uint64_t v38 = v37;
                id v35 = v38;
                goto LABEL_48;
              }
            }
          }
        }
        else
        {

          BOOL v36 = 0;
          id v35 = 0;
        }
        long long v39 = [v12 name];

        if (v39 && v36)
        {
          long long v40 = NSString;
          id v65 = 0;
          id v41 = [v12 name];
          uint64_t v42 = [v41 stringByAppendingString:v58];
          uint64_t v43 = [v40 stringWithValidatedFormat:v28, @"%@%@", &v65, v42, v35 validFormatSpecifiers error];
          id v44 = v65;
          uint64_t v45 = &stru_26FCB48F0;
          if (v43) {
            uint64_t v45 = v43;
          }
          uint64_t v38 = v45;

          if (v44)
          {
            v46 = AFSuggestionGenerationManagerOSLogFacility();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]();
            }
          }
LABEL_48:
          uint64_t v50 = [v12 value];
          int v51 = [(__CFString *)v38 isEqualToString:v50];

          if (!v51) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
        uint64_t v47 = [v12 name];

        if (v47)
        {
          uint64_t v48 = [v12 name];
        }
        else
        {
          v49 = [v12 label];

          if (!v49)
          {
            uint64_t v38 = 0;
            goto LABEL_49;
          }
          uint64_t v48 = [v12 label];
        }
        uint64_t v38 = (__CFString *)v48;
        if (v48) {
          goto LABEL_48;
        }
LABEL_49:

        uint64_t v38 = &stru_26FCB48F0;
LABEL_50:
        v52 = [v12 value];
        if (([v12 flags] & 4) != 0)
        {
          uint64_t v53 = [v12 label];

          uint64_t v54 = [v12 name];

          uint64_t v38 = (__CFString *)v53;
          v52 = (void *)v54;
        }
        v55 = [[AFSuggestion alloc] initWithTitle:v38 subTitle:v14 usernameAndPasswordPayload:0 leadingImage:0 trailingImage:0 customInfoType:0];
        [v61 addObject:v55];

        ++v11;
      }
      while (v62 != v11);
      uint64_t v56 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      uint64_t v62 = v56;
    }
    while (v56);
  }

  return v61;
}

- (void)authenticateIfNecessaryForSuggestion:(id)a3 completionHandler:(id)a4
{
}

- (void)authenticateIfNecessaryForSuggestion:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  int v10 = [v20 usernameAndPasswordPayload];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = +[AFCredentialManager sharedInstance];
    uint64_t v13 = [v20 usernameAndPasswordPayload];
LABEL_5:
    id v16 = (void *)v13;
    [v12 shouldAcceptAutoFill:v20 withPayload:v13 documentTraits:v8 completionHandler:v9];

    goto LABEL_6;
  }
  id v14 = [v20 oneTimeCodePayload];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v12 = +[AFCredentialManager sharedInstance];
    uint64_t v13 = [v20 oneTimeCodePayload];
    goto LABEL_5;
  }
  int v17 = [v20 creditCardPayload];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    int v19 = [v20 creditCardPayload];
    [(AFSuggestionGenerationManager *)self _authenticateIfNecessaryForCreditCardSuggestion:v20 withPayload:v19 documentTraits:v8 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 1);
  }
LABEL_6:
}

- (BOOL)shouldAuthenticateToAcceptAutoFill
{
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v19 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getMCProfileConnectionClass_block_invoke;
    id v14 = &unk_265247EA0;
    uint64_t v15 = &v16;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 sharedConnection];
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v5 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  uint64_t v19 = getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_block_invoke;
    id v14 = &unk_265247EA0;
    uint64_t v15 = &v16;
    id v6 = (void *)ManagedConfigurationLibrary();
    unsigned int v7 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(void *)(v15[1] + 24) = v7;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr = *(void *)(v15[1] + 24);
    unint64_t v5 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v5)
  {
    int v10 = (_Unwind_Exception *)-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v10);
  }
  BOOL v8 = [v4 effectiveBoolValueForSetting:*v5] == 1;

  return v8;
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  v49[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (v10
      && (uint64_t v14 = [v10 customInfoType],
          [(AFSuggestionGenerationManager *)self shouldAuthenticateToAcceptAutoFill])&& v14 == 13)
    {
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2050000000;
      uint64_t v15 = (void *)getLAContextClass_softClass;
      uint64_t v45 = getLAContextClass_softClass;
      if (!getLAContextClass_softClass)
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __getLAContextClass_block_invoke;
        v41[3] = &unk_265247EA0;
        v41[4] = &v42;
        __getLAContextClass_block_invoke((uint64_t)v41);
        uint64_t v15 = (void *)v43[3];
      }
      uint64_t v16 = v15;
      _Block_object_dispose(&v42, 8);
      id v17 = objc_alloc_init(v16);
      [(AFSuggestionGenerationManager *)self setLaContext:v17];

      id v35 = (void *)MGCopyAnswer();
      uint64_t v18 = NSString;
      uint64_t v19 = +[AFSuggestionGenerationManager sharedInstance];
      id v20 = [v19 localizationManager];
      id v21 = [v20 localizedStringForKey:@"CREDIT_CARD_AUTH_PASSCODE_TITLE"];
      id v40 = 0;
      dispatch_block_t v22 = [v18 stringWithValidatedFormat:v21, @"%@", &v40, v35 validFormatSpecifiers error];
      id v36 = v40;
      id v23 = &stru_26FCB48F0;
      if (v22) {
        id v23 = v22;
      }
      char v34 = v23;

      uint64_t v24 = +[AFSuggestionGenerationManager sharedInstance];
      id v25 = [v24 localizationManager];
      id v26 = [v25 localizedStringForKey:@"CREDIT_CARD_AUTH_ALERT_TITLE"];

      if (v36)
      {
        id v27 = AFCredentialManagerOSLogFacility();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:]((uint64_t)v36);
        }
      }
      if (!v26) {
        -[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:]();
      }
      if ([v12 processId])
      {
        v48[0] = &unk_26FCB6328;
        v48[1] = &unk_26FCB6340;
        v49[0] = v26;
        v49[1] = v34;
        v49[2] = MEMORY[0x263EFFA88];
        v48[2] = &unk_26FCB6358;
        v48[3] = &unk_26FCB6370;
        uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "processId"));
        v49[3] = v28;
        unint64_t v29 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
      }
      else
      {
        v46[0] = &unk_26FCB6328;
        v46[1] = &unk_26FCB6340;
        v47[0] = v26;
        v47[1] = v34;
        v46[2] = &unk_26FCB6358;
        v47[2] = MEMORY[0x263EFFA88];
        unint64_t v29 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      }
      int v30 = [(AFSuggestionGenerationManager *)self laContext];
      id v39 = 0;
      int v31 = [v30 canEvaluatePolicy:2 error:&v39];
      id v32 = v39;

      if (v31)
      {
        v33 = [(AFSuggestionGenerationManager *)self laContext];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke;
        v37[3] = &unk_265247E78;
        v37[4] = self;
        id v38 = v13;
        [v33 evaluatePolicy:2 options:v29 reply:v37];
      }
      else
      {
        [(AFSuggestionGenerationManager *)self setLaContext:0];
        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      }
    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
}

void __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  BOOL v8 = __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke_2;
  id v9 = &unk_265247E50;
  id v4 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v4;
  id v5 = v3;
  AFDispatchAsync(MEMORY[0x263EF83A0], &v6);
  objc_msgSend(*(id *)(a1 + 32), "setLaContext:", 0, v6, v7, v8, v9);
}

uint64_t __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0);
}

- (AFLocalizationManager)localizationManager
{
  return self->_localizationManager;
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_localizationManager, 0);
  objc_storeStrong((id *)&self->_inputContextPredictionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = [NSString stringWithFormat:@"%s Couldn't get credentials from Safari: %@", "-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]", a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A7F000, v2, v3, "%@", v4);
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  v1 = NSString;
  uint64_t v9 = [a1 count];
  uint64_t v2 = [v1 stringWithFormat:@"%s Generated %lu credit card suggestions"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A7F000, v3, v4, "%@", v5, v6, v7, v8, (uint64_t)"-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]", v9, v10);
}

- (uint64_t)generateCreditCardAutoFillWithCompletionHandler:.cold.3()
{
  dlerror();
  int v0 = abort_report_np();
  return -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:](v0, v1, v2);
}

- (void)generateContactAutoFillSuggestionsWithTextPrefix:(void *)a1 documentTraits:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_248A7F000, log, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_1()
{
  int v0 = [NSString stringWithFormat:@"%s There were no prediction results."];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]_block_invoke", v7, v8);
}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_2(uint64_t a1, double a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = [NSString stringWithFormat:@"%s Error returned from InputContext: %@, response time = %lf seconds", "-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]_block_invoke", a1, *(void *)&a2];
  int v5 = 138412290;
  int v6 = v2;
  OUTLINED_FUNCTION_1(&dword_248A7F000, v3, v4, "%@", (uint8_t *)&v5);
}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.1()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key PARENTHESIZED_LABEL: %@", "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v2];
  _DWORD *v1 = 138412290;
  *int v0 = v3;
  OUTLINED_FUNCTION_3(&dword_248A7F000, v4, v5, "%@");
}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.2()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = NSString;
  uint64_t v5 = [v4 value];
  int v6 = [v3 stringWithFormat:@"%s Rendering results with value= %@", "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v5];
  *(_DWORD *)uint64_t v2 = 138412290;
  void *v1 = v6;
  _os_log_debug_impl(&dword_248A7F000, v0, OS_LOG_TYPE_DEBUG, "%@", v2, 0xCu);
}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.3()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key LOCATION_AGGREGATED_NAME_AND_ADDRESS: %@", "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v2];
  _DWORD *v1 = 138412290;
  *int v0 = v3;
  OUTLINED_FUNCTION_3(&dword_248A7F000, v4, v5, "%@");
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:.cold.1()
{
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = [NSString stringWithFormat:@"%s invalid localized format for key CREDIT_CARD_AUTH_PASSCODE_TITLE: %@", "-[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:]", a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A7F000, v2, v3, "%@", v4);
}

@end