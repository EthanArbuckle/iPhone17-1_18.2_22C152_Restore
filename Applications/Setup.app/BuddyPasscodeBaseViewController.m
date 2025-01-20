@interface BuddyPasscodeBaseViewController
+ (BOOL)allowSkip;
+ (double)_passcodeInputVerticalPaddingForOrientation:(int64_t)a3;
- (BFFPasscodeCreationManager)passcodeManager;
- (BOOL)_allowSkip;
- (BOOL)footerButtonIsSkip;
- (BOOL)includeHeaderAnimation;
- (BOOL)showingSpinner;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyPasscodeBaseViewController)init;
- (BuddyPasscodeBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (BuddyPasscodeBaseViewControllerDelegate)passcodeCreationDelegate;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)passcodeInputViewBottomConstraint;
- (NSString)userFirstName;
- (OBAnimationController)animationController;
- (UIButton)footerButton;
- (id)_currentPasscodeInputView;
- (id)_firstEntryInstructions;
- (id)_passcodeInputViewForState:(unint64_t)a3 updateDetailText:(BOOL)a4;
- (id)instructionsForState:(unint64_t)a3;
- (id)passcodeInputView;
- (id)passcodeOptionAlertController;
- (id)titleForState:(unint64_t)a3;
- (unint64_t)_onboardingPasscodeAnimationForBFF:(unint64_t)a3;
- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4;
- (void)_commitPasscodeEntryTypeChange;
- (void)_finishedWithPasscode:(id)a3;
- (void)_prepareTransitionForPasscodeInput:(id)a3;
- (void)_setupFirstEntry;
- (void)_showPasscodeOptionsSheet;
- (void)_showSkipPasscodeAlert;
- (void)_showWeakWarningAlert;
- (void)_updateNextButton;
- (void)_updateNextButtonForPasscode:(id)a3;
- (void)clear;
- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3;
- (void)dealloc;
- (void)nextButtonPressed;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5;
- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)passcodeManagerWillSetPasscode:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setFooterButton:(id)a3;
- (void)setFooterButtonIsSkip:(BOOL)a3;
- (void)setIncludeHeaderAnimation:(BOOL)a3;
- (void)setPasscodeCreationDelegate:(id)a3;
- (void)setPasscodeInputViewBottomConstraint:(id)a3;
- (void)setPasscodeManager:(id)a3;
- (void)setShowingSpinner:(BOOL)a3;
- (void)setUserFirstName:(id)a3;
- (void)tappedFooterButton:(id)a3;
- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyPasscodeBaseViewController

- (BuddyPasscodeBaseViewController)init
{
  id location = [(BuddyPasscodeBaseViewController *)self initWithTitle:&stru_1002B4E18, @" ", 0, a2, 0 detailText icon];
  objc_storeStrong(&location, location);
  if (location) {
    *((unsigned char *)location + 8) = 1;
  }
  v2 = (BuddyPasscodeBaseViewController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyPasscodeBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v7 = v14;
  id v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)BuddyPasscodeBaseViewController;
  id v14 = [(BuddyPasscodeBaseViewController *)&v10 initWithTitle:&stru_1002B4E18 detailText:@" " icon:0];
  objc_storeStrong(&v14, v14);
  if (v14) {
    *((unsigned char *)v14 + 8) = 1;
  }
  v8 = (BuddyPasscodeBaseViewController *)v14;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

+ (BOOL)allowSkip
{
  if (PSHasStockholmPass()) {
    return 0;
  }
  id v2 = +[MCProfileConnection sharedConnection];
  BOOL v4 = ([v2 isPasscodeRequired] ^ 1) & 1;

  return v4;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  id v2 = [(BuddyPasscodeBaseViewController *)self passcodeManager];
  [(BFFPasscodeCreationManager *)v2 setDelegate:0];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v3 dealloc];
}

- (void)_setupFirstEntry
{
  v27 = self;
  SEL v26 = a2;
  id v3 = +[BFFPasscodeCreationManager sharedPasscodeManager];
  [(BuddyPasscodeBaseViewController *)self setPasscodeManager:v3];

  SEL v4 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
  [(BFFPasscodeCreationManager *)v4 reset];

  v5 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
  [(BFFPasscodeCreationManager *)v5 setDelegate:v27];

  int v25 = 0;
  id v6 = +[MCProfileConnection sharedConnection];
  LODWORD(v3) = [v6 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v25];

  *(_DWORD *)&v24[1] = v3;
  if (v3)
  {
    id v14 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
    [(BFFPasscodeCreationManager *)v14 setNumericPasscodeEntry:0];

    v15 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
    [(BFFPasscodeCreationManager *)v15 setSimplePasscodeEntryLength:0];
  }
  else
  {
    char v7 = PSSupportsMesa();
    *(_DWORD *)v24 = v7 & 1;
    char v8 = 1;
    if ((v7 & 1) == 0)
    {
      char v23 = MGGetBoolAnswer() & 1;
      char v8 = v23;
    }
    v24[0] = v8 & 1;
    uint64_t v22 = 0;
    char v9 = 1;
    if (v25 != 1) {
      char v9 = v24[0];
    }
    uint64_t v22 = v9 & 1;
    objc_super v10 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
    id v11 = v10;
    if (v22) {
      unsigned int v12 = 6;
    }
    else {
      unsigned int v12 = 4;
    }
    [(BFFPasscodeCreationManager *)v10 setSimplePasscodeEntryLength:v12];

    v13 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
    [(BFFPasscodeCreationManager *)v13 setNumericPasscodeEntry:1];
  }
  [(BuddyPasscodeBaseViewController *)v27 configurePasscodeTypeUsingAnimations:0];
  v16 = [(BuddyPasscodeBaseViewController *)v27 passcodeManager];
  id v17 = [(BFFPasscodeCreationManager *)v16 passcodeState];

  id v21 = v17;
  id v18 = [(BuddyPasscodeBaseViewController *)v27 headerView];
  id v19 = [(BuddyPasscodeBaseViewController *)v27 titleForState:v17];
  [v18 setTitle:v19];

  id location = [(BuddyPasscodeBaseViewController *)v27 _passcodeInputViewForState:v21 updateDetailText:1];
  [(BuddyPasscodeBaseViewController *)v27 transitionToPasscodeInput:location delegate:v27];
  objc_storeStrong(&location, 0);
}

- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4
{
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v46 = 0;
  objc_storeStrong(&v46, a4);
  id v5 = [(BuddyPasscodeBaseViewController *)v48 _currentPasscodeInputView];
  BOOL v6 = 1;
  if (([v5 isEqual:location[0]] & 1) == 0) {
    BOOL v6 = location[0] == 0;
  }

  if (v6)
  {
    int v45 = 1;
  }
  else
  {
    id v44 = [(BuddyPasscodeBaseViewController *)v48 _currentPasscodeInputView];
    [v44 disable];
    [v44 setDelegate:0];
    [location[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [location[0] setDelegate:v48];
    id v7 = [(BuddyPasscodeBaseViewController *)v48 contentView];
    [v7 addSubview:location[0]];

    if ([v44 isFirstResponder])
    {
      v38 = _NSConcreteStackBlock;
      int v39 = -1073741824;
      int v40 = 0;
      v41 = sub_1001E255C;
      v42 = &unk_1002B0D20;
      id v43 = location[0];
      +[UIView performWithoutAnimation:&v38];
      objc_storeStrong(&v43, 0);
    }
    else
    {
      [location[0] becomeFirstResponder];
    }
    [v44 removeFromSuperview];
    char v8 = objc_opt_class();
    char v9 = +[UIApplication sharedApplication];
    [v8 _passcodeInputVerticalPaddingForOrientation:[UIApplication activeInterfaceOrientation]];
    double v11 = v10;

    double v37 = v11;
    id v12 = [location[0] topAnchor];
    id v13 = [(BuddyPasscodeBaseViewController *)v48 contentView];
    id v14 = [v13 topAnchor];
    id v36 = [v12 constraintEqualToAnchor:v14 constant:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [location[0] leadingAnchor];
      id v16 = [(BuddyPasscodeBaseViewController *)v48 contentView];
      id v17 = [v16 leadingAnchor];
      id v18 = [v15 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      id v19 = [location[0] trailingAnchor];
      id v20 = [(BuddyPasscodeBaseViewController *)v48 contentView];
      id v21 = [v20 trailingAnchor];
      id v22 = [v19 constraintEqualToAnchor:v21];
      [v22 setActive:1];
    }
    char v23 = [(BuddyPasscodeBaseViewController *)v48 contentViewTopConstraint];

    if (v23)
    {
      v24 = [(BuddyPasscodeBaseViewController *)v48 contentViewTopConstraint];
      [(NSLayoutConstraint *)v24 constant];
      [v36 setConstant:];
    }
    [(BuddyPasscodeBaseViewController *)v48 setContentViewTopConstraint:v36];
    int v25 = [(BuddyPasscodeBaseViewController *)v48 footerButton];
    id v26 = [(UIButton *)v25 topAnchor];
    id v27 = [location[0] bottomAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27 constant:v37];
    [(BuddyPasscodeBaseViewController *)v48 setPasscodeInputViewBottomConstraint:v28];

    id v29 = [location[0] centerXAnchor];
    id v30 = [(BuddyPasscodeBaseViewController *)v48 contentView];
    id v31 = [v30 centerXAnchor];
    id v32 = [v29 constraintEqualToAnchor:v31];
    v49[0] = v32;
    v33 = [(BuddyPasscodeBaseViewController *)v48 contentViewTopConstraint];
    v49[1] = v33;
    v34 = [(BuddyPasscodeBaseViewController *)v48 passcodeInputViewBottomConstraint];
    v49[2] = v34;
    v35 = +[NSArray arrayWithObjects:v49 count:3];
    +[NSLayoutConstraint activateConstraints:v35];

    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v44, 0);
    int v45 = 0;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

+ (double)_passcodeInputVerticalPaddingForOrientation:(int64_t)a3
{
  double v8 = 0.0;
  id v3 = +[BYDevice currentDevice];
  id v4 = [v3 type];

  if (v4 == (id)1) {
    return 20.0;
  }
  id v5 = +[BYDevice currentDevice];
  BOOL v6 = (char *)[v5 size];

  if ((unint64_t)v6 < 2) {
    return 37.0;
  }
  if (v6 == (char *)2) {
    return 22.0;
  }
  if (v6 == (char *)3 || v6 != (char *)4 && (unint64_t)(v6 - 5) <= 1) {
    return 37.0;
  }
  return v8;
}

- (void)viewDidLoad
{
  int v45 = self;
  SEL v44 = a2;
  v43.receiver = self;
  v43.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v43 viewDidLoad];
  id v2 = [(BuddyPasscodeBaseViewController *)v45 flowItemDispositionProvider];
  unint64_t v3 = [(BuddyFlowItemDispositionProvider *)v2 dispositions] & 8;

  if (v3 == 8)
  {
    id v4 = +[UIColor systemBlueColor];
    id location = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v4];

    id v5 = [(BuddyPasscodeBaseViewController *)v45 headerView];
    BOOL v6 = +[UIImage systemImageNamed:@"figure.child.and.lock.fill" withConfiguration:location];
    [v5 setIcon:v6 accessibilityLabel:0];

    objc_storeStrong(&location, 0);
  }
  else if ([(BuddyPasscodeBaseViewController *)v45 includeHeaderAnimation])
  {
    id v7 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
    v47[0] = v7;
    id v8 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:1.0];
    v47[1] = v8;
    id v41 = +[NSArray arrayWithObjects:v47 count:2];

    id v9 = [(BuddyPasscodeBaseViewController *)v45 buddy_animationController:@"Lock" animatedStates:v41 startAtFirstState:1];
    [(BuddyPasscodeBaseViewController *)v45 setAnimationController:v9];

    objc_storeStrong(&v41, 0);
  }
  double v10 = +[BuddyMultilineButton buttonWithType:1];
  [(BuddyPasscodeBaseViewController *)v45 setFooterButton:v10];

  double v11 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  [(UIButton *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  id v13 = [(UIButton *)v12 titleLabel];
  id v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)v13 setFont:v14];

  id v15 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  id v16 = [(UIButton *)v15 titleLabel];
  [(UILabel *)v16 setNumberOfLines:0];

  id v17 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  id v18 = [(UIButton *)v17 titleLabel];
  [(UILabel *)v18 setTextAlignment:1];

  double v37 = sub_1001E2CA0();
  double v38 = v19;
  double v39 = v20;
  double v40 = v21;
  id v22 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  -[UIButton setContentEdgeInsets:](v22, "setContentEdgeInsets:", v37, v38, v39, v40);

  char v23 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  [(UIButton *)v23 addTarget:v45 action:"tappedFooterButton:" forEvents:64];

  id v24 = [(BuddyPasscodeBaseViewController *)v45 contentView];
  int v25 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  [v24 addSubview:v25];

  id v36 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  id v26 = [(UIButton *)v36 widthAnchor];
  id v27 = [(BuddyPasscodeBaseViewController *)v45 contentView];
  id v28 = [v27 widthAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28 multiplier:1.0];
  v46[0] = v29;
  id v30 = [(BuddyPasscodeBaseViewController *)v45 footerButton];
  id v31 = [(UIButton *)v30 bottomAnchor];
  id v32 = [(BuddyPasscodeBaseViewController *)v45 contentView];
  id v33 = [v32 bottomAnchor];
  id v34 = [v31 constraintEqualToAnchor:v33];
  v46[1] = v34;
  v35 = +[NSArray arrayWithObjects:v46 count:2];
  +[NSLayoutConstraint activateConstraints:v35];

  [(BuddyPasscodeBaseViewController *)v45 setExtendedLayoutIncludesOpaqueBars:1];
  [(BuddyPasscodeBaseViewController *)v45 _setupFirstEntry];
}

- (void)viewWillAppear:(BOOL)a3
{
  double v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v8 viewWillAppear:a3];
  id v7 = [(BuddyPasscodeBaseViewController *)v11 _currentPasscodeInputView];
  id v3 = [(BuddyPasscodeBaseViewController *)v11 presentedViewController];
  BOOL v4 = v3 == 0;

  if (v4) {
    [v7 becomeFirstResponder];
  }
  id v5 = v11;
  id v6 = [v7 passcode];
  [(BuddyPasscodeBaseViewController *)v5 _updateNextButtonForPasscode:v6];

  objc_storeStrong(&v7, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v11 viewDidAppear:a3];
  id v3 = [(BuddyPasscodeBaseViewController *)v14 animationController];
  [(OBAnimationController *)v3 startAnimation];

  id v4 = [(BuddyPasscodeBaseViewController *)v14 scrollView];
  [v4 contentSize];
  double v6 = v5;
  id v7 = [(BuddyPasscodeBaseViewController *)v14 view];
  [v7 frame];
  double v9 = v8;

  if (v6 > v9)
  {
    id v10 = [(BuddyPasscodeBaseViewController *)v14 scrollView];
    [v10 flashScrollIndicators];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  double v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v5 viewWillDisappear:a3];
  id v3 = [(BuddyPasscodeBaseViewController *)v8 _currentPasscodeInputView];
  [v3 resignFirstResponder];
  objc_storeStrong(&v4, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeBaseViewController;
  [(BuddyPasscodeBaseViewController *)&v7 viewDidDisappear:a3];
  if ([(BuddyPasscodeBaseViewController *)v10 showingSpinner])
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
    [(BuddyPasscodeBaseViewController *)v10 setShowingSpinner:0];
  }
  id v3 = +[BFFPasscodeCreationManager sharedPasscodeManager];
  id v4 = [v3 passcodeState];

  if (v4 == (id)4)
  {
    [(BuddyPasscodeBaseViewController *)v10 clear];
  }
  else
  {
    id v5 = +[BFFPasscodeCreationManager sharedPasscodeManager];
    [v5 reset];
  }
  id v6 = [(BuddyPasscodeBaseViewController *)v10 _currentPasscodeInputView];
  [v6 resignFirstResponder];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v14 = a3;
  SEL v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v11.receiver = v13;
  v11.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v14.width, v14.height);
  id v4 = location[0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = sub_1001E31B4;
  SEL v9 = &unk_1002B3348;
  id v10 = v13;
  [v4 animateAlongsideTransition:&v5 completion:0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed
{
  id v5 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyPasscodeBaseViewController *)self _currentPasscodeInputView];
  location[0] = [v2 passcode];

  id v3 = [(BuddyPasscodeBaseViewController *)v5 passcodeManager];
  [(BFFPasscodeCreationManager *)v3 transitionToNextPasscodeStateForInput:location[0]];

  objc_storeStrong(location, 0);
}

