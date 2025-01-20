@interface StartPreflightViewController
- (BOOL)activationLockChallengeNeeded;
- (BOOL)activationLockCheck;
- (BOOL)preflightPhase1:(id *)a3;
- (BOOL)preflightPhase2:(id *)a3;
- (BOOL)shouldPresentInHostApp;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (NSArray)activationLockComponents;
- (NSArray)chimeraLockComponents;
- (NSData)preflightBaaCert;
- (NSData)preflightRIK;
- (NSDictionary)preflightResponsePhase1;
- (NSDictionary)preflightResults;
- (NSMutableArray)viewControllers;
- (OS_dispatch_semaphore)uiNeededKnownSemaphore;
- (StartPreflightInputs)inputs;
- (UINavigationController)navigationController;
- (id)baaCert;
- (id)signData:(id)a3;
- (void)activationLockComplete;
- (void)cancel;
- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4;
- (void)handleButtonEvent:(unint64_t)a3;
- (void)moveToNextViewController;
- (void)setActivationLockChallengeNeeded:(BOOL)a3;
- (void)setActivationLockComponents:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setChimeraLockComponents:(id)a3;
- (void)setInputs:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPreflightBaaCert:(id)a3;
- (void)setPreflightRIK:(id)a3;
- (void)setPreflightResponsePhase1:(id)a3;
- (void)setPreflightResults:(id)a3;
- (void)setUiNeededKnownSemaphore:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setupActivationLockView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation StartPreflightViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[StartPreflightViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  [(StartPreflightViewController *)self setInputs:v6];
  v9 = [(StartPreflightViewController *)self inputs];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    v11 = [(StartPreflightViewController *)self result];
    [v11 setStatusCode:&off_1000194A8];

    [(StartPreflightViewController *)self setFinished:1];
  }
  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!sub_10000C5A0())
  {
    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010538();
    }

    v14 = [(StartPreflightViewController *)self result];
    [v14 setStatusCode:&off_1000194C0];

    [(StartPreflightViewController *)self setFinished:1];
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v15 = (void *)qword_10001E168;
  uint64_t v28 = qword_10001E168;
  if (!qword_10001E168)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10000C6E4;
    v30 = &unk_100018918;
    v31 = &v25;
    sub_10000C6E4((uint64_t)buf);
    v15 = (void *)v26[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v25, 8);
  v17 = objc_opt_new();
  [(StartPreflightViewController *)self setButtonEventMonitor:v17];

  v18 = [(StartPreflightViewController *)self buttonEventMonitor];
  LODWORD(v17) = v18 == 0;

  if (v17)
  {
    v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100010504();
    }

    v20 = [(StartPreflightViewController *)self result];
    [v20 setStatusCode:&off_1000194C0];

    [(StartPreflightViewController *)self setFinished:1];
  }
  objc_initWeak((id *)buf, self);
  v21 = [(StartPreflightViewController *)self buttonEventMonitor];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100009F50;
  v23[3] = &unk_100018868;
  objc_copyWeak(&v24, (id *)buf);
  [v21 startWithPriority:200 completion:v23];

  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  [(StartPreflightViewController *)self setUiNeededKnownSemaphore:v22];

  [(StartPreflightViewController *)self setActivationLockChallengeNeeded:0];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)start
{
  uint64_t v3 = [(StartPreflightViewController *)self result];
  [(id)v3 setStatusCode:&off_1000194D8];

  LOBYTE(v3) = MGGetBoolAnswer();
  char v4 = MGGetBoolAnswer();
  if (v3 & 1) != 0 || (v4)
  {
    id v14 = 0;
    unsigned __int8 v6 = [(StartPreflightViewController *)self preflightPhase1:&v14];
    id v7 = v14;
    if (v6)
    {
      unsigned __int8 v8 = [(StartPreflightViewController *)self activationLockCheck];
      v9 = [(StartPreflightViewController *)self uiNeededKnownSemaphore];
      dispatch_semaphore_signal(v9);

      if (v8)
      {
        if ([(StartPreflightViewController *)self activationLockChallengeNeeded]) {
          [(StartPreflightViewController *)self setupActivationLockView];
        }
        else {
          [(StartPreflightViewController *)self activationLockComplete];
        }
        goto LABEL_13;
      }
      v11 = self;
      uint64_t v12 = -77;
      id v13 = 0;
    }
    else
    {
      BOOL v10 = [(StartPreflightViewController *)self uiNeededKnownSemaphore];
      dispatch_semaphore_signal(v10);

      v11 = self;
      uint64_t v12 = -78;
      id v13 = v7;
    }
    [(StartPreflightViewController *)v11 endTestWithStatusCode:v12 error:v13];
LABEL_13:

    return;
  }
  v5 = [(StartPreflightViewController *)self uiNeededKnownSemaphore];
  dispatch_semaphore_signal(v5);

  [(StartPreflightViewController *)self endTestWithStatusCode:-6 error:0];
}

