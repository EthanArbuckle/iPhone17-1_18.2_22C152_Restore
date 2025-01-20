@interface MapsSettingsController
+ (id)parkedCarEnabled:(id)a3;
- (BOOL)isThirdPartyPhotoSharingStatusLoading;
- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreference;
- (MapsOfflineUIHelper)offlineHelper;
- (MapsSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (MapsSettingsEVRoutingController)evRoutingController;
- (MapsSettingsRestaurantBookingController)restaurantBookingController;
- (MapsSettingsRideBookingController)rideBookingController;
- (PSSystemPolicyForApp)appPolicy;
- (id)_allowEmailCorrespondence:(id)a3;
- (id)_enableAutomaticUpdates:(id)a3;
- (id)_enableOfflineSyncToWatch:(id)a3;
- (id)_enableOnlyUseOfflineMaps:(id)a3;
- (id)_enableOptimizeStorage:(id)a3;
- (id)_enableShareETA:(id)a3;
- (id)_labelLanguageAlwaysUILanguage:(id)a3;
- (id)_offlineDownloadSettingsMenu;
- (id)_privacyIdentifiersForContributeToMapsSection;
- (id)_showAirQualityIndex:(id)a3;
- (id)_showWeatherConditions:(id)a3;
- (id)_specifierIDForTransportType:(int64_t)a3;
- (id)_thirdPartyPhotoSharingEnabled:(id)a3;
- (id)allowsAddingRatingsAndPhotos:(id)a3;
- (id)enableImproveEVRouting:(id)a3;
- (id)lagunaBeachSiriSuggestionsEnabled:(id)a3;
- (id)parkedCarEnabled:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)_addOfflineSpecifiers:(id)a3;
- (void)_addShareETASpecifiers:(id)a3;
- (void)_appendPrivacyFooterFromBundleIdentifiers:(id)a3 toGroupSpecifier:(id)a4 selector:(SEL)a5;
- (void)_presentContributeToMapsPrivacySplashViewController;
- (void)_presentMapsAppPrivacySplashViewController;
- (void)_presentPrivacySplashViewControllerForIdentifiers:(id)a3;
- (void)_refreshThirdPartyPhotoSharingStatus;
- (void)_setAllowEmailCorrespondence:(id)a3 specifier:(id)a4;
- (void)_setAllowsAddingRatingsAndPhotos:(id)a3 specifier:(id)a4;
- (void)_setEnableAutomaticUpdates:(id)a3 specifier:(id)a4;
- (void)_setEnableOfflineSyncToWatch:(id)a3 specifier:(id)a4;
- (void)_setEnableOnlyUseOfflineMaps:(id)a3 specifier:(id)a4;
- (void)_setEnableOptimizeStorage:(id)a3 specifier:(id)a4;
- (void)_setEnableShareETA:(id)a3 specifier:(id)a4;
- (void)_setLabelLanguageAlwaysUILanguage:(id)a3 specifier:(id)a4;
- (void)_setLagunaBeachSiriSuggestionsEnabled:(id)a3 specifier:(id)a4;
- (void)_setParkedCarEnabled:(id)a3 specifier:(id)a4;
- (void)_setShowAirQualityIndex:(id)a3 specifier:(id)a4;
- (void)_setShowWeatherConditions:(id)a3 specifier:(id)a4;
- (void)_setThirdPartyPhotoSharingEnabled:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)didUpdateEVApplications:(id)a3;
- (void)didUpdateElectricVehicleCount:(unint64_t)a3;
- (void)setAppPolicy:(id)a3;
- (void)setEnableImproveEVRouting:(id)a3 specifier:(id)a4;
- (void)setEvRoutingController:(id)a3;
- (void)setOfflineHelper:(id)a3;
- (void)setRestaurantBookingController:(id)a3;
- (void)setRideBookingController:(id)a3;
- (void)setThirdPartyPhotoSharingPreference:(id)a3;
- (void)setThirdPartyPhotoSharingStatusLoading:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MapsSettingsController

- (MapsSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MapsSettingsController;
  v8 = [(MapsSettingBaseController *)&v28 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_21BA4;
    v25 = &unk_729D8;
    objc_copyWeak(&v26, &location);
    v9 = objc_retainBlock(&v22);
    v10 = [MapsSettingsRideBookingController alloc];
    v11 = -[MapsSettingsExtensionBaseController initWithUpdateHandler:](v10, "initWithUpdateHandler:", v9, v22, v23, v24, v25);
    v12 = *(void **)(v8 + 243);
    *(void *)(v8 + 243) = v11;

    v13 = [(MapsSettingsExtensionBaseController *)[MapsSettingsRestaurantBookingController alloc] initWithUpdateHandler:v9];
    v14 = *(void **)(v8 + 251);
    *(void *)(v8 + 251) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = *(void **)(v8 + 259);
    *(void *)(v8 + 259) = v15;

    [*(id *)(v8 + 259) setDelegate:v8];
    v17 = objc_alloc_init(MapsOfflineUIHelper);
    v18 = *(void **)(v8 + 267);
    *(void *)(v8 + 267) = v17;

    +[GEOUserSession setInitialShareSessionWithMaps:1];
    id v19 = &_dispatch_main_q;
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    v20 = v8;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return (MapsSettingsController *)v8;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)MapsSettingsController;
  [(MapsSettingBaseController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MapsSettingsController;
  [(MapsSettingBaseController *)&v10 viewWillAppear:a3];
  v4 = MapsRAPContactBackEmailAddress();
  if (([v4 isEqualToString:*(void *)(&self->super + 1)] & 1) == 0)
  {
    objc_storeStrong((id *)(&self->super + 1), v4);
    [(MapsSettingsController *)self reloadSpecifiers];
  }
  [(MapsSettingsController *)self _refreshThirdPartyPhotoSharingStatus];
  v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [(MapsSettingsController *)self view];
  id v7 = [v6 window];
  v8 = [v7 windowScene];
  [v5 addObserver:self selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:v8];

  v9 = [(MapsSettingsController *)self offlineHelper];
  [v9 addObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MapsSettingsController;
  [(MapsSettingsController *)&v9 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(MapsSettingsController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  [v4 removeObserver:self name:UISceneWillEnterForegroundNotification object:v7];

  v8 = [(MapsSettingsController *)self offlineHelper];
  [v8 removeObserver:self];
}

- (id)_showAirQualityIndex:(id)a3
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return +[NSNumber numberWithBool:BOOL];
}

- (void)_setShowAirQualityIndex:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_showWeatherConditions:(id)a3
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return +[NSNumber numberWithBool:BOOL];
}

- (void)_setShowWeatherConditions:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_specifierIDForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"TransportTypePreferenceDrivingID";
  }
  else {
    return off_72A70[a3 - 1];
  }
}

- (id)_labelLanguageAlwaysUILanguage:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", NavigationConfig_MapLocalizeLabels[0], NavigationConfig_MapLocalizeLabels[1]);
}

