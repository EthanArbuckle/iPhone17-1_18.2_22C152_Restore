@interface HSPCSuggestedAutomationsViewController
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (HSPCSuggestedAutomationsViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (HUAvailableRelatedTriggerItemModuleController)recommendationModuleController;
- (NAFuture)commitInProgress;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)commitConfiguration;
- (id)shouldSkip;
- (void)setCommitInProgress:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setRecommendationModuleController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCSuggestedAutomationsViewController

- (HSPCSuggestedAutomationsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 addedAccessory];
  v10 = +[NSMutableArray array];
  id v11 = objc_alloc_init((Class)HFNullValueSource);
  if (objc_msgSend(v9, "hf_isMediaAccessory"))
  {
    id v12 = objc_alloc((Class)HFMediaAccessoryItem);
    v13 = [v9 mediaProfile];
    id v14 = [v12 initWithValueSource:v11 mediaProfileContainer:v13];
  }
  else
  {
    id v14 = [objc_alloc((Class)HFAccessoryItem) initWithAccessory:v9 valueSource:v11];
  }
  [v10 addObject:v14];
  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting up HSPCSuggestedAutomationsViewController with accessory: %@", buf, 0xCu);
  }

  v16 = [[HSPCSuggestedAutomationsItemManager alloc] initWithDelegate:self serviceLikeItems:v10];
  v23.receiver = self;
  v23.super_class = (Class)HSPCSuggestedAutomationsViewController;
  v17 = [(HSPCSuggestedAutomationsViewController *)&v23 initWithItemManager:v16 tableViewStyle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_config, a4);
    objc_storeStrong((id *)&v18->_coordinator, a3);
    v19 = +[UIColor clearColor];
    v20 = [(HSPCSuggestedAutomationsViewController *)v18 tableView];
    [v20 setBackgroundColor:v19];

    commitInProgress = v18->_commitInProgress;
    v18->_commitInProgress = 0;
  }
  return v18;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HSPCSuggestedAutomationsViewController;
  [(HSPCSuggestedAutomationsViewController *)&v3 viewDidLoad];
  [(HSPCSuggestedAutomationsViewController *)self setWantsPreferredContentSize:1];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = (HUAvailableRelatedTriggerItemModuleController *)[objc_alloc((Class)HUAvailableRelatedTriggerItemModuleController) initWithModule:v7];
    recommendationModuleController = self->_recommendationModuleController;
    self->_recommendationModuleController = v8;

    uint64_t v10 = [(HSPCSuggestedAutomationsViewController *)self recommendationModuleController];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HSPCSuggestedAutomationsViewController;
    uint64_t v10 = [(HSPCSuggestedAutomationsViewController *)&v13 buildItemModuleControllerForModule:v5];
  }
  id v11 = (void *)v10;

  return v11;
}

- (id)commitConfiguration
{
  uint64_t v3 = [(HSPCSuggestedAutomationsViewController *)self commitInProgress];
  if (v3
    && (id v4 = (void *)v3,
        [(HSPCSuggestedAutomationsViewController *)self commitInProgress],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isFinished],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v12 = +[NAFuture futureWithResult:&off_1000B0BE0];
  }
  else
  {
    id v7 = [(HSPCSuggestedAutomationsViewController *)self recommendationModuleController];
    id v8 = [v7 commitSelectedItems];
    [(HSPCSuggestedAutomationsViewController *)self setCommitInProgress:v8];

    v9 = [(HSPCSuggestedAutomationsViewController *)self itemManager];
    [v9 disableExternalUpdatesWithReason:@"setupSuggestedAutomationsVCUpdatesDisabledReason"];

    uint64_t v10 = [(HSPCSuggestedAutomationsViewController *)self commitInProgress];
    id v11 = [v10 flatMap:&stru_1000AB7C0];
    id v12 = [v11 recover:&stru_1000AB7E0];
  }

  return v12;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (id)shouldSkip
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065790;
  v5[3] = &unk_1000AB848;
  v5[4] = self;
  v2 = +[NSNumber numberWithBool:sub_100065790((uint64_t)v5)];
  uint64_t v3 = +[NAFuture futureWithResult:v2];

  return v3;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModuleController)recommendationModuleController
{
  return self->_recommendationModuleController;
}

- (void)setRecommendationModuleController:(id)a3
{
}

- (NAFuture)commitInProgress
{
  return self->_commitInProgress;
}

- (void)setCommitInProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitInProgress, 0);
  objc_storeStrong((id *)&self->_recommendationModuleController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end