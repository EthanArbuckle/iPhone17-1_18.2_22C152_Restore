@interface WDElectrocardiogramSetupView
- (id)bodyString;
- (id)buttonTitleString;
- (id)createHeroView;
- (id)titleString;
- (int64_t)accessibilityGroupID;
@end

@implementation WDElectrocardiogramSetupView

- (id)createHeroView
{
  v24[4] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F1CB60]);
  id v3 = objc_alloc(MEMORY[0x263F1C6D0]);
  v4 = (void *)MEMORY[0x263F1C6B0];
  v5 = WDBundle();
  v6 = [v4 imageNamed:@"setup-watch-Cinnamon" inBundle:v5];
  v7 = (void *)[v3 initWithImage:v6];

  v23 = v7;
  [v2 addSubview:v7];
  objc_msgSend(v7, "hk_alignConstraintsWithView:", v2);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x263F476C8]), "initWithFrame:isLargeDevice:", 0, 18.0, 45.0, 80.0, 98.0);
  v9 = [MEMORY[0x263F1C550] blackColor];
  [v8 setBackgroundColor:v9];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setTimeRemaining:11.0];
  [v2 addSubview:v8];
  v19 = (void *)MEMORY[0x263F08938];
  v22 = [v8 leftAnchor];
  v21 = [v2 leftAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:18.0];
  v24[0] = v20;
  v10 = [v8 topAnchor];
  v11 = [v2 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:45.0];
  v24[1] = v12;
  v13 = [v8 widthAnchor];
  v14 = [v13 constraintEqualToConstant:80.0];
  v24[2] = v14;
  v15 = [v8 heightAnchor];
  v16 = [v15 constraintEqualToConstant:98.0];
  v24[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
  [v19 activateConstraints:v17];

  return v2;
}

- (id)titleString
{
  id v2 = WDBundle();
  id v3 = [v2 localizedStringForKey:@"ELECTROCARDIOGRAM_SETUP_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v4 = HKConditionallyRedactedHeartRhythmString();

  return v4;
}

- (id)bodyString
{
  id v2 = WDBundle();
  id v3 = [v2 localizedStringForKey:@"ELECTROCARDIOGRAM_SETUP_BODY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v4 = HKConditionallyRedactedHeartRhythmString();

  return v4;
}

- (id)buttonTitleString
{
  id v2 = WDBundle();
  id v3 = [v2 localizedStringForKey:@"ELECTROCARDIOGRAM_SETUP_BUTTON_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v4 = HKConditionallyRedactedHeartRhythmString();

  return v4;
}

- (int64_t)accessibilityGroupID
{
  return 1;
}

@end