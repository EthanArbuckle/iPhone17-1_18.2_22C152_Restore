@interface CKContextRecentsPredictionManager
- (CKContextRecentsCache)recentsCache;
- (CKContextRecentsPredictionManager)init;
- (CKContextRecentsPredictionManagerDelegate)delegate;
- (id)_localizedStringForKey:(id)a3;
- (id)_modeForModeIdentifier:(id)a3 withConfigurations:(id)a4;
- (id)_oftenUsedStringForMode:(id)a3;
- (id)_recentlyUsedStringForMode:(id)a3;
- (id)_recentsEligibleForDonationMatchingMode:(id)a3 fromRecents:(id)a4 uuidsToCounts:(id)a5;
- (id)_retrieveModeConfigurations;
- (id)_userFacingReasonStringForRecentWithNumberOfInstances:(unint64_t)a3 mode:(id)a4;
- (id)eligiblePredictionsMatchingMode:(id)a3 forRecents:(id)a4 uuidsToCounts:(id)a5;
- (int64_t)_suggestionConfidenceForRecent:(id)a3 withCount:(unint64_t)a4;
- (void)_clearSuggestions;
- (void)_createClientModelIfNecessary;
- (void)_createDoNotDisturbServiceIfNecessary;
- (void)_handleModeChangeToModeWithUUIDString:(id)a3 forCache:(id)a4;
- (void)_retrieveModeConfigurations;
- (void)_updateBlendingLayerWithSuggestions:(id)a3;
- (void)dealloc;
- (void)didInitiatePruningMaintenanceTaskForCache:(id)a3 existingRecentsUUIDs:(id)a4;
- (void)modeDidChangeToModeWithUUIDString:(id)a3 forCache:(id)a4;
- (void)retrievePredictionsForMode:(id)a3 withReply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startContributingPredictions;
- (void)stopContributingPredictions;
@end

@implementation CKContextRecentsPredictionManager

- (CKContextRecentsPredictionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKContextRecentsPredictionManager;
  v2 = [(CKContextRecentsPredictionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26DAC3C50];
    v4 = (void *)kBundleIdentifiersToNotSuggest;
    kBundleIdentifiersToNotSuggest = v3;

    dispatch_queue_t v5 = dispatch_queue_create("CKContextRecentsPredictionManager reporting queue", 0);
    suggestionReportingQueue = v2->_suggestionReportingQueue;
    v2->_suggestionReportingQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(CKContextRecentsPredictionManager *)self stopContributingPredictions];
  v3.receiver = self;
  v3.super_class = (Class)CKContextRecentsPredictionManager;
  [(CKContextRecentsPredictionManager *)&v3 dealloc];
}

- (void)startContributingPredictions
{
  recentsCache = self->_recentsCache;
  if (!recentsCache)
  {
    v4 = [[CKContextRecentsCache alloc] initWithCacheConfiguration:1];
    dispatch_queue_t v5 = self->_recentsCache;
    self->_recentsCache = v4;

    recentsCache = self->_recentsCache;
  }
  [(CKContextRecentsCache *)recentsCache setDelegate:self];
  [(CKContextRecentsPredictionManager *)self _clearSuggestions];
}

- (void)stopContributingPredictions
{
  [(CKContextRecentsCache *)self->_recentsCache setDelegate:0];
  [(CKContextRecentsPredictionManager *)self _clearSuggestions];
}

- (void)_createClientModelIfNecessary
{
  if (!self->_clientModel)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    objc_super v3 = (void *)getATXProactiveSuggestionClientModelClass_softClass;
    uint64_t v11 = getATXProactiveSuggestionClientModelClass_softClass;
    if (!getATXProactiveSuggestionClientModelClass_softClass)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __getATXProactiveSuggestionClientModelClass_block_invoke;
      v7[3] = &unk_2647D2E60;
      v7[4] = &v8;
      __getATXProactiveSuggestionClientModelClass_block_invoke((uint64_t)v7);
      objc_super v3 = (void *)v9[3];
    }
    v4 = v3;
    _Block_object_dispose(&v8, 8);
    dispatch_queue_t v5 = (ATXProactiveSuggestionClientModel *)[[v4 alloc] initWithClientModelId:@"ck_universal_recents" requestDelegate:0];
    clientModel = self->_clientModel;
    self->_clientModel = v5;
  }
}

