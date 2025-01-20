@interface PSSpecifier(DASettingsAdditions)
+ (id)buttonSpecifierWithTitle:()DASettingsAdditions target:action:confirmationInfo:;
+ (id)switchSpecifierWithTitle:()DASettingsAdditions target:setter:getter:key:;
@end

@implementation PSSpecifier(DASettingsAdditions)

+ (id)switchSpecifierWithTitle:()DASettingsAdditions target:setter:getter:key:
{
  id v11 = a7;
  v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:a4 set:a5 get:a6 detail:0 cell:6 edit:0];
  v13 = v12;
  if (v11) {
    [v12 setProperty:v11 forKey:*MEMORY[0x263F60170]];
  }

  return v13;
}

+ (id)buttonSpecifierWithTitle:()DASettingsAdditions target:action:confirmationInfo:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(id)objc_opt_class() preferenceSpecifierNamed:v9 target:v10 set:0 get:0 detail:0 cell:13 edit:0];
  v13 = v12;
  *(void *)&v12[*MEMORY[0x263F5FDF8]] = a5;
  if (v11) {
    [v12 setupWithDictionary:v11];
  }

  return v13;
}

@end