@interface RepairSummaryViewController
- (BOOL)preflightSuccess;
- (BOOL)repairSummaryNeeded;
- (BOOL)shouldPresentInHostApp;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (NSArray)deniedSPCs;
- (NSArray)failSPCs;
- (NSArray)lockSPCs;
- (NSArray)lostSPCs;
- (NSArray)passSPCs;
- (NSArray)sealedSPCs;
- (NSArray)unauthSPCs;
- (NSData)preflightRIK;
- (NSDictionary)preflightResults;
- (NSError)preflightError;
- (NSMutableArray)tableDataText;
- (NSMutableArray)tableDataText2;
- (NSMutableArray)tableImage;
- (NSMutableArray)tableImageColor;
- (NSMutableArray)viewControllers;
- (OBLinkTrayButton)linkButton;
- (OBTableWelcomeController)contentViewController;
- (OBTrayButton)boldButton;
- (OS_dispatch_semaphore)uiNeededKnownSemaphore;
- (RepairSummaryInputs)inputs;
- (UINavigationController)navigationController;
- (id)getComponentString:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel;
- (void)cancelTapped:(id)a3;
- (void)continueTapped:(id)a3;
- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4;
- (void)handleButtonEvent:(unint64_t)a3;
- (void)initRepairSummaryTable;
- (void)moveToNextViewController;
- (void)setBoldButton:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDeniedSPCs:(id)a3;
- (void)setFailSPCs:(id)a3;
- (void)setInputs:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setLockSPCs:(id)a3;
- (void)setLostSPCs:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPassSPCs:(id)a3;
- (void)setPreflightError:(id)a3;
- (void)setPreflightRIK:(id)a3;
- (void)setPreflightResults:(id)a3;
- (void)setPreflightSuccess:(BOOL)a3;
- (void)setRepairSummaryNeeded:(BOOL)a3;
- (void)setSealedSPCs:(id)a3;
- (void)setTableDataText2:(id)a3;
- (void)setTableDataText:(id)a3;
- (void)setTableImage:(id)a3;
- (void)setTableImageColor:(id)a3;
- (void)setUiNeededKnownSemaphore:(id)a3;
- (void)setUnauthSPCs:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)updateViewWithRepairSummary;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RepairSummaryViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[RepairSummaryViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  [(RepairSummaryViewController *)self setInputs:v6];
  v9 = [(RepairSummaryViewController *)self inputs];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    v11 = [(RepairSummaryViewController *)self result];
    [v11 setStatusCode:&off_10000CB38];

    [(RepairSummaryViewController *)self setFinished:1];
  }
  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!sub_100007084())
  {
    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000072BC();
    }

    v14 = [(RepairSummaryViewController *)self result];
    [v14 setStatusCode:&off_10000CB50];

    [(RepairSummaryViewController *)self setFinished:1];
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v15 = (void *)qword_100011DB0;
  uint64_t v28 = qword_100011DB0;
  if (!qword_100011DB0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000071C8;
    v30 = &unk_10000C378;
    v31 = &v25;
    sub_1000071C8((uint64_t)buf);
    v15 = (void *)v26[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v25, 8);
  v17 = objc_opt_new();
  [(RepairSummaryViewController *)self setButtonEventMonitor:v17];

  v18 = [(RepairSummaryViewController *)self buttonEventMonitor];
  LODWORD(v17) = v18 == 0;

  if (v17)
  {
    v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100007288();
    }

    v20 = [(RepairSummaryViewController *)self result];
    [v20 setStatusCode:&off_10000CB50];

    [(RepairSummaryViewController *)self setFinished:1];
  }
  objc_initWeak((id *)buf, self);
  v21 = [(RepairSummaryViewController *)self buttonEventMonitor];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000033FC;
  v23[3] = &unk_10000C2A0;
  objc_copyWeak(&v24, (id *)buf);
  [v21 startWithPriority:200 completion:v23];

  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  [(RepairSummaryViewController *)self setUiNeededKnownSemaphore:v22];

  [(RepairSummaryViewController *)self setRepairSummaryNeeded:0];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)start
{
  v3 = [(RepairSummaryViewController *)self result];
  [v3 setStatusCode:&off_10000CB68];

  char v4 = MGGetBoolAnswer();
  char v5 = MGGetBoolAnswer();
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  if (v4 & 1) != 0 || (v5)
  {
    v8 = +[CRRepairStatus isServicePartWithError:0];
    v9 = v8;
    if (v8 && [v8 isEqual:@"1"])
    {
      uint64_t v10 = CRErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Service part mTub/MLB not supported";
      v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v12 = +[NSError errorWithDomain:v10 code:-72 userInfo:v11];

      v13 = [(RepairSummaryViewController *)self uiNeededKnownSemaphore];
      dispatch_semaphore_signal(v13);

      [(RepairSummaryViewController *)self endTestWithStatusCode:-72 error:v12];
    }
    else
    {
      v14 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000036B0;
      block[3] = &unk_10000C318;
      block[4] = self;
      id v16 = v6;
      dispatch_async(v14, block);
    }
  }
  else
  {
    id v7 = [(RepairSummaryViewController *)self uiNeededKnownSemaphore];
    dispatch_semaphore_signal(v7);

    [(RepairSummaryViewController *)self endTestWithStatusCode:-6 error:0];
  }
}

