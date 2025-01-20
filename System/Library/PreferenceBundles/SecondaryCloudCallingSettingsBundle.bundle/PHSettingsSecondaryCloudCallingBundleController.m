@interface PHSettingsSecondaryCloudCallingBundleController
- (NSArray)specifiersArray;
- (id)labelValue;
- (id)parentListController;
- (id)specifiersWithSpecifier:(id)a3;
- (void)setSpecifiersArray:(id)a3;
@end

@implementation PHSettingsSecondaryCloudCallingBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PHSettingsSecondaryCloudCallingBundleController *)self specifiersArray];
  if (!v4
    && (+[TUCallCapabilities supportsPrimaryCalling] & 1) == 0)
  {
    if (!+[TUCallCapabilities supportsThumperCalling])goto LABEL_6; {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    }
    v4 = [v5 localizedStringForKey:@"SECONDARY_CLOUD_CALLING_CELL_TITLE" value:&stru_C520 table:@"SecondaryCloudCallingSettings"];

    v6 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"labelValue" detail:objc_opt_class() cell:2 edit:0];
    [v6 setIdentifier:@"SECONDARY_CLOUD_CALLING"];
    v7 = +[NSArray arrayWithObject:v6];
    [(PHSettingsSecondaryCloudCallingBundleController *)self setSpecifiersArray:v7];
  }
LABEL_6:

  return [(PHSettingsSecondaryCloudCallingBundleController *)self specifiersArray];
}

- (id)labelValue
{
  if (+[TUCallCapabilities isThumperCallingEnabled])
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    CFStringRef v4 = @"ON";
  }
  else
  {
    unsigned int v5 = +[TUCallCapabilities isRelayCallingEnabled];
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    if (v5) {
      CFStringRef v4 = @"WHEN_NEARBY";
    }
    else {
      CFStringRef v4 = @"OFF";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_C520 table:@"SecondaryCloudCallingSettings"];

  return v6;
}

- (id)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return WeakRetained;
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