- (void)didInitiatePruningMaintenanceTaskForCache:(id)a3 existingRecentsUUIDs:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 didInitiatePruningMaintenanceTaskForManager:self existingRecentsUUIDs:v8];
  }
}

- (void)_clearSuggestions
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Clearing suggestions to ATX", v0, 2u);
}

- (void)modeDidChangeToModeWithUUIDString:(id)a3 forCache:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Mode did change to mode with identifier: %@", buf, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  id suggestionsContributionBlock = v8->_suggestionsContributionBlock;
  if (suggestionsContributionBlock)
  {
    dispatch_block_cancel(suggestionsContributionBlock);
    id v10 = v8->_suggestionsContributionBlock;
    v8->_id suggestionsContributionBlock = 0;

    suggestionDonationTransaction = v8->_suggestionDonationTransaction;
    v8->_suggestionDonationTransaction = 0;
  }
  objc_initWeak((id *)buf, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CKContextRecentsPredictionManager_modeDidChangeToModeWithUUIDString_forCache___block_invoke;
  block[3] = &unk_2647D2D78;
  objc_copyWeak(&v21, (id *)buf);
  id v12 = v6;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id v15 = v8->_suggestionsContributionBlock;
  v8->_id suggestionsContributionBlock = v14;

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Scheduling predictions contribution", v17, 2u);
  }
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  dispatch_after(v16, (dispatch_queue_t)v8->_suggestionReportingQueue, v8->_suggestionsContributionBlock);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  objc_sync_exit(v8);
}

void __80__CKContextRecentsPredictionManager_modeDidChangeToModeWithUUIDString_forCache___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    objc_super v3 = WeakRetained;
    objc_sync_enter(v3);
    uint64_t v4 = os_transaction_create();
    dispatch_queue_t v5 = (void *)v3[6];
    v3[6] = v4;

    [v3 _handleModeChangeToModeWithUUIDString:*(void *)(a1 + 32) forCache:*(void *)(a1 + 40)];
    id v6 = (void *)v3[2];
    v3[2] = 0;

    objc_sync_exit(v3);
    id WeakRetained = v7;
  }
}

- (void)_handleModeChangeToModeWithUUIDString:(id)a3 forCache:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Handling mode change to mode: %@", buf, 0xCu);
  }
  [(CKContextRecentsPredictionManager *)self _clearSuggestions];
  if ([v6 length])
  {
    objc_initWeak((id *)buf, self);
    recentsCache = self->_recentsCache;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke;
    v10[3] = &unk_2647D2DA0;
    objc_copyWeak(&v13, (id *)buf);
    id v11 = v6;
    id v12 = self;
    [(CKContextRecentsCache *)recentsCache retrieveRecentsForPredictionWithReply:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    suggestionDonationTransaction = self->_suggestionDonationTransaction;
    self->_suggestionDonationTransaction = 0;
  }
}

