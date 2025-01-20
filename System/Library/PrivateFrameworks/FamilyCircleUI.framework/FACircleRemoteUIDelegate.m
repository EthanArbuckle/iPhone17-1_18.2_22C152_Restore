@interface FACircleRemoteUIDelegate
+ (BOOL)isInternalBuild;
- (FACircleContext)context;
- (FACircleRemoteUIDelegate)init;
- (FACircleRemoteUIDelegate)initWithContext:(id)a3 serverHookHandler:(id)a4 pictureStore:(id)a5;
- (FACircleRemoteUIDelegateDelegate)delegate;
- (NSDictionary)dismissInfo;
- (id)getEmergencyContacts;
- (id)getIMessageHandlesForRecommendations;
- (id)getInviteSuggestionsDependencies;
- (id)getPresentationDecoratorWhenPendingMember:(id)a3 memberBeingViewed:(id)a4 page:(id)a5;
- (void)_broadcastServicesDidChangeNotification;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)_notifyDelegateOfCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_reportRequestFailureWithResponse:(id)a3;
- (void)_setUserInteractionForRUIPage:(id)a3 enabled:(BOOL)a4;
- (void)_updateDismissInfo:(id)a3;
- (void)configureHookHandlersForRUIController:(id)a3;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissInfo:(id)a3;
- (void)setIMessageHandlesForRecommendations:(id)a3;
@end

@implementation FACircleRemoteUIDelegate

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_2);
  }
  return isInternalBuild_isInternalBuild;
}

uint64_t __43__FACircleRemoteUIDelegate_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

- (FACircleRemoteUIDelegate)init
{
  return 0;
}

- (FACircleRemoteUIDelegate)initWithContext:(id)a3 serverHookHandler:(id)a4 pictureStore:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FACircleRemoteUIDelegate;
  v12 = [(FACircleRemoteUIDelegate *)&v36 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    v14 = (FARequestConfigurator *)objc_alloc_init(MEMORY[0x263F3BFA8]);
    requestConfigurator = v13->_requestConfigurator;
    v13->_requestConfigurator = v14;

    v16 = [v9 authContext];
    [(FARequestConfigurator *)v13->_requestConfigurator setAuthContext:v16];

    objc_storeStrong((id *)&v13->_serverHookHandler, a4);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objectModelDecorators = v13->_objectModelDecorators;
    v13->_objectModelDecorators = v17;

    objc_storeStrong((id *)&v13->_familyPictureStore, a5);
    v19 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    recommendations = v13->_recommendations;
    v13->_recommendations = v19;

    v13->_proactiveModelUsed = 1;
    v21 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    emergencyContacts = v13->_emergencyContacts;
    v13->_emergencyContacts = v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F3BF78]) initForOneTapInvite];
    suggester = v13->_suggester;
    v13->_suggester = (FAInviteSuggestions *)v23;

    v13->_accumulateDismissInfo = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v25 = objc_msgSend(v10, "serverHooks", 0);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v32 + 1) + 8 * v29);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v30 setRemoteUIDelegate:v13];
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v27);
    }
  }
  return v13;
}

