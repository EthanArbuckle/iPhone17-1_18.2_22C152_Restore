@interface ATXActionSearchResult
+ (BOOL)_demoModeEnabled;
+ (BOOL)shouldDisplayRecentActionsOnHomeScreen;
+ (BOOL)shouldDisplayRecentDonationsForTesting;
+ (BOOL)shouldDisplayUpcomingMediaForTesting;
+ (BOOL)shouldDisplayValidParameterCombinations;
+ (BOOL)supportsSecureCoding;
+ (id)_demoModeActionResponse;
+ (id)_recentDonationProactiveSuggestionFromScoredAction:(id)a3 withClientModelId:(id)a4;
+ (id)_unarchiveATXHeroDataFromSuggestion:(id)a3;
+ (id)_unarchiveObjectFromSuggestion:(id)a3;
+ (id)actionResponseForDeveloperMode;
+ (id)actionResponseForDeveloperModeWithClientId:(id)a3 shouldShowRecentDonations:(BOOL)a4;
+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5;
+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5 withClientModelId:(id)a6;
+ (id)actionSearchResultFromProactiveSuggestion:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6;
+ (id)actionSearchResultFromScoredAction:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6;
+ (id)generatedSearchResultForAction:(id)a3 actionResponse:(id)a4;
+ (id)generatedSearchResultForProactiveSuggestion:(id)a3 actionResponse:(id)a4;
+ (id)mostRecentDonationParameterCombinations;
+ (id)predictedActionSearchResultsWithLimit:(int64_t)a3 forBundleIdentifiers:(id)a4;
+ (id)recentDonationsStarting:(id)a3 end:(id)a4 number:(unint64_t)a5;
+ (id)recentUpcomingMedia;
- (ATXAction)atxAction;
- (ATXActionResponse)actionResponse;
- (ATXActionSearchResult)init;
- (ATXActionSearchResult)initWithCoder:(id)a3;
- (ATXHeroData)heroApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionSearchResult:(id)a3;
- (id)blendingModelUICacheUpdateUUID;
- (unint64_t)hash;
- (void)_updateInlineCardWithContent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionResponse:(id)a3;
- (void)setAtxAction:(id)a3;
- (void)setHeroApp:(id)a3;
@end

@implementation ATXActionSearchResult

+ (id)predictedActionSearchResultsWithLimit:(int64_t)a3 forBundleIdentifiers:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v6 = __atxlog_handle_blending();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v45 = a3;
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "predictedActionSearchResultsWithLimit %lu.", buf, 0xCu);
  }

  if (!+[ATXDeviceClass shouldComputeActions])
  {
    v8 = 0;
    goto LABEL_41;
  }
  if ([a1 _demoModeEnabled])
  {
    uint64_t v7 = [a1 _demoModeActionResponse];
    goto LABEL_11;
  }
  if (([a1 shouldDisplayRecentDonationsForTesting] & 1) != 0
    || ([a1 shouldDisplayUpcomingMediaForTesting] & 1) != 0
    || [a1 shouldDisplayValidParameterCombinations])
  {
    uint64_t v7 = [a1 actionResponseForDeveloperMode];
LABEL_11:
    v9 = (void *)v7;
    if (v7) {
      goto LABEL_12;
    }
LABEL_39:
    v8 = 0;
    goto LABEL_40;
  }
  v30 = objc_opt_new();
  v31 = v30;
  if ((int)a3 >= 3) {
    uint64_t v32 = 3;
  }
  else {
    uint64_t v32 = a3;
  }
  v9 = [v30 actionPredictionsForConsumerSubType:21 limit:v32];

  if (!v9) {
    goto LABEL_39;
  }
