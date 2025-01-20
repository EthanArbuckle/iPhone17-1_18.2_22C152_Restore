@interface MPIntentViewController
- (BOOL)countdownCancelled;
- (CGSize)desiredSize;
- (INInteraction)interaction;
- (MPEmergencyCountdownView)countdownView;
- (MPLegacyRecentsTableViewCell)prototypeRecentCallCell;
- (MPVoicemailController)voicemailController;
- (PHRecentsController)recentsController;
- (PHVoicemailMessageTableViewCell)prototypeVoicemailCell;
- (UITableView)tableView;
- (VMVoicemailManager)voicemailManager;
- (double)calculatedHeightForCallRecordCellsWithWidth:(double)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)callHistoryCache;
- (id)callHistoryManager;
- (id)callRecords;
- (id)intent;
- (id)recentCallForCallRecord:(id)a3;
- (id)recentsItemCache;
- (id)recentsItemForCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)voicemailForCallRecord:(id)a3;
- (id)voicemailMessageViewModelForVoicemail:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureForCallHistory;
- (void)configureRecentCallTableViewCell:(id)a3 forRecentCall:(id)a4 numberOfOccurences:(unint64_t)a5;
- (void)configureViewForEmergencyCountdown;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7;
- (void)configureVoicemailTableViewCell:(id)a3 forVoicemail:(id)a4;
- (void)desiresInteractivity:(id)a3;
- (void)recentsController:(id)a3 didChangeCalls:(id)a4;
- (void)setCountdownCancelled:(BOOL)a3;
- (void)setCountdownView:(id)a3;
- (void)setInteraction:(id)a3;
- (void)setPrototypeRecentCallCell:(id)a3;
- (void)setPrototypeVoicemailCell:(id)a3;
- (void)setRecentsController:(id)a3;
- (void)setTableView:(id)a3;
- (void)setVoicemailController:(id)a3;
- (void)setVoicemailManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWasCancelled;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MPIntentViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MPIntentViewController;
  [(MPIntentViewController *)&v6 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(MPIntentViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(MPIntentViewController *)self view];
  [v5 setOpaque:0];

  [(MPIntentViewController *)self setCountdownCancelled:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MPIntentViewController;
  [(MPIntentViewController *)&v12 viewDidAppear:a3];
  v4 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v5 = [(MPIntentViewController *)self intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  if (![(MPIntentViewController *)self countdownCancelled])
  {
    v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Disabling application idleTimer for CallIntentCountdown: countdownStarted", buf, 2u);
    }

    v8 = +[UIApplication sharedApplication];
    [v8 _setIdleTimerDisabled:1 forReason:@"CallIntentCountdown"];

    v9 = [(MPIntentViewController *)self countdownView];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000094F8;
    v10[3] = &unk_10008D758;
    v10[4] = self;
    [v9 startCountdownFromNumber:3 withTimeInterval:v10 completion:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(2.0))];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPIntentViewController;
  [(MPIntentViewController *)&v6 viewWillDisappear:a3];
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: viewWillDisappear", v5, 2u);
  }

  v4 = +[UIApplication sharedApplication];
  [v4 _setIdleTimerDisabled:0 forReason:@"CallIntentCountdown"];
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v10 = a4;
  v11 = (void (**)(id, void, void *, double, double))a7;
  id v12 = a3;
  [(MPIntentViewController *)self setInteraction:v10];
  v13 = PHDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v10 intent];
    int v24 = 138412290;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Intent: %@", (uint8_t *)&v24, 0xCu);
  }
  v15 = PHDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v10 intentResponse];
    int v24 = 138412290;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IntentResponse: %@", (uint8_t *)&v24, 0xCu);
  }
  v17 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_8:
    [(MPIntentViewController *)self configureViewForEmergencyCountdown];
    goto LABEL_9;
  }
  v18 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_8;
  }
  v20 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    [(MPIntentViewController *)self configureForCallHistory];
  }
  else
  {
    v22 = PHDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000612D8(self);
    }

    v23 = +[NSSet set];
    v11[2](v11, 0, v23, CGSizeZero.width, CGSizeZero.height);
  }