- (void)_setLabelLanguageAlwaysUILanguage:(id)a3 specifier:(id)a4
{
}

- (id)_allowEmailCorrespondence:(id)a3
{
  BOOL v3 = +[MapsSettings allowEmailCorrespondence];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setAllowEmailCorrespondence:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  +[MapsSettings setAllowEmailCorrespondence:](MapsSettings, "setAllowEmailCorrespondence:", [v4 BOOLValue]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5) {
    uint64_t v6 = 17088;
  }
  else {
    uint64_t v6 = 17089;
  }

  +[GEOAPPortal captureUserAction:v6 target:0 value:0];
}

- (id)selectSpecifier:(id)a3
{
  id v4 = (PSSpecifier *)a3;
  unsigned int v5 = v4;
  if (*(PSSpecifier **)((char *)&self->_preferredTransportTypeSpecifiers + 3) == v4)
  {
    uint64_t v6 = [(MapsSettingsController *)self rideBookingController];
  }
  else if (*(PSSpecifier **)((char *)&self->_rideBookingLinkSpecifier + 3) == v4)
  {
    uint64_t v6 = [(MapsSettingsController *)self restaurantBookingController];
  }
  else if (*(PSSpecifier **)((char *)&self->_restaurantBookingLinkSpecifier + 3) == v4)
  {
    uint64_t v6 = [(MapsSettingsController *)self evRoutingController];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsSettingsController;
    uint64_t v6 = [(MapsSettingsController *)&v9 selectSpecifier:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MapsSettingsController;
  id v6 = a4;
  [(MapsSettingsController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[MapsSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  v8 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndexedSubscript:v7];
  objc_super v9 = [v8 propertyForKey:PSValueKey];
  if ([*(id *)((char *)&self->_emailAddress + 3) containsObject:v8])
  {
    objc_super v10 = (char *)[v9 integerValue];
    GEOSetUserTransportTypePreference();
    v11 = +[MKMapService sharedService];
    v12 = v11;
    if ((unint64_t)(v10 - 1) > 3) {
      uint64_t v13 = 5025;
    }
    else {
      uint64_t v13 = dword_45DC0[(void)(v10 - 1)];
    }
    [v11 captureUserAction:v13 onTarget:602 eventValue:0];
  }
}

- (id)specifiers
{
  BOOL v3 = +[NSMutableArray array];
  id v4 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.Maps"];
  [(MapsSettingsController *)self setAppPolicy:v4];

  unsigned int v5 = [(MapsSettingsController *)self appPolicy];
  id v6 = [v5 specifiersForPolicyOptions:8486915 force:0];

  [v3 addObjectsFromArray:v6];
  CFStringRef v168 = @"com.apple.onboarding.maps";
  id v7 = +[NSArray arrayWithObjects:&v168 count:1];
  v162 = v6;
  v8 = [v6 firstObject];
  [(MapsSettingsController *)self _appendPrivacyFooterFromBundleIdentifiers:v7 toGroupSpecifier:v8 selector:"_presentMapsAppPrivacySplashViewController"];

  [(MapsSettingsController *)self _addOfflineSpecifiers:v3];
  objc_super v9 = (NSString *)objc_alloc_init((Class)NSMutableSet);
  objc_super v10 = *(NSString **)((char *)&self->_emailAddress + 3);
  *(NSString **)((char *)&self->_emailAddress + 3) = v9;

  v11 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v12 = [v11 localizedStringForKey:@"Default Transportation Mode Title [Settings]" value:@"localized string not found" table:0];
  uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  [v13 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  uint64_t v14 = PSIDKey;
  [v13 setProperty:@"TransportTypePreferenceGroupID" forKey:PSIDKey];
  uint64_t v15 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v16 = [v15 localizedStringForKey:@"Default Transportation Mode Footer [Settings]" value:@"localized string not found" table:0];
  uint64_t v156 = PSFooterTextGroupKey;
  objc_msgSend(v13, "setProperty:forKey:", v16);

  v161 = v13;
  [v3 addObject:v13];
  v17 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v18 = [v17 localizedStringForKey:@"Driving Transportation Mode Label [Settings]" value:@"localized string not found" table:0];
  id v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v19 setProperty:@"TransportTypePreferenceDrivingID" forKey:v14];
  uint64_t v20 = PSValueKey;
  [v19 setProperty:&off_7CD30 forKey:PSValueKey];
  v166 = v3;
  [v3 addObject:v19];
  [*(id *)((char *)&self->_emailAddress + 3) addObject:v19];
  v21 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v22 = [v21 localizedStringForKey:@"Walking Transportation Mode Label [Settings]" value:@"localized string not found" table:0];
  uint64_t v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v23 setProperty:@"TransportTypePreferenceWalkingID" forKey:v14];
  [v23 setProperty:&off_7CD48 forKey:v20];
  [v3 addObject:v23];
  [*(id *)((char *)&self->_emailAddress + 3) addObject:v23];
  v24 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v25 = [v24 localizedStringForKey:@"Transit Transportation Mode Label [Settings]" value:@"localized string not found" table:0];
  id v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v165 = v14;
  [v26 setProperty:@"TransportTypePreferenceTransitID" forKey:v14];
  [v26 setProperty:&off_7CD60 forKey:v20];
  [v3 addObject:v26];
  [*(id *)((char *)&self->_emailAddress + 3) addObject:v26];
  v27 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  objc_super v28 = [v27 localizedStringForKey:@"Cycling Transportation Mode Label [Settings]" value:@"localized string not found" table:0];
  v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v29 setProperty:@"TransportTypePreferenceBicycleID" forKey:v14];
  [v29 setProperty:&off_7CD78 forKey:v20];
  [v3 addObject:v29];
  [*(id *)((char *)&self->_emailAddress + 3) addObject:v29];
  v30 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v31 = [v30 localizedStringForKey:@"Default Transportation Mode" value:@"localized string not found" table:0];

  v32 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v33 = [v32 localizedStringForKey:@"Directions Group Label [Settings]" value:@"localized string not found" table:0];
  uint64_t v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  v160 = (void *)v34;
  [v3 addObject:v34];
  v35 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  uint64_t v36 = [v35 localizedStringForKey:@"Driving Group Title [Settings]" value:@"localized string not found" table:0];

  v159 = (void *)v36;
  v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v37 setProperty:@"DrivingLinkPreferenceID" forKey:v165];
  v38 = v3;
  [v3 addObject:v37];
  v39 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  uint64_t v40 = [v39 localizedStringForKey:@"Walking Label [Settings]" value:@"localized string not found" table:0];

  v158 = (void *)v40;
  v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v41 setProperty:@"WalkingLinkPreferenceID" forKey:v165];
  [v3 addObject:v41];
  v42 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v43 = [v42 localizedStringForKey:@"Transit Label [Settings]" value:@"localized string not found" table:0];
  v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v44 setProperty:@"TransitLinkPreferenceID" forKey:v165];
  [v3 addObject:v44];
  v45 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v46 = [v45 localizedStringForKey:@"Cycling Label [Settings]" value:@"localized string not found" table:0];
  v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  v48 = v166;
  [v47 setProperty:@"CyclingLinkPreferenceID" forKey:v165];
  [v166 addObject:v47];
  v167 = self;
  if ([(MapsSettingBaseController *)self supportsNavigation])
  {
    v49 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v38 addObject:v49];
    v50 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v51 = [v50 localizedStringForKey:@"Spoken Directions Label [Settings]" value:@"localized string not found" table:0];
    v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    v48 = v166;
    [v52 setProperty:@"NavigationGuidanceLinkPreferenceID" forKey:v165];
    [v166 addObject:v52];
    [(MapsSettingsController *)self _addShareETASpecifiers:v166];

    v47 = v52;
  }
  v53 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v54 = [v53 localizedStringForKey:@"Climate Group Label [Settings]" value:@"localized string not found" table:0];
  uint64_t v55 = +[PSSpecifier preferenceSpecifierNamed:v54 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  v157 = (void *)v55;
  [v48 addObject:v55];
  v56 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v57 = [v56 localizedStringForKey:@"Air Quality Index Switch Label [Settings]" value:@"localized string not found" table:0];
  v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:"_setShowAirQualityIndex:specifier:" get:"_showAirQualityIndex:" detail:0 cell:6 edit:0];

  uint64_t v59 = PSEnabledKey;
  [v58 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v58 setProperty:@"AirQualityPreferenceID" forKey:v165];
  [v166 addObject:v58];
  v60 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v61 = [v60 localizedStringForKey:@"Air Quality Index" value:@"localized string not found" table:0];

  v62 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v63 = [v62 localizedStringForKey:@"Weather Conditions Switch Label [Settings]" value:@"localized string not found" table:0];
  v64 = +[PSSpecifier preferenceSpecifierNamed:v63 target:self set:"_setShowWeatherConditions:specifier:" get:"_showWeatherConditions:" detail:0 cell:6 edit:0];

  v65 = v166;
  [v64 setProperty:&__kCFBooleanTrue forKey:v59];
  [v64 setProperty:@"WeatherConditionsPreferenceID" forKey:v165];
  [v166 addObject:v64];
  v66 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v67 = [v66 localizedStringForKey:@"Weather Conditions" value:@"localized string not found" table:0];

  uint64_t v164 = v59;
  if ([(MapsSettingBaseController *)self canLocalizeLabels])
  {
    v68 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v69 = [v68 localizedStringForKey:@"Label Language Group Title [Settings]" value:@"localized string not found" table:0];
    v70 = +[PSSpecifier preferenceSpecifierNamed:v69 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v166 addObject:v70];
    v71 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v72 = [v71 localizedStringForKey:@"Label Language Switch Label [Settings]" value:@"localized string not found" table:0];
    v73 = +[PSSpecifier preferenceSpecifierNamed:v72 target:self set:"_setLabelLanguageAlwaysUILanguage:specifier:" get:"_labelLanguageAlwaysUILanguage:" detail:0 cell:6 edit:0];

    [v73 setProperty:&__kCFBooleanTrue forKey:v59];
    [v73 setProperty:@"LabelLanguageAlwaysUIPreferenceID" forKey:v165];
    [v166 addObject:v73];
    v74 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v75 = [v74 localizedStringForKey:@"Always in English" value:@"localized string not found" table:0];

    v163 = v73;
  }
  else
  {
    v163 = v64;
  }
  if (MapsFeature_IsEnabled_EVRouting())
  {
    v76 = [(MapsSettingsController *)self evRoutingController];
    BOOL v77 = [v76 electricVehicleCount] != 0;
  }
  else
  {
    BOOL v77 = 0;
  }
  if (MapsFeature_IsEnabled_LagunaBeach()) {
    int HaveValidAccountForMakingContributions = GEODoesUserHaveValidAccountForMakingContributions();
  }
  else {
    int HaveValidAccountForMakingContributions = 0;
  }
  if ((v77 | HaveValidAccountForMakingContributions) == 1)
  {
    v79 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v80 = [v79 localizedStringForKey:@"Contribute to Maps [Settings]" value:@"localized string not found" table:0];
    v81 = +[PSSpecifier preferenceSpecifierNamed:v80 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v166 addObject:v81];
    if (HaveValidAccountForMakingContributions)
    {
      v82 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v83 = [v82 localizedStringForKey:@"Ratings and Photos [Laguna Beach][Settings]" value:@"localized string not found" table:0];
      v84 = +[PSSpecifier preferenceSpecifierNamed:v83 target:self set:"_setAllowsAddingRatingsAndPhotos:specifier:" get:"allowsAddingRatingsAndPhotos:" detail:0 cell:6 edit:0];

      [v84 setProperty:&__kCFBooleanTrue forKey:v59];
      [v166 addObject:v84];

      v65 = v166;
      v85 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v86 = [v85 localizedStringForKey:@"Show Ratings and Photos Suggestions [Laguna Beach][Settings]" value:@"localized string not found" table:0];
      v87 = +[PSSpecifier preferenceSpecifierNamed:v86 target:self set:"_setLagunaBeachSiriSuggestionsEnabled:specifier:" get:"lagunaBeachSiriSuggestionsEnabled:" detail:0 cell:6 edit:0];

      [v87 setProperty:&__kCFBooleanTrue forKey:v59];
      [v87 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v166 addObject:v87];
    }
    if (v77)
    {
      v88 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v89 = [v88 localizedStringForKey:@"Improve EV Routing [Settings]" value:@"localized string not found" table:0];
      v90 = +[PSSpecifier preferenceSpecifierNamed:v89 target:self set:"setEnableImproveEVRouting:specifier:" get:"enableImproveEVRouting:" detail:0 cell:6 edit:0];

      [v90 setProperty:&__kCFBooleanTrue forKey:v59];
      [v90 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v65 addObject:v90];
    }
    v91 = [(MapsSettingsController *)self _privacyIdentifiersForContributeToMapsSection];
    if ([v91 count]) {
      [(MapsSettingsController *)self _appendPrivacyFooterFromBundleIdentifiers:v91 toGroupSpecifier:v81 selector:"_presentContributeToMapsPrivacySplashViewController"];
    }
  }
  if ((MapsFeature_IsEnabled_SydneyARP() & HaveValidAccountForMakingContributions) == 1)
  {
    v92 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v93 = [v92 localizedStringForKey:@"Photo Use [Settings]" value:@"localized string not found" table:0];
    v94 = +[PSSpecifier preferenceSpecifierNamed:v93 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v65 addObject:v94];
    v95 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v96 = [v95 localizedStringForKey:@"Allow Photo Providers to Use Your Photos [Settings]" value:@"localized string not found" table:0];
    +[PSSpecifier preferenceSpecifierNamed:v96 target:self set:"_setThirdPartyPhotoSharingEnabled:specifier:" get:"_thirdPartyPhotoSharingEnabled:" detail:0 cell:6 edit:0];
    v98 = v97 = v65;

    [v98 setProperty:&__kCFBooleanTrue forKey:v59];
    [v98 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v99 = +[NSNumber numberWithBool:[(MapsSettingsController *)v167 isThirdPartyPhotoSharingStatusLoading]];
    [v98 setProperty:v99 forKey:PSControlIsLoadingKey];

    [v97 addObject:v98];
    v100 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v101 = [v100 localizedStringForKey:@"Photo Sharing Footer [Settings]" value:@"localized string not found" table:0];
    [v94 setProperty:v101 forKey:v156];
  }
  v102 = *(NSMutableSet **)((char *)&v167->_preferredTransportTypeSpecifiers + 3);
  *(NSMutableSet **)((char *)&v167->_preferredTransportTypeSpecifiers + 3) = 0;

  v103 = *(PSSpecifier **)((char *)&v167->_rideBookingLinkSpecifier + 3);
  *(PSSpecifier **)((char *)&v167->_rideBookingLinkSpecifier + 3) = 0;

  v104 = *(PSSpecifier **)((char *)&v167->_restaurantBookingLinkSpecifier + 3);
  *(PSSpecifier **)((char *)&v167->_restaurantBookingLinkSpecifier + 3) = 0;

  v105 = [(MapsSettingsController *)v167 rideBookingController];
  unsigned int v106 = [v105 hasInstalledApplications];

  v107 = [(MapsSettingsController *)v167 restaurantBookingController];
  unsigned int v108 = [v107 hasInstalledApplications];

  if (MapsFeature_IsEnabled_EVRouting())
  {
    v109 = [(MapsSettingsController *)v167 evRoutingController];
    unsigned int v110 = [v109 hasInstalledApplications];
  }
  else
  {
    unsigned int v110 = 0;
  }
  if (((v106 | v108) & 1) != 0 || v110)
  {
    v111 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v112 = [v111 localizedStringForKey:@"Extensions Group Title [Settings]" value:@"localized string not found" table:0];
    v113 = +[PSSpecifier preferenceSpecifierNamed:v112 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v166 addObject:v113];
    if (v106)
    {
      v114 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v115 = [v114 localizedStringForKey:@"Ride Booking Row [Settings]" value:@"localized string not found" table:0];
      v116 = +[PSSpecifier preferenceSpecifierNamed:v115 target:0 set:0 get:0 detail:0 cell:1 edit:0];

      [(NSMutableSet *)v116 setProperty:&__kCFBooleanTrue forKey:v59];
      [v166 addObject:v116];
      v117 = *(NSMutableSet **)((char *)&v167->_preferredTransportTypeSpecifiers + 3);
      *(NSMutableSet **)((char *)&v167->_preferredTransportTypeSpecifiers + 3) = v116;
    }
    if (v108)
    {
      v118 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v119 = [v118 localizedStringForKey:@"Restaurant Booking Row [Settings]" value:@"localized string not found" table:0];
      v120 = +[PSSpecifier preferenceSpecifierNamed:v119 target:0 set:0 get:0 detail:0 cell:1 edit:0];

      [v166 addObject:v120];
      [v120 setProperty:&__kCFBooleanTrue forKey:v59];
      v121 = *(PSSpecifier **)((char *)&v167->_rideBookingLinkSpecifier + 3);
      *(PSSpecifier **)((char *)&v167->_rideBookingLinkSpecifier + 3) = (PSSpecifier *)v120;
    }
    if (v110)
    {
      v122 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v123 = [v122 localizedStringForKey:@"EV Routing Row [Settings]" value:@"localized string not found" table:0];
      v124 = +[PSSpecifier preferenceSpecifierNamed:v123 target:0 set:0 get:0 detail:0 cell:1 edit:0];

      [v166 addObject:v124];
      [v124 setProperty:&__kCFBooleanTrue forKey:v59];
      v125 = *(PSSpecifier **)((char *)&v167->_restaurantBookingLinkSpecifier + 3);
      *(PSSpecifier **)((char *)&v167->_restaurantBookingLinkSpecifier + 3) = (PSSpecifier *)v124;
    }
  }
  int AutomaticParkedCarLocationSupported = IsFetchAutomaticParkedCarLocationSupported();
  v127 = +[MCProfileConnection sharedConnection];
  if ([v127 userMode] == 1)
  {
    v128 = v166;
LABEL_45:

    goto LABEL_46;
  }
  unsigned int v129 = [v127 isEphemeralMultiUser];

  v128 = v166;
  if ((AutomaticParkedCarLocationSupported & (v129 ^ 1)) == 1)
  {
    uint64_t v130 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v131 = [(id)v130 localizedStringForKey:@"Parked Car Group Tile [Settings]" value:@"localized string not found" table:0];
    v127 = +[PSSpecifier preferenceSpecifierNamed:v131 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    v132 = [(MapsSettingsController *)v167 parkedCarEnabled:0];
    LOBYTE(v130) = [v132 BOOLValue];

    if (v130)
    {
      int v133 = MGGetBoolAnswer();
      v134 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v135 = v134;
      if (v133) {
        CFStringRef v136 = @"Parked Car Footer [Settings]";
      }
      else {
        CFStringRef v136 = @"Parked Car Footer [No CarPlay support] [Settings]";
      }
    }
    else
    {
      v134 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v135 = v134;
      CFStringRef v136 = @"Parked Car Footer [Disabled] [Settings]";
    }
    v137 = [v134 localizedStringForKey:v136 value:@"localized string not found" table:0];
    [v127 setProperty:v137 forKey:v156];

    [v166 addObject:v127];
    v138 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v139 = [v138 localizedStringForKey:@"Parked Car Switch Title [Settings]" value:@"localized string not found" table:0];
    v140 = +[PSSpecifier preferenceSpecifierNamed:v139 target:v167 set:"_setParkedCarEnabled:specifier:" get:"parkedCarEnabled:" detail:0 cell:6 edit:0];

    v141 = +[MCProfileConnection sharedConnection];
    LODWORD(v139) = [v141 BOOLRestrictionForFeature:MCFeatureFindMyCarAllowed];

    if (v139) {
      [v140 setProperty:&__kCFBooleanFalse forKey:v164];
    }
    [v140 setProperty:@"ParkedCarPreferenceID" forKey:v165];
    [v166 addObject:v140];
    v142 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v143 = [v142 localizedStringForKey:@"Parked Car" value:@"localized string not found" table:0];

    v163 = v140;
    goto LABEL_45;
  }
LABEL_46:
  if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) == 0
    && _MKRAPIsAvailable()
    && *(void *)(&v167->super + 1))
  {
    v144 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v145 = [v144 localizedStringForKey:@"Report an Issue Group Title [Settings]" value:@"localized string not found" table:0];
    v146 = +[PSSpecifier preferenceSpecifierNamed:v145 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v128 addObject:v146];
    v147 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v148 = [v147 localizedStringForKey:@"Email Correspondence Switch Label [Settings]" value:@"localized string not found" table:0];
    v149 = +[PSSpecifier preferenceSpecifierNamed:v148 target:v167 set:"_setAllowEmailCorrespondence:specifier:" get:"_allowEmailCorrespondence:" detail:0 cell:6 edit:0];

    [v149 setProperty:&__kCFBooleanTrue forKey:v164];
    v150 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v151 = [v150 localizedStringForKey:@"Report an Issue Explanation (Format) [Settings]" value:@"localized string not found" table:0];
    v152 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v151, *(void *)(&v167->super + 1));

    [v149 setProperty:v152 forKey:v156];
    [v128 addObject:v149];
  }
  else
  {
    v149 = v163;
  }
  [(MapsSettingsController *)v167 setSpecifiers:v128];
  v153 = [(MapsSettingsController *)v167 _specifierIDForTransportType:GEOGetUserTransportTypePreference()];
  v154 = [(MapsSettingsController *)v167 specifierForID:v153];
  [v161 setProperty:v154 forKey:PSRadioGroupCheckedSpecifierKey];

  return v128;
}