- (void)cancel
{
  uint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[StartPreflightViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(StartPreflightViewController *)self setFinished:1];
}

- (void)teardown
{
  uint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[StartPreflightViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v4 = [(StartPreflightViewController *)self buttonEventMonitor];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A304;
  v5[3] = &unk_100018890;
  v5[4] = self;
  [v4 stopWithCompletion:v5];
}

- (BOOL)shouldPresentInHostApp
{
  uint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[StartPreflightViewController shouldPresentInHostApp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [(StartPreflightViewController *)self uiNeededKnownSemaphore];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  return [(StartPreflightViewController *)self activationLockChallengeNeeded];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)StartPreflightViewController;
  [(StartPreflightViewController *)&v3 viewDidLoad];
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v5 = "-[StartPreflightViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StartPreflightViewController;
  [(StartPreflightViewController *)&v4 viewDidAppear:a3];
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[StartPreflightViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
}

- (void)setupActivationLockView
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "-[StartPreflightViewController setupActivationLockView]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(StartPreflightViewController *)self setShouldShowPressHomeLabel:0];
  objc_super v3 = objc_opt_new();
  [(StartPreflightViewController *)self setViewControllers:v3];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [(StartPreflightViewController *)self chimeraLockComponents];
  id v4 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v57;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v57 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v9 = [ChimeraLockViewController alloc];
        BOOL v10 = [v8 objectForKeyedSubscript:@"spc"];
        v11 = [v10 objectAtIndexedSubscript:0];
        uint64_t v12 = [v8 objectForKeyedSubscript:@"status"];
        id v13 = [(ChimeraLockViewController *)v9 initWithComponent:v11 status:v12];

        if (v13)
        {
          [(ChimeraLockViewController *)v13 setCoordinator:self];
          id v14 = [(StartPreflightViewController *)self viewControllers];
          [v14 addObject:v13];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v5);
  }

  v48 = objc_opt_new();
  v15 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obja = [(StartPreflightViewController *)self activationLockComponents];
  id v16 = [obja countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(obja);
        }
        v20 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
        v21 = [TokenChallenger alloc];
        dispatch_semaphore_t v22 = [v20 objectForKeyedSubscript:@"token"];
        v23 = [v20 objectForKeyedSubscript:@"spc"];
        id v24 = [v20 objectForKeyedSubscript:@"type"];
        uint64_t v25 = [v20 objectForKeyedSubscript:@"endpoint"];
        v26 = +[NSURL URLWithString:v25];
        uint64_t v27 = [(TokenChallenger *)v21 initWithToken:v22 components:v23 fdrTypes:v24 endpoint:v26 signer:self];
        [v15 addObject:v27];
      }
      id v17 = [obja countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v17);
  }

  if ([v15 count])
  {
    uint64_t v28 = [[ActivationLockViewController alloc] initWithTokenChallengers:v15 authenticator:v48];
    v29 = v28;
    if (v28)
    {
      [(ActivationLockViewController *)v28 setCoordinator:self];
      v30 = [(StartPreflightViewController *)self viewControllers];
      [v30 addObject:v29];
    }
  }
  v31 = objc_opt_new();
  [(StartPreflightViewController *)self setNavigationController:v31];

  v32 = [(StartPreflightViewController *)self view];
  [v32 bounds];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = [(StartPreflightViewController *)self navigationController];
  v42 = [v41 view];
  [v42 setFrame:v34, v36, v38, v40];

  v43 = [(StartPreflightViewController *)self view];
  v44 = [(StartPreflightViewController *)self navigationController];
  v45 = [v44 view];
  [v43 addSubview:v45];

  v46 = [(StartPreflightViewController *)self navigationController];
  [(StartPreflightViewController *)self addChildViewController:v46];

  [(StartPreflightViewController *)self moveToNextViewController];
  v47 = [(StartPreflightViewController *)self navigationController];
  [v47 didMoveToParentViewController:self];
}