LABEL_12:
  v10 = [ATXAVRoutingSessionHelper alloc];
  LODWORD(v11) = 0.5;
  v12 = [(ATXAVRoutingSessionHelper *)v10 initWithAcceptThreshold:0 avRoutingSessionManager:v11];
  v13 = objc_opt_new();
  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v15 = [v9 scoredActions];
  v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  v17 = [v9 scoredActions];
  if (v17)
  {
  }
  else
  {
    v24 = [v9 proactiveSuggestions];

    if (v24)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v18 = [v9 proactiveSuggestions];
      uint64_t v25 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v18);
            }
            v29 = [a1 actionSearchResultFromProactiveSuggestion:*(void *)(*((void *)&v38 + 1) + 8 * i) actionResponse:v9 avRoutingSessionHelper:v12 nowPlayingDataProvider:v13];
            if (v29) {
              [v16 addObject:v29];
            }
          }
          uint64_t v26 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v26);
      }
      goto LABEL_34;
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v18 = objc_msgSend(v9, "scoredActions", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [a1 actionSearchResultFromScoredAction:*(void *)(*((void *)&v34 + 1) + 8 * j) actionResponse:v9 avRoutingSessionHelper:v12 nowPlayingDataProvider:v13];
        if (v23) {
          [v16 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }
LABEL_34:

  v8 = (void *)[v16 copy];
LABEL_40:

LABEL_41:

  return v8;
}

+ (id)actionSearchResultFromScoredAction:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 predictedItem];
  id v14 = [v13 bundleId];
  BOOL v15 = +[ATXApplicationRecord isDeviceManagementPolicyOkForBundleId:v14];

  if (!v15)
  {
    v23 = 0;
    goto LABEL_17;
  }
  v16 = [v9 predictedItem];
  if ([v16 isTVWhiteListedLongFormMedia])
  {
    if (([v12 isTVExperienceAppNowPlaying] & 1) == 0)
    {
      v17 = [v11 predictedRouteInfo];
      uint64_t v18 = [v16 actionWithRouteInfo:v17];

      if (([v10 containsExternalRoute] & 1) == 0)
      {
        uint64_t v19 = [v11 predictedRouteInfo];
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          uint64_t v21 = [v11 predictedRouteInfo];
          int v22 = [v21 isExternalRoute];

          if (v22) {
            [v10 setContainsExternalRoute:1];
          }
        }
      }
      goto LABEL_15;
    }
  }
  else
  {
    if (![v16 isTVAction])
    {
      uint64_t v18 = (uint64_t)v16;
LABEL_15:
      v23 = +[ATXActionSearchResult generatedSearchResultForAction:v18 actionResponse:v10];
      v16 = (void *)v18;
      goto LABEL_16;
    }
    v24 = __atxlog_handle_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[ATXActionSearchResult actionSearchResultFromScoredAction:actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:](v24);
    }
  }
  v23 = 0;
LABEL_16:

LABEL_17:

  return v23;
}

+ (id)generatedSearchResultForAction:(id)a3 actionResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(ATXActionSearchResult);
  [(ATXActionSearchResult *)v7 setAtxAction:v6];

  [(ATXActionSearchResult *)v7 setActionResponse:v5];

  return v7;
}

+ (id)actionSearchResultFromProactiveSuggestion:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 executableSpecification];
  BOOL v15 = [v14 executableClassString];

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  int v18 = [v15 isEqualToString:v17];

  if (v18)
  {
    uint64_t v19 = [v10 atxActionExecutableObject];
    if (v19)
    {
      uint64_t v20 = [ATXScoredPrediction alloc];
      uint64_t v21 = [v10 scoreSpecification];
      [v21 rawScore];
      *(float *)&double v22 = v22;
      v23 = [(ATXScoredPrediction *)v20 initWithPredictedItem:v19 score:v22];

      v24 = [a1 actionSearchResultFromScoredAction:v23 actionResponse:v11 avRoutingSessionHelper:v12 nowPlayingDataProvider:v13];
      [(ATXSuggestionSearchResult *)v24 setProactiveSuggestion:v10];

LABEL_8:
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  int v27 = [v15 isEqualToString:v26];

  if (v27)
  {
    uint64_t v19 = [a1 _unarchiveATXHeroDataFromSuggestion:v10];
    if (v19)
    {
      v24 = objc_alloc_init(ATXActionSearchResult);
      [(ATXActionSearchResult *)v24 setHeroApp:v19];
      [(ATXActionSearchResult *)v24 setActionResponse:v11];
      [(ATXSuggestionSearchResult *)v24 setProactiveSuggestion:v10];
      goto LABEL_8;
    }
LABEL_7:
    v24 = 0;
    goto LABEL_8;
  }
  v24 = [a1 generatedSearchResultForProactiveSuggestion:v10 actionResponse:v11];
LABEL_10:

  return v24;
}

+ (id)_unarchiveObjectFromSuggestion:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = [v3 executableSpecification];
  uint64_t v7 = [v6 executableClassString];
  Class v8 = NSClassFromString(v7);
  id v9 = [v3 executableSpecification];
  id v10 = [v9 executable];
  id v16 = 0;
  id v11 = [v5 unarchivedObjectOfClass:v8 fromData:v10 error:&v16];
  id v12 = v16;

  if (v11 || !v12)
  {
    id v14 = v11;
  }
  else
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ATXActionSearchResult _unarchiveObjectFromSuggestion:]((uint64_t)v12, v13);
    }

    id v14 = 0;
  }

  return v14;
}

