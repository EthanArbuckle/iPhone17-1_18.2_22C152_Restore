@interface MSSSettingsController
- (id)bundleIdentifier;
- (id)deepLinkURL;
- (id)paneTitleLocalizedResource;
- (id)pathComponentsLocalizedResource;
- (unint64_t)systemPolicyOptions;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MSSSettingsController

- (id)pathComponentsLocalizedResource
{
  v2 = +[MSSSettingsUtilities photosMainPaneLocalizedResource];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)deepLinkURL
{
  v2 = +[NSString stringWithFormat:@"%@/%@", @"settings-navigation://com.apple.Settings.Apps", @"com.apple.mobileslideshow"];
  v3 = +[NSURL URLWithString:v2];

  return v3;
}

- (id)paneTitleLocalizedResource
{
  return +[MSSSettingsUtilities photosMainPaneLocalizedResource];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSSSettingsController;
  [(SettingsBaseController *)&v7 viewDidAppear:a3];
  v4 = [(MSSSettingsController *)self paneTitleLocalizedResource];
  v5 = [(MSSSettingsController *)self pathComponentsLocalizedResource];
  v6 = [(MSSSettingsController *)self deepLinkURL];
  [(MSSSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobileslideshow" title:v4 localizedNavigationComponents:v5 deepLink:v6];
}

- (id)bundleIdentifier
{
  return @"com.apple.mobileslideshow";
}

- (unint64_t)systemPolicyOptions
{
  return 0x800000;
}

@end