- (void)_updateNextButton
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = [(BuddyPasscodeBaseViewController *)self _currentPasscodeInputView];
  id v2 = [location[0] passcode];
  [(BuddyPasscodeBaseViewController *)v4 _updateNextButtonForPasscode:v2];

  objc_storeStrong(location, 0);
}

- (void)_updateNextButtonForPasscode:(id)a3
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v7 = 0;
  unsigned __int8 v3 = 0;
  if ([location[0] length])
  {
    id v8 = +[MCProfileConnection sharedConnection];
    char v7 = 1;
    unsigned __int8 v3 = [v8 passcode:location[0] meetsCurrentConstraintsOutError:0];
  }
  if (v7) {

  }
  char v9 = v3 & 1;
  id v4 = [(BuddyPasscodeBaseViewController *)v11 navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:v9 & 1];

  id v6 = +[UIKeyboard activeKeyboard];
  [v6 setReturnKeyEnabled:v9 & 1];

  objc_storeStrong(location, 0);
}

- (BOOL)_allowSkip
{
  id v2 = [(BuddyPasscodeBaseViewController *)self passcodeCreationDelegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return +[BuddyPasscodeBaseViewController allowSkip];
  }
  id v4 = [(BuddyPasscodeBaseViewController *)self passcodeCreationDelegate];
  BOOL v6 = [(BuddyPasscodeBaseViewControllerDelegate *)v4 passcodeViewControllerAllowSkip:self] & 1;

  return v6;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyPasscodeBaseViewController *)v7 _updateNextButtonForPasscode:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [location[0] passcodeField];
  [v5 forceDisplayIfNeeded];

  uint64_t v15 = 0x3FB374BC6A7EF9DBLL;
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(0.076 * 1000000000.0));
  BOOL v6 = &_dispatch_main_q;
  char v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_1001E37E4;
  objc_super v11 = &unk_1002B12F0;
  BOOL v12 = v18;
  id v13 = v16;
  dispatch_after(v14, (dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)passcodeInputView
{
  dispatch_time_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v2 = [(BuddyPasscodeBaseViewController *)self passcodeManager];
  unsigned __int8 v3 = [(BFFPasscodeCreationManager *)v2 isSimplePasscodeEntry];

  if (v3)
  {
    id v4 = [BuddySimplePasscodeInputView alloc];
    id v5 = [(BuddyPasscodeBaseViewController *)v14 passcodeManager];
    id obj = -[BuddySimplePasscodeInputView initWithFrame:numberOfEntryFields:](v4, "initWithFrame:numberOfEntryFields:", [(BFFPasscodeCreationManager *)v5 simplePasscodeEntryLength], CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    [obj setLimitCharactersToNumbers:0];
    objc_storeStrong(location, obj);
    objc_storeStrong(&obj, 0);
  }
  else
  {
    BOOL v6 = [BuddyComplexPasscodeInputView alloc];
    char v7 = [(BuddyPasscodeBaseViewController *)v14 passcodeManager];
    int v8 = -[BuddyComplexPasscodeInputView initWithFrame:numericOnly:](v6, "initWithFrame:numericOnly:", (unint64_t)[(BFFPasscodeCreationManager *)v7 isNumericPasscodeEntry] & 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v9 = location[0];
    location[0] = v8;
  }
  id v10 = location[0];
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_passcodeInputViewForState:(unint64_t)a3 updateDetailText:(BOOL)a4
{
  id v22 = self;
  SEL v21 = a2;
  unint64_t v20 = a3;
  BOOL v19 = a4;
  id location = [(BuddyPasscodeBaseViewController *)self passcodeInputView];
  if (!v20 || v20 == 3)
  {
    id v4 = [(BuddyPasscodeBaseViewController *)v22 passcodeOptionAlertController];
    id v17 = [v4 actions];

    BOOL v5 = [v17 count] == (id)2;
    unsigned __int8 v6 = 0;
    if (v5) {
      unsigned __int8 v6 = [(BuddyPasscodeBaseViewController *)v22 _allowSkip];
    }
    v22->_footerButtonIsSkip = v6 & 1;
    if (v22->_footerButtonIsSkip)
    {
      char v7 = [(BuddyPasscodeBaseViewController *)v22 footerButton];
      int v8 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [(NSBundle *)v8 localizedStringForKey:@"DO_NOT_ADD_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
      [(UIButton *)v7 setTitle:v9 forState:0];
    }
    else if ((unint64_t)[v17 count] > 1)
    {
      id v10 = [(BuddyPasscodeBaseViewController *)v22 footerButton];
      objc_super v11 = +[NSBundle bundleForClass:objc_opt_class()];
      BOOL v12 = [(NSBundle *)v11 localizedStringForKey:@"PASSCODE_OPTIONS" value:&stru_1002B4E18 table:@"Localizable"];
      [(UIButton *)v10 setTitle:v12 forState:0];
    }
    objc_storeStrong(&v17, 0);
  }
  if (v19)
  {
    id v13 = [(BuddyPasscodeBaseViewController *)v22 headerView];
    id v14 = [(BuddyPasscodeBaseViewController *)v22 instructionsForState:v20];
    [v13 setDetailText:v14];
  }
  id v15 = location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4
{
  id v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  unint64_t v15 = a4;
  if (a3 && v16 != 3)
  {
    BOOL v5 = [(BuddyPasscodeBaseViewController *)v18 footerButton];
    [(UIButton *)v5 setHidden:1];
  }
  else
  {
    id v4 = [(BuddyPasscodeBaseViewController *)v18 footerButton];
    [(UIButton *)v4 setHidden:0];
  }
  id location = [(BuddyPasscodeBaseViewController *)v18 _passcodeInputViewForState:v16 updateDetailText:0];
  [(BuddyPasscodeBaseViewController *)v18 _prepareTransitionForPasscodeInput:location];
  id v13 = [(BuddyPasscodeBaseViewController *)v18 _onboardingPasscodeAnimationForBFF:v15];
  id v6 = [(BuddyPasscodeBaseViewController *)v18 instructionsForState:v16];
  char v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_1001E3DF0;
  objc_super v11 = &unk_1002B4B00;
  BOOL v12 = v18;
  [(BuddyPasscodeBaseViewController *)v18 animateDetailText:v6 animationType:v13 heightDifference:&v7];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)_prepareTransitionForPasscodeInput:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyPasscodeBaseViewController *)v5 transitionToPasscodeInput:location[0] delegate:v5];
  id v3 = [(BuddyPasscodeBaseViewController *)v5 contentView];
  [v3 layoutIfNeeded];

  objc_storeStrong(location, 0);
}

- (unint64_t)_onboardingPasscodeAnimationForBFF:(unint64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  if (a3 == 2) {
    return 1;
  }
  return 2;
}

- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  SEL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v15 = a4;
  unint64_t v14 = a5;
  id v7 = [(BuddyPasscodeBaseViewController *)v17 headerView];
  id v8 = [(BuddyPasscodeBaseViewController *)v17 titleForState:v14];
  [v7 setTitle:v8];

  if (v14)
  {
    switch(v14)
    {
      case 2uLL:
      case 3uLL:
        if (v14 == 2) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = 1;
        }
        -[BuddyPasscodeBaseViewController _animatedPasscodeViewTransitionToState:animation:](v17, "_animatedPasscodeViewTransitionToState:animation:", v14, v10, v10);
        break;
      case 1uLL:
        [(BuddyPasscodeBaseViewController *)v17 _showWeakWarningAlert];
        break;
      case 4uLL:
        objc_super v11 = v17;
        BOOL v12 = [(BuddyPasscodeBaseViewController *)v17 passcodeManager];
        id v13 = [(BFFPasscodeCreationManager *)v12 passcode];
        [(BuddyPasscodeBaseViewController *)v11 _finishedWithPasscode:v13];

        break;
    }
  }
  else
  {
    id v9 = [(BuddyPasscodeBaseViewController *)v17 _currentPasscodeInputView];
    [v9 setPasscode:&stru_1002B4E18];

    if (v15 != 1) {
      [(BuddyPasscodeBaseViewController *)v17 _animatedPasscodeViewTransitionToState:0 animation:3];
    }
  }
  [(BuddyPasscodeBaseViewController *)v17 _updateNextButton];
  objc_storeStrong(location, 0);
}

- (void)passcodeManagerWillSetPasscode:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v7 identifier:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
  [(BuddyPasscodeBaseViewController *)v7 setShowingSpinner:1];
  id v3 = [(BuddyPasscodeBaseViewController *)v7 passcodeCreationDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(BuddyPasscodeBaseViewController *)v7 passcodeCreationDelegate];
    [(BuddyPasscodeBaseViewControllerDelegate *)v5 passcodeViewControllerWillSetPasscode:v7];
  }
  objc_storeStrong(location, 0);
}

- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5
{
  unint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  if ([(BuddyPasscodeBaseViewController *)v15 showingSpinner])
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"SETUP_PASSCODE_VIEW_CONTROLLER"];
    [(BuddyPasscodeBaseViewController *)v15 setShowingSpinner:0];
  }
  if (v13)
  {
    id v7 = [(BuddyPasscodeBaseViewController *)v15 passcodeCreationDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(BuddyPasscodeBaseViewController *)v15 passcodeCreationDelegate];
      uint64_t v10 = v15;
      id v11 = [location[0] passcode];
      [(BuddyPasscodeBaseViewControllerDelegate *)v9 passcodeViewController:v10 didSetPasscode:v11];
    }
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)tappedFooterButton:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_footerButtonIsSkip) {
    [(BuddyPasscodeBaseViewController *)v4 _showSkipPasscodeAlert];
  }
  else {
    [(BuddyPasscodeBaseViewController *)v4 _showPasscodeOptionsSheet];
  }
  objc_storeStrong(location, 0);
}

- (void)clear
{
  id v2 = [(BuddyPasscodeBaseViewController *)self _currentPasscodeInputView];
  [v2 disable];

  id v3 = [(BuddyPasscodeBaseViewController *)self _currentPasscodeInputView];
  [v3 setDelegate:0];

  id v4 = [(BuddyPasscodeBaseViewController *)self _currentPasscodeInputView];
  [v4 removeFromSuperview];

  BOOL v5 = [(BuddyPasscodeBaseViewController *)self passcodeManager];
  [(BFFPasscodeCreationManager *)v5 setDelegate:0];

  [(BuddyPasscodeBaseViewController *)self setPasscodeManager:0];
}

