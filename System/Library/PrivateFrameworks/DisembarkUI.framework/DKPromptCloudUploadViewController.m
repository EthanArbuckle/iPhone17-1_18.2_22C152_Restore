@interface DKPromptCloudUploadViewController
- (DKPromptCloudUploadViewController)init;
- (id)eraseNowBlock;
- (id)hasInternetConnectivity;
- (id)presentNetworkSettings;
- (id)shouldWarnForDataUsage;
- (id)uploadThenEraseBlock;
- (void)_eraseTapped:(id)a3;
- (void)_uploadTapped:(id)a3;
- (void)setEraseNowBlock:(id)a3;
- (void)setHasInternetConnectivity:(id)a3;
- (void)setPresentNetworkSettings:(id)a3;
- (void)setShouldWarnForDataUsage:(id)a3;
- (void)setUploadThenEraseBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation DKPromptCloudUploadViewController

- (DKPromptCloudUploadViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CLOUD_UPLOAD_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CLOUD_UPLOAD_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];
  v9.receiver = self;
  v9.super_class = (Class)DKPromptCloudUploadViewController;
  v7 = [(DKPromptCloudUploadViewController *)&v9 initWithTitle:v4 detailText:v6 symbolName:@"icloud.and.arrow.up" contentLayout:2];

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)DKPromptCloudUploadViewController;
  [(OBBaseWelcomeController *)&v11 viewDidLoad];
  v3 = [MEMORY[0x263F5B898] boldButton];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"FINISH_UPLOAD_THEN_ERASE" value:&stru_26EAA9F58 table:@"Localizable"];
  [v3 setTitle:v5 forState:0];

  [v3 addTarget:self action:sel__uploadTapped_ forControlEvents:64];
  v6 = [(DKPromptCloudUploadViewController *)self buttonTray];
  [v6 addButton:v3];

  v7 = [MEMORY[0x263F5B8D0] linkButton];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v9 = [v8 localizedStringForKey:@"ERASE_NOW" value:&stru_26EAA9F58 table:@"Localizable"];
  [v7 setTitle:v9 forState:0];

  [v7 addTarget:self action:sel__eraseTapped_ forControlEvents:64];
  v10 = [(DKPromptCloudUploadViewController *)self buttonTray];
  [v10 addButton:v7];
}

- (void)_uploadTapped:(id)a3
{
  uint64_t v4 = [(DKPromptCloudUploadViewController *)self hasInternetConnectivity];
  if (!v4
    || (v5 = (void *)v4,
        [(DKPromptCloudUploadViewController *)self hasInternetConnectivity],
        v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v7 = v6[2](),
        v6,
        v5,
        !v7))
  {
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = SFLocalizableWAPIStringKeyForKey();
    id v36 = [v26 localizedStringForKey:v27 value:&stru_26EAA9F58 table:@"Localizable"];

    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = SFLocalizableWAPIStringKeyForKey();
    v16 = [v28 localizedStringForKey:v29 value:&stru_26EAA9F58 table:@"Localizable"];

    v17 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v36 message:v16 preferredStyle:1];
    v30 = (void *)MEMORY[0x263F1C3F0];
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
    v33 = [v30 actionWithTitle:v32 style:1 handler:0];
    [v17 addAction:v33];

    v22 = (void *)MEMORY[0x263F1C3F0];
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"SETTINGS" value:&stru_26EAA9F58 table:@"Localizable"];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke_2;
    v38[3] = &unk_264CF0AE8;
    v38[4] = self;
    v25 = v38;
    goto LABEL_7;
  }
  uint64_t v8 = [(DKPromptCloudUploadViewController *)self shouldWarnForDataUsage];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(DKPromptCloudUploadViewController *)self shouldWarnForDataUsage];
    int v11 = v10[2]();

    if (v11)
    {
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = SFLocalizableWAPIStringKeyForKey();
      id v36 = [v12 localizedStringForKey:v13 value:&stru_26EAA9F58 table:@"Localizable"];

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = SFLocalizableWAPIStringKeyForKey();
      v16 = [v14 localizedStringForKey:v15 value:&stru_26EAA9F58 table:@"Localizable"];

      v17 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v36 message:v16 preferredStyle:1];
      v18 = (void *)MEMORY[0x263F1C3F0];
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
      v21 = [v18 actionWithTitle:v20 style:1 handler:0];
      [v17 addAction:v21];

      v22 = (void *)MEMORY[0x263F1C3F0];
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"CONTINUE" value:&stru_26EAA9F58 table:@"Localizable"];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke;
      v39[3] = &unk_264CF0AE8;
      v39[4] = self;
      v25 = v39;
LABEL_7:
      v34 = [v22 actionWithTitle:v24 style:0 handler:v25];
      [v17 addAction:v34];

      [(DKPromptCloudUploadViewController *)self presentViewController:v17 animated:1 completion:0];
      return;
    }
  }
  v35 = [(DKPromptCloudUploadViewController *)self uploadThenEraseBlock];

  if (v35)
  {
    v37 = [(DKPromptCloudUploadViewController *)self uploadThenEraseBlock];
    v37[2](v37, 0);
  }
}

void __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uploadThenEraseBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) uploadThenEraseBlock];
    v3[2](v3, 1);
  }
}

void __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentNetworkSettings];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) presentNetworkSettings];
    v3[2]();
  }
}

- (void)_eraseTapped:(id)a3
{
  uint64_t v4 = [(DKPromptCloudUploadViewController *)self eraseNowBlock];

  if (v4)
  {
    v5 = [(DKPromptCloudUploadViewController *)self eraseNowBlock];
    v5[2]();
  }
}

- (id)uploadThenEraseBlock
{
  return self->_uploadThenEraseBlock;
}

- (void)setUploadThenEraseBlock:(id)a3
{
}

- (id)eraseNowBlock
{
  return self->_eraseNowBlock;
}

- (void)setEraseNowBlock:(id)a3
{
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
}

- (id)shouldWarnForDataUsage
{
  return self->_shouldWarnForDataUsage;
}

- (void)setShouldWarnForDataUsage:(id)a3
{
}

- (id)presentNetworkSettings
{
  return self->_presentNetworkSettings;
}

- (void)setPresentNetworkSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentNetworkSettings, 0);
  objc_storeStrong(&self->_shouldWarnForDataUsage, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseNowBlock, 0);
  objc_storeStrong(&self->_uploadThenEraseBlock, 0);
}

@end