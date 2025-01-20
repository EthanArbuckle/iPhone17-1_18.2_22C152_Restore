@interface HPRFSessionTrackerAppCyclingPowerZonesSizeViewController
- (FIUIFormattingManager)formattingManager;
- (HPRFSessionTrackerAppCyclingPowerZonesSizeViewController)initWithConfiguration:(id)a3 updateDelegate:(id)a4;
- (PSSpecifier)functionalThresholdPowerSpecifier;
- (WOCyclingPowerZonesConfiguration)configuration;
- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_insertZoneSizeSpecifiers:(id)a3;
- (void)_pressedZoneSizePreference:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setFunctionalThresholdPowerSpecifier:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppCyclingPowerZonesSizeViewController

- (HPRFSessionTrackerAppCyclingPowerZonesSizeViewController)initWithConfiguration:(id)a3 updateDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZonesSizeViewController;
  v9 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_updateDelegate, v8);
    objc_storeStrong((id *)&v10->_configuration, a3);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZonesSizeViewController;
  [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)&v4 viewWillAppear:a3];
  [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self reloadSpecifiers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZonesSizeViewController;
  [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)&v3 viewWillDisappear:a3];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_POWER_ZONES_SIZE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  objc_super v4 = +[NSString stringWithFormat:v3];

  return v4;
}

- (id)applicationBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)specifiers
{
  objc_super v3 = objc_opt_new();
  objc_super v4 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self localizedPaneTitle];
  [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self setTitle:v4];

  [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self _insertZoneSizeSpecifiers:v3];
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  v6 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v7 = v3;

  id v8 = *(id *)&self->BPSNotificationAppController_opaque[v5];
  return v8;
}

- (void)_insertZoneSizeSpecifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WOCyclingPowerZonesConfigurationEditor allSupportedSizes];
  if ([v5 count])
  {
    v6 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_ZONES_SIZE_GROUP_ID"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v4 addObject:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    id v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v22)
    {
      v18 = v5;
      id v7 = 0;
      uint64_t v21 = *(void *)v24;
      uint64_t v19 = PSRadioGroupCheckedSpecifierKey;
      do
      {
        id v8 = 0;
        v9 = v7;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v8);
          v11 = +[NSBundle bundleForClass:objc_opt_class()];
          objc_super v12 = [v11 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_POWER_ZONES_SIZE_ITEM_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
          v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10);

          id v7 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v7 setUserInfo:v10];
          [v7 setButtonAction:"_pressedZoneSizePreference:"];
          v14 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self configuration];
          v15 = [v14 zones];
          id v16 = [v15 count];
          id v17 = [v10 integerValue];

          if (v16 == v17) {
            [v6 setProperty:v7 forKey:v19];
          }
          [v4 addObject:v7];

          id v8 = (char *)v8 + 1;
          v9 = v7;
        }
        while (v22 != v8);
        id v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v22);

      uint64_t v5 = v18;
    }
  }
}

- (void)_pressedZoneSizePreference:(id)a3
{
  id v12 = a3;
  id v4 = [v12 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v12 userInfo];
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v6 = [v5 integerValue];
  id v7 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self configuration];
  id v8 = [v7 zones];
  id v9 = [v8 count];

  if (v9 != v6)
  {
    v10 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self configuration];
    v11 = +[WOCyclingPowerZonesConfigurationEditor changeZonesSizeTo:v6 using:v10];
    [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self setConfiguration:v11];

    [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self reloadSpecifiers];
  }
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  id v6 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)self updateDelegate];
  [v6 updateWithConfiguration:v5];
}

- (WOCyclingPowerZonesConfiguration)configuration
{
  return self->_configuration;
}

- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (WOCyclingPowerZonesConfigurationUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (PSSpecifier)functionalThresholdPowerSpecifier
{
  return self->_functionalThresholdPowerSpecifier;
}

- (void)setFunctionalThresholdPowerSpecifier:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_functionalThresholdPowerSpecifier, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end