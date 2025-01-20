@interface PHBlocklistSettingsBundleController
- (NSArray)specifiersArray;
- (PSListController)parentListController;
- (id)specifiersWithSpecifier:(id)a3;
- (void)setSpecifiersArray:(id)a3;
@end

@implementation PHBlocklistSettingsBundleController

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PHBlocklistSettingsBundleController *)self specifiersArray];

  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PHBlocklistSettingsStrings localizedStringForKey:@"BLOCKLIST_MAIN_SPECIFIER_TITLE"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    v8 = v7;
    if (v7)
    {
      [v7 setIdentifier:@"BLOCKLIST_SETTINGS_MAIN_SPECIFIER_IDENTIFIER"];
      [v5 addObject:v8];
    }
    id v9 = [v5 copy];
    [(PHBlocklistSettingsBundleController *)self setSpecifiersArray:v9];
  }

  return [(PHBlocklistSettingsBundleController *)self specifiersArray];
}

- (NSArray)specifiersArray
{
  return self->_specifiersArray;
}

- (void)setSpecifiersArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end