- (void)moveToNextViewController
{
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[StartPreflightViewController moveToNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = [(StartPreflightViewController *)self viewControllers];
  id v5 = [v4 count];

  uint64_t v6 = handleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Move to next view", buf, 2u);
    }

    unsigned __int8 v8 = [(StartPreflightViewController *)self navigationController];
    v9 = [(StartPreflightViewController *)self viewControllers];
    BOOL v10 = [v9 objectAtIndexedSubscript:0];
    [v8 pushViewController:v10 animated:1];

    v11 = [(StartPreflightViewController *)self viewControllers];
    [v11 removeObjectAtIndex:0];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No more views. Activation lock complete", buf, 2u);
    }

    uint64_t v12 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AD20;
    block[3] = &unk_100018890;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

- (void)handleButtonEvent:(unint64_t)a3
{
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v5, 0xCu);
  }
}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    BOOL v7 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v8 = [(StartPreflightViewController *)self result];
    [v8 setStatusCode:v7];

    v39[0] = @"error";
    v9 = [v6 description];
    BOOL v10 = v9;
    if (!v9)
    {
      BOOL v10 = +[NSNull null];
    }
    v39[1] = @"errorCode";
    v40[0] = v10;
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    uint64_t v12 = v11;
    if (!v11)
    {
      uint64_t v12 = +[NSNull null];
    }
    v40[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    id v14 = [(StartPreflightViewController *)self result];
    [v14 setData:v13];

    if (!v11) {
    if (!v9)
    }

    [(StartPreflightViewController *)self setFinished:1];
    goto LABEL_42;
  }
  v15 = [(StartPreflightViewController *)self preflightRIK];

  if (!v15)
  {
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  id v16 = [(StartPreflightViewController *)self preflightRIK];
  uint64_t v17 = [v16 base64EncodedStringWithOptions:0];

  if (v17)
  {
LABEL_17:
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = handleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000105A0();
  }

  uint64_t v17 = 0;
  uint64_t v19 = -87;
LABEL_18:
  id v20 = [(StartPreflightViewController *)self preflightResults];

  if (v20)
  {
    v21 = [(StartPreflightViewController *)self preflightResults];
    dispatch_semaphore_t v22 = +[CRPreflightUtils spcResults:v21];

    v23 = [v22 objectForKeyedSubscript:@"sealed"];
    id v24 = [v22 objectForKeyedSubscript:@"pass"];
    id v20 = [v24 mutableCopy];
    if (v23 && [v23 count]) {
      [v20 addObject:@"RECOVER"];
    }
    if (!v20 || ![v20 count])
    {
      uint64_t v25 = handleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10001056C();
      }

      uint64_t v19 = -88;
    }
  }
  v26 = +[NSNumber numberWithInteger:v19];
  uint64_t v27 = [(StartPreflightViewController *)self result];
  [v27 setStatusCode:v26];

  v41[0] = @"error";
  uint64_t v28 = [v6 description];
  v29 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = +[NSNull null];
  }
  double v37 = (void *)v28;
  id v38 = v6;
  v42[0] = v28;
  v41[1] = @"errorCode";
  v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
  v31 = v30;
  if (!v30)
  {
    v31 = +[NSNull null];
  }
  v42[1] = v31;
  v41[2] = @"preflightRIK";
  v32 = (void *)v17;
  double v33 = (void *)v17;
  if (!v17)
  {
    v32 = +[NSNull null];
  }
  v42[2] = v32;
  v41[3] = @"preflightPartSPC";
  double v34 = v20;
  if (!v20)
  {
    double v34 = +[NSNull null];
  }
  v42[3] = v34;
  double v35 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
  double v36 = [(StartPreflightViewController *)self result];
  [v36 setData:v35];

  if (v20)
  {
    if (v33) {
      goto LABEL_38;
    }
LABEL_44:

    if (v30) {
      goto LABEL_39;
    }
LABEL_45:

    goto LABEL_39;
  }

  if (!v33) {
    goto LABEL_44;
  }
LABEL_38:
  if (!v30) {
    goto LABEL_45;
  }
LABEL_39:

  if (!v29) {
  [(StartPreflightViewController *)self setFinished:1];
  }

  id v6 = v38;
LABEL_42:
}