+ (id)_unarchiveATXHeroDataFromSuggestion:(id)a3
{
  id v3 = [a1 _unarchiveObjectFromSuggestion:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)generatedSearchResultForProactiveSuggestion:(id)a3 actionResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(ATXActionSearchResult);
  [(ATXSuggestionSearchResult *)v7 setProactiveSuggestion:v6];

  [(ATXActionSearchResult *)v7 setActionResponse:v5];

  return v7;
}

- (ATXActionSearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXActionSearchResult;
  v2 = [(ATXActionSearchResult *)&v6 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];
    [(ATXActionSearchResult *)v2 setIdentifier:v4];
  }
  return v2;
}

- (id)blendingModelUICacheUpdateUUID
{
  return [(ATXActionResponse *)self->_actionResponse blendingModelUICacheUpdateUUID];
}

- (void)setAtxAction:(id)a3
{
  id v5 = (ATXAction *)a3;
  p_atxAction = &self->_atxAction;
  if (self->_atxAction != v5)
  {
    objc_storeStrong((id *)&self->_atxAction, a3);
    uint64_t v7 = [(ATXAction *)*p_atxAction _bundleIdForDisplay];
    [(ATXActionSearchResult *)self setApplicationBundleIdentifier:v7];

    [(ATXActionSearchResult *)self _updateInlineCardWithContent:*p_atxAction];
    Class v8 = [(ATXAction *)*p_atxAction _spotlightContentType];
    [(ATXActionSearchResult *)self setContentType:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
    [(ATXActionSearchResult *)self setPunchout:v9];

    uint64_t v10 = [(ATXAction *)*p_atxAction actionType];
    id v11 = *p_atxAction;
    if (v10 == 1)
    {
      id v12 = [(ATXAction *)v11 userActivityString];
      [(ATXActionSearchResult *)self setUserActivityRequiredString:v12];
LABEL_6:

      goto LABEL_7;
    }
    id v13 = [(ATXAction *)v11 intent];

    id v14 = *p_atxAction;
    if (v13)
    {
      id v12 = [(ATXAction *)v14 intent];
      uint64_t v15 = [v12 _supportsBackgroundExecution];
      id v16 = [(ATXActionSearchResult *)self punchout];
      [v16 setIsRunnableInBackground:v15];

      goto LABEL_6;
    }
    if ([(ATXAction *)v14 actionType] == 5)
    {
      v17 = [(ATXActionSearchResult *)self punchout];
      [v17 setIsRunnableInBackground:1];
    }
    else
    {
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[ATXActionSearchResult setAtxAction:](v17);
      }
    }
  }
LABEL_7:
}