- (void)_addOfflineSpecifiers:(id)a3
{
  id v59 = a3;
  if (GEOSupportsOfflineMaps())
  {
    id v4 = [(MapsSettingsController *)self offlineHelper];
    unsigned int v5 = [v4 subscriptions];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v8 = [v7 localizedStringForKey:@"Offline Maps [Settings]" value:@"localized string not found" table:0];
      objc_super v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      [v59 addObject:v9];
      uint64_t v10 = [(MapsSettingsController *)self _offlineDownloadSettingsMenu];
      uint64_t v55 = (void *)v10;
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
        uint64_t v13 = [v12 localizedStringForKey:@"Downloads [Settings]" value:@"localized string not found" table:0];
        uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, -1, 0, v55);

        uint64_t v15 = objc_opt_class();
        uint64_t v16 = PSCellClassKey;
        [v14 setProperty:v15 forKey:PSCellClassKey];
        uint64_t v17 = PSEnabledKey;
        [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
        [v14 setUserInfo:v11];
        [v59 addObject:v14];
        objc_super v9 = v14;
      }
      else
      {
        uint64_t v17 = PSEnabledKey;
        uint64_t v16 = PSCellClassKey;
      }
      v18 = [(MapsSettingsController *)self offlineHelper];
      id v19 = [v18 totalOfflineDataSize];
      unint64_t updated = GEOMaximumAutomaticUpdateOfflineDataSize();

      v21 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v22 = [v21 localizedStringForKey:@"Automatic Updates [Settings]" value:@"localized string not found" table:0];
      uint64_t v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"_setEnableAutomaticUpdates:specifier:" get:"_enableAutomaticUpdates:" detail:0 cell:6 edit:0];

      v24 = +[NSNumber numberWithBool:(unint64_t)v19 <= updated];
      [v23 setProperty:v24 forKey:v17];

      uint64_t v56 = PSAllowMultilineTitleKey;
      objc_msgSend(v23, "setProperty:forKey:", &__kCFBooleanTrue);
      [v23 setProperty:objc_opt_class() forKey:v16];
      uint64_t v57 = v17;
      uint64_t v58 = v16;
      if ((unint64_t)v19 > updated)
      {
        id v25 = objc_alloc_init((Class)NSByteCountFormatter);
        id v26 = [v25 stringFromByteCount:GEOMaximumAutomaticUpdateOfflineDataSize()];
        objc_super v28 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
        v29 = [v28 localizedStringForKey:@"Automatic Updates Subtitle Disabled [Settings]" value:@"localized string not found" table:0];
        v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v29, v26);
        uint64_t v27 = PSTableCellSubtitleTextKey;
        [v23 setProperty:v30 forKey:PSTableCellSubtitleTextKey];
      }
      else
      {
        id v25 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
        id v26 = [v25 localizedStringForKey:@"Automatic Updates Subtitle [Settings]" value:@"localized string not found" table:0];
        uint64_t v27 = PSTableCellSubtitleTextKey;
        [v23 setProperty:v26 forKey:PSTableCellSubtitleTextKey];
      }

      [v59 addObject:v23];
      id v31 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v32 = [v31 localizedStringForKey:@"Optimize Storage [Settings]" value:@"localized string not found" table:0];
      v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:"_setEnableOptimizeStorage:specifier:" get:"_enableOptimizeStorage:" detail:0 cell:6 edit:0];

      [v33 setProperty:&__kCFBooleanTrue forKey:v57];
      [v33 setProperty:&__kCFBooleanTrue forKey:v56];
      [v33 setProperty:objc_opt_class() forKey:v58];
      uint64_t v34 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v35 = [v34 localizedStringForKey:@"Optimize Storage Subtitle [Settings]" value:@"localized string not found" table:0];
      [v33 setProperty:v35 forKey:v27];

      [v59 addObject:v33];
      if (MapsFeature_IsEnabled_StandaloneWatchOffline())
      {
        uint64_t v36 = +[NRPairedDeviceRegistry sharedInstance];
        v37 = [v36 getActivePairedDeviceExcludingAltAccount];

        if (v37)
        {
          v38 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
          v39 = [v38 localizedStringForKey:@"Sync with Watch [Settings]" value:@"localized string not found" table:0];
          uint64_t v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:"_setEnableOfflineSyncToWatch:specifier:" get:"_enableOfflineSyncToWatch:" detail:0 cell:6 edit:0];

          id v41 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"];
          LODWORD(v38) = [v37 supportsCapability:v41];

          if (v38)
          {
            v42 = [v37 valueForProperty:NRDevicePropertyName];
            v43 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
            v44 = [v43 localizedStringForKey:@"Sync with Watch Subtitle [Settings]" value:@"localized string not found" table:0];
            v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v42);

            [v40 setProperty:v45 forKey:v27];
            [v40 setProperty:&__kCFBooleanTrue forKey:v57];
          }
          else
          {
            [v40 setProperty:&__kCFBooleanFalse forKey:v57];
          }
          [v40 setProperty:&__kCFBooleanTrue forKey:v56];
          [v40 setProperty:objc_opt_class() forKey:v58];
          [v59 addObject:v40];
          v33 = v40;
        }
        v46 = &CC_SHA1_ptr;
      }
      else
      {
        v46 = &CC_SHA1_ptr;
      }
      v47 = v46[306];
      v48 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v49 = [v48 localizedStringForKey:@"Only Use Offline Maps [Settings]" value:@"localized string not found" table:0];
      v50 = [v47 preferenceSpecifierNamed:v49 target:self set:"_setEnableOnlyUseOfflineMaps:specifier:" get:"_enableOnlyUseOfflineMaps:" detail:0 cell:6 edit:0];

      v51 = [(MapsSettingsController *)self offlineHelper];
      v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v51 hasFullyLoadedSubscriptions]);
      [v50 setProperty:v52 forKey:v57];

      [v50 setProperty:&__kCFBooleanTrue forKey:v56];
      [v50 setProperty:objc_opt_class() forKey:v58];
      v53 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      v54 = [v53 localizedStringForKey:@"Only Use Offline Maps Subtitle [Settings]" value:@"localized string not found" table:0];
      [v50 setProperty:v54 forKey:v27];

      [v59 addObject:v50];
    }
  }
}

