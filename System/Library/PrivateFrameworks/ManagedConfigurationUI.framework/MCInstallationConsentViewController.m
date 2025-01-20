@interface MCInstallationConsentViewController
- (BOOL)showInstall;
- (MCInstallationConsentDelegate)consentDelegate;
- (MCInstallationConsentViewController)initWithStyle:(int64_t)a3;
- (MCProfile)profile;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelInstallProfile;
- (void)_installProfile;
- (void)_setup;
- (void)setConsentDelegate:(id)a3;
- (void)setProfile:(id)a3;
- (void)setShowInstall:(BOOL)a3;
@end

@implementation MCInstallationConsentViewController

- (MCInstallationConsentViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCInstallationConsentViewController;
  v3 = [(MCUITableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(MCInstallationConsentViewController *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v14.receiver = self;
  v14.super_class = (Class)MCInstallationConsentViewController;
  [(MCUITableViewController *)&v14 updateExtendedLayoutIncludesOpaqueBars];
  v3 = [(MCInstallationConsentViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[MCInstallationWarningCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  if (self->_showInstall) {
    objc_super v6 = @"INSTALL";
  }
  else {
    objc_super v6 = @"NEXT";
  }
  v7 = MCUILocalizedString(v6);
  v8 = MCUILocalizedString(@"INSTALL_CONSENT_TITLE");
  v9 = [(MCInstallationConsentViewController *)self navigationItem];
  [v9 setTitle:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelInstallProfile];
  v11 = [(MCInstallationConsentViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:v7 style:2 target:self action:sel__installProfile];
  v13 = [(MCInstallationConsentViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];
}

- (void)_cancelInstallProfile
{
  id v3 = [(MCInstallationConsentViewController *)self consentDelegate];
  [v3 installationConsentViewController:self finishedWithUserContinueResponse:0];
}

- (void)_installProfile
{
  id v3 = [(MCInstallationConsentViewController *)self consentDelegate];
  [v3 installationConsentViewController:self finishedWithUserContinueResponse:1];
}

- (void)setProfile:(id)a3
{
  if (self->_profile != a3)
  {
    objc_storeStrong((id *)&self->_profile, a3);
    v5 = [(MCInstallationConsentViewController *)self tableView];
    [v5 reloadData];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setShowInstall:(BOOL)a3
{
  if (self->_showInstall != a3)
  {
    self->_showInstall = a3;
    if (a3) {
      uint64_t v4 = @"INSTALL";
    }
    else {
      uint64_t v4 = @"NEXT";
    }
    MCUILocalizedString(v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:v7 style:2 target:self action:sel__installProfile];
    objc_super v6 = [(MCInstallationConsentViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(MCInstallationConsentViewController *)self tableView];
  [v4 rowHeight];
  double v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v6 = [(MCInstallationConsentViewController *)self profile];
  id v7 = [v6 localizedConsentText];

  v8 = 0;
  if (!a4 && v7)
  {
    v9 = [(MCInstallationConsentViewController *)self profile];
    v10 = [v9 organization];
    v11 = [(MCInstallationConsentViewController *)self profile];
    v12 = v11;
    if (v10) {
      [v11 organization];
    }
    else {
    v13 = [v11 friendlyName];
    }

    objc_super v14 = NSString;
    v15 = MCUILocalizedString(@"INSTALL_CONSENT_MESSAGE_FROM_%@");
    v8 = objc_msgSend(v14, "stringWithFormat:", v15, v13);
  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MCInstallationWarningCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = [(MCInstallationConsentViewController *)self profile];
  v11 = [v10 localizedConsentText];
  [v9 setWarningLabelText:v11];

  return v9;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (MCInstallationConsentDelegate)consentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consentDelegate);
  return (MCInstallationConsentDelegate *)WeakRetained;
}

- (void)setConsentDelegate:(id)a3
{
}

- (BOOL)showInstall
{
  return self->_showInstall;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consentDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end