@interface AUBrowserListItemsController
- (DOCDownloadSettings)downloadSettings;
- (NSString)defaultDownloadsFolderTitle;
- (id)_downloadsFolderTitle;
- (id)specifiers;
- (void)_updateDownloadsFolderTitle;
- (void)setDefaultDownloadsFolderTitle:(id)a3;
- (void)setDownloadSettings:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AUBrowserListItemsController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AUBrowserListItemsController;
  [(AUBrowserListItemsController *)&v4 viewDidAppear:a3];
  [(AUBrowserListItemsController *)self _updateDownloadsFolderTitle];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)AUBrowserListItemsController;
    v5 = [(PSListItemsController *)&v18 specifiers];
    v6 = (void *)[v5 mutableCopy];

    v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DOWNLOADS_GROUP"];
    [v6 addObject:v7];

    v8 = (void *)MEMORY[0x263F086E0];
    v9 = PSBundlePathForPreferenceBundle();
    v10 = [v8 bundleWithPath:v9];
    [v10 load];

    v11 = (void *)MEMORY[0x263F5FC40];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"Downloads" value:&stru_26FC1C568 table:0];
    v14 = [v11 preferenceSpecifierNamed:v13 target:self set:0 get:sel__downloadsFolderTitle detail:NSClassFromString(&cfstr_Safaridownload.isa) cell:2 edit:0];

    [v14 setIdentifier:@"DOWNLOADS"];
    [v6 addObject:v14];
    v15 = (objc_class *)[v6 copy];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v15;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_downloadsFolderTitle
{
  if (self->_defaultDownloadsFolderTitle) {
    return self->_defaultDownloadsFolderTitle;
  }
  else {
    return &stru_26FC1C568;
  }
}

- (void)_updateDownloadsFolderTitle
{
  downloadSettings = self->_downloadSettings;
  if (!downloadSettings)
  {
    objc_super v4 = (DOCDownloadSettings *)objc_alloc_init(MEMORY[0x263F3AB88]);
    v5 = self->_downloadSettings;
    self->_downloadSettings = v4;

    downloadSettings = self->_downloadSettings;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__AUBrowserListItemsController__updateDownloadsFolderTitle__block_invoke;
  v6[3] = &unk_2652311B0;
  v6[4] = self;
  [(DOCDownloadSettings *)downloadSettings fetchDefaultDownloadsLocationItem:v6];
}

void __59__AUBrowserListItemsController__updateDownloadsFolderTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6
    || ([v5 providerDomainID], v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v7 = _AULoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v12 = 0;
    v7 = [MEMORY[0x263F054C8] providerDomainForItem:v5 error:&v12];
    id v6 = v12;
    if (v6)
    {
      v9 = _AULoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_2((uint64_t)v6, v9);
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__AUBrowserListItemsController__updateDownloadsFolderTitle__block_invoke_23;
      block[3] = &unk_265231188;
      block[4] = *(void *)(a1 + 32);
      v7 = v7;
      v11 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __59__AUBrowserListItemsController__updateDownloadsFolderTitle__block_invoke_23(uint64_t a1)
{
  uint64_t v2 = DOCLocalizedDisplayName();
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 1424);
  *(void *)(v3 + 1424) = v2;

  id v5 = *(void **)(a1 + 32);
  return [v5 reloadSpecifierID:@"DOWNLOADS" animated:1];
}

- (DOCDownloadSettings)downloadSettings
{
  return self->_downloadSettings;
}

- (void)setDownloadSettings:(id)a3
{
}

- (NSString)defaultDownloadsFolderTitle
{
  return self->_defaultDownloadsFolderTitle;
}

- (void)setDefaultDownloadsFolderTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDownloadsFolderTitle, 0);
  objc_storeStrong((id *)&self->_downloadSettings, 0);
}

@end