void __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v57 = a2;
  id v65 = a3;
  uint64_t v61 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v57 count] && objc_msgSend(v65, "count"))
    {
      v64 = WeakRetained;
      v56 = [WeakRetained _recentsEligibleForDonationMatchingMode:*(void *)(a1 + 32) fromRecents:v57 uuidsToCounts:v65];
      if ([v56 count])
      {
        [WeakRetained _createClientModelIfNecessary];
        uint64_t v60 = [WeakRetained _retrieveModeConfigurations];
        id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id obj = v56;
        uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
        if (v63)
        {
          uint64_t v62 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v72 != v62) {
                objc_enumerationMutation(obj);
              }
              id v7 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              context = (void *)MEMORY[0x22A6640A0]();
              id v8 = objc_alloc(MEMORY[0x263F08D38]);
              v9 = [v7 userActivityData];
              v70 = (void *)[v8 _initWithUserActivityData:v9];

              uint64_t v80 = 0;
              v81 = &v80;
              uint64_t v82 = 0x2050000000;
              id v10 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass;
              uint64_t v83 = getATXProactiveSuggestionClientModelSpecificationClass_softClass;
              if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass)
              {
                *(void *)buf = MEMORY[0x263EF8330];
                uint64_t v76 = 3221225472;
                v77 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke;
                v78 = &unk_2647D2E60;
                v79 = &v80;
                __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke((uint64_t)buf);
                id v10 = (void *)v81[3];
              }
              id v11 = v10;
              _Block_object_dispose(&v80, 8);
              v69 = (void *)[[v11 alloc] initWithClientModelId:@"ck_universal_recents" clientModelVersion:@"1.0"];
              id v12 = [v7 title];
              if ([v12 length])
              {
                id v13 = [v7 uuid];
                dispatch_block_t v14 = [v65 objectForKeyedSubscript:v13];
                unsigned int v15 = [v14 unsignedIntValue];

                uint64_t v16 = [v7 modeIdentifier];
                v67 = [v64 _modeForModeIdentifier:v16 withConfigurations:v60];

                v17 = [v64 _userFacingReasonStringForRecentWithNumberOfInstances:v15 mode:v67];
                v66 = [v7 associatedBundleId];
                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v18 = (void *)getATXActionClass_softClass;
                uint64_t v83 = getATXActionClass_softClass;
                if (!getATXActionClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXActionClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXActionClass_block_invoke((uint64_t)buf);
                  v18 = (void *)v81[3];
                }
                id v19 = v18;
                _Block_object_dispose(&v80, 8);
                id v20 = [v19 alloc];
                id v21 = objc_alloc(MEMORY[0x263F08C38]);
                v22 = [v7 uuid];
                id v23 = (void *)[v21 initWithUUIDString:v22];
                LOBYTE(v55) = 0;
                uint64_t v24 = (void *)[v20 initWithNSUserActivity:v70 actionUUID:v23 bundleId:v66 contentAttributeSet:0 itemIdentifier:0 heuristic:@"ck_universal_recents_mode" heuristicMetadata:0 criteria:0 isFutureMedia:v55 title:v12 subtitle:v17];

                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v25 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass;
                uint64_t v83 = getATXProactiveSuggestionExecutableSpecificationClass_softClass;
                if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke((uint64_t)buf);
                  v25 = (void *)v81[3];
                }
                v26 = v25;
                _Block_object_dispose(&v80, 8);
                id v27 = [v26 alloc];
                v28 = NSString;
                v29 = [v7 title];
                v30 = [v28 stringWithFormat:@"Recent with title: %@", v29];
                v31 = [v7 uuid];
                v32 = (void *)[v27 initWithExecutableObject:v24 executableDescription:v30 executableIdentifier:v31 suggestionExecutableType:2];

                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v33 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass;
                uint64_t v83 = getATXProactiveSuggestionUISpecificationClass_softClass;
                if (!getATXProactiveSuggestionUISpecificationClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXProactiveSuggestionUISpecificationClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXProactiveSuggestionUISpecificationClass_block_invoke((uint64_t)buf);
                  v33 = (void *)v81[3];
                }
                v34 = v33;
                _Block_object_dispose(&v80, 8);
                id v35 = [v34 alloc];
                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v36 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass;
                uint64_t v83 = getATXProactiveSuggestionLayoutConfigClass_softClass;
                if (!getATXProactiveSuggestionLayoutConfigClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXProactiveSuggestionLayoutConfigClass_block_invoke((uint64_t)buf);
                  v36 = (void *)v81[3];
                }
                id v37 = v36;
                _Block_object_dispose(&v80, 8);
                v38 = [v37 layoutConfigurationsForLayoutOptions:40];
                LOWORD(v54) = 256;
                v39 = objc_msgSend(v35, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v12, v17, v17, v38, 1, 1, v54);

                v40 = *(void **)(v61 + 40);
                v41 = [v7 uuid];
                v42 = [v65 objectForKeyedSubscript:v41];
                uint64_t v43 = objc_msgSend(v40, "_suggestionConfidenceForRecent:withCount:", v7, objc_msgSend(v42, "unsignedIntegerValue"));

                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v44 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass;
                uint64_t v83 = getATXProactiveSuggestionScoreSpecificationClass_softClass;
                if (!getATXProactiveSuggestionScoreSpecificationClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXProactiveSuggestionScoreSpecificationClass_block_invoke((uint64_t)buf);
                  v44 = (void *)v81[3];
                }
                v45 = v44;
                _Block_object_dispose(&v80, 8);
                v46 = (void *)[[v45 alloc] initWithRawScore:v43 suggestedConfidenceCategory:1.0];
                uint64_t v80 = 0;
                v81 = &v80;
                uint64_t v82 = 0x2050000000;
                v47 = (void *)getATXProactiveSuggestionClass_softClass;
                uint64_t v83 = getATXProactiveSuggestionClass_softClass;
                if (!getATXProactiveSuggestionClass_softClass)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  uint64_t v76 = 3221225472;
                  v77 = __getATXProactiveSuggestionClass_block_invoke;
                  v78 = &unk_2647D2E60;
                  v79 = &v80;
                  __getATXProactiveSuggestionClass_block_invoke((uint64_t)buf);
                  v47 = (void *)v81[3];
                }
                v48 = v47;
                _Block_object_dispose(&v80, 8);
                v49 = (void *)[[v48 alloc] initWithClientModelSpecification:v69 executableSpecification:v32 uiSpecification:v39 scoreSpecification:v46];
                if (v49) {
                  [v58 addObject:v49];
                }
              }
            }
            uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
          }
          while (v63);
        }

        if ([v58 count])
        {
          [v64 _updateBlendingLayerWithSuggestions:v58];
          v50 = v64;
        }
        else
        {
          v50 = v64;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "There were no new suggestions for ATX", buf, 2u);
          }
        }
        v53 = (void *)v50[6];
        v50[6] = 0;

        v52 = (void *)v60;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
          __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke_cold_1();
        }
        v52 = (void *)WeakRetained[6];
        WeakRetained[6] = 0;
      }

      id WeakRetained = v64;
    }
    else
    {
      v51 = (void *)WeakRetained[6];
      WeakRetained[6] = 0;
    }
  }
}

