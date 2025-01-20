@interface ClarityUIOnboardingSettingsWrapperController
- (BOOL)isNextButtonEnabled;
- (ClarityUIOnboardingSettingsWrapperController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 controller:(id)a6;
- (OBBoldTrayButton)nextButton;
- (PSListController)controller;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addButtonTray;
- (void)cancelButtonTapped:(id)a3;
- (void)didUpdateIsContinueButtonEnabledForController:(id)a3;
- (void)displaySetupController:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)setController:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setNextButtonEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation ClarityUIOnboardingSettingsWrapperController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

- (ClarityUIOnboardingSettingsWrapperController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 controller:(id)a6
{
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ClarityUIOnboardingSettingsWrapperController;
  v12 = [(ClarityUIOnboardingSettingsWrapperController *)&v20 initWithTitle:a3 detailText:a4 icon:a5 adoptTableViewScrollView:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a6);
    v14 = +[OBBoldTrayButton boldButton];
    v15 = settingsLocString(@"CONTINUE", @"ClarityUISettings");
    [v14 setTitle:v15 forState:0];

    [v14 setAccessibilityIdentifier:@"APP_ONBOARDING_CONTINUE"];
    [v14 addTarget:v13 action:"nextButtonTapped:" forControlEvents:0x2000];
    if ([v11 conformsToProtocol:&OBJC_PROTOCOL___AXOnboardingContinueButtonEnabling])
    {
      id v16 = v11;
      id v17 = [v16 isContinueButtonEnabled];
      [v16 setContinueButtonEnablingDelegate:v13];
    }
    else
    {
      id v17 = &dword_0 + 1;
    }
    [v14 setEnabled:v17];
    nextButton = v13->_nextButton;
    v13->_nextButton = (OBBoldTrayButton *)v14;
  }
  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ClarityUIOnboardingSettingsWrapperController;
  [(ClarityUIOnboardingSettingsWrapperController *)&v5 viewDidLoad];
  id v3 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonTapped:"];
  v4 = [(ClarityUIOnboardingSettingsWrapperController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  [(ClarityUIOnboardingSettingsWrapperController *)self displaySetupController:self->_controller];
}

- (void)displaySetupController:(id)a3
{
  id v4 = a3;
  [(ClarityUIOnboardingSettingsWrapperController *)self addChildViewController:v4];
  [v4 loadViewIfNeeded];
  objc_super v5 = [(ClarityUIOnboardingSettingsWrapperController *)self contentView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v4 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(ClarityUIOnboardingSettingsWrapperController *)self contentView];
  id v16 = [v4 view];
  [v15 addSubview:v16];

  id v17 = [v4 table];
  [(ClarityUIOnboardingSettingsWrapperController *)self setTableView:v17];

  [v4 didMoveToParentViewController:self];
  v18 = [(ClarityUIOnboardingSettingsWrapperController *)self tableView];
  [v18 setBackgroundView:0];

  v19 = [(ClarityUIOnboardingSettingsWrapperController *)self tableView];
  objc_super v20 = +[UIColor systemBackgroundColor];
  [v19 setBackgroundColor:v20];

  [(ClarityUIOnboardingSettingsWrapperController *)self _addButtonTray];
}

- (void)_addButtonTray
{
  id v3 = [(ClarityUIOnboardingSettingsWrapperController *)self buttonTray];
  [v3 addButton:self->_nextButton];
}

- (void)setNextButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ClarityUIOnboardingSettingsWrapperController *)self isNextButtonEnabled] != a3)
  {
    nextButton = self->_nextButton;
    [(OBBoldTrayButton *)nextButton setEnabled:v3];
  }
}

- (BOOL)isNextButtonEnabled
{
  return [(OBBoldTrayButton *)self->_nextButton isEnabled];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  controller = self->_controller;
  id v6 = a4;
  id v7 = a3;
  [(PSListController *)controller tableView:v7 didSelectRowAtIndexPath:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[UIColor secondarySystemBackgroundColor];
  [v5 setBackgroundColor:v6];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ClarityUIOnboardingSettingsWrapperController *)self controller];
  double v8 = [v7 tableView:v6 viewForHeaderInSection:a4];

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ClarityUIOnboardingSettingsWrapperController *)self controller];
  [v7 tableView:v6 heightForHeaderInSection:a4];
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ClarityUIOnboardingSettingsWrapperController *)self controller];
  [v7 tableView:v6 estimatedHeightForHeaderInSection:a4];
  double v9 = v8;

  return v9;
}

- (void)didUpdateIsContinueButtonEnabledForController:(id)a3
{
  id v4 = [a3 isContinueButtonEnabled];

  [(ClarityUIOnboardingSettingsWrapperController *)self setNextButtonEnabled:v4];
}

- (PSListController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (OBBoldTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)nextButtonTapped:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)cancelButtonTapped:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end