- (void)_finishedWithPasscode:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyPasscodeBaseViewController *)v5 passcodeCreationDelegate];
  [(BuddyPasscodeBaseViewControllerDelegate *)v3 passcodeViewController:v5 didFinishWithPasscodeCreation:location[0]];

  objc_storeStrong(location, 0);
}

- (id)titleForState:(unint64_t)a3
{
  SEL v21 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  id v3 = [(BuddyPasscodeBaseViewController *)self flowItemDispositionProvider];
  char v18 = 0;
  char v16 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    BOOL v19 = [(BuddyPasscodeBaseViewController *)v21 flowItemDispositionProvider];
    char v18 = 1;
    BOOL v4 = 0;
    if ((id)[(BuddyFlowItemDispositionProvider *)v19 dispositions] == (id)8)
    {
      SEL v17 = [(BuddyPasscodeBaseViewController *)v21 userFirstName];
      char v16 = 1;
      BOOL v4 = v17 != 0;
    }
  }
  if (v16) {

  }
  if (v18) {
  BOOL v5 = +[NSBundle bundleForClass:objc_opt_class()];
  }
  if (v4)
  {
    id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CREATE_PASSCODE_FOR_CHILD_WITH_NAME"];
    id v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Localizable"];
    char v8 = [(BuddyPasscodeBaseViewController *)v21 userFirstName];
    id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);
    id v10 = location[0];
    location[0] = v9;
  }
  else
  {
    id v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CREATE_PASSCODE"];
    id v12 = [(NSBundle *)v5 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"Localizable"];
    id v13 = location[0];
    location[0] = v12;
  }
  id v14 = location[0];
  objc_storeStrong(location, 0);
  return v14;
}

