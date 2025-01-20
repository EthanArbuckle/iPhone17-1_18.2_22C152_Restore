@interface AXDisplayIntentHandler
- (void)confirmSetLargeText:(id)a3 completion:(id)a4;
- (void)handleSetLargeText:(id)a3 completion:(id)a4;
- (void)handleToggleClassicInvert:(id)a3 completion:(id)a4;
- (void)handleToggleSmartInvert:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleClassicInvert:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleSmartInvert:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleClassicInvert:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleSmartInvert:(id)a3 withCompletion:(id)a4;
- (void)resolveTextSizeForSetLargeText:(id)a3 withCompletion:(id)a4;
@end

@implementation AXDisplayIntentHandler

- (void)handleToggleSmartInvert:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    v16 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000C1B8((uint64_t)v5, v16);
    }

    v13 = [AXToggleSmartInvertIntentResponse alloc];
    uint64_t v14 = 5;
  }
  else
  {
    BOOL v7 = _AXSInvertColorsEnabled() == 0;
    if ([v5 operation] == (id)1) {
      BOOL v7 = [v5 state] == (id)1;
    }
    v8 = +[AXSettings sharedInstance];
    unsigned int v9 = [v8 classicInvertColors];

    if (v9 && v7)
    {
      v10 = +[AXSettings sharedInstance];
      [v10 setClassicInvertColors:0];
    }
    _AXSInvertColorsSetEnabled();
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      v12 = +[AXSettings sharedInstance];
      [v12 setLastSmartInvertColorsEnablement:Current];
    }
    v13 = [AXToggleSmartInvertIntentResponse alloc];
    uint64_t v14 = 4;
  }
  v15 = [(AXToggleSmartInvertIntentResponse *)v13 initWithCode:v14 userActivity:0];
  v6[2](v6, v15);
}

- (void)resolveOperationForToggleSmartInvert:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleSmartInvert:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleClassicInvert:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    uint64_t v14 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000C1B8((uint64_t)v5, v14);
    }

    v11 = [AXToggleClassicInvertIntentResponse alloc];
    uint64_t v12 = 5;
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    unsigned int v8 = [v7 classicInvertColors];

    if ([v5 operation] == (id)1) {
      uint64_t v9 = [v5 state] == (id)1;
    }
    else {
      uint64_t v9 = v8 ^ 1;
    }
    v10 = +[AXSettings sharedInstance];
    [v10 setClassicInvertColors:v9];

    v11 = [AXToggleClassicInvertIntentResponse alloc];
    uint64_t v12 = 4;
  }
  v13 = [(AXToggleClassicInvertIntentResponse *)v11 initWithCode:v12 userActivity:0];
  v6[2](v6, v13);
}

- (void)resolveOperationForToggleClassicInvert:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleClassicInvert:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetLargeText:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, AXSetLargeTextIntentResponse *))a4;
  id v6 = a3;
  _AXSSetLargeTextUsesExtendedRange();
  id v7 = sub_100002BB4();
  unsigned int v8 = (char *)[v6 textSize];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8 - 1];
  _AXSSetPreferredContentSizeCategoryName();

  v10 = [[AXSetLargeTextIntentResponse alloc] initWithCode:4 userActivity:0];
  v5[2](v5, v10);
}

- (void)confirmSetLargeText:(id)a3 completion:(id)a4
{
  v11 = (void (**)(id, AXSetLargeTextIntentResponse *))a4;
  uint64_t v5 = (uint64_t)[a3 textSize];
  unint64_t v6 = v5 - 1;
  if (v5 < 1
    || (sub_100002BB4(),
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6 >= (unint64_t)v8))
  {
    uint64_t v9 = 5;
  }
  else
  {
    uint64_t v9 = 4;
  }
  v10 = [[AXSetLargeTextIntentResponse alloc] initWithCode:v9 userActivity:0];
  v11[2](v11, v10);
}

- (void)resolveTextSizeForSetLargeText:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXEnumResolutionResult successWithResolvedEnum:](AXEnumResolutionResult, "successWithResolvedEnum:", [a3 textSize]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end