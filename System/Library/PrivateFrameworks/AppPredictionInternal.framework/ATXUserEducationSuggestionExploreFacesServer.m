@interface ATXUserEducationSuggestionExploreFacesServer
- (ATXUserEducationSuggestionExploreFacesServer)initWithConnector:(id)a3;
- (BOOL)isSubscribedForBacklightEvents;
- (BOOL)shouldNeverShowSuggestionAgain;
- (id)backlightEventSink;
- (id)suggestion;
- (int64_t)gracePeriod;
- (int64_t)maxHour;
- (int64_t)minHour;
- (int64_t)numBacklightOffEventsBeforeDismissSuggestion;
- (int64_t)tryAgainIntervalSeconds;
- (void)backlightEventHandler:(id)a3;
- (void)cancelBacklightEventSubscription;
- (void)scheduleNextTry;
- (void)sendSuggestionWithEventType:(unint64_t)a3;
- (void)setIsSubscribedForBacklightEvents:(BOOL)a3;
- (void)startUpSubscriberToBacklightBiomeStreamForTheFirstTime;
- (void)startUpSubscriberToBacklightBiomeStreamIfSubscribed;
- (void)tryToSendSuggestion;
@end

@implementation ATXUserEducationSuggestionExploreFacesServer

- (ATXUserEducationSuggestionExploreFacesServer)initWithConnector:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionExploreFacesServer;
  v6 = [(ATXUserEducationSuggestionBaseServer *)&v14 init];
  if (v6)
  {
    v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ATXUserEducationSuggestionExploreFacesServer initWithConnector:]";
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_connector, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v9 = [v8 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v9;

    uint64_t v11 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    constants = v6->_constants;
    v6->_constants = (ATXNotificationManagementMAConstants *)v11;

    [(ATXUserEducationSuggestionExploreFacesServer *)v6 scheduleNextTry];
    [(ATXUserEducationSuggestionExploreFacesServer *)v6 startUpSubscriberToBacklightBiomeStreamIfSubscribed];
  }

  return v6;
}

- (BOOL)shouldNeverShowSuggestionAgain
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXUserEducationSuggestionExploreFacesServer *)self suggestion];
  int v4 = [v3 suggestionWasAlreadyShown];

  if (v4)
  {
    id v5 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[ATXUserEducationSuggestionExploreFacesServer shouldNeverShowSuggestionAgain]";
      v6 = "%s: Will never show suggestion again because it was already shown";
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL v7 = [(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x1E4F4B740]];
  if (v7)
  {
    id v5 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[ATXUserEducationSuggestionExploreFacesServer shouldNeverShowSuggestionAgain]";
      v6 = "%s: Will never show suggestion again because user has already seen gallery";
      goto LABEL_7;
    }
LABEL_8:

    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)suggestion
{
  suggestion = self->_suggestion;
  if (!suggestion)
  {
    int v4 = (ATXUserEducationSuggestionExploreFaces *)[objc_alloc(MEMORY[0x1E4F4B3E0]) initWithRandomUUID];
    id v5 = self->_suggestion;
    self->_suggestion = v4;

    suggestion = self->_suggestion;
  }
  v6 = suggestion;
  return v6;
}

- (void)scheduleNextTry
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v2];
}