LABEL_9:
  [(MPIntentViewController *)self desiredSize];
  ((void (*)(void (**)(id, void, void *, double, double), uint64_t, id))v11[2])(v11, 1, v12);
}

- (void)viewWasCancelled
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "our view was cancelled, stopping countdown", buf, 2u);
  }

  v4 = [(MPIntentViewController *)self countdownView];
  [v4 cancel];

  [(MPIntentViewController *)self setCountdownCancelled:1];
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: viewWasCancelled", v7, 2u);
  }

  objc_super v6 = +[UIApplication sharedApplication];
  [v6 _setIdleTimerDisabled:0 forReason:@"CallIntentCountdown"];
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
}

- (void)desiresInteractivity:(id)a3
{
}

- (id)intent
{
  v2 = [(MPIntentViewController *)self interaction];
  v3 = [v2 intent];

  return v3;
}

- (id)callRecords
{
  v2 = [(MPIntentViewController *)self interaction];
  v3 = [v2 intentResponse];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 callRecords];
    if ([v4 count]) {
      goto LABEL_9;
    }
    v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100061368(v5);
    }
  }
  else
  {
    v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000613AC(v5);
    }
    v4 = 0;
  }

LABEL_9:

  return v4;
}

- (id)callHistoryManager
{
  if (qword_1000A2138 != -1) {
    dispatch_once(&qword_1000A2138, &stru_10008D898);
  }
  v2 = (void *)qword_1000A2130;

  return v2;
}

- (id)callHistoryCache
{
  if (qword_1000A2148 != -1) {
    dispatch_once(&qword_1000A2148, &stru_10008D8B8);
  }
  v2 = (void *)qword_1000A2140;

  return v2;
}

- (id)recentCallForCallRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  objc_super v6 = [(MPIntentViewController *)self callHistoryCache];
  v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Searching for calls with identifier: %@", buf, 0xCu);
    }

    v9 = +[NSPredicate predicateWithFormat:@"unique_id == %@", v5];
    id v10 = [(MPIntentViewController *)self callHistoryManager];
    v7 = [v10 callsWithPredicate:v9 limit:1 offset:0 batchSize:1];

    v11 = [(MPIntentViewController *)self callHistoryCache];
    id v12 = v11;
    if (v7) {
      v13 = v7;
    }
    else {
      v13 = &__NSArray0__struct;
    }
    [v11 setObject:v13 forKey:v5];
  }
  if ([v7 count] != (id)1)
  {
    v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100061468(v7);
    }
  }
  v15 = [v7 firstObject];
  if (!v15)
  {
    v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000613F0((uint64_t)v4, v16);
    }
  }

  return v15;
}

- (id)voicemailForCallRecord:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 longLongValue];
  objc_super v6 = [(MPIntentViewController *)self voicemailManager];
  v7 = [v6 voicemailWithIdentifier:v5];

  if (!v7)
  {
    v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000614E4((uint64_t)v4, v8);
    }
  }

  return v7;
}

- (double)calculatedHeightForCallRecordCellsWithWidth:(double)a3
{
  id v5 = [(MPIntentViewController *)self callRecords];
  id v6 = [v5 count];

  if (!v6) {
    return 0.0;
  }
  unint64_t v7 = 0;
  double v8 = 0.0;
  do
  {
    v9 = [(MPIntentViewController *)self callRecords];
    id v10 = [v9 objectAtIndexedSubscript:v7];

    if ([v10 callRecordType] == (id)5)
    {
      v11 = [(MPIntentViewController *)self voicemailForCallRecord:v10];
      if (v11)
      {
        id v12 = [[MPVisualMessage alloc] initWithVMVoicemail:v11];
        v13 = [(MPIntentViewController *)self prototypeVoicemailCell];
        [(MPIntentViewController *)self configureVoicemailTableViewCell:v13 forVoicemail:v12];

        v14 = [(MPIntentViewController *)self prototypeVoicemailCell];
        LODWORD(v15) = 1148846080;
        LODWORD(v16) = 1112014848;
        [v14 systemLayoutSizeFittingSize:a3 withHorizontalFittingPriority:0.0 verticalFittingPriority:v15 v16];
        double v18 = v17;

        double v8 = v8 + fmin(v18, 100.0);
      }
    }
    else
    {
      v11 = [(MPIntentViewController *)self recentCallForCallRecord:v10];
      if (v11)
      {
        v19 = [(MPIntentViewController *)self prototypeRecentCallCell];
        v20 = [v10 numberOfCalls];
        -[MPIntentViewController configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:](self, "configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:", v19, v11, [v20 unsignedIntegerValue]);

        char v21 = [(MPIntentViewController *)self prototypeRecentCallCell];
        LODWORD(v22) = 1148846080;
        LODWORD(v23) = 1112014848;
        [v21 systemLayoutSizeFittingSize:a3 withHorizontalFittingPriority:0.0 verticalFittingPriority:v22 v23];
        double v25 = v24;

        double v8 = v8 + v25;
      }
    }

    ++v7;
    v26 = [(MPIntentViewController *)self callRecords];
    id v27 = [v26 count];
  }
  while (v7 < (unint64_t)v27);
  return v8;
}

