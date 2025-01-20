@interface ILClassificationAndReportingSettingsBundleController
- (NSArray)specifiersArray;
- (id)specifiersWithSpecifier:(id)a3;
- (void)setSpecifiersArray:(id)a3;
@end

@implementation ILClassificationAndReportingSettingsBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(ILClassificationAndReportingSettingsBundleController *)self specifiersArray];

  if (!v4)
  {
    v5 = +[NSMutableArray arrayWithCapacity:1];
    v6 = +[ILClassificationSettingsStrings localizedStringForKey:@"REPORTING_MARKETING_NAME"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    v8 = v7;
    if (v7)
    {
      [v7 setIdentifier:@"CLASSIFICATION_AND_REPORTING"];
      [v5 addObject:v8];
      [(ILClassificationAndReportingSettingsBundleController *)self setSpecifiersArray:v5];
    }
  }

  return [(ILClassificationAndReportingSettingsBundleController *)self specifiersArray];
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