- (id)instructionsForState:(unint64_t)a3
{
  id v11 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  switch(a3)
  {
    case 0uLL:
      id v3 = [(BuddyPasscodeBaseViewController *)v11 passcodeManager];
      id v4 = [(BFFPasscodeCreationManager *)v3 constraintInstructions];
      id v5 = location[0];
      location[0] = v4;

      if (location[0] && [location[0] length]) {
        id v12 = (__CFString *)location[0];
      }
      else {
        id v12 = (__CFString *)[(BuddyPasscodeBaseViewController *)v11 _firstEntryInstructions];
      }
      break;
    case 1uLL:
    case 4uLL:
      id v12 = &stru_1002B4E18;
      break;
    case 2uLL:
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v12 = [(NSBundle *)v6 localizedStringForKey:@"RE_ENTER_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 3uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v12 = [(NSBundle *)v7 localizedStringForKey:@"PASSCODES_FAILED_TO_MATCH" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    default:
      break;
  }
  objc_storeStrong(location, 0);
  char v8 = v12;

  return v8;
}

- (id)_firstEntryInstructions
{
  id v22 = self;
  v21[1] = (id)a2;
  v21[0] = 0;
  id v2 = [(BuddyPasscodeBaseViewController *)self passcodeCreationDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [(BuddyPasscodeBaseViewController *)v22 passcodeCreationDelegate];
    id v5 = [(BuddyPasscodeBaseViewControllerDelegate *)v4 passcodeViewControllerCustomFirstEntryInstructions:v22];
    id v6 = v21[0];
    v21[0] = v5;
  }
  if (!v21[0])
  {
    id location = @"PASSCODE_DESCRIPTION";
    id v7 = [(BuddyPasscodeBaseViewController *)v22 flowItemDispositionProvider];
    char v18 = 0;
    BOOL v8 = 0;
    if (v7)
    {
      BOOL v19 = [(BuddyPasscodeBaseViewController *)v22 flowItemDispositionProvider];
      char v18 = 1;
      BOOL v8 = (id)[(BuddyFlowItemDispositionProvider *)v19 dispositions] == (id)8;
    }
    if (v18) {

    }
    if (v8)
    {
      id v9 = [(BuddyPasscodeBaseViewController *)v22 flowItemDispositionProvider];
      id v10 = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:location disposition:[(BuddyFlowItemDispositionProvider *)v9 dispositions]];
      id v11 = location;
      id location = v10;
    }
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location];
    id v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"Localizable"];
    id v15 = v21[0];
    v21[0] = v14;

    objc_storeStrong(&location, 0);
  }
  id v16 = v21[0];
  objc_storeStrong(v21, 0);
  return v16;
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  char v3 = [(BuddyPasscodeBaseViewController *)self passcodeManager];
  unsigned __int8 v4 = [(BFFPasscodeCreationManager *)v3 isSimplePasscodeEntry];

  if (v4)
  {
    id v5 = [(BuddyPasscodeBaseViewController *)v13 navigationItem];
    [v5 setRightBarButtonItem:0 animated:v11];
  }
  else
  {
    id v6 = objc_alloc((Class)UIBarButtonItem);
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v8 = [(NSBundle *)v7 localizedStringForKey:@"NEXT" value:&stru_1002B4E18 table:@"Localizable"];
    id v10 = [v6 initWithTitle:v8 style:2 target:v13 action:"nextButtonPressed"];

    id v9 = [(BuddyPasscodeBaseViewController *)v13 navigationItem];
    [v9 setRightBarButtonItem:v10 animated:v11];

    [(BuddyPasscodeBaseViewController *)v13 _updateNextButton];
    objc_storeStrong(&v10, 0);
  }
}