- (void)cancel
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[RepairSummaryViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(RepairSummaryViewController *)self setFinished:1];
}

- (void)teardown
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[RepairSummaryViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v4 = [(RepairSummaryViewController *)self buttonEventMonitor];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003DB4;
  v5[3] = &unk_10000C2F0;
  v5[4] = self;
  [v4 stopWithCompletion:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RepairSummaryViewController;
  [(RepairSummaryViewController *)&v3 viewDidLoad];
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v5 = "-[RepairSummaryViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RepairSummaryViewController;
  [(RepairSummaryViewController *)&v4 viewDidAppear:a3];
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_semaphore_t v6 = "-[RepairSummaryViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
}

- (void)initRepairSummaryTable
{
  objc_super v3 = [(RepairSummaryViewController *)self preflightResults];
  objc_super v4 = +[CRPreflightUtils spcResults:v3];

  char v5 = [(RepairSummaryViewController *)self preflightResults];
  dispatch_semaphore_t v6 = [v5 objectForKeyedSubscript:@"keyBlob"];
  [(RepairSummaryViewController *)self setPreflightRIK:v6];

  id v7 = [v4 objectForKeyedSubscript:@"pass"];
  [(RepairSummaryViewController *)self setPassSPCs:v7];

  v8 = [v4 objectForKeyedSubscript:@"fail"];
  [(RepairSummaryViewController *)self setFailSPCs:v8];

  v9 = [v4 objectForKeyedSubscript:@"lock"];
  [(RepairSummaryViewController *)self setLockSPCs:v9];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"unauth"];
  [(RepairSummaryViewController *)self setUnauthSPCs:v10];

  v11 = [v4 objectForKeyedSubscript:@"lost"];
  [(RepairSummaryViewController *)self setLostSPCs:v11];

  v12 = [v4 objectForKeyedSubscript:@"denied"];
  [(RepairSummaryViewController *)self setDeniedSPCs:v12];

  v122 = v4;
  v13 = [v4 objectForKeyedSubscript:@"sealed"];
  [(RepairSummaryViewController *)self setSealedSPCs:v13];

  v14 = objc_opt_new();
  [(RepairSummaryViewController *)self setTableDataText:v14];

  v15 = objc_opt_new();
  [(RepairSummaryViewController *)self setTableDataText2:v15];

  id v16 = objc_opt_new();
  [(RepairSummaryViewController *)self setTableImage:v16];

  NSErrorUserInfoKey v17 = objc_opt_new();
  [(RepairSummaryViewController *)self setTableImageColor:v17];

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  CFStringRef v18 = [(RepairSummaryViewController *)self passSPCs];
  id v19 = [v18 countByEnumeratingWithState:&v147 objects:v159 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v148;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v148 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v147 + 1) + 8 * i);
        id v24 = [(RepairSummaryViewController *)self getComponentString:v23];
        if (v24)
        {
          uint64_t v25 = [(RepairSummaryViewController *)self tableDataText];
          [v25 addObject:v24];

          v26 = [(RepairSummaryViewController *)self tableDataText2];
          uint64_t v27 = +[NSBundle mainBundle];
          uint64_t v28 = [v27 localizedStringForKey:@"TEXT_PASS" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v26 addObject:v28];

          v29 = [(RepairSummaryViewController *)self tableImage];
          v30 = +[UIImage systemImageNamed:@"checkmark.seal.fill"];
          [v29 addObject:v30];

          v31 = [(RepairSummaryViewController *)self tableImageColor];
          v32 = +[UIColor systemGreenColor];
          [v31 addObject:v32];
        }
        else
        {
          v31 = handleForCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v147 objects:v159 count:16];
    }
    while (v20);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v33 = [(RepairSummaryViewController *)self failSPCs];
  id v34 = [v33 countByEnumeratingWithState:&v143 objects:v156 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v144;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v144 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v143 + 1) + 8 * (void)j);
        v39 = [(RepairSummaryViewController *)self getComponentString:v38];
        if (v39)
        {
          v40 = [(RepairSummaryViewController *)self tableDataText];
          [v40 addObject:v39];

          v41 = [(RepairSummaryViewController *)self tableDataText2];
          v42 = +[NSBundle mainBundle];
          v43 = [v42 localizedStringForKey:@"TEXT_UNKNOWN" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v41 addObject:v43];

          v44 = [(RepairSummaryViewController *)self tableImage];
          v45 = +[UIImage systemImageNamed:@"exclamationmark.triangle.fill"];
          [v44 addObject:v45];

          v46 = [(RepairSummaryViewController *)self tableImageColor];
          v47 = +[UIColor systemYellowColor];
          [v46 addObject:v47];
        }
        else
        {
          v46 = handleForCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v143 objects:v156 count:16];
    }
    while (v35);
  }

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v48 = [(RepairSummaryViewController *)self lockSPCs];
  id v49 = [v48 countByEnumeratingWithState:&v139 objects:v155 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v140;
    do
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v140 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v139 + 1) + 8 * (void)k);
        v54 = [(RepairSummaryViewController *)self getComponentString:v53];
        if (v54)
        {
          v55 = [(RepairSummaryViewController *)self tableDataText];
          [v55 addObject:v54];

          v56 = [(RepairSummaryViewController *)self tableDataText2];
          v57 = +[NSBundle mainBundle];
          v58 = [v57 localizedStringForKey:@"TEXT_LOCK" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v56 addObject:v58];

          v59 = [(RepairSummaryViewController *)self tableImage];
          v60 = +[UIImage systemImageNamed:@"lock.circle.fill"];
          [v59 addObject:v60];

          v61 = [(RepairSummaryViewController *)self tableImageColor];
          v62 = +[UIColor blackColor];
          [v61 addObject:v62];
        }
        else
        {
          v61 = handleForCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v53;
            _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v50 = [v48 countByEnumeratingWithState:&v139 objects:v155 count:16];
    }
    while (v50);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v63 = [(RepairSummaryViewController *)self unauthSPCs];
  id v64 = [v63 countByEnumeratingWithState:&v135 objects:v154 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v136;
    do
    {
      for (m = 0; m != v65; m = (char *)m + 1)
      {
        if (*(void *)v136 != v66) {
          objc_enumerationMutation(v63);
        }
        uint64_t v68 = *(void *)(*((void *)&v135 + 1) + 8 * (void)m);
        v69 = [(RepairSummaryViewController *)self getComponentString:v68];
        if (v69)
        {
          v70 = [(RepairSummaryViewController *)self tableDataText];
          [v70 addObject:v69];

          v71 = [(RepairSummaryViewController *)self tableDataText2];
          v72 = +[NSBundle mainBundle];
          v73 = [v72 localizedStringForKey:@"TEXT_UNKNOWN" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v71 addObject:v73];

          v74 = [(RepairSummaryViewController *)self tableImage];
          v75 = +[UIImage systemImageNamed:@"exclamationmark.triangle.fill"];
          [v74 addObject:v75];

          v76 = [(RepairSummaryViewController *)self tableImageColor];
          v77 = +[UIColor systemYellowColor];
          [v76 addObject:v77];
        }
        else
        {
          v76 = handleForCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v68;
            _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v65 = [v63 countByEnumeratingWithState:&v135 objects:v154 count:16];
    }
    while (v65);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v78 = [(RepairSummaryViewController *)self lostSPCs];
  id v79 = [v78 countByEnumeratingWithState:&v131 objects:v153 count:16];
  if (v79)
  {
    id v80 = v79;
    uint64_t v81 = *(void *)v132;
    do
    {
      for (n = 0; n != v80; n = (char *)n + 1)
      {
        if (*(void *)v132 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = *(void *)(*((void *)&v131 + 1) + 8 * (void)n);
        v84 = [(RepairSummaryViewController *)self getComponentString:v83];
        if (v84)
        {
          v85 = [(RepairSummaryViewController *)self tableDataText];
          [v85 addObject:v84];

          v86 = [(RepairSummaryViewController *)self tableDataText2];
          v87 = +[NSBundle mainBundle];
          v88 = [v87 localizedStringForKey:@"TEXT_LOST" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v86 addObject:v88];

          v89 = [(RepairSummaryViewController *)self tableImage];
          v90 = +[UIImage _systemImageNamed:@"findmy"];
          [v89 addObject:v90];

          v91 = [(RepairSummaryViewController *)self tableImageColor];
          v92 = +[UIColor systemBlueColor];
          [v91 addObject:v92];
        }
        else
        {
          v91 = handleForCategory();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v83;
            _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v80 = [v78 countByEnumeratingWithState:&v131 objects:v153 count:16];
    }
    while (v80);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v93 = [(RepairSummaryViewController *)self deniedSPCs];
  id v94 = [v93 countByEnumeratingWithState:&v127 objects:v152 count:16];
  if (v94)
  {
    id v95 = v94;
    uint64_t v96 = *(void *)v128;
    do
    {
      for (ii = 0; ii != v95; ii = (char *)ii + 1)
      {
        if (*(void *)v128 != v96) {
          objc_enumerationMutation(v93);
        }
        uint64_t v98 = *(void *)(*((void *)&v127 + 1) + 8 * (void)ii);
        v99 = [(RepairSummaryViewController *)self getComponentString:v98];
        if (v99)
        {
          v100 = [(RepairSummaryViewController *)self tableDataText];
          [v100 addObject:v99];

          v101 = [(RepairSummaryViewController *)self tableDataText2];
          v102 = +[NSBundle mainBundle];
          v103 = [v102 localizedStringForKey:@"TEXT_DENIED" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
          [v101 addObject:v103];

          v104 = [(RepairSummaryViewController *)self tableImage];
          v105 = +[UIImage _systemImageNamed:@"findmy"];
          [v104 addObject:v105];

          v106 = [(RepairSummaryViewController *)self tableImageColor];
          v107 = +[UIColor systemBlueColor];
          [v106 addObject:v107];
        }
        else
        {
          v106 = handleForCategory();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v98;
            _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v95 = [v93 countByEnumeratingWithState:&v127 objects:v152 count:16];
    }
    while (v95);
  }

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v108 = [(RepairSummaryViewController *)self sealedSPCs];
  id v109 = [v108 countByEnumeratingWithState:&v123 objects:v151 count:16];
  if (v109)
  {
    id v110 = v109;
    uint64_t v111 = *(void *)v124;
    do
    {
      for (jj = 0; jj != v110; jj = (char *)jj + 1)
      {
        if (*(void *)v124 != v111) {
          objc_enumerationMutation(v108);
        }
        uint64_t v113 = *(void *)(*((void *)&v123 + 1) + 8 * (void)jj);
        v114 = [(RepairSummaryViewController *)self getComponentString:v113];
        if (v114)
        {
          v115 = [(RepairSummaryViewController *)self tableDataText];
          [v115 addObject:v114];

          v116 = [(RepairSummaryViewController *)self tableDataText2];
          v117 = +[NSString stringWithFormat:@"A new %@ was detected and must be repaired", v114];
          [v116 addObject:v117];

          v118 = [(RepairSummaryViewController *)self tableImage];
          v119 = +[UIImage systemImageNamed:@"checkmark.seal.fill"];
          [v118 addObject:v119];

          v120 = [(RepairSummaryViewController *)self tableImageColor];
          v121 = +[UIColor systemGreenColor];
          [v120 addObject:v121];
        }
        else
        {
          v120 = handleForCategory();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v158 = v113;
            _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }
      }
      id v110 = [v108 countByEnumeratingWithState:&v123 objects:v151 count:16];
    }
    while (v110);
  }
}

- (void)updateViewWithRepairSummary
{
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v112 = "-[RepairSummaryViewController updateViewWithRepairSummary]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(RepairSummaryViewController *)self setShouldShowPressHomeLabel:0];
  objc_super v4 = objc_opt_new();
  [(RepairSummaryViewController *)self setViewControllers:v4];

  char v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"TEST_TITLE" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];

  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"TEST_DETAILS" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];

  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];
  v11 = @"iphone.and.screwdriver";
  if (v10 == (id)1) {
    v11 = @"ipad.and.screwdriver";
  }
  v12 = v11;

  v13 = +[UIColor tintColor];
  uint64_t v14 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v13];

  uint64_t v96 = (void *)v14;
  v97 = v12;
  +[UIImage _systemImageNamed:v12 withConfiguration:v14];
  uint64_t v98 = (void *)v8;
  id v95 = v99 = (void *)v6;
  id v15 = [objc_alloc((Class)OBTableWelcomeController) initWithTitle:v6 detailText:v8 icon:v95 adoptTableViewScrollView:0];
  [(RepairSummaryViewController *)self setContentViewController:v15];

  id v16 = [(RepairSummaryViewController *)self contentViewController];
  [v16 setScrollingDisabled:0];

  NSErrorUserInfoKey v17 = [(RepairSummaryViewController *)self contentViewController];
  CFStringRef v18 = [v17 buttonTray];
  [v18 setHidden:0];

  [(RepairSummaryViewController *)self initRepairSummaryTable];
  id v19 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v20 = [(RepairSummaryViewController *)self contentViewController];
  [v20 setTableView:v19];

  uint64_t v21 = [(RepairSummaryViewController *)self contentViewController];
  dispatch_semaphore_t v22 = [v21 tableView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v23 = +[UIColor clearColor];
  id v24 = [(RepairSummaryViewController *)self contentViewController];
  uint64_t v25 = [v24 tableView];
  [v25 setBackgroundColor:v23];

  v26 = [(RepairSummaryViewController *)self contentViewController];
  uint64_t v27 = [v26 tableView];
  [v27 setBackgroundView:0];

  uint64_t v28 = [(RepairSummaryViewController *)self contentViewController];
  v29 = [v28 tableView];
  [v29 setDelegate:self];

  v30 = [(RepairSummaryViewController *)self contentViewController];
  v31 = [v30 tableView];
  [v31 setDataSource:self];

  v32 = [(RepairSummaryViewController *)self contentViewController];
  v33 = [v32 tableView];
  [v33 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  id v34 = [(RepairSummaryViewController *)self contentViewController];
  id v35 = [v34 tableView];
  uint64_t v36 = [v35 heightAnchor];
  v37 = [(RepairSummaryViewController *)self contentViewController];
  uint64_t v38 = [v37 view];
  v39 = [v38 heightAnchor];
  v40 = [v36 constraintEqualToAnchor:v39 multiplier:0.65];
  id v110 = v40;
  v41 = +[NSArray arrayWithObjects:&v110 count:1];

  +[NSLayoutConstraint activateConstraints:v41];
  v42 = +[OBBoldTrayButton boldButton];
  [(RepairSummaryViewController *)self setBoldButton:v42];

  v43 = [(RepairSummaryViewController *)self boldButton];
  v44 = +[NSBundle mainBundle];
  v45 = [v44 localizedStringForKey:@"CONTINUE" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  [v43 setTitle:v45 forState:0];

  v46 = [(RepairSummaryViewController *)self boldButton];
  [v46 addTarget:self action:"continueTapped:" forControlEvents:64];

  v47 = [(RepairSummaryViewController *)self contentViewController];
  v48 = [v47 buttonTray];
  id v49 = [(RepairSummaryViewController *)self boldButton];
  [v48 addButton:v49];

  id v50 = +[OBLinkTrayButton linkButton];
  [(RepairSummaryViewController *)self setLinkButton:v50];

  uint64_t v51 = [(RepairSummaryViewController *)self linkButton];
  v52 = +[NSBundle mainBundle];
  uint64_t v53 = [v52 localizedStringForKey:@"CANCEL" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  [v51 setTitle:v53 forState:0];

  v54 = [(RepairSummaryViewController *)self linkButton];
  [v54 addTarget:self action:"cancelTapped:" forControlEvents:64];

  v55 = [(RepairSummaryViewController *)self contentViewController];
  v56 = [v55 buttonTray];
  v57 = [(RepairSummaryViewController *)self linkButton];
  [v56 addButton:v57];

  v58 = [(RepairSummaryViewController *)self viewControllers];
  v59 = [(RepairSummaryViewController *)self contentViewController];
  [v58 addObject:v59];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v60 = [(RepairSummaryViewController *)self failSPCs];
  id v61 = [v60 countByEnumeratingWithState:&v104 objects:v109 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v105;
    do
    {
      id v64 = 0;
      do
      {
        if (*(void *)v105 != v63) {
          objc_enumerationMutation(v60);
        }
        id v65 = [(RepairSummaryViewController *)self getComponentString:*(void *)(*((void *)&v104 + 1) + 8 * (void)v64)];
        if (v65)
        {
          uint64_t v66 = [[UnknownPartViewController alloc] initWithComponent:v65];
          v67 = v66;
          if (v66)
          {
            [(UnknownPartViewController *)v66 setCoordinator:self];
            uint64_t v68 = [(RepairSummaryViewController *)self viewControllers];
            [v68 addObject:v67];
          }
        }

        id v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      id v62 = [v60 countByEnumeratingWithState:&v104 objects:v109 count:16];
    }
    while (v62);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v69 = [(RepairSummaryViewController *)self unauthSPCs];
  id v70 = [v69 countByEnumeratingWithState:&v100 objects:v108 count:16];
  if (v70)
  {
    id v71 = v70;
    uint64_t v72 = *(void *)v101;
    do
    {
      v73 = 0;
      do
      {
        if (*(void *)v101 != v72) {
          objc_enumerationMutation(v69);
        }
        v74 = [(RepairSummaryViewController *)self getComponentString:*(void *)(*((void *)&v100 + 1) + 8 * (void)v73)];
        if (v74)
        {
          v75 = [[UnknownPartViewController alloc] initWithComponent:v74];
          v76 = v75;
          if (v75)
          {
            [(UnknownPartViewController *)v75 setCoordinator:self];
            v77 = [(RepairSummaryViewController *)self viewControllers];
            [v77 addObject:v76];
          }
        }

        v73 = (char *)v73 + 1;
      }
      while (v71 != v73);
      id v71 = [v69 countByEnumeratingWithState:&v100 objects:v108 count:16];
    }
    while (v71);
  }

  v78 = objc_opt_new();
  [(RepairSummaryViewController *)self setNavigationController:v78];

  id v79 = [(RepairSummaryViewController *)self view];
  [v79 bounds];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  v88 = [(RepairSummaryViewController *)self navigationController];
  v89 = [v88 view];
  [v89 setFrame:v81, v83, v85, v87];

  v90 = [(RepairSummaryViewController *)self view];
  v91 = [(RepairSummaryViewController *)self navigationController];
  v92 = [v91 view];
  [v90 addSubview:v92];

  v93 = [(RepairSummaryViewController *)self navigationController];
  [(RepairSummaryViewController *)self addChildViewController:v93];

  [(RepairSummaryViewController *)self moveToNextViewController];
  id v94 = [(RepairSummaryViewController *)self navigationController];
  [v94 didMoveToParentViewController:self];
}

- (void)moveToNextViewController
{
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[RepairSummaryViewController moveToNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  objc_super v4 = [(RepairSummaryViewController *)self viewControllers];
  id v5 = [v4 count];

  uint64_t v6 = handleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Move to next view", (uint8_t *)&v12, 2u);
    }

    uint64_t v8 = [(RepairSummaryViewController *)self navigationController];
    v9 = [(RepairSummaryViewController *)self viewControllers];
    id v10 = [v9 objectAtIndexedSubscript:0];
    [v8 pushViewController:v10 animated:1];

    v11 = [(RepairSummaryViewController *)self viewControllers];
    [v11 removeObjectAtIndex:0];
  }
  else
  {
    if (v7)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No more views.", (uint8_t *)&v12, 2u);
    }

    [(RepairSummaryViewController *)self endTestWithStatusCode:0 error:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(RepairSummaryViewController *)self tableDataText];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  uint64_t v8 = [v7 defaultContentConfiguration];
  v9 = [(RepairSummaryViewController *)self tableDataText];
  id v10 = [v9 objectAtIndexedSubscript:[v6 row]];
  [v8 setText:v10];

  v11 = [(RepairSummaryViewController *)self tableDataText2];
  int v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v8 setSecondaryText:v12];

  v13 = [(RepairSummaryViewController *)self tableImage];
  uint64_t v14 = [v13 objectAtIndexedSubscript:[v6 row]];
  [v8 setImage:v14];

  id v15 = [(RepairSummaryViewController *)self tableImageColor];
  id v16 = [v6 row];

  NSErrorUserInfoKey v17 = [v15 objectAtIndexedSubscript:v16];
  CFStringRef v18 = [v8 imageProperties];
  [v18 setTintColor:v17];

  id v19 = [v8 textProperties];
  id v20 = [v19 font];
  [v20 pointSize];
  uint64_t v21 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  dispatch_semaphore_t v22 = [v8 textProperties];
  [v22 setFont:v21];

  [v7 setContentConfiguration:v8];
  uint64_t v23 = +[UIColor systemGroupedBackgroundColor];
  id v24 = [v7 contentView];
  [v24 setBackgroundColor:v23];

  return v7;
}

- (void)continueTapped:(id)a3
{
  objc_super v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Continue button tapped", v5, 2u);
  }

  [(RepairSummaryViewController *)self moveToNextViewController];
}

- (void)cancelTapped:(id)a3
{
  objc_super v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancel button tapped", v5, 2u);
  }

  [(RepairSummaryViewController *)self endTestWithStatusCode:-82 error:0];
}

- (void)handleButtonEvent:(unint64_t)a3
{
  objc_super v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)shouldPresentInHostApp
{
  objc_super v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    BOOL v7 = "-[RepairSummaryViewController shouldPresentInHostApp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  objc_super v4 = [(RepairSummaryViewController *)self uiNeededKnownSemaphore];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  return [(RepairSummaryViewController *)self repairSummaryNeeded];
}

- (id)getComponentString:(id)a3
{
  v29[0] = @"IPHONE COMP BATTERY";
  id v28 = a3;
  uint64_t v27 = +[NSBundle mainBundle];
  v26 = [v27 localizedStringForKey:@"PART_BATTERY" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[0] = v26;
  v29[1] = @"IPHONE COMP DISPLAY";
  uint64_t v25 = +[NSBundle mainBundle];
  id v24 = [v25 localizedStringForKey:@"PART_DISPLAY" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[1] = v24;
  v29[2] = @"IPHONE COMP CAMERA";
  uint64_t v23 = +[NSBundle mainBundle];
  dispatch_semaphore_t v22 = [v23 localizedStringForKey:@"PART_REAR_CAMERA" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[2] = v22;
  v29[3] = @"IPHONE COMP FACEID";
  uint64_t v21 = +[NSBundle mainBundle];
  id v20 = [v21 localizedStringForKey:@"PART_TRUE_DEPTH_CAMERA" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[3] = v20;
  v29[4] = @"IPHONE BACK GLASS";
  id v19 = +[NSBundle mainBundle];
  CFStringRef v18 = [v19 localizedStringForKey:@"PART_BACK_GLASS" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[4] = v18;
  v29[5] = @"IPHONE COMP RCAM";
  NSErrorUserInfoKey v17 = +[NSBundle mainBundle];
  id v16 = [v17 localizedStringForKey:@"PART_REAR_CAMERA" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[5] = v16;
  v29[6] = @"IPHONE COMP ENCL";
  id v15 = +[NSBundle mainBundle];
  objc_super v3 = [v15 localizedStringForKey:@"PART_ENCLOSURE" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[6] = v3;
  v29[7] = @"IPAD COMP DISPLAY";
  objc_super v4 = +[NSBundle mainBundle];
  int v5 = [v4 localizedStringForKey:@"PART_DISPLAY" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[7] = v5;
  v29[8] = @"IPAD REAR CAMERA";
  int v6 = +[NSBundle mainBundle];
  BOOL v7 = [v6 localizedStringForKey:@"PART_REAR_CAMERA" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[8] = v7;
  v29[9] = @"IPAD FRONT CAMERA";
  uint64_t v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"PART_TRUE_DEPTH_CAMERA" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[9] = v9;
  v29[10] = @"IPAD TOUCH ID";
  id v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"PART_TOUCH_ID" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v30[10] = v11;
  int v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:11];

  v13 = [v12 objectForKeyedSubscript:v28];

  return v13;
}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    v9 = +[NSNumber numberWithInteger:a3];
    id v10 = [(RepairSummaryViewController *)self result];
    [v10 setStatusCode:v9];

    v11 = [v8 description:@"error"];
    int v12 = v11;
    if (!v11)
    {
      int v12 = +[NSNull null];
    }
    v51[1] = @"errorCode";
    v52[0] = v12;
    v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
    uint64_t v14 = v13;
    if (!v13)
    {
      uint64_t v14 = +[NSNull null];
    }
    v52[1] = v14;
    id v15 = v52;
    id v16 = v51;
LABEL_23:
    uint64_t v25 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];
    v26 = [(RepairSummaryViewController *)self result];
    [v26 setData:v25];

    if (!v13) {
    if (!v11)
    }

    [(RepairSummaryViewController *)self setFinished:1];
    goto LABEL_28;
  }
  NSErrorUserInfoKey v17 = [(RepairSummaryViewController *)self lockSPCs];
  if (v17)
  {
    objc_super v4 = [(RepairSummaryViewController *)self lockSPCs];
    if ([v4 count])
    {

LABEL_18:
      uint64_t v23 = +[NSNumber numberWithInteger:0];
      id v24 = [(RepairSummaryViewController *)self result];
      [v24 setStatusCode:v23];

      v57[0] = @"error";
      v11 = [v8 description];
      int v12 = v11;
      if (!v11)
      {
        int v12 = +[NSNull null];
      }
      v58[0] = v12;
      v57[1] = @"errorCode";
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
      uint64_t v14 = v13;
      if (!v13)
      {
        uint64_t v14 = +[NSNull null];
      }
      v58[1] = v14;
      id v15 = v58;
      id v16 = v57;
      goto LABEL_23;
    }
  }
  CFStringRef v18 = [(RepairSummaryViewController *)self lostSPCs];
  if (v18)
  {
    int v5 = [(RepairSummaryViewController *)self lostSPCs];
    if ([v5 count])
    {
      BOOL v19 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v20 = [(RepairSummaryViewController *)self deniedSPCs];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    dispatch_semaphore_t v22 = [(RepairSummaryViewController *)self deniedSPCs];
    BOOL v19 = [v22 count] != 0;

    if (!v18) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL v19 = 0;
  if (v18)
  {
LABEL_15:
  }
LABEL_16:
  if (v17)
  {

    if (v19) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v19) {
      goto LABEL_18;
    }
  }
  uint64_t v27 = [(RepairSummaryViewController *)self passSPCs];
  id v28 = [v27 mutableCopy];

  uint64_t v29 = [(RepairSummaryViewController *)self sealedSPCs];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(RepairSummaryViewController *)self sealedSPCs];
    id v32 = [v31 count];

    if (v32) {
      [v28 addObject:@"RECOVER"];
    }
  }
  v33 = [(RepairSummaryViewController *)self preflightRIK];

  if (v33
    && ([(RepairSummaryViewController *)self preflightRIK],
        id v34 = objc_claimAutoreleasedReturnValue(),
        [v34 base64EncodedStringWithOptions:0],
        v33 = objc_claimAutoreleasedReturnValue(),
        v34,
        !v33))
  {
    uint64_t v36 = handleForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100007324();
    }

    v33 = 0;
    uint64_t v35 = -87;
    if (!v28) {
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if (!v28) {
      goto LABEL_43;
    }
  }
  if (![v28 count])
  {
LABEL_43:
    v37 = handleForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000072F0();
    }

    uint64_t v35 = -88;
  }
  if (v28 && v33 && [v28 count])
  {
    uint64_t v38 = +[NSNumber numberWithInteger:v35];
    v39 = [(RepairSummaryViewController *)self result];
    [v39 setStatusCode:v38];

    v55[0] = @"error";
    v40 = [v8 description];
    v41 = v40;
    if (!v40)
    {
      v41 = +[NSNull null];
    }
    v56[0] = v41;
    v55[1] = @"errorCode";
    v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
    v43 = v42;
    if (!v42)
    {
      v43 = +[NSNull null];
    }
    v56[1] = v43;
    v56[2] = v33;
    v55[2] = @"preflightRIK";
    v55[3] = @"preflightPartSPC";
    v56[3] = v28;
    v44 = v56;
    v45 = v55;
    uint64_t v46 = 4;
  }
  else
  {
    v47 = +[NSNumber numberWithInteger:v35];
    v48 = [(RepairSummaryViewController *)self result];
    [v48 setStatusCode:v47];

    v53[0] = @"error";
    v40 = [v8 description];
    v41 = v40;
    if (!v40)
    {
      v41 = +[NSNull null];
    }
    v53[1] = @"errorCode";
    v54[0] = v41;
    v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
    v43 = v42;
    if (!v42)
    {
      v43 = +[NSNull null];
    }
    v54[1] = v43;
    v44 = v54;
    v45 = v53;
    uint64_t v46 = 2;
  }
  id v49 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v45 count:v46];
  id v50 = [(RepairSummaryViewController *)self result];
  [v50 setData:v49];

  if (!v42) {
  if (!v40)
  }

  [(RepairSummaryViewController *)self setFinished:1];
LABEL_28:
}

- (RepairSummaryInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (OBTableWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (OS_dispatch_semaphore)uiNeededKnownSemaphore
{
  return self->_uiNeededKnownSemaphore;
}

- (void)setUiNeededKnownSemaphore:(id)a3
{
}

- (BOOL)repairSummaryNeeded
{
  return self->_repairSummaryNeeded;
}

- (void)setRepairSummaryNeeded:(BOOL)a3
{
  self->_repairSummaryNeeded = a3;
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (NSMutableArray)tableDataText
{
  return self->_tableDataText;
}

- (void)setTableDataText:(id)a3
{
}

- (NSMutableArray)tableDataText2
{
  return self->_tableDataText2;
}

- (void)setTableDataText2:(id)a3
{
}

- (NSMutableArray)tableImage
{
  return self->_tableImage;
}

- (void)setTableImage:(id)a3
{
}

- (NSMutableArray)tableImageColor
{
  return self->_tableImageColor;
}

- (void)setTableImageColor:(id)a3
{
}

- (OBTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (BOOL)preflightSuccess
{
  return self->_preflightSuccess;
}

- (void)setPreflightSuccess:(BOOL)a3
{
  self->_preflightSuccess = a3;
}

- (NSData)preflightRIK
{
  return self->_preflightRIK;
}

- (void)setPreflightRIK:(id)a3
{
}

- (NSDictionary)preflightResults
{
  return self->_preflightResults;
}

- (void)setPreflightResults:(id)a3
{
}

- (NSError)preflightError
{
  return self->_preflightError;
}

- (void)setPreflightError:(id)a3
{
}

- (NSArray)passSPCs
{
  return self->_passSPCs;
}

- (void)setPassSPCs:(id)a3
{
}

- (NSArray)failSPCs
{
  return self->_failSPCs;
}

- (void)setFailSPCs:(id)a3
{
}

- (NSArray)lockSPCs
{
  return self->_lockSPCs;
}

- (void)setLockSPCs:(id)a3
{
}

- (NSArray)unauthSPCs
{
  return self->_unauthSPCs;
}

- (void)setUnauthSPCs:(id)a3
{
}

- (NSArray)lostSPCs
{
  return self->_lostSPCs;
}

- (void)setLostSPCs:(id)a3
{
}

- (NSArray)deniedSPCs
{
  return self->_deniedSPCs;
}

- (void)setDeniedSPCs:(id)a3
{
}

- (NSArray)sealedSPCs
{
  return self->_sealedSPCs;
}

- (void)setSealedSPCs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sealedSPCs, 0);
  objc_storeStrong((id *)&self->_deniedSPCs, 0);
  objc_storeStrong((id *)&self->_lostSPCs, 0);
  objc_storeStrong((id *)&self->_unauthSPCs, 0);
  objc_storeStrong((id *)&self->_lockSPCs, 0);
  objc_storeStrong((id *)&self->_failSPCs, 0);
  objc_storeStrong((id *)&self->_passSPCs, 0);
  objc_storeStrong((id *)&self->_preflightError, 0);
  objc_storeStrong((id *)&self->_preflightResults, 0);
  objc_storeStrong((id *)&self->_preflightRIK, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_tableImageColor, 0);
  objc_storeStrong((id *)&self->_tableImage, 0);
  objc_storeStrong((id *)&self->_tableDataText2, 0);
  objc_storeStrong((id *)&self->_tableDataText, 0);
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->inputs, 0);
}

@end