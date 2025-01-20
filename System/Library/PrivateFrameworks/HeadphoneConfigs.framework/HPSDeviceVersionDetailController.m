@interface HPSDeviceVersionDetailController
- (id)getBudVersion;
- (id)getCaseVersion;
- (id)specifiers;
- (void)userDidTapLink:(id)a3;
@end

@implementation HPSDeviceVersionDetailController

- (id)getBudVersion
{
  v2 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"device-bud-version"];

  return v3;
}

- (id)getCaseVersion
{
  v2 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"device-case-version"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4097960 target:self set:0 get:0 detail:0 cell:0 edit:0];
    v7 = NSString;
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"ACCESSORY_VERSION_DETAIL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig"];
    v10 = objc_msgSend(v7, "stringWithFormat:", v9, @"support.apple.com");

    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v6 setProperty:v12 forKey:*MEMORY[0x1E4F93140]];

    [v6 setProperty:v10 forKey:*MEMORY[0x1E4F93160]];
    v29.location = [v10 rangeOfString:@"support.apple.com"];
    v13 = NSStringFromRange(v29);
    [v6 setProperty:v13 forKey:*MEMORY[0x1E4F93150]];

    v14 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v6 setProperty:v14 forKey:*MEMORY[0x1E4F93158]];

    [v6 setProperty:@"userDidTapLink:" forKey:*MEMORY[0x1E4F93148]];
    [v5 addObject:v6];
    v15 = [(HPSDeviceVersionDetailController *)self getBudVersion];

    v16 = (void *)MEMORY[0x1E4F93108];
    if (v15)
    {
      v17 = (void *)MEMORY[0x1E4F92E70];
      v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE" value:&stru_1F4097960 table:@"DeviceConfig"];
      v20 = [v17 preferenceSpecifierNamed:v19 target:self set:0 get:sel_getBudVersion detail:0 cell:4 edit:0];

      [v20 setProperty:MEMORY[0x1E4F1CC38] forKey:*v16];
      [v5 addObject:v20];
    }
    v21 = [(HPSDeviceVersionDetailController *)self getCaseVersion];

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E4F92E70];
      v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"ACCESSORY_ABOUT_CASE_VERSION_FIRMWARE" value:&stru_1F4097960 table:@"DeviceConfig"];
      v25 = [v22 preferenceSpecifierNamed:v24 target:self set:0 get:sel_getCaseVersion detail:0 cell:4 edit:0];

      [v25 setProperty:MEMORY[0x1E4F1CC38] forKey:*v16];
      [v5 addObject:v25];
    }
    v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)userDidTapLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht213317?cid=mc-ols-airpods-article_ht213317-ios_ui-06152022"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

@end