- (void)setHeroApp:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = (ATXHeroData *)a3;
  p_heroApp = &self->_heroApp;
  if (self->_heroApp != v5)
  {
    objc_storeStrong((id *)&self->_heroApp, a3);
    uint64_t v7 = [(ATXHeroData *)v5 clipMetadata];

    if (v7)
    {
      [(ATXActionSearchResult *)self setApplicationBundleIdentifier:@"com.apple.application"];
      Class v8 = NSString;
      id v9 = [(ATXHeroData *)*p_heroApp clipMetadata];
      uint64_t v10 = [v9 webClipID];
      id v11 = (void *)v10;
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      else {
        id v12 = &stru_1EFD9B408;
      }
      id v13 = [v8 stringWithFormat:@"com.apple.appclip-%@", v12];
      [(ATXActionSearchResult *)self setIdentifier:v13];

      [(ATXActionSearchResult *)self setType:23];
      [(ATXActionSearchResult *)self _updateInlineCardWithContent:*p_heroApp];
      id v14 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
      [(ATXActionSearchResult *)self setPunchout:v14];

      uint64_t v15 = [(ATXHeroData *)v5 clipMetadata];
      id v16 = [v15 clipURL];
      v22[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      int v18 = [(ATXActionSearchResult *)self punchout];
      [v18 setUrls:v17];

      uint64_t v19 = [(ATXActionSearchResult *)self punchout];
      [v19 setHasClip:1];

      uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v21 = [v20 localizedStringForKey:@"Nearby" value:&stru_1EFD9B408 table:0];
      [(ATXActionSearchResult *)self setNearbyBusinessesString:v21];
    }
  }
}

