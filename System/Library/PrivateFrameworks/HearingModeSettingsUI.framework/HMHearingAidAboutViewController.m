@interface HMHearingAidAboutViewController
- (id)createGroupSpecifier:(id)a3;
- (id)getAccessoryUDI;
- (id)getAccessoryUpdateVersion;
- (id)getDevice;
- (id)getFeatureVersion;
- (id)getHostUDI;
- (id)getHostUpdateVersion;
- (id)getWatchUDI;
- (id)getWatchUpdateVersion;
- (id)getYearOfRelease;
- (id)specifiers;
- (void)contactAppleSupportTapped;
@end

@implementation HMHearingAidAboutViewController

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Product Name" value:&stru_2702152D0 table:0];
  v6 = [(HMHearingAidAboutViewController *)self createGroupSpecifier:v5];
  [v3 addObject:v6];

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Hearing Aid Feature" value:&stru_2702152D0 table:0];
  v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v3 addObject:v10];

  v91 = [(HMHearingAidAboutViewController *)self getDevice];
  v11 = -[HMHearingAidAboutViewController createGroupSpecifier:](self, "createGroupSpecifier:");
  [v3 addObject:v11];

  v12 = (void *)MEMORY[0x263F5FC40];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"Feature Version" value:&stru_2702152D0 table:0];
  v15 = [v12 preferenceSpecifierNamed:v14 target:self set:0 get:sel_getFeatureVersion detail:0 cell:4 edit:0];
  [v3 addObject:v15];

  v16 = (void *)MEMORY[0x263F5FC40];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"Update Version" value:&stru_2702152D0 table:0];
  v19 = [v16 preferenceSpecifierNamed:v18 target:self set:0 get:sel_getHostUpdateVersion detail:0 cell:4 edit:0];
  [v3 addObject:v19];

  v20 = (void *)MEMORY[0x263F5FC40];
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"Year of Release" value:&stru_2702152D0 table:0];
  v23 = [v20 preferenceSpecifierNamed:v22 target:self set:0 get:sel_getYearOfRelease detail:0 cell:4 edit:0];
  [v3 addObject:v23];

  v24 = (void *)MEMORY[0x263F5FC40];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"UDI" value:&stru_2702152D0 table:0];
  v27 = [v24 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v28 = [(HMHearingAidAboutViewController *)self getHostUDI];
  [v27 setUserInfo:v28];

  v90 = v27;
  [v3 addObject:v27];
  v89 = [MEMORY[0x263F57730] sharedInstance];
  v88 = [v89 getActivePairedDevice];
  if (v88)
  {
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"Apple Watch" value:&stru_2702152D0 table:0];
    v31 = [(HMHearingAidAboutViewController *)self createGroupSpecifier:v30];
    [v3 addObject:v31];

    v32 = (void *)MEMORY[0x263F5FC40];
    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"Feature Version" value:&stru_2702152D0 table:0];
    v35 = [v32 preferenceSpecifierNamed:v34 target:self set:0 get:sel_getFeatureVersion detail:0 cell:4 edit:0];
    [v3 addObject:v35];

    v36 = (void *)MEMORY[0x263F5FC40];
    v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v38 = [v37 localizedStringForKey:@"Update Version" value:&stru_2702152D0 table:0];
    v39 = [v36 preferenceSpecifierNamed:v38 target:self set:0 get:sel_getWatchUpdateVersion detail:0 cell:4 edit:0];
    [v3 addObject:v39];

    v40 = (void *)MEMORY[0x263F5FC40];
    v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v42 = [v41 localizedStringForKey:@"Year of Release" value:&stru_2702152D0 table:0];
    v43 = [v40 preferenceSpecifierNamed:v42 target:self set:0 get:sel_getYearOfRelease detail:0 cell:4 edit:0];
    [v3 addObject:v43];

    v44 = (void *)MEMORY[0x263F5FC40];
    v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v46 = [v45 localizedStringForKey:@"UDI" value:&stru_2702152D0 table:0];
    v47 = [v44 preferenceSpecifierNamed:v46 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v48 = [(HMHearingAidAboutViewController *)self getWatchUDI];
    [v47 setUserInfo:v48];

    [v3 addObject:v47];
  }
  v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v50 = [v49 localizedStringForKey:@"AirPods Pro" value:&stru_2702152D0 table:0];
  v51 = [(HMHearingAidAboutViewController *)self createGroupSpecifier:v50];
  [v3 addObject:v51];

  v52 = (void *)MEMORY[0x263F5FC40];
  v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v54 = [v53 localizedStringForKey:@"Feature Version" value:&stru_2702152D0 table:0];
  v55 = [v52 preferenceSpecifierNamed:v54 target:self set:0 get:sel_getFeatureVersion detail:0 cell:4 edit:0];
  [v3 addObject:v55];

  v56 = (void *)MEMORY[0x263F5FC40];
  v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v58 = [v57 localizedStringForKey:@"Update Version" value:&stru_2702152D0 table:0];
  v59 = [v56 preferenceSpecifierNamed:v58 target:self set:0 get:sel_getAccessoryUpdateVersion detail:0 cell:4 edit:0];
  [v3 addObject:v59];

  v60 = (void *)MEMORY[0x263F5FC40];
  v61 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v62 = [v61 localizedStringForKey:@"Year of Release" value:&stru_2702152D0 table:0];
  v63 = [v60 preferenceSpecifierNamed:v62 target:self set:0 get:sel_getYearOfRelease detail:0 cell:4 edit:0];
  [v3 addObject:v63];

  v64 = (void *)MEMORY[0x263F5FC40];
  v65 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v66 = [v65 localizedStringForKey:@"UDI" value:&stru_2702152D0 table:0];
  v67 = [v64 preferenceSpecifierNamed:v66 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v68 = [(HMHearingAidAboutViewController *)self getAccessoryUDI];
  [v67 setUserInfo:v68];

  [v3 addObject:v67];
  v69 = [(HMHearingAidAboutViewController *)self createGroupSpecifier:&stru_2702152D0];
  [v3 addObject:v69];

  v70 = (void *)MEMORY[0x263F5FC40];
  v71 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v72 = [v71 localizedStringForKey:@"Instructions for Use" value:&stru_2702152D0 table:0];
  v73 = [v70 preferenceSpecifierNamed:v72 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v3 addObject:v73];

  v74 = (void *)MEMORY[0x263F5FC40];
  v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v76 = [v75 localizedStringForKey:@"Manufacturer Address" value:&stru_2702152D0 table:0];
  v77 = [v74 preferenceSpecifierNamed:v76 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v3 addObject:v77];

  v78 = [(HMHearingAidAboutViewController *)self createGroupSpecifier:&stru_2702152D0];
  [v3 addObject:v78];

  v79 = (void *)MEMORY[0x263F5FC40];
  v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v81 = [v80 localizedStringForKey:@"Contact Apple Support" value:&stru_2702152D0 table:0];
  v82 = [v79 preferenceSpecifierNamed:v81 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v82 setButtonAction:sel_contactAppleSupportTapped];
  [v3 addObject:v82];
  uint64_t v83 = (int)*MEMORY[0x263F5FDB8];
  v84 = *(Class *)((char *)&self->super.super.super.super.super.isa + v83);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v83) = (Class)v3;
  id v85 = v3;

  id v86 = *(id *)((char *)&self->super.super.super.super.super.isa + v83);
  return v86;
}

