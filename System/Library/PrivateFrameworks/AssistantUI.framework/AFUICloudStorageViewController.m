@interface AFUICloudStorageViewController
- (id)specifiers;
- (void)_disableAndDeleteCloudSync;
- (void)confirmDisable;
- (void)confirmDisableForMultiUserVoiceIdentification;
- (void)didReceiveMemoryWarning;
- (void)handleDisableAndDeleteButtonPress;
- (void)viewDidLoad;
@end

@implementation AFUICloudStorageViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AFUICloudStorageViewController;
  [(AFUICloudStorageViewController *)&v5 viewDidLoad];
  v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
  settings = self->_settings;
  self->_settings = v3;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)AFUICloudStorageViewController;
  [(AFUICloudStorageViewController *)&v2 didReceiveMemoryWarning];
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v7 = (void *)getSTStorageAppHeaderCellClass_softClass;
    uint64_t v22 = getSTStorageAppHeaderCellClass_softClass;
    if (!getSTStorageAppHeaderCellClass_softClass)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __getSTStorageAppHeaderCellClass_block_invoke;
      v18[3] = &unk_264691928;
      v18[4] = &v19;
      __getSTStorageAppHeaderCellClass_block_invoke((uint64_t)v18);
      v7 = (void *)v20[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v19, 8);
    v9 = [v8 specifierForAppIdentifier:@"com.apple.siri"];
    [v9 setVersionLabelEnabled:0];
    [v6 addObject:v9];
    v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DISABLE_AND_DELETE"];
    v11 = _LocStr(@"DISABLE_AND_DELETE_FOOTER");
    [v10 setProperty:v11 forKey:*MEMORY[0x263F600F8]];

    [v6 addObject:v10];
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = _LocStr(@"DISABLE_AND_DELETE");
    v14 = [v12 deleteButtonSpecifierWithName:v13 target:self action:sel_handleDisableAndDeleteButtonPress];
    [v6 addObject:v14];

    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
    id v16 = v6;

    id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }

  return v4;
}

- (void)handleDisableAndDeleteButtonPress
{
  objc_initWeak(&location, self);
  settings = self->_settings;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke;
  v4[3] = &unk_264691A00;
  objc_copyWeak(&v5, &location);
  [(AFSettingsConnection *)settings fetchMultiUserVoiceIdentificationSetting:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke_2;
  v2[3] = &unk_264691B40;
  char v4 = a2;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
}

void __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (v1) {
    [WeakRetained confirmDisableForMultiUserVoiceIdentification];
  }
  else {
    [WeakRetained confirmDisable];
  }
}

- (void)confirmDisableForMultiUserVoiceIdentification
{
  v9[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F5FB40]);
  v8[0] = *MEMORY[0x263F60018];
  char v4 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_TITLE_MULTI_USER");
  v9[0] = v4;
  v8[1] = *MEMORY[0x263F60010];
  id v5 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_MULTI_USER");
  v9[1] = v5;
  v8[2] = *MEMORY[0x263F5FFF8];
  id v6 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_CANCEL_MULTI_USER");
  v9[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v3 setupWithDictionary:v7];

  [v3 setTarget:self];
  [v3 setConfirmationAction:sel_confirmDisable];
  [(AFUICloudStorageViewController *)self showConfirmationViewForSpecifier:v3];
}

- (void)confirmDisable
{
  v10[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F5FB40]);
  v9[0] = *MEMORY[0x263F60018];
  char v4 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_TITLE");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F60010];
  id v5 = _LocStr(@"DISABLE_AND_DELETE_PROMPT");
  v10[1] = v5;
  v9[2] = *MEMORY[0x263F60008];
  id v6 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_OK");
  v10[2] = v6;
  v9[3] = *MEMORY[0x263F5FFF8];
  v7 = _LocStr(@"DISABLE_AND_DELETE_PROMPT_CANCEL");
  v10[3] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v3 setupWithDictionary:v8];

  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
  [v3 setTarget:self];
  [v3 setConfirmationAction:sel__disableAndDeleteCloudSync];
  [(AFUICloudStorageViewController *)self showConfirmationViewForSpecifier:v3];
}

- (void)_disableAndDeleteCloudSync
{
}

void __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void).cxx_destruct
{
}

void __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[AFUICloudStorageViewController _disableAndDeleteCloudSync]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s Error deleting & disabling Cloud sync: %@", (uint8_t *)&v2, 0x16u);
}

@end