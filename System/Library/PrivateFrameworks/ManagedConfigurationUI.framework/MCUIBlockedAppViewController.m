@interface MCUIBlockedAppViewController
- (BOOL)overridden;
- (BOOL)reenabled;
- (MCUIBlockedAppViewController)init;
- (id)_reenableButtonSpecifier;
- (id)specifiers;
- (void)_askForReenableConfirmation;
- (void)dealloc;
- (void)setOverride:(id)a3;
- (void)setReenabled:(BOOL)a3;
@end

@implementation MCUIBlockedAppViewController

- (MCUIBlockedAppViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MCUIBlockedAppViewController;
  v2 = [(MCUIBlockedAppViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__blockedAppsUpdated name:*MEMORY[0x1E4F73EC0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F73EC0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MCUIBlockedAppViewController;
  [(MCUIBlockedAppViewController *)&v4 dealloc];
}

void __51__MCUIBlockedAppViewController__blockedAppsUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (BOOL)overridden
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92FA0];
  objc_super v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) propertyForKey:@"MCUIBlockedAppCdHash"];
  if (v4)
  {
    objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) propertyForKey:@"MCUIBlockedAppHashType"];
    [v5 intValue];

    char v6 = MISBlacklistOverriddenByUser();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setOverride:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (int)*MEMORY[0x1E4F92FA0];
  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:@"MCUIBlockedAppCdHash"];
  if (v5)
  {
    char v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:@"MCUIBlockedAppHashType"];
    [v6 intValue];

    [v7 BOOLValue];
    MISBlacklistSetOverride();
  }
}

- (void)_askForReenableConfirmation
{
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) propertyForKey:@"MCUIBlockedAppName"];
  uint64_t v4 = NSString;
  objc_super v5 = MCUILocalizedString(@"REENABLE_WARNING_TITLE_%@");
  char v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

  id v7 = (void *)MEMORY[0x1E4F42728];
  v8 = MCUILocalizedString(@"REENABLE_WARNING_TEXT");
  v9 = [v7 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v10 = MCUILocalizedString(@"REENABLE_WARNING_CANCEL");
  [v9 MCUIAddCancelActionWithTitle:v10];

  objc_initWeak(&location, self);
  v11 = MCUILocalizedString(@"REENABLE_WARNING_OK");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MCUIBlockedAppViewController__askForReenableConfirmation__block_invoke;
  v12[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v13, &location);
  [v9 MCUIAddActionWithTitle:v11 style:2 completion:v12];

  [v9 MCUIShowFromController:self];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __59__MCUIBlockedAppViewController__askForReenableConfirmation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setOverride:MEMORY[0x1E4F1CC38]];

  id v3 = objc_loadWeakRetained(v1);
  [v3 reloadSpecifiers];
}

- (id)_reenableButtonSpecifier
{
  id v3 = (void *)MEMORY[0x1E4F92E70];
  if (self->_reenabled) {
    uint64_t v4 = @"DETAIL_REENABLED_BUTTON_TITLE";
  }
  else {
    uint64_t v4 = @"DETAIL_REENABLE_BUTTON_TITLE";
  }
  objc_super v5 = MCUILocalizedString(v4);
  char v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  id v7 = [MEMORY[0x1E4F74230] sharedConnection];
  int v8 = [v7 isOnDeviceAppInstallationAllowed];

  if (self->_reenabled || v8 == 0)
  {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    [v6 setButtonAction:sel__askForReenableConfirmation];
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  [v6 setProperty:v10 forKey:*MEMORY[0x1E4F93130]];
  return v6;
}

- (id)specifiers
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int)*MEMORY[0x1E4F92F08];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v6 = (int)*MEMORY[0x1E4F92FA0];
    id v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + v6) propertyForKey:@"MCUIBlockedAppCdHash"];
    if (v7)
    {
      self->_reenabled = [(MCUIBlockedAppViewController *)self overridden];
      int v8 = (void *)MEMORY[0x1E4F92E70];
      v9 = MCUILocalizedString(@"DETAIL_GROUP_TITLE");
      uint64_t v10 = [v8 groupSpecifierWithName:v9];

      v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + v6) propertyForKey:@"MCUIBlockedAppName"];
      v12 = NSString;
      if (self->_reenabled) {
        id v13 = @"DETAIL_GROUP_REENABLED_FOOTER_%@";
      }
      else {
        id v13 = @"DETAIL_GROUP_FOOTER_%@";
      }
      v14 = MCUILocalizedString(v13);
      v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

      [v10 setProperty:v15 forKey:*MEMORY[0x1E4F93170]];
      v20[0] = v10;
      v16 = [(MCUIBlockedAppViewController *)self _reenableButtonSpecifier];
      v20[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v17;

      id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
    }
    else
    {
      [(MCUIBlockedAppViewController *)self popRecursivelyToRootController];
      id v4 = 0;
    }
  }
  return v4;
}

- (BOOL)reenabled
{
  return self->_reenabled;
}

- (void)setReenabled:(BOOL)a3
{
  self->_reenabled = a3;
}

@end