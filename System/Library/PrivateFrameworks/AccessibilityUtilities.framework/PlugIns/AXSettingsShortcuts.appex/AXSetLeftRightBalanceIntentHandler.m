@interface AXSetLeftRightBalanceIntentHandler
- (void)handleSetLeftRightBalance:(id)a3 completion:(id)a4;
- (void)resolveOperationForSetLeftRightBalance:(id)a3 withCompletion:(id)a4;
- (void)resolveParameterForSetLeftRightBalance:(id)a3 withCompletion:(id)a4;
- (void)resolveValueForSetLeftRightBalance:(id)a3 withCompletion:(id)a4;
@end

@implementation AXSetLeftRightBalanceIntentHandler

- (void)handleSetLeftRightBalance:(id)a3 completion:(id)a4
{
  id v16 = a3;
  v5 = (void (**)(id, AXSetLeftRightBalanceIntentResponse *))a4;
  if ([v16 operation] == (id)1)
  {
    v6 = +[AXSettings sharedInstance];
    unsigned int v7 = [v6 leftRightBalanceEnabled];

    v8 = +[AXSettings sharedInstance];
    [v8 setLeftRightBalanceEnabled:v7 ^ 1];
  }
  else
  {
    if ([v16 operation] != (id)2) {
      goto LABEL_6;
    }
    v9 = [v16 value];
    [v9 floatValue];

    AXSLogarithmicValueForLinearValue();
    float v11 = v10;
    BOOL v12 = v10 != 0.0;
    v13 = +[AXSettings sharedInstance];
    [v13 setLeftRightBalanceEnabled:v12];

    v14 = +[AXSettings sharedInstance];
    [v14 setLeftRightBalanceValue:v11];

    _AXSSetLeftRightAudioBalance();
  }
  v15 = [[AXSetLeftRightBalanceIntentResponse alloc] initWithCode:4 userActivity:0];
  v5[2](v5, v15);

LABEL_6:
}

- (void)resolveOperationForSetLeftRightBalance:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXLeftRightBalanceOperationResolutionResult successWithResolvedLeftRightBalanceOperation:](AXLeftRightBalanceOperationResolutionResult, "successWithResolvedLeftRightBalanceOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveParameterForSetLeftRightBalance:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 parameter]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveValueForSetLeftRightBalance:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 value];
  [v8 doubleValue];
  id v7 = +[AXSetLeftRightBalanceValueResolutionResult successWithResolvedValue:](AXSetLeftRightBalanceValueResolutionResult, "successWithResolvedValue:");
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

@end