- (void)_updateBlendingLayerWithSuggestions:(id)a3
{
  clientModel = self->_clientModel;
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 >= 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);

  [(ATXProactiveSuggestionClientModel *)clientModel updateSuggestions:v8 completionHandler:&__block_literal_global];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_45;
  v12[3] = &unk_2647D2DE8;
  objc_copyWeak(&v13, &location);
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, v12);
  id suggestionsClearingBlock = self->_suggestionsClearingBlock;
  self->_id suggestionsClearingBlock = v9;

  dispatch_time_t v11 = dispatch_time(0, 300000000000);
  dispatch_after(v11, (dispatch_queue_t)self->_suggestionReportingQueue, self->_suggestionsClearingBlock);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((v4 || (a2 & 1) == 0) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_cold_1();
  }
}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    [WeakRetained _clearSuggestions];
    v2 = (void *)v3[3];
    v3[3] = 0;

    id WeakRetained = v3;
  }
}

- (id)_userFacingReasonStringForRecentWithNumberOfInstances:(unint64_t)a3 mode:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 name];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if (a3 > 4) {
      [(CKContextRecentsPredictionManager *)self _oftenUsedStringForMode:v6];
    }
    else {
    uint64_t v9 = [(CKContextRecentsPredictionManager *)self _recentlyUsedStringForMode:v6];
    }
  }
  else
  {
    if (a3 > 4) {
      id v10 = @"Often used during this Focus";
    }
    else {
      id v10 = @"Recently used during this Focus";
    }
    uint64_t v9 = [(CKContextRecentsPredictionManager *)self _localizedStringForKey:v10];
  }
  dispatch_time_t v11 = (void *)v9;

  return v11;
}

