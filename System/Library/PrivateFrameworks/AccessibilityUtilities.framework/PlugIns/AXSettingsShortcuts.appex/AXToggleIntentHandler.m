@interface AXToggleIntentHandler
- (void)handleToggleAssistiveTouch:(id)a3 completion:(id)a4;
- (void)handleToggleAutoAnswerCalls:(id)a3 completion:(id)a4;
- (void)handleToggleCaptions:(id)a3 completion:(id)a4;
- (void)handleToggleColorFilters:(id)a3 completion:(id)a4;
- (void)handleToggleContrast:(id)a3 completion:(id)a4;
- (void)handleToggleLEDFlash:(id)a3 completion:(id)a4;
- (void)handleToggleLiveCaptions:(id)a3 completion:(id)a4;
- (void)handleToggleMonoAudio:(id)a3 completion:(id)a4;
- (void)handleToggleTransparency:(id)a3 completion:(id)a4;
- (void)handleToggleVoiceControl:(id)a3 completion:(id)a4;
- (void)handleToggleWhitePoint:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleAssistiveTouch:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleAutoAnswerCalls:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleCaptions:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleColorFilters:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleContrast:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleLEDFlash:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleLiveCaptions:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleMonoAudio:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleTransparency:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleVoiceControl:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleWhitePoint:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleAssistiveTouch:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleAutoAnswerCalls:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleCaptions:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleColorFilters:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleContrast:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleLEDFlash:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleLiveCaptions:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleMonoAudio:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleTransparency:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleVoiceControl:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleWhitePoint:(id)a3 withCompletion:(id)a4;
@end

@implementation AXToggleIntentHandler

- (void)handleToggleVoiceControl:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AXToggleVoiceControlIntentResponse *))a4;
  int v7 = _AXSCommandAndControlEnabled();
  v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSCommandAndControlEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSCommandAndControlSetEnabled();
    uint64_t v9 = 4;
  }
  v10 = [[AXToggleVoiceControlIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleVoiceControl:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleVoiceControl:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleTransparency:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleTransparencyIntentResponse *))a4;
  int v7 = _AXSEnhanceBackgroundContrastEnabled();
  v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSEnhanceBackgroundContrastEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSSetEnhanceBackgroundContrastEnabled();
    uint64_t v9 = 4;
  }
  v10 = [[AXToggleTransparencyIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleTransparency:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleTransparency:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleContrast:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleContrastIntentResponse *))a4;
  int v7 = _AXDarkenSystemColors();
  v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXDarkenSystemColors();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSSetDarkenSystemColors();
    uint64_t v9 = 4;
  }
  v10 = [[AXToggleContrastIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleContrast:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleContrast:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleWhitePoint:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleWhitePointIntentResponse *))a4;
  int v7 = _AXSReduceWhitePointEnabled();
  v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSReduceWhitePointEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSSetReduceWhitePointEnabled();
    uint64_t v9 = 4;
  }
  v10 = [[AXToggleWhitePointIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleWhitePoint:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleWhitePoint:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleColorFilters:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    int v12 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = [AXToggleColorFiltersIntentResponse alloc];
    uint64_t v10 = 5;
  }
  else
  {
    id v7 = +[AXBackBoardServer server];
    unsigned int v8 = [v7 supportsAccessibilityDisplayFilters];

    if (v8)
    {
      MADisplayFilterPrefGetCategoryEnabled();
      if ([v5 operation] == (id)1) {
        [v5 state];
      }
      MADisplayFilterPrefSetCategoryEnabled();
    }
    else
    {
      if ([v5 operation] == (id)1) {
        [v5 state];
      }
      else {
        _AXSGrayscaleEnabled();
      }
      _AXSGrayscaleSetEnabled();
    }
    uint64_t v9 = [AXToggleColorFiltersIntentResponse alloc];
    uint64_t v10 = 4;
  }
  v11 = [(AXToggleColorFiltersIntentResponse *)v9 initWithCode:v10 userActivity:0];
  v6[2](v6, v11);
}