- (id)_offlineDownloadSettingsMenu
{
  BOOL v3 = +[CellularReachability cellularStatus];
  if (v3)
  {
    int v4 = MGGetBoolAnswer();
    unsigned int v5 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v6 = v5;
    if (v4)
    {
      id v7 = [v5 localizedStringForKey:@"WLAN Only [menu option]" value:@"localized string not found" table:0];

      v8 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      objc_super v9 = v8;
      CFStringRef v10 = @"WLAN + Cellular [menu option]";
    }
    else
    {
      id v7 = [v5 localizedStringForKey:@"Wi-Fi Only [menu option]" value:@"localized string not found" table:0];

      v8 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      objc_super v9 = v8;
      CFStringRef v10 = @"Wi-Fi + Cellular [menu option]";
    }
    uint64_t v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_24CC4;
    v19[3] = &unk_72A00;
    v19[4] = self;
    v12 = +[UIAction actionWithTitle:v7 image:0 identifier:0 handler:v19];
    [v12 setAccessibilityIdentifier:@"WifiOnlyAction"];
    [v12 setAccessibilityLabel:v7];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_24D0C;
    v18[3] = &unk_72A00;
    v18[4] = self;
    uint64_t v13 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:v18];
    [v13 setAccessibilityIdentifier:@"WifiAndCellularAction"];
    [v13 setAccessibilityLabel:v11];
    int BOOL = GEOConfigGetBOOL();
    if (v3 == (unsigned char *)&dword_0 + 3 && BOOL)
    {
      [v13 setState:1];
      uint64_t v15 = 0;
    }
    else
    {
      [v12 setState:1];
      if ((unint64_t)v3 > 3)
      {
LABEL_11:
        v20[0] = v12;
        v20[1] = v13;
        uint64_t v16 = +[NSArray arrayWithObjects:v20 count:2];
        BOOL v3 = +[UIMenu menuWithChildren:v16];

        goto LABEL_12;
      }
      uint64_t v15 = qword_45DD0[(void)v3 - 1];
    }
    [v13 setAttributes:v15];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (id)_enableAutomaticUpdates:(id)a3
{
  BOOL v3 = [(MapsSettingsController *)self offlineHelper];
  id v4 = [v3 totalOfflineDataSize];
  unint64_t updated = GEOMaximumAutomaticUpdateOfflineDataSize();

  unsigned int BOOL = GEOConfigGetBOOL();
  if ((unint64_t)v4 <= updated) {
    uint64_t v7 = BOOL;
  }
  else {
    uint64_t v7 = 0;
  }

  return +[NSNumber numberWithInt:v7];
}

- (void)_setEnableAutomaticUpdates:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_enableOptimizeStorage:(id)a3
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return +[NSNumber numberWithBool:BOOL];
}