- (void)configureHookHandlersForRUIController:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(FACircleRemoteUIDelegate *)self context];
  v6 = [v5 eventType];
  int v7 = [v6 isEqualToString:@"FACircleEventTypeFamilyPicker"];

  if (v7)
  {
    v8 = [(FACircleRemoteUIDelegate *)self context];
    id v9 = [v8 ephemeralAuthResults];
    id v10 = +[FAFamilyImageLoader shared];
    [v10 setAuthResults:v9];

    objc_initWeak(&location, self);
    id v11 = objc_alloc_init(FAPickerSelectMemberHook);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke;
    v33[3] = &unk_264348C38;
    objc_copyWeak(&v34, &location);
    [(FAPickerSelectMemberHook *)v11 setActivateAction:v33];
    v12 = [(AAUIServerUIHookHandler *)self->_serverHookHandler serverHooks];
    v13 = (void *)[v12 mutableCopy];

    [v13 addObject:v11];
    v14 = (void *)[v13 copy];
    [(AAUIServerUIHookHandler *)self->_serverHookHandler setServerHooks:v14];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  v15 = [(FACircleRemoteUIDelegate *)self context];
  v16 = [v15 authContext];
  v17 = [v16 appProvidedContext];
  int v18 = [v17 isEqualToString:*MEMORY[0x263F28F28]];

  if (v18)
  {
    self->_accumulateDismissInfo = 1;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v19 = [(AAUIServerUIHookHandler *)self->_serverHookHandler serverHooks];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = v23;
            v25 = [(FACircleRemoteUIDelegate *)self context];
            uint64_t v26 = [v25 ephemeralAuthResults];
            [v24 setEphemeralAuthResults:v26];

            [v24 setIsChildDevice:1];
            objc_initWeak(&location, self);
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke_2;
            v27[3] = &unk_264348C60;
            objc_copyWeak(&v28, &location);
            [v24 setCompletionAction:v27];
            objc_destroyWeak(&v28);
            objc_destroyWeak(&location);

            goto LABEL_14;
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v36 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

void __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke(id *a1, void *a2)
{
  v3 = [a2 clientInfo];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setDismissInfo:v3];

  id v5 = objc_loadWeakRetained(a1);
  [v5 _notifyDelegateOfCompletionWithSuccess:1 error:0];
}

void __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateDismissInfo:v3];
}

- (void)_notifyDelegateOfCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = v4;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate We have a delegate - notifying completion success: %d error: %@", (uint8_t *)v13, 0x12u);
    }

    id v9 = objc_alloc(MEMORY[0x263F3BEF0]);
    id v10 = [(FACircleRemoteUIDelegate *)self dismissInfo];
    id v11 = (void *)[v9 initWithLoadSuccess:v4 error:v6 userInfo:v10];

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 circleRemoteUIDelegate:self completedWithResponse:v11];
  }
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (NSURLRequest *)[v11 copy];
  cachedRequest = self->_cachedRequest;
  self->_cachedRequest = v14;

  uint64_t v16 = [(FACircleRemoteUIDelegate *)self context];
  v17 = [v16 ephemeralAuthResults];

  if (v17)
  {
    requestConfigurator = self->_requestConfigurator;
    v19 = [(FACircleRemoteUIDelegate *)self context];
    uint64_t v20 = [v19 ephemeralAuthResults];
    [(FARequestConfigurator *)requestConfigurator updateWithEphemeralAuthResults:v20];
  }
  objc_initWeak(&location, self);
  uint64_t v21 = self->_requestConfigurator;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v24[3] = &unk_264348C88;
  objc_copyWeak(&v27, &location);
  id v22 = v11;
  id v25 = v22;
  id v23 = v13;
  id v26 = v23;
  [(FARequestConfigurator *)v21 addFresnoHeadersToRequest:v22 withCompletion:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained context];
    id v10 = [v9 additionalParameters];

    if (v10)
    {
      id v11 = [v8 context];
      id v12 = [v11 additionalParameters];
      [v6 addEntriesFromDictionary:v12];
    }
    id v13 = [v8[14] clientName];
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F3BDA8]];

    __int16 v14 = [v8[14] clientBundleID];
    [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x263F3BDA0]];

    [MEMORY[0x263F3BFA8] addMessageEligibilityToPayload:v6];
    id v15 = [*(id *)(a1 + 32) HTTPMethod];
    int v16 = [v15 isEqualToString:@"POST"];

    if (v16) {
      [v8[1] addFresnoPayloadToRequest:*(void *)(a1 + 32) additionalPayload:v6];
    }
  }
  v17 = _FALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(a1, v17);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)getEmergencyContacts
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F20300]) initWithBlock:&__block_literal_global_59];
  return v2;
}

void __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v3 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v20 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    __int16 v14 = __getHKHealthStoreClass_block_invoke;
    id v15 = &unk_264348998;
    int v16 = &v17;
    __getHKHealthStoreClass_block_invoke((uint64_t)&v12);
    id v3 = (void *)v18[3];
  }
  BOOL v4 = v3;
  _Block_object_dispose(&v17, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v6 = (void *)getHKMedicalIDStoreClass_softClass;
  uint64_t v20 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    __int16 v14 = __getHKMedicalIDStoreClass_block_invoke;
    id v15 = &unk_264348998;
    int v16 = &v17;
    __getHKMedicalIDStoreClass_block_invoke((uint64_t)&v12);
    id v6 = (void *)v18[3];
  }
  int v7 = v6;
  _Block_object_dispose(&v17, 8);
  v8 = (void *)[[v7 alloc] initWithHealthStore:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke_2;
  v10[3] = &unk_264348CD0;
  id v11 = v2;
  id v9 = v2;
  [v8 fetchMedicalIDEmergencyContactsWithCompletion:v10];
}

