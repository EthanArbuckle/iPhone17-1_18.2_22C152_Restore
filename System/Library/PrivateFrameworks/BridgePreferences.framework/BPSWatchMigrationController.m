@interface BPSWatchMigrationController
- (BOOL)iTunes;
- (BOOL)shouldBeDisplayedGivenMigrationData:(id)a3;
- (BOOL)useBridgeStyling;
- (BPSWatchMigrationController)init;
- (BPSWatchMigrationController)initWithSnapshot:(id)a3;
- (BPSWatchMigrationController)initWithSourceDeviceName:(id)a3;
- (BPSWatchMigrationControllerDelegate)migrationDelegate;
- (NSArray)migratableDevices;
- (NSString)localizedDetailText;
- (NSString)sourceDeviceName;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_notifyDelegateShouldMigrateWithData:(id)a3;
- (void)_saveMigrationPreference:(BOOL)a3;
- (void)alternateButtonPressed:(id)a3;
- (void)loadView;
- (void)setITunes:(BOOL)a3;
- (void)setLocalizedDetailText:(id)a3;
- (void)setMigratableDevices:(id)a3;
- (void)setMigrationDelegate:(id)a3;
- (void)setSourceDeviceName:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation BPSWatchMigrationController

- (BPSWatchMigrationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BPSWatchMigrationController;
  v2 = [(BPSWelcomeOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BPSWelcomeOptinViewController *)v2 setStyle:74];
  }
  return v3;
}

- (BPSWatchMigrationController)initWithSourceDeviceName:(id)a3
{
  id v5 = a3;
  v6 = [(BPSWatchMigrationController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceDeviceName, a3);
  }

  return v7;
}

- (BPSWatchMigrationController)initWithSnapshot:(id)a3
{
  v4 = [a3 deviceName];
  id v5 = [(BPSWatchMigrationController *)self initWithSourceDeviceName:v4];

  return v5;
}

- (BOOL)shouldBeDisplayedGivenMigrationData:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_MigrationDataP.isa, v4, [v4 length]);
  migratableDevices = self->_migratableDevices;
  self->_migratableDevices = 0;

  if (v4)
  {
    v6 = [MEMORY[0x263F57710] sharedMigrator];
    [v6 devicesFromMigrationConsentRequestData:v4];
  }
  else
  {
    self->_iTunes = 1;
    v6 = [MEMORY[0x263F57710] sharedMigrator];
    [v6 migratableDevicesRequiringConsent];
  }
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_migratableDevices;
  self->_migratableDevices = v7;

  NSLog(&cfstr_FoundLdDevices.isa, [(NSArray *)self->_migratableDevices count]);
  BOOL v9 = [(NSArray *)self->_migratableDevices count] != 0;

  return v9;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)BPSWatchMigrationController;
  [(OBBaseWelcomeController *)&v15 loadView];
  uint64_t v3 = [(NSArray *)self->_migratableDevices count];
  id v4 = [(NSArray *)self->_migratableDevices firstObject];
  id v5 = [v4 valueForProperty:*MEMORY[0x263F57610]];

  v6 = self->_sourceDeviceName;
  if (v3 < 1)
  {
    NSLog(&cfstr_ErrorShowingBp.isa);
    [(BPSWatchMigrationController *)self _notifyDelegateShouldMigrateWithData:0];
  }
  else
  {
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v9 = v8;
    uint64_t v10 = (v3 - 1);
    if (v6)
    {
      v11 = [v8 localizedStringForKey:@"BIXBY_DETAIL_TEXT_FORMAT" value:&stru_26CCB36C8 table:@"Localizable"];
      objc_msgSend(v7, "localizedStringWithFormat:", v11, v10, v5, v6);
    }
    else
    {
      v11 = [v8 localizedStringForKey:@"BIXBY_DETAIL_TEXT_FORMAT_GENERIC_PHONE" value:&stru_26CCB36C8 table:@"Localizable"];
      objc_msgSend(v7, "localizedStringWithFormat:", v11, v10, v5, v14);
    }
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedDetailText = self->_localizedDetailText;
    self->_localizedDetailText = v12;
  }
}

- (BOOL)useBridgeStyling
{
  return 0;
}

- (id)titleString
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"BIXBY_SETUP_TITLE" value:&stru_26CCB36C8 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  return self->_localizedDetailText;
}

- (id)imageResource
{
  return @"Screen-Diagnostics";
}

- (id)imageResourceBundleIdentifier
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"BIXBY_CONTINUE_BUTTON" value:&stru_26CCB36C8 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"BIXBY_SKIP_BUTTON" value:&stru_26CCB36C8 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)_saveMigrationPreference:(BOOL)a3
{
  if (a3)
  {
    id v4 = self->_migratableDevices;
    if ([(NSArray *)v4 count])
    {
      uint64_t v5 = [MEMORY[0x263F57710] migrationDataPreRestoreForConsentedDevices:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v6 = (id)v5;
    [(BPSWatchMigrationController *)self _notifyDelegateShouldMigrateWithData:v5];
    if (v6 && self->_iTunes) {
      [MEMORY[0x263F57710] ingestPostRestoreMigrationDataForConsentedDevices:v6];
    }
  }
  else
  {
    [(BPSWatchMigrationController *)self _notifyDelegateShouldMigrateWithData:0];
  }
}

- (void)_notifyDelegateShouldMigrateWithData:(id)a3
{
  id v8 = a3;
  id v4 = [(BPSWatchMigrationController *)self migrationDelegate];
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      if (v8)
      {
        NSLog(&cfstr_Bpswatchmigrat.isa, [v8 length]);
        uint64_t v5 = v4;
        uint64_t v6 = 1;
        id v7 = v8;
      }
      else
      {
        NSLog(&cfstr_Bpswatchmigrat_0.isa);
        uint64_t v5 = v4;
        uint64_t v6 = 0;
        id v7 = 0;
      }
      [v5 controllerItemCompletedWithMigration:v6 preRestoreData:v7];
    }
    else
    {
      NSLog(&cfstr_Bpswatchmigrat_1.isa, v4);
    }
  }
  else
  {
    NSLog(&cfstr_Bpswatchmigrat_2.isa);
  }
}

- (BPSWatchMigrationControllerDelegate)migrationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrationDelegate);
  return (BPSWatchMigrationControllerDelegate *)WeakRetained;
}

- (void)setMigrationDelegate:(id)a3
{
}

- (NSString)sourceDeviceName
{
  return self->_sourceDeviceName;
}

- (void)setSourceDeviceName:(id)a3
{
}

- (NSString)localizedDetailText
{
  return self->_localizedDetailText;
}

- (void)setLocalizedDetailText:(id)a3
{
}

- (NSArray)migratableDevices
{
  return self->_migratableDevices;
}

- (void)setMigratableDevices:(id)a3
{
}

- (BOOL)iTunes
{
  return self->_iTunes;
}

- (void)setITunes:(BOOL)a3
{
  self->_iTunes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratableDevices, 0);
  objc_storeStrong((id *)&self->_localizedDetailText, 0);
  objc_storeStrong((id *)&self->_sourceDeviceName, 0);
  objc_destroyWeak((id *)&self->_migrationDelegate);
}

@end