- (void)_setEnableOptimizeStorage:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_enableOfflineSyncToWatch:(id)a3
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return +[NSNumber numberWithBool:BOOL];
}

- (void)_setEnableOfflineSyncToWatch:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_enableOnlyUseOfflineMaps:(id)a3
{
  if (GEOConfigGetBOOL())
  {
    id v4 = [(MapsSettingsController *)self offlineHelper];
    unsigned int v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 hasFullyLoadedSubscriptions]);
  }
  else
  {
    unsigned int v5 = +[NSNumber numberWithInt:0];
  }

  return v5;
}

- (void)_setEnableOnlyUseOfflineMaps:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)parkedCarEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() parkedCarEnabled:v3];

  return v4;
}

+ (id)parkedCarEnabled:(id)a3
{
  id v3 = +[MCProfileConnection sharedConnection];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isFindMyCarAllowed]);

  return v4;
}

- (void)_setParkedCarEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if ([v5 BOOLValue]) {
    uint64_t v6 = 5029;
  }
  else {
    uint64_t v6 = 5030;
  }
  uint64_t v7 = +[MCProfileConnection sharedConnection];
  id v8 = [v5 BOOLValue];

  [v7 setFindMyCarAllowed:v8];
  objc_super v9 = +[MKMapService sharedService];
  [v9 captureUserAction:v6 onTarget:602 eventValue:0];

  [(MapsSettingsController *)self reloadSpecifiers];
}

