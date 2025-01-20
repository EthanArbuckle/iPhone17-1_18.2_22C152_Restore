@interface BuddyFinishedController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_shouldShowCursiveAnimation;
- (BOOL)_shouldShowGetStartedButton;
- (BOOL)_welcomeGradientShouldAdjustBuddyColor;
- (BOOL)drawHomeAffordance;
- (BOOL)isEphemeral;
- (BYDeviceProvider)deviceProvider;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyFinishedController)init;
- (BuddyFinishedCursiveChildWelcomeView)cursiveWelcomeView;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddySuspendTask)suspendTask;
- (MTLumaDodgePillView)homeAffordanceView;
- (SASWelcomeToDeviceViewControllerProvider)welcomeGradientViewProvider;
- (_TtP5Setup20IntelligenceProvider_)intelligenceProvider;
- (id)contentView;
- (int64_t)style;
- (unint64_t)allowedTerminationSources;
- (void)_determineStyleWithCompletion:(id)a3;
- (void)_prepareContentView;
- (void)_shouldShowIntelligenceAnimationWithCompletion:(id)a3;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCursiveWelcomeView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setDrawHomeAffordance:(BOOL)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setHomeAffordanceView:(id)a3;
- (void)setIntelligenceProvider:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuspendTask:(id)a3;
- (void)setWelcomeGradientViewProvider:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BuddyFinishedController