- (void)_updateInlineCardWithContent:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v5 = (void (*)(void))getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr;
  v24 = getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr;
  if (!getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    int v18 = __getAPUIRegisterCardServicesIfNeededSymbolLoc_block_invoke;
    uint64_t v19 = &unk_1E5D04E28;
    uint64_t v20 = &v21;
    objc_super v6 = (void *)AppPredictionUILibrary();
    v22[3] = (uint64_t)dlsym(v6, "APUIRegisterCardServicesIfNeeded");
    getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    id v5 = (void (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v5) {
    -[ATXActionSearchResult _updateInlineCardWithContent:]();
  }
  v5();
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v7 = (void (*)(void))getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr;
  v24 = getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr;
  if (!getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    int v18 = __getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_block_invoke;
    uint64_t v19 = &unk_1E5D04E28;
    uint64_t v20 = &v21;
    Class v8 = (void *)AppPredictionUILibrary();
    v22[3] = (uint64_t)dlsym(v8, "APUIRegisterCardKitProvidersIfNeeded");
    getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    uint64_t v7 = (void (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v7) {
    -[ATXActionSearchResult _updateInlineCardWithContent:]();
  }
  v7();
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2050000000;
  id v9 = (void *)getCRSCardRequestClass_softClass;
  v24 = (void *)getCRSCardRequestClass_softClass;
  if (!getCRSCardRequestClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    int v18 = __getCRSCardRequestClass_block_invoke;
    uint64_t v19 = &unk_1E5D04E28;
    uint64_t v20 = &v21;
    __getCRSCardRequestClass_block_invoke((uint64_t)&v16);
    id v9 = (void *)v22[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v21, 8);
  id v11 = objc_opt_new();
  [v11 setFormat:2];
  [v11 setContent:v4];
  [v11 setLoadsBundleServices:0];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__ATXActionSearchResult__updateInlineCardWithContent___block_invoke;
  v14[3] = &unk_1E5D06BB8;
  v14[4] = self;
  dispatch_semaphore_t v15 = v12;
  id v13 = v12;
  [v11 startWithReply:v14];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v13 timeoutSeconds:5.0];
}

intptr_t __54__ATXActionSearchResult__updateInlineCardWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 card];
  [*(id *)(a1 + 32) setInlineCard:v3];

  id v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

+ (id)_demoModeActionResponse
{
  v73[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  uint64_t v3 = [v2 stringForKey:@"demoActionContactName"];
  id v4 = (void *)v3;
  id v5 = @"Eddy Cue";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  objc_super v6 = v5;

  uint64_t v7 = [v2 stringForKey:@"demoActionContactEmail"];
  Class v8 = (void *)v7;
  id v9 = @"eddy@example.com";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  uint64_t v11 = [v2 stringForKey:@"demoActionMessageContent"];
  dispatch_semaphore_t v12 = (void *)v11;
  id v13 = @"Iʼm running late.";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  id v14 = v13;

  uint64_t v15 = [v2 stringForKey:@"demoActionMessageSubtitle"];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = @"“Shortcuts Launch Planning” starts at 3:00 PM.";
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  int v18 = v17;

  uint64_t v19 = [v2 stringForKey:@"demoActionAppBundleId"];
  uint64_t v20 = (void *)v19;
  uint64_t v21 = @"com.apple.MobileSMS";
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  double v22 = v21;

  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F305B8]) initWithValue:v10 type:1];
  v70 = (void *)v23;
  uint64_t v24 = [objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v23 nameComponents:0 displayName:v6 image:0 contactIdentifier:0 customIdentifier:0];
  id v25 = objc_alloc(MEMORY[0x1E4F306D0]);
  v69 = (void *)v24;
  v73[0] = v24;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
  int v27 = (void *)[v25 initWithRecipients:v26 outgoingMessageType:0 content:v14 speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];

  v28 = v27;
  [v27 _setLaunchId:v22];
  v29 = [(__CFString *)v6 componentsSeparatedByString:@" "];
  v30 = v6;
  uint64_t v31 = (uint64_t)v30;
  if ([v29 count])
  {
    uint64_t v31 = [v29 objectAtIndexedSubscript:0];
  }
  v67 = (void *)v31;
  v64 = [NSString stringWithFormat:@"Tell %@ “%@”", v31, v14];
  v68 = v30;
  uint64_t v32 = [ATXAction alloc];
  v65 = v28;
  v66 = v29;
  v33 = objc_opt_new();
  LOBYTE(v59) = 0;
  v61 = [(ATXAction *)v32 initWithIntent:v28 actionUUID:v33 bundleId:v22 heuristic:@"runningLateText" heuristicMetadata:0 criteria:0 isFutureMedia:v59 title:v64 subtitle:v18];

  uint64_t v34 = [v2 stringForKey:@"demoActionMessagePhone"];
  long long v35 = (void *)v34;
  long long v36 = @"1-888-555-1212";
  if (v34) {
    long long v36 = (__CFString *)v34;
  }
  v63 = v22;
  long long v37 = v36;

  uint64_t v38 = [v2 stringForKey:@"demoActionMeetingTitle"];
  long long v39 = (void *)v38;
  long long v40 = @"Call in to “Shortcuts Launch Planning”";
  if (v38) {
    long long v40 = (__CFString *)v38;
  }
  long long v41 = v40;

  uint64_t v42 = [v2 stringForKey:@"demoActionMeetingSubtitle"];
  v43 = (void *)v42;
  v44 = @"Event starts at 3:00 PM.";
  if (v42) {
    v44 = (__CFString *)v42;
  }
  v62 = v14;
  int64_t v45 = v44;

  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F305B8]) initWithValue:v37 type:2];
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v46 nameComponents:0 displayName:v41 image:0 contactIdentifier:0 customIdentifier:v37];

  id v48 = objc_alloc(MEMORY[0x1E4F30760]);
  v72 = v47;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v50 = (void *)[v48 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v49 callCapability:1];

  [v50 setPreferredCallProvider:1];
  [v50 setTTYType:1];
  [v50 _setLaunchId:@"com.apple.InCallService"];
  [v50 _setExtensionBundleId:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
  v51 = [ATXAction alloc];
  v52 = objc_opt_new();
  LOBYTE(v60) = 0;
  v53 = [(ATXAction *)v51 initWithIntent:v50 actionUUID:v52 bundleId:@"com.apple.InCallService" heuristic:@"conferenceCall" heuristicMetadata:0 criteria:0 isFutureMedia:v60 title:v41 subtitle:v45];

  v54 = [[ATXScoredPrediction alloc] initWithPredictedItem:v61 score:0.0];
  v71[0] = v54;
  v55 = [[ATXScoredPrediction alloc] initWithPredictedItem:v53 score:0.0];
  v71[1] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];

  v57 = [[ATXActionResponse alloc] initWithScoredActions:v56 cacheFileData:0 consumerSubType:0 error:0];

  return v57;
}

+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5
{
  return (id)[a1 actionResponseForDeveloperModeWithShouldShowRecentDonations:a3 shouldShowParameterCombinations:a4 shouldShowUpcomingMedia:a5 withClientModelId:@"developerModeRecentDonations"];
}

