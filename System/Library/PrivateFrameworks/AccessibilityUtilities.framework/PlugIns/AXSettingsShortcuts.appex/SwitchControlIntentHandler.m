@interface SwitchControlIntentHandler
- (void)handleToggleSwitchControl:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleSwitchControl:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleSwitchControl:(id)a3 withCompletion:(id)a4;
@end

@implementation SwitchControlIntentHandler

- (void)handleToggleSwitchControl:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AXToggleSwitchControlIntentResponse *))a4;
  if ([v5 operation] != (id)1 || objc_msgSend(v5, "state"))
  {
    if ([v5 operation] == (id)2) {
      BOOL v7 = _AXSAssistiveTouchScannerEnabled() == 0;
    }
    else {
      BOOL v7 = [v5 state] == (id)1;
    }
    int v8 = v7;
    v9 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"OFF";
      if (v8) {
        CFStringRef v10 = @"ON";
      }
      int v21 = 138412290;
      CFStringRef v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SwitchControlIntentHandler Turning  %@", (uint8_t *)&v21, 0xCu);
    }

    v11 = (AXToggleSwitchControlIntentResponse *)_AXSTripleClickCopyOptions();
    _AXSAssistiveTouchScannerSetEnabled();
    v12 = +[AXSettings sharedInstance];
    v13 = v12;
    if (v8)
    {
      [v12 setAssistiveTouchSwitchUsageConfirmed:1];

      if (([(AXToggleSwitchControlIntentResponse *)v11 containsObject:&off_100014AC0] & 1) == 0)
      {
        _AXSTripleClickAddOption();
        v14 = +[AXSettings sharedInstance];
        v15 = v14;
        uint64_t v16 = 1;
LABEL_20:
        [v14 setAssistiveTouchScannerAddedTripleClickAutomatically:v16];
      }
    }
    else
    {
      unsigned int v17 = [v12 assistiveTouchScannerAddedTripleClickAutomatically];

      if (v17)
      {
        if ([(AXToggleSwitchControlIntentResponse *)v11 containsObject:&off_100014AC0])
        {
          id v18 = [(AXToggleSwitchControlIntentResponse *)v11 mutableCopy];
          [v18 removeObject:&off_100014AC0];
          _AXSSetTripleClickOptions();
        }
        v14 = +[AXSettings sharedInstance];
        v15 = v14;
        uint64_t v16 = 0;
        goto LABEL_20;
      }
    }
    v19 = [[AXToggleSwitchControlIntentResponse alloc] initWithCode:4 userActivity:0];
    v6[2](v6, v19);

    goto LABEL_22;
  }
  v20 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10000C1B8((uint64_t)v5, v20);
  }

  v11 = [[AXToggleSwitchControlIntentResponse alloc] initWithCode:5 userActivity:0];
  v6[2](v6, v11);
LABEL_22:
}

- (void)resolveOperationForToggleSwitchControl:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleSwitchControl:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end