- (CGSize)desiredSize
{
  v3 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_4;
  }
  id v4 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_4:
    id v6 = [(MPIntentViewController *)self extensionContext];
    [v6 hostedViewMaximumAllowedSize];
    double v8 = v7;

    v9 = [(MPIntentViewController *)self extensionContext];
    [v9 hostedViewMaximumAllowedSize];
    double v11 = v10;

    if (v11 <= 200.0) {
      double v12 = v11;
    }
    else {
      double v12 = 200.0;
    }
    goto LABEL_7;
  }
  v14 = [(MPIntentViewController *)self intent];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  double v12 = 0.0;
  double v8 = 0.0;
  if (v15)
  {
    double v16 = [(MPIntentViewController *)self extensionContext];
    [v16 hostedViewMaximumAllowedSize];
    double v8 = v17;

    [(MPIntentViewController *)self calculatedHeightForCallRecordCellsWithWidth:v8];
    double v12 = v18;
  }
LABEL_7:
  double v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)configureViewForEmergencyCountdown
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuring for emergency countdown", v20, 2u);
  }

  id v4 = [MPEmergencyCountdownView alloc];
  LODWORD(v5) = 1125515264;
  id v6 = [(MPEmergencyCountdownView *)v4 initWithDiameter:v5];
  [(MPIntentViewController *)self setCountdownView:v6];

  double v7 = [(MPIntentViewController *)self view];
  double v8 = [(MPIntentViewController *)self countdownView];
  [v7 addSubview:v8];

  v9 = [(MPIntentViewController *)self countdownView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = [(MPIntentViewController *)self countdownView];
  double v11 = [v10 centerXAnchor];
  double v12 = [(MPIntentViewController *)self view];
  double v13 = [v12 centerXAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  char v15 = [(MPIntentViewController *)self countdownView];
  double v16 = [v15 centerYAnchor];
  double v17 = [(MPIntentViewController *)self view];
  double v18 = [v17 centerYAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];
}

- (void)configureForCallHistory
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuring for call history", v64, 2u);
  }

  id v4 = +[PHApplicationServices sharedInstance];
  double v5 = +[TUCallHistoryController callHistoryControllerWithCoalescingStrategy:1 options:15];
  id v6 = [PHRecentsController alloc];
  double v7 = [v4 callProviderManager];
  double v8 = [v4 contactStore];
  v9 = [v4 suggestedContactStore];
  double v10 = [v4 metadataCache];
  double v11 = [(PHRecentsController *)v6 initWithCallHistoryController:v5 callProviderManager:v7 contactStore:v8 suggestedContactStore:v9 metadataCache:v10];
  [(MPIntentViewController *)self setRecentsController:v11];

  double v12 = [(MPIntentViewController *)self recentsController];
  [v12 addDelegate:self queue:&_dispatch_main_q];

  id v13 = objc_alloc_init((Class)VMVoicemailManager);
  [(MPIntentViewController *)self setVoicemailManager:v13];

  v14 = [(MPIntentViewController *)self voicemailManager];
  char v15 = +[PHVisualVoicemailManagerFactory getVisualVoiceMailWithVisualVoicemailManager:v14 onVoicemailsChanged:&stru_10008D8D8];

  double v16 = [MPVoicemailController alloc];
  double v17 = [(MPIntentViewController *)self voicemailManager];
  double v18 = [v4 callProviderManager];
  v19 = [v4 contactStore];
  v20 = [v4 suggestedContactStore];
  char v21 = [v4 metadataCache];
  double v22 = [(MPVoicemailController *)v16 initWithVoicemailManager:v15 accountManager:v17 callProviderManager:v18 contactStore:v19 suggestedContactStore:v20 metadataCache:v21];
  [(MPIntentViewController *)self setVoicemailController:v22];

  double v23 = objc_alloc_init(MPLegacyRecentsTableViewCell);
  [(MPIntentViewController *)self setPrototypeRecentCallCell:v23];

  double v24 = [(MPIntentViewController *)self prototypeRecentCallCell];
  [v24 updateFontsLayoutMetricsAndSeparatorInset];

  double v25 = objc_alloc_init(PHVoicemailMessageTableViewCell);
  [(MPIntentViewController *)self setPrototypeVoicemailCell:v25];

  v26 = +[UIColor systemBlueColor];
  id v27 = [(MPIntentViewController *)self view];
  [v27 setTintColor:v26];

  id v28 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MPIntentViewController *)self setTableView:v28];

  v29 = [(MPIntentViewController *)self tableView];
  [v29 setDataSource:self];

  v30 = [(MPIntentViewController *)self tableView];
  [v30 setDelegate:self];

  v31 = [(MPIntentViewController *)self tableView];
  [v31 setScrollEnabled:0];

  v32 = +[UIColor clearColor];
  v33 = [(MPIntentViewController *)self tableView];
  [v33 setBackgroundColor:v32];

  v34 = [(MPIntentViewController *)self tableView];
  v35 = [v34 layer];
  [v35 setHitTestsAsOpaque:1];

  v36 = [(MPIntentViewController *)self tableView];
  [v36 registerClass:objc_opt_class() forCellReuseIdentifier:@"MPLegacyRecentsTableViewCell"];

  v37 = [(MPIntentViewController *)self tableView];
  uint64_t v38 = objc_opt_class();
  v39 = +[PHVoicemailMessageTableViewCell reuseIdentifier];
  [v37 registerClass:v38 forCellReuseIdentifier:v39];

  v40 = [(MPIntentViewController *)self tableView];
  [v40 setRowHeight:UITableViewAutomaticDimension];

  v41 = [(MPIntentViewController *)self view];
  v42 = [(MPIntentViewController *)self tableView];
  [v41 addSubview:v42];

  v43 = [(MPIntentViewController *)self tableView];
  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

  v44 = [(MPIntentViewController *)self tableView];
  v45 = [v44 topAnchor];
  v46 = [(MPIntentViewController *)self view];
  v47 = [v46 topAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [(MPIntentViewController *)self tableView];
  v50 = [v49 bottomAnchor];
  v51 = [(MPIntentViewController *)self view];
  v52 = [v51 bottomAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  [v53 setActive:1];

  v54 = [(MPIntentViewController *)self tableView];
  v55 = [v54 leftAnchor];
  v56 = [(MPIntentViewController *)self view];
  v57 = [v56 leftAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  v59 = [(MPIntentViewController *)self tableView];
  v60 = [v59 rightAnchor];
  v61 = [(MPIntentViewController *)self view];
  v62 = [v61 rightAnchor];
  v63 = [v60 constraintEqualToAnchor:v62];
  [v63 setActive:1];
}

- (id)voicemailMessageViewModelForVoicemail:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(MPVoicemailMessageViewModel);
  id v6 = [v4 date];
  [(MPVoicemailMessageViewModel *)v5 setDate:v6];

  double v7 = PHVoicemailCellDateFormatter();
  double v8 = [v4 date];
  v9 = [v7 stringFromDate:v8];
  [(MPVoicemailMessageViewModel *)v5 setLocalizedDate:v9];

  double v10 = [(MPIntentViewController *)self voicemailController];
  double v11 = [v10 localizedTitleForMessage:v4];
  [(MPVoicemailMessageViewModel *)v5 setLocalizedTitle:v11];

  [v4 duration];
  id v13 = PHVoicemailFormatTime(v12);
  [(MPVoicemailMessageViewModel *)v5 setLocalizedDuration:v13];

  v14 = [(MPIntentViewController *)self voicemailController];
  char v15 = [v14 localizedSubtitleForMessage:v4];
  [(MPVoicemailMessageViewModel *)v5 setLocalizedSubtitle:v15];

  -[MPVoicemailMessageViewModel setIsRead:](v5, "setIsRead:", [v4 isRead]);
  -[MPVoicemailMessageViewModel setIsDeleted:](v5, "setIsDeleted:", [v4 folder] == (id)2);
  id v16 = [v4 isTranscriptionAvailable];
  double v17 = PHDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10006155C((char)v16, (uint64_t)v4, v17);
  }

  [(MPVoicemailMessageViewModel *)v5 setShowsTranscriptionView:v16];
  [(MPVoicemailMessageViewModel *)v5 setShowsPlayerControls:1];
  [v4 duration];
  -[MPVoicemailMessageViewModel setDuration:](v5, "setDuration:");
  if (+[PHDevice isGeminiCapable])
  {
    id v18 = [(MPIntentViewController *)self voicemailController];
    v19 = [v18 callProviderManager];
    v20 = [v19 telephonyProvider];
    char v21 = [v20 prioritizedSenderIdentities];
    if ((unint64_t)[v21 count] < 2)
    {
    }
    else
    {
      double v22 = [v4 receiverDestinationID];
      id v23 = [v22 length];

      if (!v23) {
        goto LABEL_9;
      }
      id v24 = objc_alloc((Class)TUHandle);
      double v25 = [v4 receiverDestinationID];
      id v18 = [v24 initWithType:2 value:v25];

      v26 = [v4 receiverISOCountryCode];
      v19 = [v18 canonicalHandleForISOCountryCode:v26];

      id v27 = [(MPIntentViewController *)self voicemailController];
      id v28 = [v27 callProviderManager];
      v29 = [v28 telephonyProvider];
      v30 = [v29 senderIdentityForHandle:v19];
      v20 = [v30 localizedShortName];

      [(MPVoicemailMessageViewModel *)v5 setLocalizedSenderIdentityTitle:v20];
    }
  }
LABEL_9:
  v31 = [[VMMessageTranscriptViewModel alloc] initWithMPMessage:v4];
  [(MPVoicemailMessageViewModel *)v5 setTranscriptViewModel:v31];

  return v5;
}

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  double v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling recent calls change", (uint8_t *)&v9, 0xCu);
  }
  double v7 = [(MPIntentViewController *)self recentsItemCache];
  [v7 removeAllObjects];

  double v8 = [(MPIntentViewController *)self tableView];
  [v8 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MPIntentViewController *)self callRecords];
  int v9 = [v8 objectAtIndexedSubscript:[v7 row]];

  if ([v9 callRecordType] == (id)5)
  {
    id v10 = +[PHVoicemailMessageTableViewCell reuseIdentifier];
    double v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

    double v12 = [(MPIntentViewController *)self voicemailForCallRecord:v9];
    if (!v12) {
      goto LABEL_7;
    }
    id v13 = [[MPVisualMessage alloc] initWithVMVoicemail:v12];
    [(MPIntentViewController *)self configureVoicemailTableViewCell:v11 forVoicemail:v13];
  }
  else
  {
    double v11 = [v6 dequeueReusableCellWithIdentifier:@"MPLegacyRecentsTableViewCell" forIndexPath:v7];
    [v11 updateFontsLayoutMetricsAndSeparatorInset];
    double v12 = [(MPIntentViewController *)self recentCallForCallRecord:v9];
    if (!v12) {
      goto LABEL_7;
    }
    id v13 = [v9 numberOfCalls];
    [(MPIntentViewController *)self configureRecentCallTableViewCell:v11 forRecentCall:v12 numberOfOccurences:[(MPVisualMessage *)v13 unsignedIntegerValue]];
  }