- (BOOL)activationLockCheck
{
  v2 = self;
  objc_super v3 = [(StartPreflightViewController *)self preflightResponsePhase1];
  id v4 = +[CRPreflightUtils activationResults:v3];

  v30 = +[NSMutableArray array];
  v29 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
    uint64_t v27 = v2;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
      BOOL v10 = [v9 objectForKeyedSubscript:@"status" v27];
      v11 = [v9 objectForKeyedSubscript:@"spc"];
      uint64_t v12 = [v9 objectForKeyedSubscript:@"type"];
      id v13 = [v9 objectForKeyedSubscript:@"endpoint"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v24 = handleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100010720();
        }
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v24 = handleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_1000106EC();
        }
        goto LABEL_39;
      }
      if (![v11 count]
        || ![v12 count]
        || (id v14 = [v11 count], v14 != objc_msgSend(v12, "count")))
      {
        id v24 = handleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_1000105D4(v11, v12, v24);
        }
        goto LABEL_39;
      }
      if ([v10 isEqualToString:@"CHALLENGED"])
      {
        v15 = [v9 objectForKeyedSubscript:@"token"];

        if (!v15)
        {
          id v24 = handleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100010684();
          }
          goto LABEL_39;
        }
        id v16 = [v9 objectForKeyedSubscript:@"endpoint"];

        uint64_t v17 = v29;
        if (!v16)
        {
          id v24 = handleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_1000106B8();
          }
LABEL_39:
          id v20 = obj;

          BOOL v23 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        unsigned __int8 v18 = [v10 isEqualToString:@"DENIED"];
        uint64_t v17 = v30;
        if ((v18 & 1) == 0)
        {
          unsigned int v19 = [v10 isEqualToString:@"DENIED"];
          uint64_t v17 = v30;
          if (!v19) {
            goto LABEL_18;
          }
        }
      }
      [v17 addObject:v9];
LABEL_18:

      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        v2 = v27;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v20 = obj;

  if ([v30 count])
  {
    v21 = handleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Chimera lock needed", buf, 2u);
    }

    [(StartPreflightViewController *)v2 setChimeraLockComponents:v30];
    [(StartPreflightViewController *)v2 setActivationLockChallengeNeeded:1];
  }
  if ([v29 count])
  {
    dispatch_semaphore_t v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Activation lock needed", buf, 2u);
    }

    [(StartPreflightViewController *)v2 setActivationLockComponents:v29];
    BOOL v23 = 1;
    [(StartPreflightViewController *)v2 setActivationLockChallengeNeeded:1];
  }
  else
  {
    BOOL v23 = 1;
  }
LABEL_40:

  return v23;
}

- (BOOL)preflightPhase1:(id *)a3
{
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_10000BB1C;
  double v39 = sub_10000BB2C;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = sub_10000BB1C;
  long long v33 = sub_10000BB2C;
  id v34 = 0;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = objc_opt_new();
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  BOOL v23 = sub_10000BB34;
  id v24 = &unk_1000188B8;
  v26 = &v41;
  uint64_t v27 = &v35;
  uint64_t v28 = &v29;
  uint64_t v8 = v6;
  uint64_t v25 = v8;
  [v7 preflightPhase1:v5 withReply:&v21];
  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    BOOL v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000107BC();
    }
LABEL_4:

    goto LABEL_5;
  }
  if (*((unsigned char *)v42 + 24) && !v30[5])
  {
    id v14 = (void *)v36[5];
    if (v14)
    {
      v15 = [v14 objectForKeyedSubscript:@"keyBlob" v21, v22, v23, v24];
      if (v15)
      {
        id v16 = [(id)v36[5] objectForKeyedSubscript:@"baaCert"];
        if (v16)
        {
          uint64_t v17 = [(id)v36[5] objectForKeyedSubscript:@"responsePhase1"];

          if (v17)
          {
            unsigned __int8 v18 = [(id)v36[5] objectForKeyedSubscript:@"keyBlob"];
            [(StartPreflightViewController *)self setPreflightRIK:v18];

            unsigned int v19 = [(id)v36[5] objectForKeyedSubscript:@"baaCert"];
            [(StartPreflightViewController *)self setPreflightBaaCert:v19];

            id v20 = [(id)v36[5] objectForKeyedSubscript:@"responsePhase1"];
            [(StartPreflightViewController *)self setPreflightResponsePhase1:v20];

            BOOL v11 = 1;
            goto LABEL_6;
          }
        }
        else
        {
        }
      }
    }
    BOOL v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010788();
    }
    goto LABEL_4;
  }
  id v13 = handleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100010754();
  }

  if (a3)
  {
    BOOL v11 = 0;
    *a3 = (id) v30[5];
    goto LABEL_6;
  }