void __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldNeverShowSuggestionAgain])
  {
    v2 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
      v3 = "%s: Not scheduling attempt to show suggestion because it should never be shown again.";
      int v4 = v2;
      uint32_t v5 = 12;
LABEL_13:
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) minHour];
    uint64_t v7 = [*(id *)(a1 + 32) maxHour];
    if (v6 >= v7)
    {
      v2 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
        __int16 v22 = 2048;
        uint64_t v23 = v6;
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        v3 = "%s: Not scheduling attempt to show suggestion because minHour (%ld) >= maxHour (%ld)";
        int v4 = v2;
        uint32_t v5 = 32;
        goto LABEL_13;
      }
    }
    else
    {
      v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v8 = objc_opt_new();
      int v9 = -[NSObject dateByAddingUnit:value:toDate:options:](v2, "dateByAddingUnit:value:toDate:options:", 128, [*(id *)(a1 + 32) tryAgainIntervalSeconds], v8, 0);
      uint64_t v10 = [v2 component:32 fromDate:v9];
      if (v10 < v6 || v10 > v7)
      {
        uint64_t v12 = v10;
        v13 = [v2 dateBySettingHour:v6 minute:0 second:0 ofDate:v9 options:0];

        if (v12 <= v7)
        {
          int v9 = v13;
        }
        else
        {
          int v9 = [v2 dateByAddingUnit:16 value:1 toDate:v13 options:0];
        }
      }
      [v9 timeIntervalSinceDate:v8];
      int64_t v15 = (uint64_t)v14;
      int64_t v16 = [*(id *)(a1 + 32) gracePeriod];
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E4F14320], 1);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E4F142F8], 0);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E4F14138], 1);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x1E4F14170], v15);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x1E4F141A8], v16);
      xpc_dictionary_set_string(v17, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
      v18 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
        __int16 v22 = 2048;
        uint64_t v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = v16;
        __int16 v26 = 2114;
        v27 = v9;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "%s: Registering XPC activity with delay: %llds and gracePeriod: %llds. Expecting the next attempt to send the suggestion to occur at %{public}@", buf, 0x2Au);
      }

      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke_23;
      handler[3] = &unk_1E68ACF98;
      handler[4] = *(void *)(a1 + 32);
      xpc_activity_register("com.apple.duetexpertd.ATXUserEducationSuggestionExploreFacesServer", v17, handler);
    }
  }
}

uint64_t __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke_23(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_set_state(activity, 5);
  v3 = *(void **)(a1 + 32);
  return [v3 tryToSendSuggestion];
}

- (void)tryToSendSuggestion
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v2];
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) scheduleNextTry];
  v2 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Attempting to send suggestion", buf, 0xCu);
  }

  if (![*(id *)(a1 + 32) shouldNeverShowSuggestionAgain])
  {
    v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v4 = objc_opt_new();
    uint64_t v5 = [v3 component:32 fromDate:v4];
    if (v5 < [*(id *)(a1 + 32) minHour] || v5 > objc_msgSend(*(id *)(a1 + 32), "maxHour"))
    {
      uint64_t v6 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) minHour];
        uint64_t v8 = [*(id *)(a1 + 32) maxHour];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2048;
        double v60 = *(double *)&v7;
        __int16 v61 = 2048;
        uint64_t v62 = v8;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion because the current hour, %ld, is not between %ld to %ld.", buf, 0x2Au);
      }
      goto LABEL_41;
    }
    [*(id *)(*(void *)(a1 + 32) + 40) doubleForKey:*MEMORY[0x1E4F4B6C8]];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v9];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSinceDate:v6];
    double v12 = v11;

    if (v12 < 172800.0)
    {
      v13 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        double v60 = v12;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion since user likely upgraded less than 48 hours ago. Will be eligbile after 48 hours. Approximate date of last upgrade was %{public}@ (%f seconds ago)", buf, 0x20u);
      }

      goto LABEL_41;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v60) = 1;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    double v14 = BiomeLibrary();
    int64_t v15 = [v14 UserFocus];
    int64_t v16 = [v15 ComputedMode];
    xpc_object_t v17 = objc_msgSend(v16, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1F27F05E8, &unk_1F27F05E8, 0);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_27;
    v51[3] = &unk_1E68AC060;
    v51[4] = &v52;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_29;
    v50[3] = &unk_1E68AE200;
    v50[4] = &v52;
    v50[5] = buf;
    id v18 = (id)[v17 sinkWithCompletion:v51 receiveInput:v50];

    if (*((unsigned char *)v53 + 24))
    {
      v19 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_40;
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v19 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_1(v19, v27, v28, v29, v30, v31, v32, v33);
      }
      goto LABEL_40;
    }
    v34 = +[ATXPosterDescriptorCache sharedInstance];
    v19 = [v34 descriptors];

    if (!v19)
    {
      v43 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v57 = 136315138;
        v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion. Unable to get all descriptors from ATXPosterDescriptorCache.", v57, 0xCu);
      }
      goto LABEL_39;
    }
    v35 = [v19 objectForKeyedSubscript:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
    v44 = v35;
    if (v35)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      obj = v35;
      uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v47 != v37) {
              objc_enumerationMutation(obj);
            }
            v39 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "galleryOptions", v44);
            char v40 = [v39 isHero];

            if ((v40 & 1) == 0)
            {

              [*(id *)(a1 + 32) sendSuggestionWithEventType:0];
              v43 = obj;
              goto LABEL_39;
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }

      v41 = __atxlog_handle_context_user_education_suggestions();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_DWORD *)v57 = 136315138;
      v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
      v42 = "%s: Not sending suggestion. Found 0 non-hero row ATXPosterDescriptors, possibly indicating that photos hasn'"
            "t finished donating their posters to us.";
    }
    else
    {
      v41 = __atxlog_handle_context_user_education_suggestions();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
LABEL_38:

        v43 = v44;
LABEL_39:

LABEL_40:
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(buf, 8);
LABEL_41:

        goto LABEL_42;
      }
      *(_DWORD *)v57 = 136315138;
      v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
      v42 = "%s: Not sending suggestion. Unable to get list of photos descriptors from ATXPosterDescriptorCache.";
    }
    _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, v42, v57, 0xCu);
    goto LABEL_38;
  }
  xpc_activity_unregister("com.apple.duetexpertd.ATXUserEducationSuggestionExploreFacesServer");
  v3 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion because we should never show it again. See logs above. Unregistered all future XPC activities to try and show the suggestion again.", buf, 0xCu);
  }