- (void)_addShareETASpecifiers:(id)a3
{
  id v18 = a3;
  if (MSPSharedTripNetworkEnabled())
  {
    id v4 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v5 = [v4 localizedStringForKey:@"Share ETA [Settings]" value:@"localized string not found" table:0];
    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v18 addObject:v6];
    uint64_t v7 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v8 = [v7 localizedStringForKey:@"Enable Share ETA [Settings]" value:@"localized string not found" table:0];
    objc_super v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setEnableShareETA:specifier:" get:"_enableShareETA:" detail:0 cell:6 edit:0];

    [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v9 setProperty:@"MSPShareETAUserEnabledKey" forKey:PSDefaultsKey];
    [v9 setProperty:@"ShareETAPreferenceID" forKey:PSIDKey];
    [v18 addObject:v9];
    CFStringRef v10 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v11 = [v10 localizedStringForKey:@"Share ETA" value:@"localized string not found" table:0];

    v12 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    uint64_t v13 = [v12 localizedStringForKey:@"Blocked Contacts [Settings]" value:@"localized string not found" table:0];
    uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:2 edit:0];

    uint64_t v15 = PSBundlePathForPreferenceBundle();
    [v14 setProperty:v15 forKey:PSLazilyLoadedBundleKey];

    [v14 setProperty:@"PHBlocklistSettingsListController" forKey:PSDetailControllerClassKey];
    [v14 setProperty:&__kCFBooleanTrue forKey:PSBundleOverridePrincipalClassKey];
    [v14 setControllerLoadAction:"lazyLoadBundle:"];
    uint64_t v16 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    uint64_t v17 = [v16 localizedStringForKey:@"Share ETA Footer [Settings]" value:@"localized string not found" table:0];
    [v14 setProperty:v17 forKey:PSFooterTextGroupKey];

    [v18 addObject:v14];
  }
}