uint64_t __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getIMessageHandlesForRecommendations
{
  id v3 = objc_alloc_init(IDSRecommendationProvider);
  BOOL v4 = [[IMessageHandlesForPeopleRecommendations alloc] initWithProvider:v3];
  id v5 = objc_alloc(MEMORY[0x263F20300]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__FACircleRemoteUIDelegate_getIMessageHandlesForRecommendations__block_invoke;
  v9[3] = &unk_264348CF8;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  int v7 = (void *)[v5 initWithBlock:v9];

  return v7;
}

uint64_t __64__FACircleRemoteUIDelegate_getIMessageHandlesForRecommendations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getRecommendationsWith:*(void *)(*(void *)(a1 + 40) + 48) completion:a2];
}

- (id)getInviteSuggestionsDependencies
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F20300];
  BOOL v4 = [(FACircleRemoteUIDelegate *)self getIMessageHandlesForRecommendations];
  v11[0] = v4;
  id v5 = [(FACircleRemoteUIDelegate *)self getEmergencyContacts];
  v11[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  int v7 = [v3 all:v6];
  v8 = [v7 then];
  id v9 = ((void (**)(void, void *))v8)[2](v8, &__block_literal_global_65);

  return v9;
}

id __60__FACircleRemoteUIDelegate_getInviteSuggestionsDependencies__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectAtIndexedSubscript:0];
  BOOL v4 = [MEMORY[0x263EFF9D0] null];
  if (v3 == v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v2 objectAtIndexedSubscript:0];
  }

  id v6 = [v2 objectAtIndexedSubscript:1];
  int v7 = [MEMORY[0x263EFF9D0] null];
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v2 objectAtIndexedSubscript:1];
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v9 setObject:v5 forKeyedSubscript:@"validIMessageHandles"];
  [v9 setObject:v8 forKeyedSubscript:@"emergencyContacts"];

  return v9;
}

- (void)setIMessageHandlesForRecommendations:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_recommendations;
  uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        int v7 = [v6 contact];
        v8 = [v7 emailAddressStrings];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v31;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
            __int16 v14 = (void *)_IDSCopyIDForEmailAddress();
            char v15 = [v4 containsObject:v14];

            if (v15) {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          int v16 = [v6 contact];
          v8 = [v16 phoneNumberStrings];

          uint64_t v17 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (!v17) {
            goto LABEL_24;
          }
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v27;
LABEL_16:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
            uint64_t v21 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
            char v22 = [v4 containsObject:v21];

            if (v22) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v18) {
                goto LABEL_16;
              }
              goto LABEL_24;
            }
          }
        }
        [v6 setIMessageHandle:v13];
LABEL_24:
      }
      uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v25);
  }
}

