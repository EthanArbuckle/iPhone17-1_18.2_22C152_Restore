@interface HealthFollowUpExtensionViewController
+ (id)actionIdentifiers;
+ (void)clearFollowUpItemWithIdentifier:(id)a3;
- (id)makeHealthStore;
- (id)makeHealthViewControllerToPresent;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HealthFollowUpExtensionViewController

+ (id)actionIdentifiers
{
  v4[0] = kHKEmergencyFollowUpOnboardActionIdentifier;
  v4[1] = kHKEmergencyFollowUpReviewActionIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HealthFollowUpExtensionViewController;
  [(HealthFollowUpExtensionViewController *)&v12 viewDidAppear:a3];
  _HKInitializeLogging();
  v4 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = objc_opt_class();
    activeItem = self->_activeItem;
    activeAction = self->_activeAction;
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = activeItem;
    __int16 v17 = 2112;
    v18 = activeAction;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to present view controller for item %@, action %@", buf, 0x20u);
  }
  v10 = [(HealthFollowUpExtensionViewController *)self makeHealthViewControllerToPresent];
  if (v10)
  {
    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
    [v11 setModalInPresentation:1];
    [(HealthFollowUpExtensionViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    [(HealthFollowUpExtensionViewController *)self finishProcessing];
  }
}

- (id)makeHealthViewControllerToPresent
{
  v3 = [(FLFollowUpItem *)self->_activeItem uniqueIdentifier];
  if ([v3 isEqualToString:kHKEmergencyFollowUpUniqueIdentifier])
  {
    v4 = [(FLFollowUpAction *)self->_activeAction identifier];
    v5 = [(HealthFollowUpExtensionViewController *)self makeHealthStore];
    v6 = +[EmergencyAccessBuddyViewControllerCreator makeFollowUpViewControllerFor:v4 healthStore:v5 followUpDelegate:self];
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_100006DE4(v7);
    }
    v6 = 0;
  }

  return v6;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  _HKInitializeLogging();
  id v11 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = v11;
    int v21 = 138412802;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    id v13 = v22;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Extension processing item: %@ action: %@", (uint8_t *)&v21, 0x20u);
  }
  v14 = [(id)objc_opt_class() actionIdentifiers];
  __int16 v15 = [v9 identifier];
  unsigned int v16 = [v14 containsObject:v15];

  if (v16)
  {
    objc_storeStrong((id *)&self->_activeAction, a4);
    __int16 v17 = (FLFollowUpItem *)v8;
    activeItem = self->_activeItem;
    self->_activeItem = v17;
  }
  else
  {
    _HKInitializeLogging();
    v19 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_100006E80(v19);
    }
    v20 = objc_opt_class();
    activeItem = [v8 uniqueIdentifier];
    [v20 clearFollowUpItemWithIdentifier:activeItem];
  }

  v10[2](v10, v16 ^ 1);
}

+ (void)clearFollowUpItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FLFollowUpController);
  id v6 = [v5 initWithClientIdentifier:kHKEmergencyFollowUpClientIdentifier];
  if (v6)
  {
    id v11 = v4;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005E24;
    v8[3] = &unk_1000082D8;
    id v10 = a1;
    id v9 = v4;
    [v6 clearPendingFollowUpItemsWithUniqueIdentifiers:v7 completion:v8];
  }
}

- (id)makeHealthStore
{
  id v2 = objc_alloc_init((Class)HKHealthStore);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAction, 0);

  objc_storeStrong((id *)&self->_activeItem, 0);
}

@end