- (id)_oftenUsedStringForMode:(id)a3
{
  id v4 = a3;
  switch([v4 semanticType])
  {
    case -1:
      id v5 = NSString;
      id v6 = [(CKContextRecentsPredictionManager *)self _localizedStringForKey:@"Often used during %@ Focus"];
      uint64_t v7 = [v4 name];
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      uint64_t v8 = @"Often used during Do Not Disturb";
      goto LABEL_13;
    case 1:
      uint64_t v8 = @"Often used during Sleep Focus";
      goto LABEL_13;
    case 2:
      uint64_t v8 = @"Often used during Driving Focus";
      goto LABEL_13;
    case 3:
      uint64_t v8 = @"Often used during Fitness Focus";
      goto LABEL_13;
    case 4:
      uint64_t v8 = @"Often used during Work Focus";
      goto LABEL_13;
    case 5:
      uint64_t v8 = @"Often used during Personal Focus";
      goto LABEL_13;
    case 6:
      uint64_t v8 = @"Often used during Reading Focus";
      goto LABEL_13;
    case 7:
      uint64_t v8 = @"Often used during Gaming Focus";
      goto LABEL_13;
    case 8:
      uint64_t v8 = @"Often used during Mindfulness Focus";
      goto LABEL_13;
    case 9:
      uint64_t v8 = @"Often used during Reduce Interruptions Focus";
LABEL_13:
      self = [(CKContextRecentsPredictionManager *)self _localizedStringForKey:v8];
      break;
    default:
      break;
  }

  return self;
}

- (id)_recentlyUsedStringForMode:(id)a3
{
  id v4 = a3;
  switch([v4 semanticType])
  {
    case -1:
      id v5 = NSString;
      id v6 = [(CKContextRecentsPredictionManager *)self _localizedStringForKey:@"Recently used during %@ Focus"];
      uint64_t v7 = [v4 name];
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      uint64_t v8 = @"Recently used during Do Not Disturb";
      goto LABEL_13;
    case 1:
      uint64_t v8 = @"Recently used during Sleep Focus";
      goto LABEL_13;
    case 2:
      uint64_t v8 = @"Recently used during Driving Focus";
      goto LABEL_13;
    case 3:
      uint64_t v8 = @"Recently used during Fitness Focus";
      goto LABEL_13;
    case 4:
      uint64_t v8 = @"Recently used during Work Focus";
      goto LABEL_13;
    case 5:
      uint64_t v8 = @"Recently used during Personal Focus";
      goto LABEL_13;
    case 6:
      uint64_t v8 = @"Recently used during Reading Focus";
      goto LABEL_13;
    case 7:
      uint64_t v8 = @"Recently used during Gaming Focus";
      goto LABEL_13;
    case 8:
      uint64_t v8 = @"Recently used during Mindfulness Focus";
      goto LABEL_13;
    case 9:
      uint64_t v8 = @"Recently used during Reduce Interruptions Focus";
LABEL_13:
      self = [(CKContextRecentsPredictionManager *)self _localizedStringForKey:v8];
      break;
    default:
      break;
  }

  return self;
}

- (int64_t)_suggestionConfidenceForRecent:(id)a3 withCount:(unint64_t)a4
{
  id v5 = a3;
  if (a4 < 0xB)
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (a4 < 6)
    {
      if (v7) {
        -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:](v5);
      }
      int64_t v6 = 2;
    }
    else
    {
      if (v7) {
        -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:](v5);
      }
      int64_t v6 = 3;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:](v5);
    }
    int64_t v6 = 4;
  }

  return v6;
}

- (id)eligiblePredictionsMatchingMode:(id)a3 forRecents:(id)a4 uuidsToCounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    dispatch_time_t v11 = [(CKContextRecentsPredictionManager *)self _recentsEligibleForDonationMatchingMode:v8 fromRecents:v9 uuidsToCounts:v10];
  }
  else
  {
    dispatch_time_t v11 = (void *)MEMORY[0x263EFFA68];
  }

  return v11;
}

- (void)retrievePredictionsForMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 length])
    {
      id v8 = v6;
      if (([v8 isEqualToString:@"Custom"] & 1) == 0
        && ([v8 isEqualToString:@"Unknown"] & 1) == 0
        && ([v8 isEqualToString:@"Default"] & 1) == 0
        && (([v8 isEqualToString:@"Home"] & 1) != 0
         || ([v8 isEqualToString:@"Working"] & 1) != 0
         || ([v8 isEqualToString:@"Exercising"] & 1) != 0
         || ([v8 isEqualToString:@"Driving"] & 1) != 0
         || ([v8 isEqualToString:@"Bedtime"] & 1) != 0
         || ([v8 isEqualToString:@"Gaming"] & 1) != 0
         || ([v8 isEqualToString:@"Reading"] & 1) != 0
         || ([v8 isEqualToString:@"Traveling"] & 1) != 0
         || ([v8 isEqualToString:@"Learning"] & 1) != 0
         || ([v8 isEqualToString:@"Streaming"] & 1) != 0
         || ([v8 isEqualToString:@"ScreenSharing"] & 1) != 0
         || ([v8 isEqualToString:@"ScreenRecording"] & 1) != 0
         || ([v8 isEqualToString:@"AirPlayMirroring"] & 1) != 0
         || ([v8 isEqualToString:@"Mindfulness"] & 1) != 0
         || ([v8 isEqualToString:@"ReduceInterruptions"] & 1) != 0))
      {

        objc_initWeak(&location, self);
        recentsCache = self->_recentsCache;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __74__CKContextRecentsPredictionManager_retrievePredictionsForMode_withReply___block_invoke;
        v10[3] = &unk_2647D2E10;
        objc_copyWeak(&v13, &location);
        id v12 = v7;
        id v11 = v8;
        [(CKContextRecentsCache *)recentsCache retrieveRecentsForPredictionWithReply:v10];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x263EFFA68]);
  }
