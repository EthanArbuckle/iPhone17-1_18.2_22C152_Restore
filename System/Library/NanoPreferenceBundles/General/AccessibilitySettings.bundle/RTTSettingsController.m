@interface RTTSettingsController
- (id)createSpecifiersForRTTEnabled;
- (id)rttEnabled:(id)a3;
- (id)rttRelayNumber:(id)a3;
- (id)shouldSendImmediately:(id)a3;
- (id)specifiers;
- (void)didReceiveNPSValueChangedNotificationWithName:(id)a3;
- (void)setRTTEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setRTTRelayNumber:(id)a3 specifier:(id)a4;
- (void)setSendImmediately:(id)a3 forSpecifier:(id)a4;
@end

@implementation RTTSettingsController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(RTTSettingsController *)self loadSpecifiersFromPlistName:@"RTTSettings" target:self];
    v6 = [(RTTSettingsController *)self createSpecifiersForRTTEnabled];
    [v5 addObjectsFromArray:v6];

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)createSpecifiersForRTTEnabled
{
  uint64_t v3 = [MEMORY[0x263F62AE0] sharedInstance];
  int v4 = [v3 TTYSoftwareEnabled];

  if (v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"TTY_RELAY_FOOTER", @"RTTSettings");
    uint64_t v8 = *MEMORY[0x263F600F8];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    uint64_t v9 = *MEMORY[0x263F60138];
    [v6 setProperty:@"RTT_RELAY_GROUP" forKey:*MEMORY[0x263F60138]];
    [v5 addObject:v6];
    v10 = (void *)MEMORY[0x263F5FC40];
    v11 = settingsLocString(@"TTY_RELAY_LABEL", @"RTTSettings");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:sel_rttRelayNumber_ detail:objc_opt_class() cell:2 edit:0];

    [v12 setProperty:@"RTT_RELAY_NUMBER" forKey:v9];
    [v5 addObject:v12];
    v13 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v14 = settingsLocString(@"TTY_REALTIME_FOOTER", @"RTTSettings");
    [v13 setProperty:v14 forKey:v8];

    [v13 setProperty:@"RTT_REALTIME_GROUP" forKey:v9];
    [v5 addObject:v13];
    v15 = (void *)MEMORY[0x263F5FC40];
    v16 = settingsLocString(@"TTY_REALTIME_LABEL", @"RTTSettings");
    v17 = [v15 preferenceSpecifierNamed:v16 target:self set:sel_setSendImmediately_forSpecifier_ get:sel_shouldSendImmediately_ detail:0 cell:6 edit:0];

    [v17 setProperty:@"RTT_REALTIME_SWITCH" forKey:v9];
    [v5 addObject:v17];
    v18 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v18 setProperty:@"RTT_DEFAULT_REPLIES_GROUP" forKey:v9];
    [v5 addObject:v18];
    v19 = (void *)MEMORY[0x263F5FC40];
    v20 = settingsLocString(@"RTT_CANNED_TEXT_TITLE", @"RTTSettings");
    v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v21 setProperty:@"RTT_DEFAULT_REPLIES_LINK" forKey:v9];
    [v5 addObject:v21];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)rttRelayNumber:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F62AE0], "sharedInstance", a3);
  int v4 = [v3 preferredRelayNumber];

  if (![v4 length])
  {
    v5 = [MEMORY[0x263F62AF8] sharedInstance];
    uint64_t v6 = [v5 preferredRelayNumber];

    v7 = [MEMORY[0x263F62AE0] sharedInstance];
    [v7 setPreferredRelayNumber:v6];

    int v4 = (void *)v6;
  }

  return v4;
}

- (void)setRTTRelayNumber:(id)a3 specifier:(id)a4
{
  int v4 = (void *)MEMORY[0x263F62AE0];
  id v5 = a3;
  id v7 = [v4 sharedInstance];
  uint64_t v6 = [MEMORY[0x263F62AD0] phoneNumberStringFromString:v5];

  [v7 setPreferredRelayNumber:v6];
}

- (id)shouldSendImmediately:(id)a3
{
  uint64_t v3 = NSNumber;
  int v4 = objc_msgSend(MEMORY[0x263F62AE0], "sharedInstance", a3);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "ttyShouldBeRealtime"));

  return v5;
}

- (void)setSendImmediately:(id)a3 forSpecifier:(id)a4
{
  int v4 = (void *)MEMORY[0x263F62AE0];
  id v5 = a3;
  id v7 = [v4 sharedInstance];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setTtyShouldBeRealtime:v6];
}

- (id)rttEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  int v4 = objc_msgSend(MEMORY[0x263F62AE0], "sharedInstance", a3);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "TTYSoftwareEnabled"));

  return v5;
}

- (void)setRTTEnabled:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  id v5 = [MEMORY[0x263F62AE0] sharedInstance];
  objc_msgSend(v5, "setTTYSoftwareEnabled:", objc_msgSend(v9, "BOOLValue"));

  if ([v9 BOOLValue])
  {
    uint64_t v6 = [(RTTSettingsController *)self specifierForID:@"RTT_RELAY_GROUP"];

    if (!v6)
    {
      uint64_t v8 = [(RTTSettingsController *)self createSpecifiersForRTTEnabled];
      -[RTTSettingsController insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v8, [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count]);
      goto LABEL_7;
    }
  }
  if (([v9 BOOLValue] & 1) == 0)
  {
    id v7 = [(RTTSettingsController *)self specifierForID:@"RTT_RELAY_GROUP"];

    if (v7)
    {
      uint64_t v8 = [(RTTSettingsController *)self specifiersForIDs:&unk_26FB00790];
      [(RTTSettingsController *)self removeContiguousSpecifiers:v8];
LABEL_7:
    }
  }
}

- (void)didReceiveNPSValueChangedNotificationWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RTTSettingsController;
  id v4 = a3;
  [(AccessibilityBridgeBaseController *)&v6 didReceiveNPSValueChangedNotificationWithName:v4];
  int v5 = objc_msgSend(v4, "isEqualToString:", @"NanoRTTDefaultsChanged", v6.receiver, v6.super_class);

  if (v5) {
    [(RTTSettingsController *)self reloadSpecifiers];
  }
}

@end