+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5 withClientModelId:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  uint64_t v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "returning results for DEVELOPER switch", buf, 2u);
  }

  dispatch_semaphore_t v12 = objc_opt_new();
  uint64_t v13 = [v12 dateByAddingTimeInterval:-3600.0];
  uint64_t v26 = (void *)v13;
  if (v8)
  {
    id v14 = [a1 recentDonationsStarting:v13 end:v12 number:10];
    uint64_t v15 = [v14 count];
    if (!v7) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v16 = [a1 mostRecentDonationParameterCombinations];
    v15 += [v16 count];
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t v15 = 0;
  id v14 = 0;
  if (v7) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v16 = 0;
  if (!v6)
  {
LABEL_6:
    uint64_t v17 = 0;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v17 = [a1 recentUpcomingMedia];
  v15 += [v17 count];
LABEL_10:
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
  if ([v14 count]) {
    [v18 addObjectsFromArray:v14];
  }
  if ([v16 count]) {
    [v18 addObjectsFromArray:v16];
  }
  if ([v17 count]) {
    [v18 addObjectsFromArray:v17];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __159__ATXActionSearchResult_actionResponseForDeveloperModeWithShouldShowRecentDonations_shouldShowParameterCombinations_shouldShowUpcomingMedia_withClientModelId___block_invoke;
  v27[3] = &unk_1E5D06BE0;
  id v28 = v10;
  id v29 = a1;
  id v19 = v10;
  uint64_t v20 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v27);
  uint64_t v21 = [ATXActionResponse alloc];
  double v22 = objc_opt_new();
  uint64_t v23 = objc_opt_new();
  uint64_t v24 = [(ATXActionResponse *)v21 initWithScoredActions:0 cacheFileData:0 proactiveSuggestions:v20 blendingModelUICacheUpdateUUID:v22 consumerSubType:16 predictionDate:v23 error:0];

  return v24;
}

id __159__ATXActionSearchResult_actionResponseForDeveloperModeWithShouldShowRecentDonations_shouldShowParameterCombinations_shouldShowUpcomingMedia_withClientModelId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() _recentDonationProactiveSuggestionFromScoredAction:v3 withClientModelId:*(void *)(a1 + 32)];

  return v4;
}

+ (id)_recentDonationProactiveSuggestionFromScoredAction:(id)a3 withClientModelId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v6 clientModelVersion:@"1.0" engagementResetPolicy:0];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:0.0];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v9 = (void *)getATXProactiveSuggestionBuilderClass_softClass;
  uint64_t v39 = getATXProactiveSuggestionBuilderClass_softClass;
  if (!getATXProactiveSuggestionBuilderClass_softClass)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __getATXProactiveSuggestionBuilderClass_block_invoke;
    v35[3] = &unk_1E5D04E28;
    v35[4] = &v36;
    __getATXProactiveSuggestionBuilderClass_block_invoke((uint64_t)v35);
    id v9 = (void *)v37[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v36, 8);
  if (!v10)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"+[ATXActionSearchResult _recentDonationProactiveSuggestionFromScoredAction:withClientModelId:]"];
    [v31 handleFailureInFunction:v32 file:@"ATXActionSearchResult.m" lineNumber:493 description:@"Expected ATXProactiveSuggestionBuilder to not be nil"];
  }
  uint64_t v11 = [v10 _uiSpecForScoredAction:v5 scoreSpec:v8 clientModelSpec:v7 predictionReason:0 shouldClearOnEngagement:0 allowedOnLockscreen:1];
  dispatch_semaphore_t v12 = [v5 predictedItem];
  uint64_t v13 = [v12 archivedDataForAction];

  if (v13)
  {
    id v34 = v6;
    id v14 = [NSString alloc];
    uint64_t v15 = [v5 predictedItem];
    uint64_t v16 = [v15 json];
    v33 = (void *)[v14 initWithFormat:@"%@", v16];

    id v17 = [NSString alloc];
    int v18 = [v5 predictedItem];
    id v19 = [v18 actionKey];
    uint64_t v20 = NSNumber;
    [v5 predictedItem];
    uint64_t v21 = v8;
    v23 = double v22 = v7;
    uint64_t v24 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v23, "paramHash"));
    id v25 = (void *)[v17 initWithFormat:@"%@:%lld", v19, objc_msgSend(v24, "longLongValue")];

    id v26 = objc_alloc(MEMORY[0x1E4F93950]);
    int v27 = [v5 predictedItem];
    id v28 = (void *)[v26 initWithExecutableObject:v27 executableDescription:v33 executableIdentifier:v25 suggestionExecutableType:2];

    BOOL v7 = v22;
    BOOL v8 = v21;
    id v29 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v7 executableSpecification:v28 uiSpecification:v11 scoreSpecification:v21];

    id v6 = v34;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