- (void)resolveOperationForToggleColorFilters:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleColorFilters:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleCaptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleCaptionsIntentResponse *))a4;
  int v7 = _AXSClosedCaptionsEnabled();
  unsigned int v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSClosedCaptionsEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSClosedCaptionsSetEnabled();
    uint64_t v9 = 4;
  }
  uint64_t v10 = [[AXToggleCaptionsIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleMonoAudio:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleMonoAudioIntentResponse *))a4;
  int v7 = _AXSMonoAudioEnabled();
  unsigned int v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSMonoAudioEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSMonoAudioSetEnabled();
    uint64_t v9 = 4;
  }
  uint64_t v10 = [[AXToggleMonoAudioIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleMonoAudio:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleMonoAudio:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleLEDFlash:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleLEDFlashIntentResponse *))a4;
  int v7 = _AXSVisualAlertEnabled();
  unsigned int v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSVisualAlertEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSVisualAlertSetEnabled();
    uint64_t v9 = 4;
  }
  uint64_t v10 = [[AXToggleLEDFlashIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleLEDFlash:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleLEDFlash:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleLiveCaptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleLiveCaptionsIntentResponse *))a4;
  int v7 = _AXSLiveTranscriptionEnabled();
  unsigned int v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v7 == 0;
    __int16 v16 = 1024;
    int v17 = _AXSLiveTranscriptionEnabled();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v12, 0x18u);
  }

  if ([v5 operation] == (id)1 && (objc_msgSend(v5, "state"), !objc_msgSend(v5, "state")))
  {
    v11 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v9 = 5;
  }
  else
  {
    _AXSLiveTranscriptionSetEnabled();
    uint64_t v9 = 4;
  }
  uint64_t v10 = [[AXToggleLiveCaptionsIntentResponse alloc] initWithCode:v9 userActivity:0];
  v6[2](v6, v10);
}

- (void)resolveOperationForToggleLiveCaptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleLiveCaptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleAutoAnswerCalls:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleAutoAnswerCallsIntentResponse *))a4;
  unsigned int v7 = sub_100004B94();
  unsigned int v8 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543874;
    id v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v7 == 0;
    __int16 v17 = 1024;
    unsigned int v18 = sub_100004B94();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v13, 0x18u);
  }

  BOOL v9 = v7 == 0;
  if ([v5 operation] == (id)1 && (BOOL v9 = objc_msgSend(v5, "state") == (id)1, !objc_msgSend(v5, "state")))
  {
    uint64_t v10 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }
    uint64_t v11 = 5;
  }
  else
  {
    uint64_t v10 = +[AXSettings sharedInstance];
    [v10 setCallAudioRoutingAutoAnswerEnabled:v9];
    uint64_t v11 = 4;
  }

  int v12 = [[AXToggleAutoAnswerCallsIntentResponse alloc] initWithCode:v11 userActivity:0];
  v6[2](v6, v12);
}

- (void)resolveOperationForToggleAutoAnswerCalls:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleAutoAnswerCalls:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleAssistiveTouch:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXToggleAssistiveTouchIntentResponse *))a4;
  int v7 = _AXSAssistiveTouchEnabled();
  BOOL v8 = v7 == 0;
  BOOL v9 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543874;
    id v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v7 == 0;
    __int16 v17 = 1024;
    int v18 = _AXSAssistiveTouchEnabled();
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, " intent: %{public}@ %i %i", (uint8_t *)&v13, 0x18u);
  }

  if ([v5 operation] == (id)1 && (BOOL v8 = objc_msgSend(v5, "state") == (id)1, !objc_msgSend(v5, "state")))
  {
    int v12 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000C230();
    }

    uint64_t v10 = 5;
  }
  else
  {
    _AXSAssistiveTouchSetEnabledShortcuts(v8);
    uint64_t v10 = 4;
  }
  uint64_t v11 = [[AXToggleAssistiveTouchIntentResponse alloc] initWithCode:v10 userActivity:0];
  v6[2](v6, v11);
}

- (void)resolveOperationForToggleAssistiveTouch:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleAssistiveTouch:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end