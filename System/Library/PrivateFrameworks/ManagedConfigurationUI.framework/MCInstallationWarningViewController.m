@interface MCInstallationWarningViewController
- (BOOL)isMDMInstall;
- (MCInstallationWarningDelegate)warningDelegate;
- (MCInstallationWarningViewController)initWithStyle:(int64_t)a3;
- (NSArray)warnings;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelInstallProfile;
- (void)_installProfile;
- (void)_setup;
- (void)setIsMDMInstall:(BOOL)a3;
- (void)setWarningDelegate:(id)a3;
- (void)setWarnings:(id)a3;
@end

@implementation MCInstallationWarningViewController

- (MCInstallationWarningViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCInstallationWarningViewController;
  v3 = [(MCUITableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(MCInstallationWarningViewController *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v14.receiver = self;
  v14.super_class = (Class)MCInstallationWarningViewController;
  [(MCUITableViewController *)&v14 updateExtendedLayoutIncludesOpaqueBars];
  v3 = [(MCInstallationWarningViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[MCInstallationWarningCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  objc_super v6 = MCUILocalizedString(@"INSTALL_WARNING_TITLE");
  v7 = [(MCInstallationWarningViewController *)self navigationItem];
  [v7 setTitle:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelInstallProfile];
  v9 = [(MCInstallationWarningViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
  v11 = MCUILocalizedString(@"INSTALL");
  v12 = (void *)[v10 initWithTitle:v11 style:2 target:self action:sel__confirmInstallProfileIfNeeded];
  v13 = [(MCInstallationWarningViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];
}

- (void)_cancelInstallProfile
{
  id v3 = [(MCInstallationWarningViewController *)self warningDelegate];
  [v3 installationWarningViewController:self finishedWithUserContinueResponse:0];
}

- (void)_installProfile
{
  id v3 = [(MCInstallationWarningViewController *)self warningDelegate];
  [v3 installationWarningViewController:self finishedWithUserContinueResponse:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MCInstallationWarningViewController *)self warnings];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(MCInstallationWarningViewController *)self warnings];
  int64_t v6 = [v5 count] > (unint64_t)a4;

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  int64_t v4 = [(MCInstallationWarningViewController *)self tableView];
  [v4 rowHeight];
  double v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v6 = [(MCInstallationWarningViewController *)self warnings];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    id v10 = 0;
  }
  else
  {
    v8 = [(MCInstallationWarningViewController *)self warnings];
    v9 = [v8 objectAtIndex:a4];

    id v10 = [v9 localizedTitle];
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MCInstallationWarningCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  id v10 = [(MCInstallationWarningViewController *)self warnings];
  uint64_t v11 = [v6 section];

  v12 = [v10 objectAtIndex:v11];

  v13 = [v12 localizedBody];
  [v9 setWarningLabelText:v13];

  return v9;
}

- (BOOL)isMDMInstall
{
  return self->_isMDMInstall;
}

- (void)setIsMDMInstall:(BOOL)a3
{
  self->_isMDMInstall = a3;
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (void)setWarnings:(id)a3
{
}

- (MCInstallationWarningDelegate)warningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_warningDelegate);
  return (MCInstallationWarningDelegate *)WeakRetained;
}

- (void)setWarningDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_warningDelegate);
  objc_storeStrong((id *)&self->_warnings, 0);
}

@end