- (void)_showWeakWarningAlert
{
  id v27 = self;
  v26[1] = (id)a2;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WEAK_PASSCODE_DETAILS"];
  v26[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  unsigned __int8 v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [(NSBundle *)v4 localizedStringForKey:@"WEAK_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
  id location = +[UIAlertController alertControllerWithTitle:v5 message:v26[0] preferredStyle:1];

  id v6 = location;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v8 = [(NSBundle *)v7 localizedStringForKey:@"CHANGE_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
  BOOL v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = sub_1001E5270;
  char v23 = &unk_1002B1040;
  id v24 = v27;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&v19];
  [v6 addAction:v9];

  id v10 = location;
  BOOL v11 = +[NSBundle bundleForClass:objc_opt_class()];
  SEL v12 = [(NSBundle *)v11 localizedStringForKey:@"USE_WEAK_PASSCODE_ANYWAY" value:&stru_1002B4E18 table:@"Localizable"];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1001E52E0;
  SEL v17 = &unk_1002B1040;
  char v18 = v27;
  id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v14];
  [v10 addAction:v13, v14, v15, v16, v17];

  [(BuddyPasscodeBaseViewController *)v27 presentViewController:location animated:1 completion:0];
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v26, 0);
}

- (void)_showSkipPasscodeAlert
{
  int v21 = self;
  v20[1] = (id)a2;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SKIP_PASSCODE_DESCRIPTION"];
  v20[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  unsigned __int8 v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [(NSBundle *)v4 localizedStringForKey:@"SKIP_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
  id location = +[UIAlertController alertControllerWithTitle:v5 message:v20[0] preferredStyle:1];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [(NSBundle *)v6 localizedStringForKey:@"SKIP_OPTION_CREATE_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
  BOOL v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];
  [location addAction:v8];

  id v9 = location;
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v11 = [(NSBundle *)v10 localizedStringForKey:@"SKIP_OPTION_DONT_USE_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_1001E573C;
  SEL v17 = &unk_1002B1040;
  char v18 = v21;
  SEL v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&v13];
  [v9 addAction:v12];

  [(BuddyPasscodeBaseViewController *)v21 presentViewController:location animated:1 completion:0];
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v20, 0);
}

- (void)_commitPasscodeEntryTypeChange
{
  -[BuddyPasscodeBaseViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 1, a2);
  id v2 = [(BuddyPasscodeBaseViewController *)self passcodeManager];
  [(BFFPasscodeCreationManager *)v2 setPasscodeState:0];
}

- (id)passcodeOptionAlertController
{
  v75 = self;
  SEL v74 = a2;
  int v73 = 0;
  id v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v73];

  unsigned int v72 = v3;
  id location = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  unsigned __int8 v4 = [(BuddyPasscodeBaseViewController *)v75 passcodeManager];
  LOBYTE(v3) = [(BFFPasscodeCreationManager *)v4 isNumericPasscodeEntry];

  if (v3)
  {
    id v5 = location;
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [(NSBundle *)v6 localizedStringForKey:@"CUSTOM_ALPHANUMERIC_CODE" value:&stru_1002B4E18 table:@"Localizable"];
    v65 = _NSConcreteStackBlock;
    int v66 = -1073741824;
    int v67 = 0;
    v68 = sub_1001E6118;
    v69 = &unk_1002B1040;
    v70 = v75;
    BOOL v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:&v65];
    [v5 addAction:v8];

    objc_storeStrong((id *)&v70, 0);
  }
  char v63 = 0;
  char v61 = 0;
  if (!v72 || (BOOL v9 = 0, v72 == 1))
  {
    v64 = [(BuddyPasscodeBaseViewController *)v75 passcodeManager];
    char v63 = 1;
    BOOL v9 = 1;
    if ([(BFFPasscodeCreationManager *)v64 isNumericPasscodeEntry])
    {
      v62 = [(BuddyPasscodeBaseViewController *)v75 passcodeManager];
      char v61 = 1;
      BOOL v9 = (uint64_t)[(BFFPasscodeCreationManager *)v62 simplePasscodeEntryLength] > 0;
    }
  }
  if (v61) {

  }
  if (v63) {
  if (v9)
  }
  {
    id v10 = location;
    BOOL v11 = +[NSBundle bundleForClass:objc_opt_class()];
    SEL v12 = [(NSBundle *)v11 localizedStringForKey:@"CUSTOM_NUMERIC_CODE" value:&stru_1002B4E18 table:@"Localizable"];
    v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_1001E61B8;
    v59 = &unk_1002B1040;
    v60 = v75;
    id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v55];
    [v10 addAction:v13];

    objc_storeStrong((id *)&v60, 0);
  }
  if (!v72)
  {
    int v14 = [(BuddyPasscodeBaseViewController *)v75 passcodeManager];
    id v15 = [(BFFPasscodeCreationManager *)v14 simplePasscodeEntryLength];

    if (v15 != (id)6)
    {
      id v16 = location;
      SEL v17 = +[NSBundle bundleForClass:objc_opt_class()];
      char v18 = [(NSBundle *)v17 localizedStringForKey:@"6_DIGIT_CODE" value:&stru_1002B4E18 table:@"Localizable"];
      v49 = _NSConcreteStackBlock;
      int v50 = -1073741824;
      int v51 = 0;
      v52 = sub_1001E625C;
      v53 = &unk_1002B1040;
      v54 = v75;
      BOOL v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v49];
      [v16 addAction:v19];

      objc_storeStrong((id *)&v54, 0);
    }
    char v47 = 0;
    BOOL v20 = 0;
    if (!v73)
    {
      id v48 = [(BuddyPasscodeBaseViewController *)v75 passcodeManager];
      char v47 = 1;
      BOOL v20 = [v48 simplePasscodeEntryLength] != (id)4;
    }
    if (v47) {

    }
    if (v20)
    {
      id v21 = location;
      id v22 = +[NSBundle bundleForClass:objc_opt_class()];
      char v23 = [(NSBundle *)v22 localizedStringForKey:@"4_DIGIT_CODE" value:&stru_1002B4E18 table:@"Localizable"];
      id v41 = _NSConcreteStackBlock;
      int v42 = -1073741824;
      int v43 = 0;
      SEL v44 = sub_1001E6300;
      int v45 = &unk_1002B1040;
      id v46 = v75;
      id v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:&v41];
      [v21 addAction:v24];

      objc_storeStrong((id *)&v46, 0);
    }
  }
  if ([(BuddyPasscodeBaseViewController *)v75 _allowSkip])
  {
    id v25 = location;
    id v26 = +[NSBundle bundleForClass:objc_opt_class()];
    id v27 = [(NSBundle *)v26 localizedStringForKey:@"DO_NOT_ADD_PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];
    v35 = _NSConcreteStackBlock;
    int v36 = -1073741824;
    int v37 = 0;
    double v38 = sub_1001E63A4;
    double v39 = &unk_1002B1040;
    double v40 = v75;
    id v28 = +[UIAlertAction actionWithTitle:v27 style:0 handler:&v35];
    [v25 addAction:v28];

    objc_storeStrong((id *)&v40, 0);
  }
  id v29 = location;
  id v30 = +[NSBundle bundleForClass:objc_opt_class()];
  id v31 = [(NSBundle *)v30 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  id v32 = +[UIAlertAction actionWithTitle:v31 style:1 handler:0];
  [v29 addAction:v32];

  id v33 = location;
  objc_storeStrong(&location, 0);
  return v33;
}

- (void)_showPasscodeOptionsSheet
{
  BOOL v9 = self;
  v8[1] = (id)a2;
  v8[0] = [(BuddyPasscodeBaseViewController *)self passcodeOptionAlertController];
  if (BFFIsiPad())
  {
    [v8[0] setModalPresentationStyle:7];
    id v7 = [v8[0] popoverPresentationController];
    id location = [(BuddyPasscodeBaseViewController *)v9 footerButton];
    [v7 setPermittedArrowDirections:2];
    [v7 setSourceView:location];
    [location bounds];
    [v7 setSourceRect:v2, v3, v4, v5];
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v7, 0);
  }
  [(BuddyPasscodeBaseViewController *)v9 presentViewController:v8[0] animated:1 completion:0];
  objc_storeStrong(v8, 0);
}

