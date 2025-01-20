@interface VoiceOverIntentHandler
- (void)handleToggleVoiceOver:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleVoiceOver:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleVoiceOver:(id)a3 withCompletion:(id)a4;
@end

@implementation VoiceOverIntentHandler

- (void)handleToggleVoiceOver:(id)a3 completion:(id)a4
{
  v5 = (__CFString *)a3;
  v6 = (void (**)(id, AXToggleVoiceOverIntentResponse *))a4;
  v7 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    CFStringRef v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOverIntentHandler: Handling intent %@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v8 = _AXSVoiceOverTouchEnabled() == 0;
  if ([(__CFString *)v5 operation] != (id)1) {
    goto LABEL_7;
  }
  if ([(__CFString *)v5 operation] != (id)1 || [(__CFString *)v5 state])
  {
    BOOL v8 = [(__CFString *)v5 state] == (id)1;
LABEL_7:
    v9 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"NO";
      if (v8) {
        CFStringRef v10 = @"YES";
      }
      int v14 = 138412290;
      CFStringRef v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VoiceOverIntentHandler. Turning VO %@", (uint8_t *)&v14, 0xCu);
    }

    if (v8)
    {
      _AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription();
      _AXSVoiceOverTouchSetUsageConfirmed();
    }
    _AXSVoiceOverTouchSetEnabled();
    _AXSVoiceOverTouchSetUIEnabled();
    uint64_t v11 = 4;
    goto LABEL_14;
  }
  v13 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10000C1B8((uint64_t)v5, v13);
  }

  uint64_t v11 = 5;
LABEL_14:
  v12 = [[AXToggleVoiceOverIntentResponse alloc] initWithCode:v11 userActivity:0];
  v6[2](v6, v12);
}

- (void)resolveOperationForToggleVoiceOver:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleVoiceOver:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end