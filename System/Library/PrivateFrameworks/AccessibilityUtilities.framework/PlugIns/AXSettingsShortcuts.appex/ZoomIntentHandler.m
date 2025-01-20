@interface ZoomIntentHandler
- (void)handleToggleZoom:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleZoom:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleZoom:(id)a3 withCompletion:(id)a4;
@end

@implementation ZoomIntentHandler

- (void)handleToggleZoom:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    v13 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000C1B8((uint64_t)v5, v13);
    }

    v10 = [AXToggleZoomIntentResponse alloc];
    uint64_t v11 = 5;
  }
  else
  {
    if ([v5 operation] == (id)2) {
      BOOL v7 = _AXSZoomTouchEnabled() == 0;
    }
    else {
      BOOL v7 = [v5 state] == (id)1;
    }
    int v8 = v7;
    _AXSZoomTouchSetEnabled();
    _AXSZoomTouchSetToggledByPreferenceSwitch();
    if (v8)
    {
      v9 = +[AXSettings sharedInstance];
      [v9 setZoomInStandby:0];
    }
    v10 = [AXToggleZoomIntentResponse alloc];
    uint64_t v11 = 4;
  }
  v12 = [(AXToggleZoomIntentResponse *)v10 initWithCode:v11 userActivity:0];
  v6[2](v6, v12);
}

- (void)resolveOperationForToggleZoom:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleZoom:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end