@interface MapsSettingsRideBookingController
- (BOOL)hasInstalledApplications;
- (id)_automaticallyEnableRideBookingExtensions:(id)a3;
- (id)extensionLookupPolicy;
- (id)localizedExtensionsFooter;
- (id)localizedExtensionsHeader;
- (id)specifiers;
- (void)_setAutomaticallyEnableRideBookingExtensions:(id)a3 specifier:(id)a4;
@end

@implementation MapsSettingsRideBookingController

- (BOOL)hasInstalledApplications
{
  BOOL IsEnabled = RideBookingIsEnabled();
  if (IsEnabled)
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsSettingsRideBookingController;
    LOBYTE(IsEnabled) = [(MapsSettingsExtensionBaseController *)&v5 hasInstalledApplications];
  }
  return IsEnabled;
}

- (id)extensionLookupPolicy
{
  return +[_MXExtensionManager _maps_lookupPolicyForRidesharingNonUIExtensions];
}

- (id)specifiers
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v13.receiver = self;
  v13.super_class = (Class)MapsSettingsRideBookingController;
  v4 = [(MapsSettingsExtensionBaseController *)&v13 specifiers];
  id v5 = [v3 initWithArray:v4];

  v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v7 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v8 = [v7 localizedStringForKey:@"Ride Booking Enable Extensions Switch Footer [Settings]" value:@"localized string not found" table:0];
  [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v5 addObject:v6];
  v9 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v10 = [v9 localizedStringForKey:@"Ride Booking Enable Extensions Switch Label [Settings]" value:@"localized string not found" table:0];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"_setAutomaticallyEnableRideBookingExtensions:specifier:" get:"_automaticallyEnableRideBookingExtensions:" detail:0 cell:6 edit:0];

  [v5 addObject:v11];
  [(MapsSettingsRideBookingController *)self setSpecifiers:v5];

  return v5;
}

- (id)_automaticallyEnableRideBookingExtensions:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[0], MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[1]);
}

- (void)_setAutomaticallyEnableRideBookingExtensions:(id)a3 specifier:(id)a4
{
}

- (id)localizedExtensionsHeader
{
  v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v3 = [v2 localizedStringForKey:@"Ride Booking Extensions Group Title [Settings]" value:@"localized string not found" table:0];

  return v3;
}

- (id)localizedExtensionsFooter
{
  v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v3 = [v2 localizedStringForKey:@"Ride Booking Extensions Footer [Settings]" value:@"localized string not found" table:0];

  return v3;
}

@end