- (BuddyFinishedController)init
{
  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WELCOME_TO"];
  v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id location = [(BuddyFinishedController *)self initWithTitle:v5];
  v6 = (BuddyFinishedController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyFinishedController;
  [(BuddyFinishedController *)&v3 loadView];
  id v2 = [(BuddyFinishedController *)v5 navigationItem];
  [v2 setHidesBackButton:1];

  [(BuddyFinishedController *)v5 _prepareContentView];
}

- (void)viewDidLoad
{
  v25 = self;
  SEL v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)BuddyFinishedController;
  [(BuddyFinishedController *)&v23 viewDidLoad];
  if ([(BuddyFinishedController *)v25 _shouldShowGetStartedButton])
  {
    objc_initWeak(&location, v25);
    id v2 = v25;
    objc_super v3 = +[NSBundle mainBundle];
    SEL v4 = [(NSBundle *)v3 localizedStringForKey:@"GET_STARTED" value:&stru_1002B4E18 table:@"Localizable"];
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_100045908;
    v20 = &unk_1002B0CA8;
    objc_copyWeak(&v21, &location);
    [(BuddyFinishedController *)v2 setButtonTitle:v4 action:&v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = v25;
    v6 = +[NSBundle mainBundle];
    v7 = [(NSBundle *)v6 localizedStringForKey:@"GET_STARTED_IPHONE_X" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyFinishedController *)v5 setInstructionalText:v7];
  }
  if ([(BuddyFinishedController *)v25 drawHomeAffordance])
  {
    id v8 = [objc_alloc((Class)MTLumaDodgePillView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(BuddyFinishedController *)v25 setHomeAffordanceView:v8];

    v9 = [(BuddyFinishedController *)v25 homeAffordanceView];
    [(MTLumaDodgePillView *)v9 setStyle:3];

    id v10 = [(BuddyFinishedController *)v25 view];
    v11 = [(BuddyFinishedController *)v25 homeAffordanceView];
    [v10 addSubview:v11];
  }
  v12 = [(BuddyFinishedController *)v25 welcomeGradientViewProvider];
  unsigned __int8 v13 = 0;
  if (v12) {
    unsigned __int8 v13 = [(BuddyFinishedController *)v25 _welcomeGradientShouldAdjustBuddyColor];
  }

  if (v13)
  {
    v14 = +[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0];
    id v15 = [(BuddyFinishedController *)v25 view];
    [v15 setBackgroundColor:v14];
  }
}

- (void)viewDidLayoutSubviews
{
  v31 = self;
  SEL v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BuddyFinishedController;
  [(BuddyFinishedController *)&v29 viewDidLayoutSubviews];
  id v2 = [(BuddyFinishedController *)v31 homeAffordanceView];

  if (v2)
  {
    id v3 = [(BuddyFinishedController *)v31 view];
    [v3 bounds];
    v28.origin.y = v4;
    v28.origin.x = v5;
    v28.size.height = v6;
    v28.size.width = v7;

    id v8 = [(BuddyFinishedController *)v31 homeAffordanceView];
    id v9 = [(BuddyFinishedController *)v31 view];
    [v9 bounds];
    [(MTLumaDodgePillView *)v8 suggestedSizeForContentWidth:v10];

    v11 = [(BuddyFinishedController *)v31 homeAffordanceView];
    -[MTLumaDodgePillView setFrame:](v11, "setFrame:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);

    v12 = [(BuddyFinishedController *)v31 homeAffordanceView];
    double v13 = sub_100045BE8();
    -[MTLumaDodgePillView setBounds:](v12, "setBounds:", v13, v14, v15, v16);

    CGRectGetMidX(v28);
    CGRectGetHeight(v28);
    int v17 = [(BuddyFinishedController *)v31 homeAffordanceView];
    [(MTLumaDodgePillView *)v17 bounds];
    v22 = [(BuddyFinishedController *)v31 homeAffordanceView];
    [(MTLumaDodgePillView *)v22 suggestedEdgeSpacing];
    sub_100045C40();
    double v26 = v23;
    double v27 = v24;

    v25 = [(BuddyFinishedController *)v31 homeAffordanceView];
    -[MTLumaDodgePillView setCenter:](v25, "setCenter:", v26, v27);
  }
}

- (id)contentView
{
  id v2 = [(BuddyFinishedController *)self cursiveWelcomeView];

  if (v2)
  {
    id v8 = [(BuddyFinishedController *)self cursiveWelcomeView];
  }
  else
  {
    id v3 = [(BuddyFinishedController *)self welcomeGradientViewProvider];

    if (v3)
    {
      CGFloat v4 = [(BuddyFinishedController *)self welcomeGradientViewProvider];
      id v5 = [(SASWelcomeToDeviceViewControllerProvider *)v4 viewController];
      id v8 = (BuddyFinishedCursiveChildWelcomeView *)[v5 view];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v35 = self;
  SEL v34 = a2;
  BOOL v33 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BuddyFinishedController;
  [(BuddyFinishedController *)&v32 viewDidAppear:a3];
  id v3 = [(BuddyFinishedController *)v35 cursiveWelcomeView];
  [(BuddyFinishedCursiveChildWelcomeView *)v3 startAnimation];

  CGFloat v4 = [(BuddyFinishedController *)v35 welcomeGradientViewProvider];
  [(SASWelcomeToDeviceViewControllerProvider *)v4 startAnimation];

  id v5 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WELCOME_TO"];
  CGFloat v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Localizable"];
  id v8 = [(BuddyFinishedController *)v35 cursiveWelcomeView];
  [(BuddyFinishedCursiveChildWelcomeView *)v8 setAccessibilityLabel:v7];

  id v9 = +[ACAccountStore defaultStore];
  id v31 = [v9 aa_primaryAppleAccount];

  if (v31)
  {
    id v10 = +[ACAccountStore defaultStore];
    id v30 = [v10 aa_accountsEnabledForDataclass:kAccountDataclassDeviceLocator];

    memset(__b, 0, sizeof(__b));
    id v11 = v30;
    id v12 = [v11 countByEnumeratingWithState:__b objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v12; ++i)
        {
          if (*(void *)__b[2] != v13) {
            objc_enumerationMutation(v11);
          }
          id v29 = *(id *)(__b[1] + 8 * i);
          if ((objc_msgSend(v29, "aa_isAccountClass:", AAAccountClassPrimary) & 1) == 0)
          {
            [v29 setEnabled:0 forDataclass:kAccountDataclassDeviceLocator];
            id v15 = +[ACAccountStore defaultStore];
            [v15 saveAccount:v29 withCompletionHandler:0];

            double v16 = +[NSBundle mainBundle];
            int v17 = [(NSBundle *)v16 localizedStringForKey:@"FMIP_ACCOUNT_DISABLE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
            id v18 = [v29 aa_primaryEmail];
            id v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v18);

            uint64_t v19 = +[NSBundle mainBundle];
            uint64_t v20 = [(NSBundle *)v19 localizedStringForKey:@"FMIP_ACCOUNT_DISABLE_MESSAGE" value:&stru_1002B4E18 table:@"Localizable"];
            id v21 = [v31 aa_primaryEmail];
            id v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21);

            id location = +[UIAlertController alertControllerWithTitle:v27 message:v26 preferredStyle:1];
            v22 = +[NSBundle mainBundle];
            double v23 = [(NSBundle *)v22 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
            double v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:0];
            [location addAction:v24];

            [(BuddyFinishedController *)v35 presentViewController:location animated:1 completion:0];
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v26, 0);
            objc_storeStrong(&v27, 0);
            goto LABEL_11;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:__b objects:v36 count:16];
      }
      while (v12);
    }
LABEL_11:

    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(&v31, 0);
}

+ (BOOL)controllerNeedsToRun
{
  return (+[DMCMultiUserModeUtilities inSharediPadUserSession] ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v13 = 0;
  unsigned __int8 v3 = +[DMCMultiUserModeUtilities inSharediPadUserSession];
  char v4 = 1;
  if (v3) {
    char v4 = +[DMCMultiUserModeUtilities awaitUserConfigurationEnabled] ^ 1;
  }
  char v13 = v4 & 1;
  if (v4)
  {
    id v5 = v15;
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_100046494;
    id v10 = &unk_1002B0CD0;
    id v11 = v15;
    id v12 = location[0];
    [(BuddyFinishedController *)v5 _determineStyleWithCompletion:&v6];
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  else
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupWelcome;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (unint64_t)allowedTerminationSources
{
  id v2 = [(BuddyFinishedController *)self suspendTask];
  unsigned __int8 v3 = [(BuddySuspendTask *)v2 launchURL];
  char v6 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    int v7 = [(BuddyFinishedController *)self buddyPreferencesExcludedFromBackup];
    char v6 = 1;
    unsigned __int8 v4 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
  }
  if (v6) {

  }
  if (v4) {
    return 0;
  }
  else {
    return 3;
  }
}

- (void)_determineStyleWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyFinishedController *)v12 _shouldShowCursiveAnimation])
  {
    [(BuddyFinishedController *)v12 setStyle:1];
    (*((void (**)(void))location[0] + 2))();
  }
  else
  {
    unsigned __int8 v3 = v12;
    unsigned __int8 v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = sub_1000467F0;
    int v8 = &unk_1002B0CF8;
    id v9 = v12;
    id v10 = location[0];
    [(BuddyFinishedController *)v3 _shouldShowIntelligenceAnimationWithCompletion:&v4];
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_prepareContentView
{
  int64_t v2 = [(BuddyFinishedController *)self style];
  if (v2)
  {
    if (v2 == 1)
    {
      unsigned __int8 v3 = -[BuddyFinishedCursiveChildWelcomeView initWithFrame:]([BuddyFinishedCursiveChildWelcomeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(BuddyFinishedController *)self setCursiveWelcomeView:v3];

      unsigned __int8 v4 = [(BuddyFinishedController *)self cursiveWelcomeView];
      [(BuddyFinishedCursiveChildWelcomeView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else if (v2 == 2)
    {
      id v5 = objc_alloc((Class)SASWelcomeToDeviceViewControllerProvider);
      int v6 = +[NSBundle mainBundle];
      id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WELCOME_TO"];
      int v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
      id v9 = +[UIColor labelColor];
      id v10 = [v5 initWithText:v8 finalTextColor:v9 onAnimationCompleteHandler:0];
      [(BuddyFinishedController *)self setWelcomeGradientViewProvider:v10];

      id v11 = [(BuddyFinishedController *)self welcomeGradientViewProvider];
      id v12 = [(SASWelcomeToDeviceViewControllerProvider *)v11 viewController];
      id v13 = [v12 view];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v14 = +[UIColor clearColor];
      id v15 = [(BuddyFinishedController *)self welcomeGradientViewProvider];
      id v16 = [(SASWelcomeToDeviceViewControllerProvider *)v15 viewController];
      id v17 = [v16 view];
      [v17 setBackgroundColor:v14];
    }
  }
}

- (BOOL)_welcomeGradientShouldAdjustBuddyColor
{
  int64_t v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 potentialEDRHeadroom];
  BOOL v4 = v3 > 2.0;

  BOOL v9 = v4;
  id v5 = [(BuddyFinishedController *)self traitCollection];
  BOOL v6 = [v5 userInterfaceStyle] == (id)2;

  BOOL v7 = 0;
  if (!v6) {
    return !v9;
  }
  return v7;
}

- (BOOL)_shouldShowCursiveAnimation
{
  int64_t v2 = [(BuddyFinishedController *)self flowItemDispositionProvider];
  BOOL v3 = ([(BuddyFlowItemDispositionProvider *)v2 dispositions] & 0x10) == 16;

  return v3;
}

- (void)_shouldShowIntelligenceAnimationWithCompletion:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyFinishedController *)v5 intelligenceProvider];
  [(IntelligenceProvider *)v3 isIntelligenceEnabledWithCompletionHandler:location[0]];

  objc_storeStrong(location, 0);
}

- (BOOL)_shouldShowGetStartedButton
{
  int64_t v2 = [(BuddyFinishedController *)self deviceProvider];
  unsigned __int8 v3 = [(BYDeviceProvider *)v2 hasHomeButton];
  char v6 = 0;
  BOOL v4 = 1;
  if ((v3 & 1) == 0)
  {
    BOOL v7 = [(BuddyFinishedController *)self deviceProvider];
    char v6 = 1;
    BOOL v4 = [(BYDeviceProvider *)v7 type] == (id)1;
  }
  BOOL v9 = v4;
  if (v6) {

  }
  return v9;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (_TtP5Setup20IntelligenceProvider_)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
}

- (BOOL)drawHomeAffordance
{
  return self->_drawHomeAffordance;
}

- (void)setDrawHomeAffordance:(BOOL)a3
{
  self->_drawHomeAffordance = a3;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (MTLumaDodgePillView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
}

- (BuddyFinishedCursiveChildWelcomeView)cursiveWelcomeView
{
  return self->_cursiveWelcomeView;
}

- (void)setCursiveWelcomeView:(id)a3
{
}

- (SASWelcomeToDeviceViewControllerProvider)welcomeGradientViewProvider
{
  return self->_welcomeGradientViewProvider;
}

- (void)setWelcomeGradientViewProvider:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end