LABEL_7:

  return v11;
}

- (id)recentsItemCache
{
  if (qword_1000A2158 != -1) {
    dispatch_once(&qword_1000A2158, &stru_10008D8F8);
  }
  v2 = (void *)qword_1000A2150;

  return v2;
}

- (id)recentsItemForCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 uniqueId];
  double v8 = [(MPIntentViewController *)self recentsItemCache];
  int v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    id v10 = [(MPIntentViewController *)self recentsController];
    int v9 = [v10 itemForRecentCall:v6 numberOfOccurences:a4];

    if (v9)
    {
      double v11 = [(MPIntentViewController *)self recentsItemCache];
      [v11 setObject:v9 forKey:v7];
    }
  }

  return v9;
}

- (void)configureRecentCallTableViewCell:(id)a3 forRecentCall:(id)a4 numberOfOccurences:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MPIntentViewController *)self recentsItemForCall:v8 numberOfOccurences:a5];
  double v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Recent Call: %@", (uint8_t *)&v16, 0xCu);
  }

  double v12 = PHDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Recents Item: %@", (uint8_t *)&v16, 0xCu);
  }

  [v9 configureWithRecentsItem:v10 recentCall:v8];
  [v9 setAccessoryType:0];
  id v13 = +[UIColor clearColor];
  [v9 setBackgroundColor:v13];

  v14 = +[UIColor clearColor];
  char v15 = [v9 contentView];

  [v15 setBackgroundColor:v14];
}

