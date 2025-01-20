@interface PHSettingsPrimaryCloudCallingBundleController
- (NSArray)specifiersArray;
- (id)labelValue;
- (id)parentListController;
- (id)specifiersWithSpecifier:(id)a3;
- (void)setSpecifiersArray:(id)a3;
@end

@implementation PHSettingsPrimaryCloudCallingBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PHSettingsPrimaryCloudCallingBundleController *)self specifiersArray];
  if (!v4
    && ((+[TUCallCapabilities supportsThumperCalling](TUCallCapabilities, "supportsThumperCalling") & 1) != 0|| +[TUCallCapabilities supportsRelayCalling](TUCallCapabilities, "supportsRelayCalling"))&& +[TUCallCapabilities supportsPrimaryCalling])
  {
    if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])
    {
      v11 = +[NSBundle bundleForClass:objc_opt_class()];
      v6 = [v11 localizedStringForKey:@"PRIMARY_CLOUD_CALLING_CELL_TITLE" value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

      v12 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"labelValue" detail:objc_opt_class() cell:2 edit:0];
      [v12 setIdentifier:@"PRIMARY_CLOUD_CALLING"];
      v13 = +[NSArray arrayWithObject:v12];
      [(PHSettingsPrimaryCloudCallingBundleController *)self setSpecifiersArray:v13];

      goto LABEL_23;
    }
  }
  else
  {
  }
  v5 = [(PHSettingsPrimaryCloudCallingBundleController *)self specifiersArray];

  if (v5) {
    goto LABEL_24;
  }
  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (+[TUCallCapabilities supportsThumperCalling])CFStringRef v7 = @"YES"; {
    else
    }
      CFStringRef v7 = @"NO";
    if (+[TUCallCapabilities supportsRelayCalling])CFStringRef v8 = @"YES"; {
    else
    }
      CFStringRef v8 = @"NO";
    if (+[TUCallCapabilities supportsPrimaryCalling])CFStringRef v9 = @"YES"; {
    else
    }
      CFStringRef v9 = @"NO";
    *(_DWORD *)buf = 138413058;
    if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])CFStringRef v10 = @"YES"; {
    else
    }
      CFStringRef v10 = @"NO";
    CFStringRef v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v9;
    __int16 v22 = 2112;
    CFStringRef v23 = v10;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Not showing the primary cloud-calling settings because: (supportsThumperCalling:%@ || supportsRelayCalling:%@) && supportsPrimaryCalling:%@ && supportsDisplayingFaceTimeVideoCalls:%@", buf, 0x2Au);
  }
LABEL_23:

LABEL_24:
  v14 = [(PHSettingsPrimaryCloudCallingBundleController *)self specifiersArray];

  return v14;
}

- (id)labelValue
{
  if (+[TUCallCapabilities isThumperCallingEnabled])
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    CFStringRef v4 = @"ON";
  }
  else if (+[TUCallCapabilities isRelayCallingEnabled])
  {
    unsigned int v5 = +[PHUIConfiguration preferShorterStrings];
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    if (v5) {
      CFStringRef v4 = @"NEARBY";
    }
    else {
      CFStringRef v4 = @"WHEN_NEARBY";
    }
  }
  else
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    CFStringRef v4 = @"OFF";
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

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