- (id)_currentPasscodeInputView
{
  id v2 = [(BuddyPasscodeBaseViewController *)self contentView];
  id v3 = [v2 subviews];
  double v4 = +[NSPredicate predicateWithBlock:&stru_1002B4B40];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  id v6 = [v5 firstObject];

  return v6;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void)setUserFirstName:(id)a3
{
}

- (BOOL)includeHeaderAnimation
{
  return self->_includeHeaderAnimation;
}

- (void)setIncludeHeaderAnimation:(BOOL)a3
{
  self->_includeHeaderAnimation = a3;
}

- (BuddyPasscodeBaseViewControllerDelegate)passcodeCreationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeCreationDelegate);

  return (BuddyPasscodeBaseViewControllerDelegate *)WeakRetained;
}

- (void)setPasscodeCreationDelegate:(id)a3
{
}

- (BFFPasscodeCreationManager)passcodeManager
{
  return self->_passcodeManager;
}

- (void)setPasscodeManager:(id)a3
{
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)passcodeInputViewBottomConstraint
{
  return self->_passcodeInputViewBottomConstraint;
}

- (void)setPasscodeInputViewBottomConstraint:(id)a3
{
}

- (BOOL)footerButtonIsSkip
{
  return self->_footerButtonIsSkip;
}

- (void)setFooterButtonIsSkip:(BOOL)a3
{
  self->_footerButtonIsSkip = a3;
}

- (BOOL)showingSpinner
{
  return self->_showingSpinner;
}

- (void)setShowingSpinner:(BOOL)a3
{
  self->_showingSpinner = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end