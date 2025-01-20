@interface ASDFollowUpViewController
- (ASDFollowUpViewController)init;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ASDFollowUpViewController

- (ASDFollowUpViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASDFollowUpViewController;
  return [(ASDFollowUpViewController *)&v3 init];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)ASDFollowUpViewController;
  [(ASDFollowUpViewController *)&v6 viewWillLayoutSubviews];
  objc_super v3 = [(ASDFollowUpViewController *)self view];
  [v3 setOpaque:0];

  v4 = +[UIColor clearColor];
  v5 = [(ASDFollowUpViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ASDFollowUpViewController;
  [(ASDFollowUpViewController *)&v3 viewDidAppear:a3];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start with: %{public}@", buf, 0xCu);
  }

  v12 = [v9 userInfo];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"ASDAccountID"];

  v14 = [v9 userInfo];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"ASDAppleID"];

  v16 = [v9 identifier];
  unsigned int v17 = [v16 isEqualToString:@"clear"];

  if (v17)
  {
    id v18 = [v9 userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ASDRestore_FOLLOWUP_ID"];
    sub_10000340C((uint64_t)self, v19);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  if (!(v13 | v15))
  {
    v20 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Either ASDAccountID or ASDAppleID need to be provided as part of followup action. Clearing followup", buf, 2u);
    }

    id v18 = [v8 uniqueIdentifier];
    sub_10000340C((uint64_t)self, v18);
    goto LABEL_18;
  }
  v21 = [v9 identifier];
  unsigned int v22 = [v21 isEqualToString:@"auth"];

  if (v22)
  {
    v23 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v13;
      __int16 v35 = 2114;
      uint64_t v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Requesting appstored to auth for accountID: %{public}@ appleID: %{public}@", buf, 0x16u);
    }

    id v18 = [objc_alloc((Class)ASDRestoreDemotedApplicationsRequestOptions) initWithAccountID:v13 appleID:v15];
    id v19 = [objc_alloc((Class)ASDRestoreDemotedApplicationsRequest) initWithOptions:v18];
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000035B8;
    v29[3] = &unk_100004150;
    id v25 = (id)v13;
    id v30 = v25;
    id v31 = (id)v15;
    v26 = v24;
    v32 = v26;
    [v19 startWithCompletionBlock:v29];
    dispatch_time_t v27 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v26, v27))
    {
      v28 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = (uint64_t)v25;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Timed out attempting to call appstored to restore demoted apps for accountID: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_17;
  }
LABEL_19:
  v10[2](v10, 1);
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
}

@end