- (void)remoteUIController:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 defaultPages];
  uint64_t v10 = [v9 firstObject];

  if (+[FASuggestionsTableViewDecorator shouldShowSuggestionsInPage:v10])
  {
    uint64_t v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      suggester = self->_suggester;
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)suggester;
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "In shouldShowSuggestion, suggester is %@", buf, 0xCu);
    }

    uint64_t v13 = [v7 clientInfo];
    __int16 v14 = [v13 objectForKeyedSubscript:@"useSuggester"];

    char v15 = _FALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "Reading suggester model from RUI: %@", buf, 0xCu);
    }

    int v16 = [(FAInviteSuggestions *)self->_suggester fetchFamilyMemberSuggestions:&self->_proactiveModelUsed useSuggester:v14];
    recommendations = self->_recommendations;
    self->_recommendations = v16;

    uint64_t v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int64_t proactiveModelUsed = self->_proactiveModelUsed;
      *(_DWORD *)buf = 136315394;
      v53 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]";
      __int16 v54 = 2048;
      int64_t v55 = proactiveModelUsed;
      _os_log_impl(&dword_2189F0000, v18, OS_LOG_TYPE_DEFAULT, "%s: used proactive model %li for invite suggestions", buf, 0x16u);
    }

    NSUInteger v41 = [(NSArray *)self->_recommendations count];
    id v20 = objc_alloc(MEMORY[0x263F3BF70]);
    uint64_t v21 = [v7 clientInfo];
    char v22 = (void *)[v20 initWithResults:v21];

    id v23 = _FALogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v22 maxFamilySuggestions];
      uint64_t v25 = self->_recommendations;
      *(_DWORD *)buf = 136315650;
      v53 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]";
      __int16 v54 = 2048;
      int64_t v55 = v24;
      __int16 v56 = 2112;
      v57 = v25;
      _os_log_impl(&dword_2189F0000, v23, OS_LOG_TYPE_DEFAULT, "%s: Recommendations for %li spots: %@", buf, 0x20u);
    }

    [(FAProfilePictureStore *)self->_familyPictureStore fetchProfilePicturesForRecommendedFamilyMembers:self->_recommendations];
    if ([(NSArray *)self->_recommendations count])
    {
      long long v26 = [(FACircleRemoteUIDelegate *)self getInviteSuggestionsDependencies];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke;
      v47[3] = &unk_264348D40;
      v47[4] = self;
      id v48 = v22;
      id v50 = v8;
      NSUInteger v51 = v41;
      v49 = v14;
      [v26 onComplete:v47 onQueue:MEMORY[0x263EF83A0]];
    }
    else
    {
      v40 = v22;
      long long v28 = _FALogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2189F0000, v28, OS_LOG_TYPE_DEFAULT, "Recommendations are zero, no need to fetch dependencies", buf, 2u);
      }

      long long v29 = +[FamilyInviteAnalytics shared];
      NSUInteger v30 = [(NSArray *)self->_recommendations count];
      long long v31 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
      long long v32 = [v31 peopleSuggesterPredictionContext];
      long long v33 = [v32 seedContactIdentifiers];
      BOOL v34 = [v33 count] != 0;
      if (v14) {
        long long v35 = (__CFString *)v14;
      }
      else {
        long long v35 = @"-";
      }
      [v29 sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:v41 familySuggestionsDisplayedCount:v30 hasBoostedContacts:v34 proactiveModelUsed:self->_proactiveModelUsed serverRequestedModel:v35];

      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
      char v22 = v40;
    }
    if (+[FACircleRemoteUIDelegate isInternalBuild]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v36 = [MEMORY[0x263F63778] tapToRadarButton];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_88;
      v44[3] = &unk_264348AE0;
      long long v37 = v22;
      id v38 = v10;
      id v45 = v38;
      v46 = self;
      [v36 setAction:v44];
      v39 = v38;
      char v22 = v37;
      [v39 setLeftNavigationBarButtonItem:v36];
    }
