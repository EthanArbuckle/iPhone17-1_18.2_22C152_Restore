@interface BuddyProximityPairingControllerStringProvider
- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4;
- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4;
- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4;
- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4;
@end

@implementation BuddyProximityPairingControllerStringProvider

- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_SETUP_PAIR_VISUAL_TITLE" deviceClass:location[0]];
  v6 = +[NSBundle mainBundle];
  id v7 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_SETUP_PAIR_VISUAL_MESSAGE" deviceClass:location[0]];
  v6 = +[NSBundle mainBundle];
  id v7 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  location[2] = self;
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

- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_SETUP_PAIR_MANUAL_MESSAGE" deviceClass:location[0]];
  id v6 = +[NSBundle mainBundle];
  id v7 = (id)SFLocalizedStringFromTableInBundleForLanguage();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v7;
}

@end