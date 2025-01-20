@interface WiFiPasswordController
+ (id)generateDefaultPassword;
+ (void)generateDefaultPassword;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)wifiPassword:(id)a3;
- (void)cancelButtonClicked:(id)a3;
- (void)doneButtonClicked:(id)a3;
- (void)textDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WiFiPasswordController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)WiFiPasswordController;
  [(WiFiPasswordController *)&v8 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonClicked_];
  v4 = [(WiFiPasswordController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonClicked_];
  v6 = [(WiFiPasswordController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  v7 = WMSUIEventDictionary(@"view-ph-password", 0);
  WMSubmitUIEventMetric(v7);
}

- (void)viewDidAppear:(BOOL)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)WiFiPasswordController;
  [(WiFiPasswordController *)&v19 viewDidAppear:a3];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  v5 = [(WiFiPasswordController *)self indexPathForIndex:1];
  v6 = [v4 cellForRowAtIndexPath:v5];
  [v6 becomeFirstResponder];

  if (_os_feature_enabled_impl())
  {
    v7 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.PersonalHotspot"];
    id v8 = objc_alloc(MEMORY[0x263F08DB0]);
    v9 = [MEMORY[0x263EFF960] currentLocale];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 bundleURL];
    v12 = (void *)[v8 initWithKey:@"Wi-Fi Password" table:0 locale:v9 bundleURL:v11];

    id v13 = objc_alloc(MEMORY[0x263F08DB0]);
    v14 = [MEMORY[0x263EFF960] currentLocale];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    v17 = (void *)[v13 initWithKey:@"Personal Hotspot" table:0 locale:v14 bundleURL:v16];

    if (objc_opt_respondsToSelector())
    {
      v20[0] = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      [(WiFiPasswordController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.personal-hotspot" title:v12 localizedNavigationComponents:v18 deepLink:v7];
    }
  }
}

+ (id)generateDefaultPassword
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ1234567890"];
  v10[0] = v2;
  v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"1234567890"];
  v10[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v5 setObject:&unk_26F312D70 forKey:*MEMORY[0x263F17450]];
  [v5 setObject:&unk_26F312D70 forKey:*MEMORY[0x263F17448]];
  [v5 setObject:@"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ1234567890" forKey:*MEMORY[0x263F17438]];
  [v5 setObject:v4 forKey:*MEMORY[0x263F17460]];
  [v5 setObject:&unk_26F312D88 forKey:*MEMORY[0x263F17440]];
  [v5 setObject:&unk_26F312D88 forKey:*MEMORY[0x263F17458]];
  [v5 setObject:@"-" forKey:*MEMORY[0x263F17468]];
  id v6 = v5;
  v7 = (void *)SecPasswordGenerate();
  if (!v7)
  {
    id v8 = WMSLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[WiFiPasswordController generateDefaultPassword];
    }
  }

  return v7;
}

- (void)cancelButtonClicked:(id)a3
{
  id v4 = [(WiFiPasswordController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)doneButtonClicked:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  v5 = [(WiFiPasswordController *)self indexPathForIndex:1];
  id v6 = [v4 cellForRowAtIndexPath:v5];
  id v17 = [v6 editableTextField];

  if (v17)
  {
    v7 = [v17 text];
    if ((unint64_t)[v7 length] < 8)
    {
LABEL_6:

      goto LABEL_7;
    }
    id v8 = [v17 text];
    unint64_t v9 = [v8 length];

    if (v9 <= 0x3F)
    {
      v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
      id WeakRetained = objc_loadWeakRetained(v10);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v7 = objc_loadWeakRetained(v10);
        id v13 = [v17 text];
        [v7 _setWiFiPassword:v13];

        [v7 reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
        v14 = WMSUIEventDictionary(@"edit-ph-password", 0);
        WMSubmitUIEventMetric(v14);

        goto LABEL_6;
      }
    }
  }
LABEL_7:
  v15 = [(WiFiPasswordController *)self navigationController];
  id v16 = (id)[v15 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiPasswordController;
  v5 = [(WiFiPasswordController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    id v6 = [v5 editableTextField];
    v7 = v6;
    if (v6)
    {
      [v6 setTextContentType:*MEMORY[0x263F83A70]];
      [v7 setReturnKeyType:9];
      [v7 setKeyboardType:1];
      [v7 setDisplaySecureTextUsingPlainText:1];
      [v7 setAutocapitalizationType:0];
      [v7 setAutocorrectionType:1];
      [v7 setClearButtonMode:3];
      [v7 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];
      [v7 setDelegate:self];
    }
  }

  return v5;
}

- (void)textDidChange:(id)a3
{
  id v10 = a3;
  id v4 = [v10 text];
  if ((unint64_t)[v4 length] < 8)
  {
    BOOL v6 = 0;
  }
  else
  {
    v5 = [v10 text];
    BOOL v6 = (unint64_t)[v5 length] < 0x40;
  }
  v7 = [(WiFiPasswordController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];

  objc_super v9 = [MEMORY[0x263F828A0] activeKeyboard];
  [v9 setReturnKeyEnabled:v6];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v5 = a5;
  if ([v5 length])
  {
    BOOL v6 = [v5 dataUsingEncoding:1];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = [v8 bytes];
      if ([v8 length])
      {
        unint64_t v10 = 0;
        do
        {
          unsigned int v11 = *(unsigned __int8 *)(v9 + v10) - 32;
          BOOL v12 = v11 < 0x5F;
          if (v11 >= 0x5F) {
            break;
          }
          ++v10;
        }
        while (v10 < [v8 length]);
      }
      else
      {
        BOOL v12 = 1;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)wifiPassword:(id)a3
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained(v3);
    v7 = [v6 _wiFiPassword];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    int v26 = MGGetBoolAnswer();
    id v5 = (void *)MEMORY[0x263F5FC40];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PASSWORD" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v28 = [v5 preferenceSpecifierNamed:v7 target:self set:sel_emptySetter_specifier_ get:sel_wifiPassword_ detail:0 cell:8 edit:0];

    id v8 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    uint64_t v9 = NSString;
    unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unsigned int v11 = [v10 localizedStringForKey:@"WIFI_PASSWORD_FOOTER" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = v12;
    if (v26) {
      v14 = @"WIFI_CH";
    }
    else {
      v14 = @"WIFI";
    }
    v27 = v14;
    v15 = objc_msgSend(v12, "localizedStringForKey:value:table:");
    id v16 = objc_msgSend(v9, "stringWithFormat:", v11, v15);
    [v8 setProperty:v16 forKey:*MEMORY[0x263F600F8]];

    id v17 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, v28, 0);
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v17;

    objc_super v19 = NSString;
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"WIFI_PASSWORD_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:v27 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v24 = objc_msgSend(v19, "stringWithFormat:", v21, v23);
    [(WiFiPasswordController *)self setTitle:v24];

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

+ (void)generateDefaultPassword
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F3F1000, a2, OS_LOG_TYPE_ERROR, "Failed to generate default personal hotspot password! (%@)", (uint8_t *)&v2, 0xCu);
}

@end