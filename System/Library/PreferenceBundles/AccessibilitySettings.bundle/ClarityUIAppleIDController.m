@interface ClarityUIAppleIDController
- (ClarityUIAppleIDController)initWithAppleID:(id)a3 delegate:(id)a4 andCompletion:(id)a5;
- (ClarityUIOnboardingDismissalDelegate)delegate;
- (id)completionHandler;
- (void)_cancelButtonTapped:(id)a3;
- (void)_changeButtonTapped:(id)a3;
- (void)_nextButtonTapped:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityUIAppleIDController

- (ClarityUIAppleIDController)initWithAppleID:(id)a3 delegate:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v8, "clarityUI_shortName");
  uint64_t v12 = [v8 appleID];
  if ([v11 length])
  {
    v13 = AXLocStringKeyForModel();
    v14 = settingsLocString(v13, @"ClarityUISettings");
    v40 = AXCFormattedString();
  }
  else
  {
    v13 = AXLocStringKeyForModel();
    v40 = settingsLocString(v13, @"ClarityUISettings");
  }

  int v15 = _os_feature_enabled_impl();
  if (v15)
  {
    v16 = [@"APPLE_ID_TEXT" stringByAppendingString:@"_AABRANDING"];
  }
  else
  {
    v16 = @"APPLE_ID_TEXT";
  }
  v17 = settingsLocString(v16, @"ClarityUISettings");
  v39 = (void *)v12;
  v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v12);
  v44.receiver = self;
  v44.super_class = (Class)ClarityUIAppleIDController;
  v19 = [(ClarityUIAppleIDController *)&v44 initWithTitle:v40 detailText:v18 icon:0];

  if (v15) {
  if (v19)
  }
  {
    objc_storeWeak((id *)&v19->_delegate, v9);
    id v38 = v10;
    id v20 = objc_retainBlock(v10);
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v20;

    v22 = +[OBBoldTrayButton boldButton];
    v23 = settingsLocString(@"CONTINUE", @"ClarityUISettings");
    [v22 setTitle:v23 forState:0];

    [v22 addTarget:v19 action:"_nextButtonTapped:" forControlEvents:0x2000];
    v24 = [(ClarityUIAppleIDController *)v19 buttonTray];
    [v24 addButton:v22];

    objc_initWeak(&location, v19);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __69__ClarityUIAppleIDController_initWithAppleID_delegate_andCompletion___block_invoke;
    v41[3] = &unk_20A8F8;
    objc_copyWeak(&v42, &location);
    v25 = +[UIAction actionWithHandler:v41];
    v26 = +[OBLinkTrayButton linkButton];
    int v27 = _os_feature_enabled_impl();
    if (v27)
    {
      v28 = [@"CHANGE_APPLE_ID" stringByAppendingString:@"_AABRANDING"];
    }
    else
    {
      v28 = @"CHANGE_APPLE_ID";
    }
    v29 = settingsLocString(v28, @"ClarityUISettings");
    [v26 setTitle:v29 forState:0];

    if (v27) {
    [v26 addAction:v25 forControlEvents:0x2000];
    }
    v30 = [(ClarityUIAppleIDController *)v19 buttonTray];
    [v30 addButton:v26];

    v31 = settingsLocString(@"APPLE_ID_TITLE_1", @"ClarityUISettings");
    v32 = settingsLocString(@"APPLE_ID_VALUE_1", @"ClarityUISettings");
    v33 = +[UIImage systemImageNamed:@"icloud"];
    [(ClarityUIAppleIDController *)v19 addBulletedListItemWithTitle:v31 description:v32 image:v33];

    v34 = settingsLocString(@"APPLE_ID_TITLE_2", @"ClarityUISettings");
    v35 = settingsLocString(@"APPLE_ID_VALUE_2", @"ClarityUISettings");
    v36 = +[UIImage systemImageNamed:@"person.2.fill"];
    [(ClarityUIAppleIDController *)v19 addBulletedListItemWithTitle:v34 description:v35 image:v36];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    id v10 = v38;
  }

  return v19;
}

void __69__ClarityUIAppleIDController_initWithAppleID_delegate_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogTemp();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Button pressed", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeButtonTapped:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ClarityUIAppleIDController;
  [(ClarityUIAppleIDController *)&v7 viewDidLoad];
  id v3 = objc_allocWithZone((Class)UIBarButtonItem);
  v4 = settingsLocString(@"CANCEL", @"ClarityUISettings");
  id v5 = [v3 initWithTitle:v4 style:2 target:self action:"_cancelButtonTapped:"];

  v6 = [(ClarityUIAppleIDController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];
}

- (void)_nextButtonTapped:(id)a3
{
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (void)_changeButtonTapped:(id)a3
{
  id v3 = [(ClarityUIAppleIDController *)self delegate];
  [v3 dimissOnboardingControllerEarlyWithCompletion:&__block_literal_global_34];
}

void __50__ClarityUIAppleIDController__changeButtonTapped___block_invoke(id a1)
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = +[LSApplicationWorkspace defaultWorkspace];
  [v1 openSensitiveURL:v2 withOptions:0];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (ClarityUIOnboardingDismissalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ClarityUIOnboardingDismissalDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end