- (void)_setEnableShareETA:(id)a3 specifier:(id)a4
{
  +[MapsSettings setValue:forConfigKey:](MapsSettings, "setValue:forConfigKey:", a3, GEOConfigMSPShareETAUserEnabled[0], GEOConfigMSPShareETAUserEnabled[1]);

  notify_post("com.apple.maps.ShareETAUserEnabled");
}

- (id)_enableShareETA:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", GEOConfigMSPShareETAUserEnabled[0], GEOConfigMSPShareETAUserEnabled[1]);
}

- (id)lagunaBeachSiriSuggestionsEnabled:(id)a3
{
  uint64_t v3 = GEOAreLagunaBeachSiriSuggestionsEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)_setLagunaBeachSiriSuggestionsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  [v4 BOOLValue];
  GEOSetAreLagunaBeachSiriSuggestionsEnabled();
  unsigned int v5 = [v4 BOOLValue];

  if (v5) {
    uint64_t v6 = 322;
  }
  else {
    uint64_t v6 = 321;
  }

  +[GEOAPPortal captureUserAction:v6 target:602 value:0];
}

- (id)allowsAddingRatingsAndPhotos:(id)a3
{
  uint64_t LagunaBeachContributions = GEOCanUserMakeLagunaBeachContributions();

  return +[NSNumber numberWithBool:LagunaBeachContributions];
}

- (void)_setAllowsAddingRatingsAndPhotos:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  [v4 BOOLValue];
  GEOSetCanUserMakeLagunaBeachContributions();
  unsigned int v5 = [v4 BOOLValue];

  if (v5) {
    uint64_t v6 = 324;
  }
  else {
    uint64_t v6 = 330;
  }

  +[GEOAPPortal captureUserAction:v6 target:602 value:0];
}

- (void)_appendPrivacyFooterFromBundleIdentifiers:(id)a3 toGroupSpecifier:(id)a4 selector:(SEL)a5
{
  id v24 = a4;
  id v8 = a3;
  if ((unint64_t)[v8 count] <= 1)
  {
    uint64_t v10 = [v8 firstObject];

    objc_super v9 = +[OBPrivacyLinkController linkWithBundleIdentifier:v10];
    id v8 = (id)v10;
  }
  else
  {
    objc_super v9 = +[OBPrivacyLinkController linkWithBundleIdentifiers:v8];
  }

  id v11 = [v9 flow];
  v12 = [v11 localizedButtonTitle];

  uint64_t v13 = [v24 propertyForKey:PSFooterTextGroupKey];
  if (v13) {
    +[NSString stringWithFormat:@"%@ %@", v13, v12];
  }
  else {
  uint64_t v14 = +[NSString stringWithFormat:@"%@", v12, v23];
  }
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  uint64_t v17 = PSFooterCellClassGroupKey;
  [v24 setProperty:v16 forKey:PSFooterCellClassGroupKey];

  [v24 setProperty:v14 forKey:PSFooterHyperlinkViewTitleKey];
  v26.id location = (NSUInteger)[v14 rangeOfString:v12];
  id v18 = NSStringFromRange(v26);
  [v24 setProperty:v18 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v19 = +[NSValue valueWithNonretainedObject:self];
  [v24 setProperty:v19 forKey:PSFooterHyperlinkViewTargetKey];

  uint64_t v20 = NSStringFromSelector(a5);
  [v24 setProperty:v20 forKey:PSFooterHyperlinkViewActionKey];

  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v24 setProperty:v22 forKey:v17];
}

- (id)_privacyIdentifiersForContributeToMapsSection
{
  v2 = +[NSMutableArray array];
  if (MapsFeature_IsEnabled_LagunaBeach()
    && GEODoesUserHaveValidAccountForMakingContributions())
  {
    [v2 addObject:@"com.apple.onboarding.ratingsAndPhotos"];
  }
  if (MapsFeature_IsEnabled_EVRouting() && GEOConfigGetBOOL()) {
    [v2 addObject:@"com.apple.onboarding.improveEVRouting"];
  }
  id v3 = [v2 copy];

  return v3;
}

- (void)_presentContributeToMapsPrivacySplashViewController
{
  id v3 = [(MapsSettingsController *)self _privacyIdentifiersForContributeToMapsSection];
  [(MapsSettingsController *)self _presentPrivacySplashViewControllerForIdentifiers:v3];
}