LABEL_27:

    goto LABEL_28;
  }
  if (+[FAProfilePictureTableViewDecorator shouldShowPicturesInPage:v10])
  {
    __int16 v14 = (char *)objc_opt_new();
    [v14 setCachePolicy:1];
    [v14 setQualityOfService:33];
    long long v27 = _FALogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v27, OS_LOG_TYPE_DEFAULT, "Starting family request.", buf, 2u);
    }

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_95;
    v42[3] = &unk_264348DE0;
    v42[4] = self;
    id v43 = v8;
    [v14 startRequestWithCompletionHandler:v42];

    goto LABEL_27;
  }
  (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
LABEL_28:
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  NSUInteger v30 = v6;
  id v8 = [v5 objectForKeyedSubscript:@"validIMessageHandles"];
  [*(id *)(a1 + 32) setIMessageHandlesForRecommendations:v8];
  uint64_t v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 136315394;
    long long v32 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
    __int16 v33 = 2112;
    uint64_t v34 = v10;
    _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "%s: Recommendations before filtering: %@", buf, 0x16u);
  }

  uint64_t v11 = +[FASuggestionsHelper filterAndTrimMessagesHandleSuggestions:maxSuggestions:](FASuggestionsHelper, "filterAndTrimMessagesHandleSuggestions:maxSuggestions:", *(void *)(*(void *)(a1 + 32) + 48), [*(id *)(a1 + 40) maxFamilySuggestions]);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  __int16 v14 = _FALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 136315394;
    long long v32 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "%s: Final recommendations: %@", buf, 0x16u);
  }

  int v16 = [v5 objectForKeyedSubscript:@"emergencyContacts"];
  uint64_t v17 = _FALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v16 debugDescription];
    *(_DWORD *)buf = 138412290;
    long long v32 = v18;
    _os_log_impl(&dword_2189F0000, v17, OS_LOG_TYPE_DEFAULT, "EC returned from Health: %@", buf, 0xCu);
  }
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(v19 + 64);
  *(void *)(v19 + 64) = v16;
  id v21 = v16;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  char v22 = +[FamilyInviteAnalytics shared];
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 88) feedbackContext];
  long long v26 = [v25 peopleSuggesterPredictionContext];
  long long v27 = [v26 seedContactIdentifiers];
  uint64_t v28 = [v27 count];
  if (*(void *)(a1 + 48)) {
    long long v29 = *(__CFString **)(a1 + 48);
  }
  else {
    long long v29 = @"-";
  }
  [v22 sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:v23 familySuggestionsDisplayedCount:v24 hasBoostedContacts:v28 != 0 proactiveModelUsed:*(void *)(*(void *)(a1 + 32) + 56) serverRequestedModel:v29];
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_88(uint64_t a1)
{
  id v2 = _FALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v2, OS_LOG_TYPE_DEFAULT, "Suggestions tap-to-radar button tapped :(", buf, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x263F827A0]);
  id v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  id v7 = objc_msgSend(v3, "initWithSize:", v5, v6);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_90;
  v10[3] = &unk_264348D68;
  id v11 = *(id *)(a1 + 32);
  id v8 = [v7 imageWithActions:v10];
  uint64_t v9 = [[FamilySuggestionsTapToRadar alloc] initWithSuggestions:*(void *)(*(void *)(a1 + 40) + 48) screenshot:v8];
  [(FamilySuggestionsTapToRadar *)v9 open];
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_90(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2;
  v10[3] = &unk_264348DB8;
  id v11 = v6;
  id v7 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v7;
  uint64_t v12 = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2_cold_1(v2, v3);
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32) == 0);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 40) setFamilyCircle:*(void *)(a1 + 48)];
    id v4 = *(void **)(*(void *)(a1 + 40) + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_96;
    v5[3] = &unk_264348D90;
    id v6 = *(id *)(a1 + 56);
    [v4 fetchProfileImagesWithCompletion:v5];
  }
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_96(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_96_cold_1((uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 allHeaderFields];
  id v9 = [v8 valueForKey:*MEMORY[0x263F3BDC8]];

  [MEMORY[0x263F3BF10] handleURLResponse:v7];
  uint64_t v10 = [v7 allHeaderFields];
  id v11 = [v10 objectForKey:*MEMORY[0x263F3BDD8]];

  if (v11)
  {
    uint64_t v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate - Family services have changed", buf, 2u);
    }

    [(FACircleRemoteUIDelegate *)self _broadcastServicesDidChangeNotification];
  }
  id v13 = [v7 allHeaderFields];
  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F3C018]];

  if ([v14 length])
  {
    uint64_t v15 = _FALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = (uint64_t)v14;
      _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "Received a command to teardown followup with an identifier: %@", buf, 0xCu);
    }

    [MEMORY[0x263F3BF60] tearDownFollowupItemWithIdentifier:v14 completion:0];
  }
  if ([v7 statusCode] >= 400 && objc_msgSend(v7, "statusCode") <= 505)
  {
    int v16 = [v6 displayedPages];
    uint64_t v17 = [v16 firstObject];

    uint64_t v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v7 statusCode];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v19;
      _os_log_impl(&dword_2189F0000, v18, OS_LOG_TYPE_DEFAULT, "Family Circle RemoteUI request failed with status %ld", buf, 0xCu);
    }

    if ([v7 statusCode] == 401 && v17)
    {
      id v20 = _FALogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2189F0000, v20, OS_LOG_TYPE_DEFAULT, "Recieved a 401, attempting re-auth", buf, 2u);
      }

      p_cachedPage = &self->_cachedPage;
      if (v17 == self->_cachedPage)
      {
        uint64_t v24 = _FALogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[FACircleRemoteUIDelegate remoteUIController:didReceiveHTTPResponse:](v24);
        }

        uint64_t v23 = *p_cachedPage;
        *p_cachedPage = 0;
      }
      else
      {
        objc_storeStrong((id *)&self->_cachedPage, v17);
        [(FACircleRemoteUIDelegate *)self _setUserInteractionForRUIPage:v17 enabled:0];
        requestConfigurator = self->_requestConfigurator;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke;
        v25[3] = &unk_264348E08;
        v25[4] = self;
        long long v26 = v17;
        id v27 = v6;
        id v28 = v7;
        [(FARequestConfigurator *)requestConfigurator renewCredentialsWithCompletion:v25];

        uint64_t v23 = v26;
      }
    }
    else
    {
      [(FACircleRemoteUIDelegate *)self _reportRequestFailureWithResponse:v7];
    }
  }
}