LABEL_42:
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    int v4 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_27_cold_1(v3);
    }
  }
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 eventBody];

  if (v4)
  {
    uint64_t v5 = [v3 eventBody];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 starting];
  }
  else
  {
    uint64_t v6 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_29_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (void)sendSuggestionWithEventType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F4B3D8]);
  uint64_t v6 = [(ATXUserEducationSuggestionExploreFacesServer *)self suggestion];
  uint64_t v7 = (void *)[v5 initWithUserEducationSuggestion:v6 userEducationSuggestionEventType:a3];

  uint64_t v8 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[ATXUserEducationSuggestionExploreFacesServer sendSuggestionWithEventType:]";
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending suggestion event: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [(ATXUserEducationSuggestionConnector *)self->_connector remoteObjectProxy];
  [v9 didReceiveUserEducationSuggestionEvent:v7];
}

- (void)setIsSubscribedForBacklightEvents:(BOOL)a3
{
}

- (BOOL)isSubscribedForBacklightEvents
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_IsSubscribedToBackLightStream"];
}

- (void)startUpSubscriberToBacklightBiomeStreamForTheFirstTime
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v2];
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isSubscribedForBacklightEvents])
  {
    v2 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_1(v2);
    }
  }
  else
  {
    id v3 = *v1;
    if (*((void *)*v1 + 7) || v3[6])
    {
      int v4 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_2((uint64_t)v1, 56, v4);
      }
    }
    else
    {
      id v5 = (void *)v3[5];
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
      [v6 timeIntervalSinceReferenceDate];
      objc_msgSend(v5, "setDouble:forKey:", @"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_TimestampFirstSubscribedToBackLightStream");

      [*v1 setIsSubscribedForBacklightEvents:1];
      id v7 = *v1;
      [v7 startUpSubscriberToBacklightBiomeStreamIfSubscribed];
    }
  }
}

- (void)startUpSubscriberToBacklightBiomeStreamIfSubscribed
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __99__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamIfSubscribed__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v2];
}