LABEL_8:
}

void __74__CKContextRecentsPredictionManager_retrievePredictionsForMode_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && [v9 count] && objc_msgSend(v5, "count"))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [WeakRetained _recentsEligibleForDonationMatchingMode:*(void *)(a1 + 32) fromRecents:v9 uuidsToCounts:v5];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_recentsEligibleForDonationMatchingMode:(id)a3 fromRecents:(id)a4 uuidsToCounts:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v61 = a5;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v71 = (unint64_t)v7;
    _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "🔮 Finding recents eligible prediction for mode: %@", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned int v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v16 = [v15 modeIdentifier];
        int v17 = [v16 isEqualToString:v7];

        if (v17) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v54 = v10;
    v18 = [v9 firstObject];
    id v19 = (void *)MEMORY[0x263EFF910];
    v53 = v18;
    [v18 absoluteTimestamp];
    id v57 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
    id v55 = v9;
    id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = [v9 reverseObjectEnumerator];
    uint64_t v20 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (!v20) {
      goto LABEL_56;
    }
    uint64_t v21 = v20;
    v22 = MEMORY[0x263EF8438];
    uint64_t v23 = *(void *)v63;
    while (1)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v63 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v26 = [v25 associatedBundleId];
          id v27 = (void *)MEMORY[0x263EFF910];
          [v25 absoluteTimestamp];
          v28 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
          *(_DWORD *)buf = 138412802;
          unint64_t v71 = (unint64_t)v7;
          __int16 v72 = 2112;
          long long v73 = v26;
          __int16 v74 = 2112;
          v75 = v28;
          _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "Considering recent for mode: %@ from bundle: %@, date: %@", buf, 0x20u);
        }
        v29 = [v25 uuid];
        v30 = [v61 objectForKeyedSubscript:v29];
        unsigned int v31 = [v30 unsignedIntValue];
        unsigned int v32 = v31;

        if (v31 - 33 > 0xFFFFFFDF)
        {
          id v33 = objc_alloc(MEMORY[0x263F08D38]);
          v34 = [v25 userActivityData];
          id v35 = (void *)[v33 _initWithUserActivityData:v34];

          if (v35)
          {
            int v36 = [v35 isEligibleForPrediction];
            int v37 = [v35 isEligibleForPublicIndexing];
            if (v36 & 1) != 0 || (v37)
            {
              if ((v37 & ~v36) != 1 || v32 > 4)
              {
                v41 = [v35 expirationDate];
                v42 = [MEMORY[0x263EFF910] date];
                if (v41
                  && ([v41 earlierDate:v42],
                      uint64_t v43 = objc_claimAutoreleasedReturnValue(),
                      v43,
                      v43 == v41))
                {
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because past expiration date", buf, 2u);
                  }
                }
                else
                {
                  v44 = [v25 associatedBundleId];
                  if ([v44 length]
                    && ![(id)kBundleIdentifiersToNotSuggest containsObject:v44])
                  {
                    id v58 = (void *)MEMORY[0x263EFF910];
                    [v25 absoluteTimestamp];
                    v59 = objc_msgSend(v58, "dateWithTimeIntervalSinceReferenceDate:");
                    [v59 timeIntervalSinceDate:v57];
                    double v47 = fabs(v46);
                    BOOL v48 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
                    if (v47 <= 1800.0)
                    {
                      if (v48)
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "--- accepting as valid candidate", buf, 2u);
                      }
                      [v56 addObject:v25];
                    }
                    else if (v48)
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because too old", buf, 2u);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because bundle identifier is not allowed", buf, 2u);
                  }
                }
              }
              else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                v38 = v22;
                v39 = "--- rejecting publicly indexable prediction due to insufficient count";