- (void)configureVoicemailTableViewCell:(id)a3 forVoicemail:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setDelegate:self];
  id v8 = +[UIColor clearColor];
  [v7 setBackgroundColor:v8];

  id v9 = +[UIColor clearColor];
  id v10 = [v7 contentView];
  [v10 setBackgroundColor:v9];

  id v11 = [(MPIntentViewController *)self voicemailMessageViewModelForVoicemail:v6];

  [v7 configureWithVoicemailMessageViewModel:v11 expanded:0 shouldGrayForeground:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MPIntentViewController *)self callRecords];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  +[MPLegacyRecentsTableViewCell minimumRowHeight];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [(MPIntentViewController *)self callRecords];
  id v8 = [v7 objectAtIndexedSubscript:[v14 row]];

  if ([v8 callRecordType] == (id)5)
  {
    id v9 = [(MPIntentViewController *)self voicemailForCallRecord:v8];
    id v10 = +[NSURL phoneAppVoicemailURLForRecordID:](NSURL, "phoneAppVoicemailURLForRecordID:", [v9 identifier]);
    TUOpenSensitiveURL();
  }
  else
  {
    id v9 = [(MPIntentViewController *)self recentCallForCallRecord:v8];
    id v11 = [v9 validRemoteParticipantHandles];
    id v12 = [v11 count];

    id v13 = [(MPIntentViewController *)self recentsController];
    id v10 = v13;
    if ((unint64_t)v12 < 2) {
      [v13 performDialRequestForRecentCall:v9];
    }
    else {
      [v13 performJoinRequestForRecentCall:v9];
    }
  }

  [v6 deselectRowAtIndexPath:v14 animated:1];
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
}

- (MPEmergencyCountdownView)countdownView
{
  return self->_countdownView;
}

- (void)setCountdownView:(id)a3
{
}

- (BOOL)countdownCancelled
{
  return self->_countdownCancelled;
}

- (void)setCountdownCancelled:(BOOL)a3
{
  self->_countdownCancelled = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (void)setRecentsController:(id)a3
{
}

- (MPLegacyRecentsTableViewCell)prototypeRecentCallCell
{
  return self->_prototypeRecentCallCell;
}

- (void)setPrototypeRecentCallCell:(id)a3
{
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (void)setVoicemailController:(id)a3
{
}

- (PHVoicemailMessageTableViewCell)prototypeVoicemailCell
{
  return self->_prototypeVoicemailCell;
}

- (void)setPrototypeVoicemailCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeVoicemailCell, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_prototypeRecentCallCell, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);

  objc_storeStrong((id *)&self->_interaction, 0);
}

@end