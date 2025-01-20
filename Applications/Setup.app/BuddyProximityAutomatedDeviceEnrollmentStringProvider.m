@interface BuddyProximityAutomatedDeviceEnrollmentStringProvider
- (id)_titleWithLocalDeviceClass:(id)a3 language:(id)a4;
- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4;
- (id)textualPairingButtonTitleWithLanguage:(id)a3;
- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4;
- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4;
- (id)visualPairingButtonTitleWithLanguage:(id)a3;
- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4;
@end

@implementation BuddyProximityAutomatedDeviceEnrollmentStringProvider

- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentStringProvider *)v9 _titleWithLocalDeviceClass:location[0] language:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v5 = +[NSBundle mainBundle];
  id v6 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentStringProvider *)v9 _titleWithLocalDeviceClass:location[0] language:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v5 = +[NSBundle mainBundle];
  id v6 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)visualPairingButtonTitleWithLanguage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle];
  id v4 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(location, 0);

  return v4;
}

- (id)textualPairingButtonTitleWithLanguage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle];
  id v4 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(location, 0);

  return v4;
}

- (id)_titleWithLocalDeviceClass:(id)a3 language:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = @"PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_PAIRING_TITLE";
  id v5 = +[BuddyLocalizationUtilities modelSpecificLocalizedStringKeyForKey:v9 deviceClass:location[0]];
  id v6 = +[NSBundle mainBundle];
  id v7 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);

  return v7;
}

@end