void __99__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamIfSubscribed__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isSubscribedForBacklightEvents])
  {
    v2 = [*(id *)(a1 + 32) suggestion];
    int v3 = [v2 suggestionWasAlreadyDismissed];

    if (v3)
    {
      int v4 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamIfSubscribed]_block_invoke";
        _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: Suggestion has already been dismissed, no need to start the backlight subscriber.", (uint8_t *)&v7, 0xCu);
      }

      [*(id *)(a1 + 32) setIsSubscribedForBacklightEvents:0];
    }
    else
    {
      id v6 = (id)[*(id *)(a1 + 32) backlightEventSink];
    }
  }
  else
  {
    id v5 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamIfSubscribed]_block_invoke";
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: Not subscribed to the backlight stream so don't set it up.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)backlightEventSink
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  backlightEventSink = self->_backlightEventSink;
  if (backlightEventSink)
  {
    int v3 = backlightEventSink;
  }
  else
  {
    id v5 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventSink]";
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: Setting up the backlight subscriber", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v6 = objc_alloc(MEMORY[0x1E4F502E8]);
    int v7 = [(ATXUserEducationSuggestionBaseServer *)self serialQueue];
    uint64_t v8 = (BMBiomeScheduler *)[v6 initWithIdentifier:@"ATXUserEducationSuggestionExploreFacesServer.Backlight" targetQueue:v7];
    backlightEventScheduler = self->_backlightEventScheduler;
    self->_backlightEventScheduler = v8;

    int v10 = BiomeLibrary();
    uint64_t v11 = [v10 Device];
    __int16 v12 = [v11 ScreenLocked];
    uint64_t v13 = objc_msgSend(v12, "atx_DSLPublisher");
    uint64_t v14 = [v13 filterWithKeyPath:@"eventBody.starting" value:MEMORY[0x1E4F1CC28]];
    int64_t v15 = [v14 subscribeOn:self->_backlightEventScheduler];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_43;
    v20[3] = &unk_1E68AE228;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v16 = [v15 sinkWithCompletion:&__block_literal_global_52 receiveInput:v20];
    p_backlightEventSink = (id *)&self->_backlightEventSink;
    id v18 = *p_backlightEventSink;
    id *p_backlightEventSink = (id)v16;

    int v3 = (BPSSink *)*p_backlightEventSink;
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  int v4 = __atxlog_handle_context_user_education_suggestions();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventSink]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: Done listening to backlight events", (uint8_t *)&v6, 0xCu);
  }
}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_43(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained backlightEventHandler:v3];
}

- (void)backlightEventHandler:(id)a3
{
  *(void *)&v34[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXUserEducationSuggestionExploreFacesServer *)self isSubscribedForBacklightEvents])
  {
    id v5 = [v4 eventBody];
    int v6 = v5;
    if (v5)
    {
      if ([v5 hasStarting])
      {
        [(NSUserDefaults *)self->_defaults doubleForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_TimestampFirstSubscribedToBackLightStream"];
        double v8 = v7;
        [v4 timestamp];
        if (v9 >= v8)
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F1C9C8];
          [v4 timestamp];
          int v10 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
          uint64_t v26 = __atxlog_handle_context_user_education_suggestions();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = 136315650;
            uint64_t v32 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
            __int16 v33 = 1024;
            *(_DWORD *)v34 = [v6 starting];
            v34[2] = 2114;
            *(void *)&v34[3] = v10;
            _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%s: Backlight on: %{BOOL}d Date: %{public}@", (uint8_t *)&v31, 0x1Cu);
          }

          NSInteger v27 = [(NSUserDefaults *)self->_defaults integerForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_BacklightOffCount"]+ 1;
          [(NSUserDefaults *)self->_defaults setInteger:v27 forKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_BacklightOffCount"];
          int64_t v28 = [(ATXUserEducationSuggestionExploreFacesServer *)self numBacklightOffEventsBeforeDismissSuggestion];
          int64_t v29 = v28 - v27;
          if (v28 <= v27)
          {
            [(ATXUserEducationSuggestionExploreFacesServer *)self cancelBacklightEventSubscription];
            [(ATXUserEducationSuggestionExploreFacesServer *)self setIsSubscribedForBacklightEvents:0];
            [(ATXUserEducationSuggestionExploreFacesServer *)self sendSuggestionWithEventType:1];
          }
          else
          {
            uint64_t v30 = __atxlog_handle_context_user_education_suggestions();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              int v31 = 136315394;
              uint64_t v32 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
              __int16 v33 = 2048;
              *(void *)v34 = v29;
              _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, "%s: %ld more backlight off events required before dismissing the suggestion.", (uint8_t *)&v31, 0x16u);
            }
          }
        }
        else
        {
          int v10 = __atxlog_handle_context_user_education_suggestions();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:](v10);
          }
        }
      }
      else
      {
        int v10 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:](v10, v18, v19, v20, v21, v22, v23, v24);
        }
      }
    }
    else
    {
      int v10 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    int v6 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:].cold.4(v6);
    }
  }
}