LABEL_5:
  BOOL v11 = 0;
LABEL_6:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v11;
}

- (BOOL)preflightPhase2:(id *)a3
{
  id v5 = objc_opt_new();
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_10000BB1C;
  long long v32 = sub_10000BB2C;
  id v33 = 0;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10000BB1C;
  v26 = sub_10000BB2C;
  id v27 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v8 = [(StartPreflightViewController *)self preflightRIK];
  [v7 setObject:v8 forKeyedSubscript:@"keyBlob"];

  dispatch_time_t v9 = [(StartPreflightViewController *)self preflightResponsePhase1];
  [v7 setObject:v9 forKeyedSubscript:@"responsePhase1"];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C024;
  v17[3] = &unk_1000188B8;
  unsigned int v19 = &v34;
  id v20 = &v28;
  v21 = &v22;
  BOOL v10 = v6;
  unsigned __int8 v18 = v10;
  [v5 preflightPhase2:v7 withReply:v17];
  dispatch_time_t v11 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    uint64_t v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000107F0();
    }
  }
  else
  {
    if (*((unsigned char *)v35 + 24) && !v23[5])
    {
      [(StartPreflightViewController *)self setPreflightResults:v29[5]];
      BOOL v13 = 1;
      goto LABEL_6;
    }
    v15 = handleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 failed", v16, 2u);
    }

    if (a3)
    {
      BOOL v13 = 0;
      *a3 = (id) v23[5];
      goto LABEL_6;
    }
  }
  BOOL v13 = 0;
LABEL_6:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v13;
}

- (void)activationLockComplete
{
  id v7 = 0;
  unsigned __int8 v3 = [(StartPreflightViewController *)self preflightPhase2:&v7];
  id v4 = v7;
  if (v3)
  {
    uint64_t v5 = 0;
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = -79;
    id v6 = v4;
  }
  [(StartPreflightViewController *)self endTestWithStatusCode:v5 error:v6];
}

- (id)baaCert
{
  return [(StartPreflightViewController *)self preflightBaaCert];
}

- (id)signData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(StartPreflightViewController *)self preflightRIK];
  id v7 = [v5 sign:v4 keyBlob:v6];

  return v7;
}

- (StartPreflightInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSData)preflightRIK
{
  return self->_preflightRIK;
}

- (void)setPreflightRIK:(id)a3
{
}

- (NSData)preflightBaaCert
{
  return self->_preflightBaaCert;
}

- (void)setPreflightBaaCert:(id)a3
{
}

- (NSDictionary)preflightResponsePhase1
{
  return self->_preflightResponsePhase1;
}

- (void)setPreflightResponsePhase1:(id)a3
{
}

- (NSDictionary)preflightResults
{
  return self->_preflightResults;
}

- (void)setPreflightResults:(id)a3
{
}

- (BOOL)activationLockChallengeNeeded
{
  return self->_activationLockChallengeNeeded;
}

- (void)setActivationLockChallengeNeeded:(BOOL)a3
{
  self->_activationLockChallengeNeeded = a3;
}

- (NSArray)chimeraLockComponents
{
  return self->_chimeraLockComponents;
}

- (void)setChimeraLockComponents:(id)a3
{
}

- (NSArray)activationLockComponents
{
  return self->_activationLockComponents;
}

- (void)setActivationLockComponents:(id)a3
{
}

- (OS_dispatch_semaphore)uiNeededKnownSemaphore
{
  return self->_uiNeededKnownSemaphore;
}

- (void)setUiNeededKnownSemaphore:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, 0);
  objc_storeStrong((id *)&self->_activationLockComponents, 0);
  objc_storeStrong((id *)&self->_chimeraLockComponents, 0);
  objc_storeStrong((id *)&self->_preflightResults, 0);
  objc_storeStrong((id *)&self->_preflightResponsePhase1, 0);
  objc_storeStrong((id *)&self->_preflightBaaCert, 0);
  objc_storeStrong((id *)&self->_preflightRIK, 0);

  objc_storeStrong((id *)&self->inputs, 0);
}

@end