- (id)createGroupSpecifier:(id)a3
{
  return (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:0 edit:0];
}

- (id)getFeatureVersion
{
  return @"1";
}

- (id)getYearOfRelease
{
  return @"2024";
}

- (id)getHostUpdateVersion
{
  v2 = NSString;
  id v3 = [(HMHearingAidAboutViewController *)self getFeatureVersion];
  v4 = [v2 stringWithFormat:@"%@.%@", v3, MGGetStringAnswer()];

  return v4;
}

- (id)getHostUDI
{
  v2 = NSString;
  id v3 = [(HMHearingAidAboutViewController *)self getHostUpdateVersion];
  v4 = [v2 stringWithFormat:@"%@%@", @"(01)00195949149924(10)", v3];

  return v4;
}

- (id)getWatchUpdateVersion
{
  id v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [v3 getActivePairedDevice];

  v5 = NSString;
  uint64_t v6 = [(HMHearingAidAboutViewController *)self getFeatureVersion];
  v7 = (void *)v6;
  if (v4)
  {
    v8 = [v4 valueForProperty:*MEMORY[0x263F57658]];
    v9 = [v5 stringWithFormat:@"%@.%@", v7, v8];
  }
  else
  {
    v9 = [v5 stringWithFormat:@"%@.%@", v6, &stru_2702152D0];
  }

  return v9;
}

- (id)getWatchUDI
{
  v2 = NSString;
  id v3 = [(HMHearingAidAboutViewController *)self getWatchUpdateVersion];
  v4 = [v2 stringWithFormat:@"%@%@", @"(01)00195950095074(10)", v3];

  return v4;
}

- (id)getAccessoryUpdateVersion
{
  id v3 = NSString;
  v4 = [(HMHearingAidAboutViewController *)self getFeatureVersion];
  v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"fwVersion"];
  v7 = [v3 stringWithFormat:@"%@.%@", v4, v6];

  return v7;
}

- (id)getAccessoryUDI
{
  v2 = NSString;
  id v3 = [(HMHearingAidAboutViewController *)self getAccessoryUpdateVersion];
  v4 = [v2 stringWithFormat:@"%@%@", @"(01)00195949149931(10)", v3];

  return v4;
}

- (id)getDevice
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    id v3 = @"iPad";
  }
  else {
    id v3 = @"iPhone";
  }
  v4 = v3;

  return v4;
}

- (void)contactAppleSupportTapped
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"https://getsupport.apple.com/?caller=aphap&PFC=PFC7000&category_id=SC0998&symptom_id=23669"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

@end