- (void)cancelBacklightEventSubscription
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__ATXUserEducationSuggestionExploreFacesServer_cancelBacklightEventSubscription__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v2];
}

void __80__ATXUserEducationSuggestionExploreFacesServer_cancelBacklightEventSubscription__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ATXUserEducationSuggestionExploreFacesServer cancelBacklightEventSubscription]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Cancelling backlight biome subscription", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) backlightEventSink];
  [v3 cancel];
}

- (int64_t)minHour
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_minHour"];
  int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = [(ATXNotificationManagementMAConstants *)self->_constants ATXUserEducationSuggestionExploreFacesServer_minHour];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)maxHour
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_maxHour"];
  int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = [(ATXNotificationManagementMAConstants *)self->_constants ATXUserEducationSuggestionExploreFacesServer_maxHour];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)tryAgainIntervalSeconds
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds"];
  int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = [(ATXNotificationManagementMAConstants *)self->_constants ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)gracePeriod
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_gracePeriod"];
  int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = [(ATXNotificationManagementMAConstants *)self->_constants ATXUserEducationSuggestionExploreFacesServer_gracePeriod];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)numBacklightOffEventsBeforeDismissSuggestion
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion"];
  int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = [(ATXNotificationManagementMAConstants *)self->_constants ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion];
  }
  int64_t v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightEventSink, 0);
  objc_storeStrong((id *)&self->_backlightEventScheduler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_27_cold_1(void *a1)
{
  double v7 = [a1 error];
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v1, v2, "%s: error fetching latest mode change event from biome %@", v3, v4, v5, v6, 2u);
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_29_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamForTheFirstTime]_block_invoke";
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "%s: Trying to start up the backlight subscriber for the first time, but found that it's already subscribed. This shouldn't happen. Returning early.", (uint8_t *)&v1, 0xCu);
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + a2);
  uint64_t v4 = *(void *)(*(void *)a1 + 48);
  int v5 = 136315650;
  uint64_t v6 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamForTheFirstTime]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "%s: Trying to start up the backlight subscriber for the first time, but found that the internal biome objects have already been allocated and initialized. This shouldn't happen. Returning early. %@ %@", (uint8_t *)&v5, 0x20u);
}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_cold_1(void *a1)
{
  __int16 v7 = [a1 error];
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v1, v2, "%s: Error listening to backlight events: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)backlightEventHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)backlightEventHandler:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "%s: Ignoring backlight event that happened before the time that we first subscribed to the biome stream.", (uint8_t *)&v1, 0xCu);
}

- (void)backlightEventHandler:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)backlightEventHandler:(os_log_t)log .cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "%s: Not responding to backlight event. Handler called even though we're no longer subscribed to the biome stream.", (uint8_t *)&v1, 0xCu);
}

@end