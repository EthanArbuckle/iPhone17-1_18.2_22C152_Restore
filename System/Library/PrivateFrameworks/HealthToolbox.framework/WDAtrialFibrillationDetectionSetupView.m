@interface WDAtrialFibrillationDetectionSetupView
- (id)bodyString;
- (id)buttonTitleString;
- (id)createHeroView;
- (id)titleString;
- (int64_t)accessibilityGroupID;
@end

@implementation WDAtrialFibrillationDetectionSetupView

- (id)createHeroView
{
  id v2 = objc_alloc_init(MEMORY[0x263F476D8]);

  return v2;
}

- (id)titleString
{
  id v2 = WDBundle();
  v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SETUP_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

  return v3;
}

- (id)bodyString
{
  id v2 = WDBundle();
  v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SETUP_BODY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

  return v3;
}

- (id)buttonTitleString
{
  id v2 = WDBundle();
  v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SETUP_BUTTON_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

  return v3;
}

- (int64_t)accessibilityGroupID
{
  return 2;
}

@end