uint64_t __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = a1 + 32;
  [*(id *)(a1 + 32) _setUserInteractionForRUIPage:*(void *)(a1 + 40) enabled:1];
  if (a2)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke_cold_1(v4, v5);
    }

    return [*(id *)(a1 + 48) loadRequest:*(void *)(*(void *)(a1 + 32) + 24) completion:0];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    return [v7 _reportRequestFailureWithResponse:v8];
  }
}

- (void)_setUserInteractionForRUIPage:(id)a3 enabled:(BOOL)a4
{
  id v5 = a3;
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:]((uint64_t)v5, a4, v6);
  }

  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__FACircleRemoteUIDelegate__setUserInteractionForRUIPage_enabled___block_invoke;
    v8[3] = &unk_264348E30;
    id v9 = v5;
    BOOL v10 = a4;
    dispatch_async(MEMORY[0x263EF83A0], v8);
    id v7 = v9;
  }
  else
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:](v7);
    }
  }
}

uint64_t __66__FACircleRemoteUIDelegate__setUserInteractionForRUIPage_enabled___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "buttonItems", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) setEnabled:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = [*(id *)(a1 + 32) view];
  [v7 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 40)];

  return [*(id *)(a1 + 32) setLoading:*(unsigned char *)(a1 + 40) == 0];
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v9 displayedPages];
    uint64_t v8 = [v7 count];

    if (!v8) {
      [(FACircleRemoteUIDelegate *)self _notifyDelegateOfCompletionWithSuccess:0 error:v6];
    }
  }
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  self->_isReplacing = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = objc_msgSend(v9, "allPages", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setHidesBottomBarWhenPushed:1];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(FACircleRemoteUIDelegate *)self _handleObjectModelChangeForController:v8 objectModel:v9 isModal:v5];
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 circleRemoteUIDelegateDidPresent:self];
  }
}

