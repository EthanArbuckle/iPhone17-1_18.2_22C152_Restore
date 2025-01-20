@interface AUDeveloperSettingsLearnMoreController
- (AUDeveloperSettingsLearnMoreController)init;
- (OBTextWelcomeController)controller;
- (void)donePressed;
- (void)setController:(id)a3;
@end

@implementation AUDeveloperSettingsLearnMoreController

- (AUDeveloperSettingsLearnMoreController)init
{
  v24[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AUDeveloperSettingsLearnMoreController;
  v2 = [(AUDeveloperSettingsLearnMoreController *)&v18 init];
  if (v2)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v3 = (void *)getOBTextWelcomeControllerClass_softClass;
    uint64_t v23 = getOBTextWelcomeControllerClass_softClass;
    if (!getOBTextWelcomeControllerClass_softClass)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __getOBTextWelcomeControllerClass_block_invoke;
      v19[3] = &unk_2648399D8;
      v19[4] = &v20;
      __getOBTextWelcomeControllerClass_block_invoke((uint64_t)v19);
      v3 = (void *)v21[3];
    }
    v4 = v3;
    _Block_object_dispose(&v20, 8);
    id v5 = [v4 alloc];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"LEGAL_CONSENT_TITLE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v8 = (void *)[v5 initWithTitle:v7 detailText:0 symbolName:0];
    [(AUDeveloperSettingsLearnMoreController *)v2 setController:v8];

    v9 = [(AUDeveloperSettingsLearnMoreController *)v2 controller];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"LEGAL_CONSENT_TEXT" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    [v9 addSectionWithHeader:0 content:v11];

    v12 = [(AUDeveloperSettingsLearnMoreController *)v2 controller];
    v24[0] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [(AUDeveloperSettingsLearnMoreController *)v2 setViewControllers:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v2 action:sel_donePressed];
    v15 = [(AUDeveloperSettingsLearnMoreController *)v2 controller];
    v16 = [v15 navigationItem];
    [v16 setRightBarButtonItem:v14];
  }
  return v2;
}

- (void)donePressed
{
  id v3 = [(AUDeveloperSettingsLearnMoreController *)self controller];
  v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (OBTextWelcomeController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end