+ (id)actionResponseForDeveloperMode
{
  uint64_t v3 = [a1 shouldDisplayRecentDonationsForTesting];
  uint64_t v4 = [a1 shouldDisplayValidParameterCombinations];
  uint64_t v5 = [a1 shouldDisplayUpcomingMediaForTesting];

  return (id)[a1 actionResponseForDeveloperModeWithShouldShowRecentDonations:v3 shouldShowParameterCombinations:v4 shouldShowUpcomingMedia:v5 withClientModelId:@"developerModeRecentDonations"];
}

+ (id)actionResponseForDeveloperModeWithClientId:(id)a3 shouldShowRecentDonations:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = objc_msgSend(a1, "actionResponseForDeveloperModeWithShouldShowRecentDonations:shouldShowParameterCombinations:shouldShowUpcomingMedia:withClientModelId:", v4, objc_msgSend(a1, "shouldDisplayValidParameterCombinations"), objc_msgSend(a1, "shouldDisplayUpcomingMediaForTesting"), v6);

  return v7;
}

+ (id)recentDonationsStarting:(id)a3 end:(id)a4 number:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(ATXCombinedIntentStream);
  uint64_t v24 = v7;
  id v10 = [(ATXCombinedIntentStream *)v9 getSortedActivityAndIntentEventsBetweenStartDate:v7 endDate:v8 bundleIdFilter:0 comparator:&__block_literal_global_26];

  unint64_t v11 = [v10 count];
  if (v11 >= a5) {
    unint64_t v12 = a5;
  }
  else {
    unint64_t v12 = v11;
  }
  uint64_t v13 = objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) action];
        if (v20)
        {
          uint64_t v21 = [[ATXScoredPrediction alloc] initWithPredictedItem:v20 score:0.0];
          [v14 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  double v22 = (void *)[v14 copy];

  return v22;
}

uint64_t __60__ATXActionSearchResult_recentDonationsStarting_end_number___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 dateInterval];
  id v6 = [v4 dateInterval];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)mostRecentDonationParameterCombinations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = [v20 dateByAddingTimeInterval:-7200.0];
  uint64_t v18 = [a1 recentDonationsStarting:v19 end:v20 number:1];
  uint64_t v3 = [v18 firstObject];
  id v4 = [v3 predictedItem];

  uint64_t v5 = objc_opt_new();
  if (v4)
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x2050000000;
    id v6 = (void *)get_ATXActionUtilsClass_softClass;
    uint64_t v29 = get_ATXActionUtilsClass_softClass;
    if (!get_ATXActionUtilsClass_softClass)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __get_ATXActionUtilsClass_block_invoke;
      v25[3] = &unk_1E5D04E28;
      v25[4] = &v26;
      __get_ATXActionUtilsClass_block_invoke((uint64_t)v25);
      id v6 = (void *)v27[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v26, 8);
    id v8 = [v7 slotSetsForAction:v4 intentCache:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [ATXScoredPrediction alloc];
          id v14 = [v12 parameters];
          id v15 = (void *)[v4 copyWithParameterWhitelist:v14];
          uint64_t v16 = [(ATXScoredPrediction *)v13 initWithPredictedItem:v15 score:0.0];
          [v5 addObject:v16];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v9);
    }
  }

  return v5;
}