- (void)_presentMapsAppPrivacySplashViewController
{
  CFStringRef v4 = @"com.apple.onboarding.maps";
  id v3 = +[NSArray arrayWithObjects:&v4 count:1];
  [(MapsSettingsController *)self _presentPrivacySplashViewControllerForIdentifiers:v3];
}

- (void)_presentPrivacySplashViewControllerForIdentifiers:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    id v6 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:v4];
  }
  else
  {
    uint64_t v5 = [v4 firstObject];

    id v6 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:v5];
    id v4 = (id)v5;
  }

  [v6 setPresentingViewController:self];
  [v6 present];
}

- (id)enableImproveEVRouting:(id)a3
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return +[NSNumber numberWithBool:BOOL];
}

- (void)setEnableImproveEVRouting:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (void)didUpdateEVApplications:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  id v7 = v4;
  if (!*(PSSpecifier **)((char *)&self->_restaurantBookingLinkSpecifier + 3)) {
    goto LABEL_4;
  }
  id v6 = [v4 count];
  uint64_t v5 = v7;
  if (v6)
  {
    if (*(PSSpecifier **)((char *)&self->_restaurantBookingLinkSpecifier + 3)) {
      goto LABEL_6;
    }
LABEL_4:
    if (![v5 count]) {
      goto LABEL_6;
    }
  }
  [(MapsSettingsController *)self reloadSpecifiers];
LABEL_6:

  _objc_release_x1();
}

- (void)didUpdateElectricVehicleCount:(unint64_t)a3
{
  if ((a3 != 0) != (*(PSSpecifier **)((char *)&self->_restaurantBookingLinkSpecifier + 3) != 0)) {
    [(MapsSettingsController *)self reloadSpecifiers];
  }
}

- (void)_refreshThirdPartyPhotoSharingStatus
{
  [(MapsSettingsController *)self setThirdPartyPhotoSharingStatusLoading:1];
  objc_initWeak(&location, self);
  id v3 = +[UGCThirdPartyPhotoSharingPreferencesManager sharedManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25D78;
  v4[3] = &unk_72A28;
  objc_copyWeak(&v5, &location);
  [v3 fetchThirdPartyPhotoSharingPreferencesWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_thirdPartyPhotoSharingEnabled:(id)a3
{
  id v3 = [(MapsSettingsController *)self thirdPartyPhotoSharingPreference];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 optIn]);

  return v4;
}

- (void)_setThirdPartyPhotoSharingEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  [(MapsSettingsController *)self reloadSpecifier:v7];
  objc_initWeak(&location, self);
  id v8 = +[UGCThirdPartyPhotoSharingPreferencesManager sharedManager];
  id v9 = [v6 BOOLValue];
  uint64_t v10 = [(MapsSettingsController *)self thirdPartyPhotoSharingPreference];
  id v11 = [v10 version];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_25FDC;
  v13[3] = &unk_72A50;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [v8 updateThirdPartyPhotoSharingPreferences:v9 versionID:v11 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  BOOL v6 = a3.var0 == MapsConfig_OfflineMapDownloadsAllowCellular && a3.var1 == off_8CF50;
  if (v6
    || (a3.var0 == GeoOfflineConfig_AutomaticUpdatesEnabled
      ? (BOOL v7 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_AutomaticUpdatesEnabled + 1))
      : (BOOL v7 = 0),
        v7
     || (a3.var0 == GeoOfflineConfig_OptimizeStorageEnabled
       ? (BOOL v8 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_OptimizeStorageEnabled + 1))
       : (BOOL v8 = 0),
         v8
      || (a3.var0 == GeoOfflineConfig_SyncToWatchEnabled
        ? (BOOL v9 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_SyncToWatchEnabled + 1))
        : (BOOL v9 = 0),
          v9 || (a3.var0 == MapsConfig_OfflineOnlyData ? (BOOL v10 = a3.var1 == off_8CBD0) : (BOOL v10 = 0), v10)))))
  {
    [(MapsSettingsController *)self reloadSpecifiers];
  }
  if (var0 == MapsConfig_PreferencesUniqueEntityDidUpdate && var1 == off_8D5C0)
  {
    [(MapsSettingsController *)self reloadSpecifiers];
  }
}

- (PSSystemPolicyForApp)appPolicy
{
  return *(PSSystemPolicyForApp **)(&self->_thirdPartyPhotoSharingStatusLoading + 3);
}

- (void)setAppPolicy:(id)a3
{
}

- (MapsSettingsRideBookingController)rideBookingController
{
  return *(MapsSettingsRideBookingController **)((char *)&self->_appPolicy + 3);
}

- (void)setRideBookingController:(id)a3
{
}

- (MapsSettingsRestaurantBookingController)restaurantBookingController
{
  return *(MapsSettingsRestaurantBookingController **)((char *)&self->_rideBookingController + 3);
}

- (void)setRestaurantBookingController:(id)a3
{
}

- (MapsSettingsEVRoutingController)evRoutingController
{
  return *(MapsSettingsEVRoutingController **)((char *)&self->_restaurantBookingController + 3);
}

- (void)setEvRoutingController:(id)a3
{
}

- (MapsOfflineUIHelper)offlineHelper
{
  return *(MapsOfflineUIHelper **)((char *)&self->_evRoutingController + 3);
}

- (void)setOfflineHelper:(id)a3
{
}

- (BOOL)isThirdPartyPhotoSharingStatusLoading
{
  return BYTE3(self->_evRoutingLinkSpecifier);
}

- (void)setThirdPartyPhotoSharingStatusLoading:(BOOL)a3
{
  BYTE3(self->_evRoutingLinkSpecifier) = a3;
}

- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreference
{
  return *(GEORPThirdPartyPhotoSharingPreference **)((char *)&self->_offlineHelper + 3);
}

- (void)setThirdPartyPhotoSharingPreference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_offlineHelper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_evRoutingController + 3), 0);
  objc_storeStrong((id *)((char *)&self->_restaurantBookingController + 3), 0);
  objc_storeStrong((id *)((char *)&self->_rideBookingController + 3), 0);
  objc_storeStrong((id *)((char *)&self->_appPolicy + 3), 0);
  objc_storeStrong((id *)(&self->_thirdPartyPhotoSharingStatusLoading + 3), 0);
  objc_storeStrong((id *)((char *)&self->_restaurantBookingLinkSpecifier + 3), 0);
  objc_storeStrong((id *)((char *)&self->_rideBookingLinkSpecifier + 3), 0);
  objc_storeStrong((id *)((char *)&self->_preferredTransportTypeSpecifiers + 3), 0);
  objc_storeStrong((id *)((char *)&self->_emailAddress + 3), 0);

  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end