- (id)getPresentationDecoratorWhenPendingMember:(id)a3 memberBeingViewed:(id)a4 page:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 tableViewOM];
  long long v10 = [v9 tableView];

  uint64_t v11 = [(FACircleContext *)self->_context userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F3C028]];

  if (v12)
  {
    uint64_t v13 = [FAProfileViewTableViewDecorator alloc];
    uint64_t v14 = [v8 tableViewOM];
    long long v15 = [(FAProfileViewTableViewDecorator *)v13 initWithTableView:v10 ruiTableView:v14 forPerson:v7 pictureStore:self->_familyPictureStore];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 identifier];
    *(_DWORD *)buf = 138412290;
    v46 = v11;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "handleObjectModelChangeForController - %@", buf, 0xCu);
  }
  uint64_t v12 = [v9 defaultPages];
  uint64_t v13 = [v12 firstObject];

  if ([v13 hasTableView])
  {
    uint64_t v14 = [v9 sourceURL];

    if (v14)
    {
      long long v15 = [v13 tableViewOM];
      long long v16 = [v15 tableView];

      long long v17 = [(FACircleContext *)self->_context userInfo];
      uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F3C028]];

      v44 = (void *)v18;
      uint64_t v19 = [(FACircleRemoteUIDelegate *)self getPresentationDecoratorWhenPendingMember:v9 memberBeingViewed:v18 page:v13];
      if (v19)
      {
        uint64_t v20 = [FAProfilePictureTableViewDecorator alloc];
        id v21 = [v13 tableViewOM];
        char v22 = [(FAProfilePictureTableViewDecorator *)v20 initWithTableView:v19 ruiTableView:v21 pictureStore:self->_familyPictureStore];

        uint64_t v23 = v22;
        uint64_t v24 = (uint64_t)v23;
      }
      else
      {
        if (!+[FAProfilePictureTableViewDecorator shouldShowPicturesInPage:v13])
        {
          uint64_t v23 = 0;
          goto LABEL_10;
        }
        uint64_t v25 = [FAProfilePictureTableViewDecorator alloc];
        long long v26 = [v13 tableViewOM];
        uint64_t v24 = [(FAProfilePictureTableViewDecorator *)v25 initWithTableView:v16 ruiTableView:v26 pictureStore:self->_familyPictureStore];

        objectModelDecorators = self->_objectModelDecorators;
        id v28 = [v9 sourceURL];
        [(NSMutableDictionary *)objectModelDecorators setObject:v24 forKey:v28];

        uint64_t v23 = 0;
      }

      long long v16 = (void *)v24;
LABEL_10:
      if (+[FASuggestionsTableViewDecorator shouldShowSuggestionsInPage:v13])
      {
        id v29 = objc_alloc(MEMORY[0x263F3BF70]);
        [v9 clientInfo];
        uint64_t v30 = v43 = v23;
        uint64_t v31 = (void *)[v29 initWithResults:v30];

        long long v32 = [FASuggestionsTableViewDecorator alloc];
        __int16 v33 = [v13 tableViewOM];
        uint64_t v34 = [(FASuggestionsTableViewDecorator *)v32 initWithTableView:v16 ruiTableView:v33 pictureStore:self->_familyPictureStore recommendations:self->_recommendations proactiveModelUsed:self->_proactiveModelUsed emergencyContacts:self->_emergencyContacts context:v31 viewController:v8 suggester:self->_suggester objectModel:v9];

        uint64_t v35 = self->_objectModelDecorators;
        long long v36 = [v9 sourceURL];
        [(NSMutableDictionary *)v35 setObject:v34 forKey:v36];

        long long v16 = (void *)v34;
        uint64_t v23 = v43;
      }
      long long v37 = [_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator alloc];
      id v38 = [v13 tableViewOM];
      v39 = [(FASettingsPresetsTableViewDecorator *)v37 initWithTableView:v16 ruiTableView:v38 parentViewController:v13];

      v40 = v39;
      NSUInteger v41 = self->_objectModelDecorators;
      v42 = [v9 sourceURL];
      [(NSMutableDictionary *)v41 setObject:v40 forKey:v42];
    }
  }
  [(AAUIServerUIHookHandler *)self->_serverHookHandler processObjectModel:v9 isModal:v5];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  BOOL v5 = [a3 _objectModels];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    [(FACircleRemoteUIDelegate *)self _notifyDelegateOfCompletionWithSuccess:1 error:0];
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  [(FACircleRemoteUIDelegate *)self _notifyDelegateOfCompletionWithSuccess:1 error:0];
  objectModelDecorators = self->_objectModelDecorators;
  [(NSMutableDictionary *)objectModelDecorators removeAllObjects];
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7 = a4;
  id v8 = [v7 sourceURL];
  id v9 = [v8 absoluteString];
  [v9 rangeOfString:*MEMORY[0x263F3BD98]];
  uint64_t v11 = v10;

  if (v11)
  {
    *a5 = 4;
LABEL_9:
    [(FACircleRemoteUIDelegate *)self _updateDismissInfo:0];
    goto LABEL_10;
  }
  if (*a5 != 1) {
    goto LABEL_9;
  }
  [(AAUIServerUIHookHandler *)self->_serverHookHandler processObjectModel:v7 isModal:0];
  uint64_t v12 = [v7 clientInfo];
  [(FACircleRemoteUIDelegate *)self _updateDismissInfo:v12];

  uint64_t v13 = [(FACircleRemoteUIDelegate *)self dismissInfo];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    long long v15 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 1)
    {
      long long v17 = _FALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[FACircleRemoteUIDelegate remoteUIController:didReceiveObjectModel:actionSignal:](v17);
      }

      uint64_t v18 = (void *)MEMORY[0x263F3BEE8];
      uint64_t v19 = [(FACircleRemoteUIDelegate *)self dismissInfo];
      [v18 broadcastRemoteUIWillDismissNotification:v19];
    }
  }