+ (id)recentUpcomingMedia
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v30 = +[ATXUpcomingMediaQuery getAllUpcomingMedia];
  v2 = [v30 sortedUpcomingMedia];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v36 + 1) + 8 * i) first];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }
  uint64_t v29 = v4;

  unint64_t v10 = [v3 count];
  if (v10 >= 3) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = v10;
  }
  unint64_t v12 = objc_msgSend(v3, "subarrayWithRange:", 0, v11);
  uint64_t v13 = (void *)[v12 mutableCopy];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v20 = [v19 launchId];

        if (v20)
        {
          long long v21 = [ATXAction alloc];
          long long v22 = objc_opt_new();
          long long v23 = [v19 launchId];
          LOBYTE(v28) = 0;
          long long v24 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v21, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v19, v22, v23, 0, 0, 0, v28, 0, 0, v29);

          if (v24)
          {
            long long v25 = [[ATXScoredPrediction alloc] initWithPredictedItem:v24 score:0.0];
            [v31 addObject:v25];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v16);
  }

  uint64_t v26 = (void *)[v31 copy];

  return v26;
}

+ (BOOL)_demoModeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"zkwActionsDemoModeEnabled", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat) != 0;
}

+ (BOOL)shouldDisplayRecentDonationsForTesting
{
  return CFPreferencesGetAppBooleanValue(@"displayRecentDonations", @"com.apple.duetexpertd", 0) != 0;
}

+ (BOOL)shouldDisplayUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(@"displayUpcomingMedia", @"com.apple.duetexpertd", 0) != 0;
}

+ (BOOL)shouldDisplayValidParameterCombinations
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  char v3 = [v2 BOOLForKey:@"ShowValidParameterCombinations"];

  return v3;
}

+ (BOOL)shouldDisplayRecentActionsOnHomeScreen
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  char v3 = [v2 BOOLForKey:@"ATXRecentActionsOnHomeScreen"];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(ATXActionResponse *)self->_actionResponse uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXActionSearchResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActionSearchResult *)self isEqualToActionSearchResult:v5];

  return v6;
}

- (BOOL)isEqualToActionSearchResult:(id)a3
{
  uint64_t v5 = a3;
  BOOL v6 = [(ATXSuggestionSearchResult *)self proactiveSuggestion];
  if (v6 || ([v5 proactiveSuggestion], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [(ATXSuggestionSearchResult *)self proactiveSuggestion];
    id v8 = [v5 proactiveSuggestion];
    int v9 = [v7 isEqual:v8];

    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    int v9 = 1;
  }

LABEL_7:
  if ([(ATXAction *)self->_atxAction isEqual:v5[100]]) {
    BOOL v10 = [(ATXActionResponse *)self->_actionResponse isEqual:v5[99]] & v9;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXActionSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXActionSearchResult;
  uint64_t v5 = [(ATXSuggestionSearchResult *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_atxAction"];
    atxAction = v5->_atxAction;
    v5->_atxAction = (ATXAction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_atxActionResponse"];
    actionResponse = v5->_actionResponse;
    v5->_actionResponse = (ATXActionResponse *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  atxAction = self->_atxAction;
  id v5 = a3;
  [v5 encodeObject:atxAction forKey:@"_atxAction"];
  [v5 encodeObject:self->_actionResponse forKey:@"_atxActionResponse"];
  v6.receiver = self;
  v6.super_class = (Class)ATXActionSearchResult;
  [(ATXSuggestionSearchResult *)&v6 encodeWithCoder:v5];
}

- (ATXActionResponse)actionResponse
{
  return self->_actionResponse;
}

- (void)setActionResponse:(id)a3
{
}

- (ATXAction)atxAction
{
  return self->_atxAction;
}

- (ATXHeroData)heroApp
{
  return self->_heroApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroApp, 0);
  objc_storeStrong((id *)&self->_atxAction, 0);

  objc_storeStrong((id *)&self->_actionResponse, 0);
}

+ (void)actionSearchResultFromScoredAction:(os_log_t)log actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Prevented showing a TV intent which is not a TVWhiteListedLongFormMedia", v1, 2u);
}

+ (void)_unarchiveObjectFromSuggestion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "error unarchiving data for suggestion: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setAtxAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Unexpected ATXAction configuration found in ATXActionSearchResult.", v1, 2u);
}

- (void)_updateInlineCardWithContent:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void soft_APUIRegisterCardServicesIfNeeded(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionSearchResult.m", 63, @"%s", dlerror());

  __break(1u);
}

- (void)_updateInlineCardWithContent:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void soft_APUIRegisterCardKitProvidersIfNeeded(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionSearchResult.m", 64, @"%s", dlerror());

  __break(1u);
}

@end