LABEL_41:
                _os_log_impl(&dword_226BEC000, v38, OS_LOG_TYPE_INFO, v39, buf, 2u);
              }
            }
            else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v38 = v22;
              v39 = "--- rejecting because ineligible for predictions or public indexing";
              goto LABEL_41;
            }
          }

          continue;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v71 = v31;
          _os_log_impl(&dword_226BEC000, v22, OS_LOG_TYPE_INFO, "--- rejecting due to occurence count: %lu", buf, 0xCu);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
      if (!v21)
      {
LABEL_56:

        unint64_t v49 = [v56 count];
        if (v49 >= 2) {
          uint64_t v50 = 2;
        }
        else {
          uint64_t v50 = v49;
        }
        v51 = objc_msgSend(v56, "subarrayWithRange:", 0, v50);

        id v10 = v54;
        id v9 = v55;
        goto LABEL_61;
      }
    }
  }
  v51 = (void *)MEMORY[0x263EFFA68];
LABEL_61:

  return v51;
}

- (id)_localizedStringForKey:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleWithPath:@"/System/Library/PrivateFrameworks/ContextKitPrediction.framework"];
  id v6 = [v5 localizedStringForKey:v4 value:v4 table:0];

  return v6;
}

- (void)_createDoNotDisturbServiceIfNecessary
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Could not obtain reference to DNDModeConfigurationService", v0, 2u);
}

- (id)_retrieveModeConfigurations
{
  [(CKContextRecentsPredictionManager *)self _createDoNotDisturbServiceIfNecessary];
  dndService = self->_dndService;
  id v10 = 0;
  id v4 = [(DNDModeConfigurationService *)dndService modeConfigurationsReturningError:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[CKContextRecentsPredictionManager _retrieveModeConfigurations]();
    }
    id v8 = 0;
  }

  return v8;
}

- (id)_modeForModeIdentifier:(id)a3 withConfigurations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]
    && ([v6 allKeys],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __79__CKContextRecentsPredictionManager__modeForModeIdentifier_withConfigurations___block_invoke;
    dispatch_block_t v14 = &unk_2647D2E38;
    id v15 = v5;
    uint64_t v16 = &v17;
    [v6 enumerateKeysAndObjectsUsingBlock:&v11];
    id v9 = objc_msgSend((id)v18[5], "mode", v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __79__CKContextRecentsPredictionManager__modeForModeIdentifier_withConfigurations___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  BOOL v7 = [v11 mode];
  uint64_t v8 = [v7 identifier];
  id v9 = [v8 UUIDString];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (CKContextRecentsCache)recentsCache
{
  return self->_recentsCache;
}

- (CKContextRecentsPredictionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKContextRecentsPredictionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentsCache, 0);
  objc_storeStrong((id *)&self->_suggestionDonationTransaction, 0);
  objc_storeStrong((id *)&self->_dndService, 0);
  objc_storeStrong((id *)&self->_suggestionReportingQueue, 0);
  objc_storeStrong(&self->_suggestionsClearingBlock, 0);
  objc_storeStrong(&self->_suggestionsContributionBlock, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
}

void __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "No eligible recents for donation.", v0, 2u);
}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error updating suggestions to ATX: %@", v0, 0xCu);
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.1(void *a1)
{
  uint64_t v1 = [a1 uuid];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v2, "Reporting high confidence for recent: %@", v3, v4, v5, v6, v7);
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.2(void *a1)
{
  uint64_t v1 = [a1 uuid];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v2, "Reporting medium confidence for recent: %@", v3, v4, v5, v6, v7);
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.3(void *a1)
{
  uint64_t v1 = [a1 uuid];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v2, "Reporting low confidence for recent: %@", v3, v4, v5, v6, v7);
}

- (void)_retrieveModeConfigurations
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Could not obtain mode configurations: %{public}@", v0, 0xCu);
}

@end