LABEL_10:
  self->_isReplacing = *a5 == 3;
  if (*a5 == 7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      [v21 circleRemoteUIDelegateDidPresent:self];
    }
  }
}

- (NSDictionary)dismissInfo
{
  return self->_dismissInfo;
}

- (void)_updateDismissInfo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_accumulateDismissInfo)
  {
    BOOL v5 = (void *)[(NSDictionary *)self->_dismissInfo mutableCopy];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v8 = v7;

    [(NSDictionary *)v8 addEntriesFromDictionary:v10];
  }
  else
  {
    id v8 = (NSDictionary *)v4;
  }
  dismissInfo = self->_dismissInfo;
  self->_dismissInfo = v8;
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!self->_isReplacing)
  {
    id v7 = [v12 displayedPages];
    uint64_t v8 = [v7 count];

    if (!v8) {
      [(FACircleRemoteUIDelegate *)self _notifyDelegateOfCompletionWithSuccess:1 error:0];
    }
  }
  id v9 = [v6 sourceURL];

  if (v9)
  {
    objectModelDecorators = self->_objectModelDecorators;
    uint64_t v11 = [v6 sourceURL];
    [(NSMutableDictionary *)objectModelDecorators removeObjectForKey:v11];
  }
}

- (void)_reportRequestFailureWithResponse:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F3BDB8];
  uint64_t v10 = *MEMORY[0x263F3BDC0];
  v11[0] = a3;
  id v6 = NSDictionary;
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = [v4 errorWithDomain:v5 code:-1002 userInfo:v8];

  [(FACircleRemoteUIDelegate *)self _notifyDelegateOfCompletionWithSuccess:0 error:v9];
}

- (void)_broadcastServicesDidChangeNotification
{
}

- (void)setDismissInfo:(id)a3
{
}

- (FACircleContext)context
{
  return self->_context;
}

- (FACircleRemoteUIDelegateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FACircleRemoteUIDelegateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dismissInfo, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_cachedPage, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_objectModelDecorators, 0);
  objc_storeStrong((id *)&self->_cachedRequest, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
}

void __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 allHTTPHeaderFields];
  id v6 = [*(id *)(a1 + 32) HTTPBody];
  int v7 = 136381443;
  uint64_t v8 = "-[FACircleRemoteUIDelegate remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]_block_invoke";
  __int16 v9 = 2113;
  uint64_t v10 = v4;
  __int16 v11 = 2113;
  id v12 = v5;
  __int16 v13 = 2113;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "%{private}s request: %{private}@, headers: %{private}@, body: %{private}@", (uint8_t *)&v7, 0x2Au);
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "%s: Error %@", (uint8_t *)&v2, 0x16u);
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error fetching family circle: %@", (uint8_t *)&v3, 0xCu);
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_96_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error fetching profile images: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIController:(os_log_t)log didReceiveHTTPResponse:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "We're in a 401 loop, bailing", v1, 2u);
}

void __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "Family replaying RUI request %@", (uint8_t *)&v3, 0xCu);
}

- (void)_setUserInteractionForRUIPage:(os_log_t)log enabled:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "No page provided to toggle user interaction", v1, 2u);
}

- (void)_setUserInteractionForRUIPage:(os_log_t)log enabled:.cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = @"NO";
  uint64_t v5 = "-[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:]";
  int v4 = 136315650;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  if (a2) {
    int v3 = @"YES";
  }
  __int16 v8 = 2112;
  __int16 v9 = v3;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "%s page:%@ enabled:%@", (uint8_t *)&v4, 0x20u);
}

- (void)remoteUIController:(os_log_t)log didReceiveObjectModel:actionSignal:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Broadcasting remote dismiss", v1, 2u);
}

@end