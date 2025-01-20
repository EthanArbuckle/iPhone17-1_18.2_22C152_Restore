@interface VOTQuickSettingsViewController
- (AXQuickSettingsData)data;
- (BOOL)_canShowWhileLocked;
- (VOTQuickSettingsListViewController)settingsListViewController;
- (VOTQuickSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VOTQuickSettingsViewControllerDelegate)delegate;
- (void)_dismissQuickSettings;
- (void)_handleDoneButtonTap:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingsListViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VOTQuickSettingsViewController

- (VOTQuickSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VOTQuickSettingsViewController;
  v4 = [(VOTQuickSettingsViewController *)&v10 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = sub_10000CFD0(@"VoiceOverQuickSettings.title");
    [(VOTQuickSettingsViewController *)v4 setTitle:v5];

    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v4 action:"_handleDoneButtonTap:"];
    id v11 = v6;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    v8 = [(VOTQuickSettingsViewController *)v4 navigationItem];
    [v8 setRightBarButtonItems:v7];
  }
  return v4;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VOTQuickSettingsViewController;
  [(VOTQuickSettingsViewController *)&v10 viewDidLoad];
  v3 = objc_alloc_init(VOTQuickSettingsListViewController);
  settingsListViewController = self->_settingsListViewController;
  self->_settingsListViewController = v3;

  v5 = [(VOTQuickSettingsViewController *)self data];
  [(VOTQuickSettingsListViewController *)self->_settingsListViewController setData:v5];

  id v6 = [(VOTQuickSettingsViewController *)self view];
  v7 = [(VOTQuickSettingsListViewController *)self->_settingsListViewController view];
  [(VOTQuickSettingsViewController *)self addChildViewController:self->_settingsListViewController];
  [v6 addSubview:v7];
  [v6 bounds];
  [v7 setFrame:];
  [v7 setAutoresizingMask:18];
  [(VOTQuickSettingsListViewController *)self->_settingsListViewController didMoveToParentViewController:self];
  v8 = [(VOTQuickSettingsListViewController *)self->_settingsListViewController searchController];
  v9 = [(VOTQuickSettingsViewController *)self navigationItem];
  [v9 setSearchController:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsViewController;
  [(VOTQuickSettingsViewController *)&v5 viewWillAppear:a3];
  v4 = [(VOTQuickSettingsViewController *)self navigationItem];
  [v4 setHidesSearchBarWhenScrolling:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VOTQuickSettingsViewController;
  [(VOTQuickSettingsViewController *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
  objc_super v5 = [(VOTQuickSettingsViewController *)self navigationController];
  UIAccessibilityPostNotification(v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_handleDoneButtonTap:(id)a3
{
}

- (void)_dismissQuickSettings
{
  v3 = [(VOTQuickSettingsViewController *)self delegate];
  [v3 quickSettingsViewControllerWasDismissed:self];

  id v4 = [(VOTQuickSettingsViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:0 completion:0];
}

- (VOTQuickSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTQuickSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXQuickSettingsData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (VOTQuickSettingsListViewController)settingsListViewController
{
  return self->_settingsListViewController;
}

- (void)setSettingsListViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsListViewController, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end