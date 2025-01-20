@interface AMSFollowUpViewController
- (AMSFollowUp)followUp;
- (AMSFollowUpAction)action;
- (AMSFollowUpItem)item;
- (BOOL)viewHasAppeared;
- (NSMutableArray)activePromises;
- (OS_dispatch_queue)internalQueue;
- (UIViewController)accountViewController;
- (id)_bagContract;
- (void)_dismiss;
- (void)_enqueueClearFollowUp;
- (void)_enqueueFollowUpAction;
- (void)_enqueueMetricsForAction;
- (void)_enqueuePromise:(id)a3;
- (void)_presentAccountViewController;
- (void)_presentEngagementAccountViewControllerWithBag:(id)a3;
- (void)_presentLegacyAccountViewController;
- (void)_waitForPromises;
- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setAccountViewController:(id)a3;
- (void)setAction:(id)a3;
- (void)setActivePromises:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setItem:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSFollowUpViewController

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AMSFollowUpViewController;
  [(AMSFollowUpViewController *)&v6 viewWillLayoutSubviews];
  v3 = [(AMSFollowUpViewController *)self view];
  [v3 setOpaque:0];

  v4 = +[UIColor clearColor];
  v5 = [(AMSFollowUpViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSFollowUpViewController;
  [(AMSFollowUpViewController *)&v4 viewDidAppear:a3];
  if (![(AMSFollowUpViewController *)self viewHasAppeared])
  {
    [(AMSFollowUpViewController *)self _presentAccountViewController];
    [(AMSFollowUpViewController *)self setViewHasAppeared:1];
  }
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, void))a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.AppleMediaServices.FollowUpVC", 0);
  [(AMSFollowUpViewController *)self setInternalQueue:v11];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  [(AMSFollowUpViewController *)self setActivePromises:v12];

  id v13 = objc_alloc_init((Class)AMSFollowUp);
  [(AMSFollowUpViewController *)self setFollowUp:v13];

  id v14 = [objc_alloc((Class)AMSFollowUpItem) initWithFollowUpItem:v10];
  [(AMSFollowUpViewController *)self setItem:v14];

  id v15 = [objc_alloc((Class)AMSFollowUpAction) initWithItem:v10 action:v9];
  [(AMSFollowUpViewController *)self setAction:v15];

  v16 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v16)
  {
    v16 = +[AMSLogConfig sharedConfig];
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    id v19 = v18;
    v20 = [(AMSFollowUpViewController *)self item];
    v21 = [v20 logKey];
    *(_DWORD *)buf = 138543618;
    v40 = v18;
    __int16 v41 = 2114;
    v42 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing follow up", buf, 0x16u);
  }
  [(AMSFollowUpViewController *)self _enqueueFollowUpAction];
  [(AMSFollowUpViewController *)self _enqueueMetricsForAction];
  v22 = [(AMSFollowUpViewController *)self action];
  unsigned int v23 = [v22 requiresFollowUpUI];

  uint64_t v24 = +[AMSLogConfig sharedFollowUpConfig];
  v25 = (void *)v24;
  if (v23)
  {
    if (!v24)
    {
      v25 = +[AMSLogConfig sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      id v28 = v27;
      v29 = [(AMSFollowUpViewController *)self item];
      v30 = [v29 logKey];
      *(_DWORD *)buf = 138543618;
      v40 = v27;
      __int16 v41 = 2114;
      v42 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requesting UI", buf, 0x16u);
    }
    v8[2](v8, 0);
  }
  else
  {
    if (!v24)
    {
      v25 = +[AMSLogConfig sharedConfig];
    }
    v31 = [v25 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_opt_class();
      id v33 = v32;
      v34 = [(AMSFollowUpViewController *)self item];
      v35 = [v34 logKey];
      *(_DWORD *)buf = 138543618;
      v40 = v32;
      __int16 v41 = 2114;
      v42 = v35;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requesting headless execution", buf, 0x16u);
    }
    v36 = [(AMSFollowUpViewController *)self internalQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100003C80;
    v37[3] = &unk_100008230;
    v37[4] = self;
    v38 = v8;
    dispatch_async(v36, v37);
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSFollowUp);
  objc_super v6 = [v5 pendingFollowUps];
  v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003E04;
    v11[3] = &unk_100008258;
    v11[4] = self;
    v8 = [v6 thenWithBlock:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003FA4;
    v9[3] = &unk_100008280;
    id v10 = v4;
    [v8 addFinishBlock:v9];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_bagContract
{
  v2 = objc_alloc_init(AMSFollowUpBag);
  return v2;
}

- (void)_enqueueClearFollowUp
{
  v3 = [(AMSFollowUpViewController *)self followUp];
  id v4 = [(AMSFollowUpViewController *)self item];
  id v5 = [v4 identifier];
  objc_super v6 = [(AMSFollowUpViewController *)self item];
  v7 = [v6 account];
  v8 = [v3 clearFollowUpWithIdentifier:v5 account:v7];

  [(AMSFollowUpViewController *)self _enqueuePromise:v8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000040FC;
  v9[3] = &unk_1000082A8;
  void v9[4] = self;
  [v8 addFinishBlock:v9];
}

- (void)_enqueueFollowUpAction
{
  v3 = [(AMSFollowUpViewController *)self action];
  id v4 = [(AMSFollowUpViewController *)self _bagContract];
  id v5 = [(AMSFollowUpViewController *)self item];
  objc_super v6 = [v5 account];
  v7 = [v3 performActionsWithContract:v4 account:v6];

  [(AMSFollowUpViewController *)self _enqueuePromise:v7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004414;
  v8[3] = &unk_1000082A8;
  v8[4] = self;
  [v7 addFinishBlock:v8];
}

- (void)_enqueueMetricsForAction
{
  v3 = [(AMSFollowUpViewController *)self action];
  id v4 = [(AMSFollowUpViewController *)self _bagContract];
  id v5 = [v3 postMetricsWithBagContract:v4];

  if (v5)
  {
    [(AMSFollowUpViewController *)self _enqueuePromise:v5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004700;
    v6[3] = &unk_1000082D0;
    v6[4] = self;
    [v5 addFinishBlock:v6];
  }
}

- (void)_enqueuePromise:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSFollowUpViewController *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004A34;
  v7[3] = &unk_1000082F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_presentAccountViewController
{
  v3 = +[AMSUIEngagementTask createBagForSubProfile];
  id v4 = [(AMSFollowUpViewController *)self action];
  id v5 = [v4 url];

  id v6 = [objc_alloc((Class)AMSURLParser) initWithBag:v3];
  v7 = [v6 typeForURL:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004B90;
  v9[3] = &unk_100008320;
  void v9[4] = self;
  id v10 = v3;
  id v8 = v3;
  [v7 addFinishBlock:v9];
}

- (void)_presentEngagementAccountViewControllerWithBag:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSEngagementRequest);
  id v6 = [(AMSFollowUpViewController *)self item];
  v7 = [v6 account];
  if (v7)
  {
    [v5 setAccount:v7];
  }
  else
  {
    id v8 = +[ACAccountStore ams_sharedAccountStore];
    id v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
    [v5 setAccount:v9];
  }
  id v10 = [(AMSFollowUpViewController *)self action];
  dispatch_queue_t v11 = [v10 url];
  [v5 setURL:v11];

  [v5 setClientData:&off_100008618];
  [v5 setFailOnDismiss:1];
  id v12 = [objc_alloc((Class)AMSUIEngagementTask) initWithRequest:v5 bag:v4 presentingViewController:self];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100004FFC;
  v15[4] = sub_10000500C;
  v16 = self;
  id v13 = [v12 presentEngagement];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005014;
  v14[3] = &unk_100008348;
  v14[4] = v15;
  [v13 addFinishBlock:v14];

  _Block_object_dispose(v15, 8);
}

- (void)_dismiss
{
  v3 = [(AMSFollowUpViewController *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000529C;
  block[3] = &unk_100008370;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_waitForPromises
{
  v3 = [(AMSFollowUpViewController *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(AMSFollowUpViewController *)self activePromises];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 performSelector:"waitUntilFinished"];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v10 = objc_alloc_init((Class)NSMutableArray);
  [(AMSFollowUpViewController *)self setActivePromises:v10];
}

- (void)_presentLegacyAccountViewController
{
  v3 = [(AMSFollowUpViewController *)self action];
  id v4 = [v3 url];

  id v5 = [objc_alloc(off_10000D230()) initWithAccountURL:v4];
  [v5 setDelegate:self];
  [(AMSFollowUpViewController *)self setAccountViewController:v5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000550C;
  block[3] = &unk_100008370;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  id v5 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(AMSFollowUpViewController *)self item];
    id v10 = [v9 logKey];
    int v11 = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Interruption resolved", (uint8_t *)&v11, 0x16u);
  }
  [(AMSFollowUpViewController *)self _enqueueClearFollowUp];
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000057E4;
  v5[3] = &unk_100008398;
  objc_copyWeak(&v6, &location);
  [v4 dismissViewControllerAnimated:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (AMSFollowUpAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSMutableArray)activePromises
{
  return self->_activePromises;
}

- (void)setActivePromises:(id)a3
{
}

- (AMSFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (AMSFollowUpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (UIViewController)accountViewController
{
  return self->_accountViewController;
}

- (void)setAccountViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_activePromises, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end