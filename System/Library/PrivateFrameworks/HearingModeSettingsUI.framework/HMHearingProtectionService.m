@interface HMHearingProtectionService
+ (BOOL)shouldShowHearingProtectionForDevice:(id)a3;
+ (id)getSpecifiersForDevice:(id)a3 device:(id)a4;
@end

@implementation HMHearingProtectionService

+ (BOOL)shouldShowHearingProtectionForDevice:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v4 = [MEMORY[0x263F47538] sharedInstance];
    int v5 = [v4 activeHearingProtectionAvailableForAddress:v3];

    v6 = "NO";
    if (v5) {
      v6 = "YES";
    }
    NSLog(&cfstr_HearingProtect_4.isa, v6, v3, v6, "YES");
  }
  else
  {
    NSLog(&cfstr_HearingProtect_3.isa);
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)getSpecifiersForDevice:(id)a3 device:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Hearing Protection" value:&stru_2702152D0 table:0];
  v10 = [v7 preferenceSpecifierNamed:v9 target:a1 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v13 = @"bt-address";
  v14[0] = v5;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  [v10 setUserInfo:v11];
  [v10 setIdentifier:@"HEARING_PROTECTION_ID"];
  [v6 addObject:v10];

  return v6;
}

@end