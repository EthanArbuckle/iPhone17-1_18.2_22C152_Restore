@interface MFNanoBridgeSettingsMailboxPicker
- (MFNanoBridgeSettingsMailboxPicker)initWithNibName:(id)a3 bundle:(id)a4;
- (void)mailboxPickerController:(id)a3 didChangeSelectedMailboxes:(id)a4;
- (void)viewDidLoad;
- (void)willBecomeActive;
@end

@implementation MFNanoBridgeSettingsMailboxPicker

- (MFNanoBridgeSettingsMailboxPicker)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFNanoBridgeSettingsMailboxPicker;
  v8 = [(MFNanoBridgeSettingsMailboxPicker *)&v15 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = objc_alloc_init(MFNanoBridgeSettingsMailboxPickerController);
    nanoMailboxPickerController = v8->_nanoMailboxPickerController;
    v8->_nanoMailboxPickerController = v9;

    [(MFNanoBridgeSettingsMailboxPickerController *)v8->_nanoMailboxPickerController setDelegate:v8];
    [(MFNanoBridgeSettingsMailboxPicker *)v8 addChildViewController:v8->_nanoMailboxPickerController];
    [(MFNanoBridgeSettingsMailboxPickerController *)v8->_nanoMailboxPickerController didMoveToParentViewController:v8];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"INCLUDE_MAIL_SCREEN_NAVIGATION_TITLE" value:&stru_2CC10 table:@"Main"];
    v13 = [(MFNanoBridgeSettingsMailboxPicker *)v8 navigationItem];
    [v13 setTitle:v12];
  }
  return v8;
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)MFNanoBridgeSettingsMailboxPicker;
  [(MFNanoBridgeSettingsMailboxPicker *)&v3 willBecomeActive];
  [(MFNanoBridgeSettingsMailboxPickerController *)self->_nanoMailboxPickerController refreshData];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MFNanoBridgeSettingsMailboxPicker;
  [(MFNanoBridgeSettingsMailboxPicker *)&v16 viewDidLoad];
  objc_super v3 = [(MFNanoBridgeSettingsMailboxPicker *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MFNanoBridgeSettingsMailboxPickerController *)self->_nanoMailboxPickerController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(MFNanoBridgeSettingsMailboxPickerController *)self->_nanoMailboxPickerController tableView];
  [v13 setUsesVariableMargins:1];

  v14 = [(MFNanoBridgeSettingsMailboxPicker *)self view];
  objc_super v15 = [(MFNanoBridgeSettingsMailboxPickerController *)self->_nanoMailboxPickerController tableView];
  [v14 addSubview:v15];
}

- (void)mailboxPickerController:(id)a3 didChangeSelectedMailboxes:(id)a4
{
  id v8 = a4;
  double v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setIncludeMailMailboxes:v8];

  double v6 = [(MFNanoBridgeSettingsMailboxPicker *)self parentController];
  double v7 = [(MFNanoBridgeSettingsMailboxPicker *)self specifier];
  [v6 reloadSpecifier:v7];
}

- (void).cxx_destruct
{
}

@end