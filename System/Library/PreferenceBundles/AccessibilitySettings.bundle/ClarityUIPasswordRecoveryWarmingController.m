@interface ClarityUIPasswordRecoveryWarmingController
- (ClarityUIPasswordRecoveryWarmingController)initWithCompletion:(id)a3;
- (id)completionHandler;
- (void)_didTapNextButton:(id)a3;
- (void)_didTapSkipButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation ClarityUIPasswordRecoveryWarmingController

- (ClarityUIPasswordRecoveryWarmingController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = settingsLocString(@"PASSWORD_RECOVERY_TITLE", @"ClarityUISettings");
  if (_os_feature_enabled_impl())
  {
    v6 = [@"PASSWORD_RECOVERY_SUBTITLE" stringByAppendingString:@"_AABRANDING"];
    v7 = settingsLocString(v6, @"ClarityUISettings");
  }
  else
  {
    v7 = settingsLocString(@"PASSWORD_RECOVERY_SUBTITLE", @"ClarityUISettings");
  }
  v20.receiver = self;
  v20.super_class = (Class)ClarityUIPasswordRecoveryWarmingController;
  v8 = [(ClarityUIPasswordRecoveryWarmingController *)&v20 initWithTitle:v5 detailText:v7 icon:0];
  if (v8)
  {
    id v9 = objc_retainBlock(v4);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = v9;

    v11 = +[OBBoldTrayButton boldButton];
    int v12 = _os_feature_enabled_impl();
    if (v12)
    {
      v13 = [@"PASSWORD_RECOVERY_CONTINUE" stringByAppendingString:@"_AABRANDING"];
    }
    else
    {
      v13 = @"PASSWORD_RECOVERY_CONTINUE";
    }
    v14 = settingsLocString(v13, @"ClarityUISettings");
    [v11 setTitle:v14 forState:0];

    if (v12) {
    [v11 addTarget:v8 action:"_didTapNextButton:" forControlEvents:0x2000];
    }
    v15 = [(ClarityUIPasswordRecoveryWarmingController *)v8 buttonTray];
    [v15 addButton:v11];

    v16 = +[OBLinkTrayButton linkButton];
    v17 = settingsLocString(@"PASSWORD_RECOVERY_SKIP", @"ClarityUISettings");
    [v16 setTitle:v17 forState:0];

    [v16 addTarget:v8 action:"_didTapSkipButton:" forControlEvents:0x2000];
    v18 = [(ClarityUIPasswordRecoveryWarmingController *)v8 buttonTray];
    [v18 addButton:v16];
  }
  return v8;
}

- (void)_didTapNextButton:(id)a3
{
}

- (void)_didTapSkipButton:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end