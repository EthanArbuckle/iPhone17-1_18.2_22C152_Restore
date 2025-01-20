@interface NLCSettings
+ (id)sharedInstance;
- (BOOL)hasActiveNetworkCondition;
- (NLCSettings)init;
- (id)currentProfile;
- (id)isNLCRunning:(id)a3;
- (id)selectedProfile:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)enableNLC:(BOOL)a3;
- (void)loadFromSelectedProfile;
- (void)presentAddProfile;
- (void)setCurrentProfile:(id)a3;
- (void)setNLCRunning:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFromSelectedProfile;
- (void)updateNLCProfilesList;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation NLCSettings

+ (id)sharedInstance
{
  return (id)qword_412B0;
}

- (NLCSettings)init
{
  if (dword_412E8) {
    NSLog(@"NLCSettings init %p", a2, self);
  }
  v10.receiver = self;
  v10.super_class = (Class)NLCSettings;
  v3 = [(NLCSettings *)&v10 init];
  if (v3)
  {
    objc_storeStrong((id *)&qword_412B0, v3);
    uint64_t v4 = 0;
    values = v3->_values;
    do
    {
      v6 = values[v4];
      values[v4] = (NSString *)@"0";

      ++v4;
    }
    while (v4 != 11);
    v7 = objc_alloc_init(NLCSavedProfiles);
    v8 = (void *)qword_412F0;
    qword_412F0 = (uint64_t)v7;

    [(id)qword_412F0 loadPreferences];
    [(NLCSettings *)v3 loadFromSelectedProfile];
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NLCSettings;
  [(NLCSettings *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"NETWORK_LINK_CONDITIONER" value:&stru_35910 table:@"NLCSettings"];
  [(NLCSettings *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NLCSettings;
  [(NLCSettings *)&v14 viewDidAppear:a3];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:@"NETWORK_LINK_CONDITIONER" table:@"NLCSettings" locale:v10 bundleURL:v5];

  id v15 = v8;
  v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/NLC"];
  [(NLCSettings *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v11 localizedNavigationComponents:v12 deepLink:v13];
}

- (void)dealloc
{
  v3 = (void *)qword_412F0;
  qword_412F0 = 0;

  v4.receiver = self;
  v4.super_class = (Class)NLCSettings;
  [(NLCSettings *)&v4 dealloc];
}

- (BOOL)hasActiveNetworkCondition
{
  v2 = +[COConditionSession getActiveConditions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [v2 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (dword_412E8) {
          NSLog(@"Active Condition: %@", *(void *)(*((void *)&v11 + 1) + 8 * i));
        }
        if ([v8 containsString:@"SlowNetwork"])
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (id)specifiers
{
  v2 = self;
  if (dword_412E8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
    NSLog(@"NLCSettings specifiers %p parent %p", v2, WeakRetained);
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
  v41 = v47 = v4;
  objc_msgSend(v4, "addObject:");
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"ENABLE" value:&stru_35910 table:@"NLCSettings"];
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:v2 set:"setNLCRunning:specifier:" get:"isNLCRunning:" detail:0 cell:6 edit:0];

  if ([(NLCSettings *)v2 hasActiveNetworkCondition])
  {
    if (dword_412E8) {
      NSLog(@"Found an active SlowNetwork condition. Prevent NLC from being enabled");
    }
    [v7 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  v40 = v7;
  [v47 addObject:v7];
  v43 = +[NSNumber numberWithBool:0];
  v44 = +[NSNumber numberWithBool:1];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v9 = [v8 localizedStringForKey:@"CHOOSE_PROFILE" value:&stru_35910 table:@"NLCSettings"];
  uint64_t v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

  v39 = (void *)v10;
  [v47 addObject:v10];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(id)qword_412F0 allProfilesArray];
  id v11 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v46 = *(void *)v49;
    uint64_t v45 = PSSetupCustomClassKey;
    uint64_t v13 = PSCellClassKey;
    uint64_t v14 = PSTableCellHeightKey;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v17 = v2;
        v18 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v2 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
        uint64_t v19 = objc_opt_class();
        v20 = +[NSNumber numberWithInt:50];
        v21 = +[NSDictionary dictionaryWithObjectsAndKeys:@"NLCProfileDetailController", v45, v19, v13, v20, v14, 0];

        [v18 setProperties:v21];
        v22 = [(id)qword_412F0 profileDictionaryWithName:v16];
        v23 = [v22 objectForKey:@"Preset"];
        v24 = v23;
        if (!v23 || (unsigned __int8 v25 = [v23 BOOLValue], v26 = v43, (v25 & 1) == 0)) {
          v26 = v44;
        }
        v27 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v26, @"user-created", 0];
        [v18 setUserInfo:v27];
        [v47 addObject:v18];

        v2 = v17;
      }
      id v12 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v12);
  }

  v28 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
  [v47 addObject:v28];
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"ADD_PROFILE" value:&stru_35910 table:@"NLCSettings"];
  v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:v2 set:0 get:0 detail:objc_opt_class() cell:4 edit:0];

  [v31 setButtonAction:"presentAddProfile"];
  addProfileSpecifier = v2->_addProfileSpecifier;
  v2->_addProfileSpecifier = (PSSpecifier *)v31;
  id v33 = v31;

  [v47 addObject:v2->_addProfileSpecifier];
  uint64_t v34 = OBJC_IVAR___PSListController__specifiers;
  v35 = *(void **)&v2->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&v2->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v47;
  id v36 = v47;

  id v37 = *(id *)&v2->PSListController_opaque[v34];
  return v37;
}

- (void)presentAddProfile
{
  id v4 = objc_alloc_init(NLCProfileSetupController);
  v3 = +[PSSpecifier emptyGroupSpecifier];
  [v3 setObject:@"NLCProfileDetailController" forKeyedSubscript:PSSetupCustomClassKey];
  [(NLCProfileSetupController *)v4 setSpecifier:v3];
  [(NLCProfileSetupController *)v4 setParentController:self];
  [(NLCProfileSetupController *)v4 setupController];
  [(NLCSettings *)self presentViewController:v4 animated:1 completion:0];
}

- (void)enableNLC:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NLCSettings *)self hasActiveNetworkCondition])
  {
    long long v5 = 0uLL;
    memset(v27, 0, 208);
    uint64_t v26 = 0;
    if (dword_412E8)
    {
      uint64_t v6 = "off";
      if (v3) {
        uint64_t v6 = "on";
      }
      NSLog(@"%s %s", "-[NLCSettings enableNLC:]", v6);
      long long v5 = 0uLL;
    }
    v27[12] = v5;
    *(long long *)((char *)&v27[11] + 4) = v5;
    *(long long *)((char *)&v27[10] + 4) = v5;
    *(long long *)((char *)&v27[9] + 4) = v5;
    *(long long *)((char *)&v27[8] + 4) = v5;
    *(long long *)((char *)&v27[7] + 4) = v5;
    *(long long *)((char *)&v27[6] + 4) = v5;
    *(long long *)((char *)&v27[5] + 4) = v5;
    *(long long *)((char *)&v27[4] + 4) = v5;
    *(long long *)((char *)&v27[3] + 4) = v5;
    *(long long *)((char *)&v27[2] + 4) = v5;
    *(long long *)((char *)&v27[1] + 4) = v5;
    *(long long *)((char *)v27 + 4) = v5;
    LODWORD(v27[0]) = 21;
    if (v3)
    {
      int v30 = 0;
      long long v28 = v5;
      long long v29 = v5;
      v27[15] = v5;
      v27[16] = v5;
      v27[13] = v5;
      v27[14] = v5;
      unsigned int v7 = [(NSString *)self->_values[0] intValue];
      [(NSString *)self->_values[1] floatValue];
      float v9 = v8 / 100.0;
      unsigned int v10 = [(NSString *)self->_values[2] intValue];
      if (!v7 && (v9 == 0.0 ? (BOOL v11 = v10 == 0) : (BOOL v11 = 0), v11))
      {
        int v12 = 5;
      }
      else
      {
        LODWORD(v27[13]) = 9;
        *(void *)&long long v28 = v7;
        *((void *)&v28 + 1) = __PAIR64__(v10, LODWORD(v9));
        long long v29 = 0uLL;
        int v12 = 13;
        int v30 = 0;
      }
      unsigned int v13 = [(NSString *)self->_values[3] intValue];
      [(NSString *)self->_values[4] floatValue];
      float v15 = v14 / 100.0;
      unsigned int v16 = [(NSString *)self->_values[5] intValue];
      if (v13 || (v15 == 0.0 ? (BOOL v17 = v16 == 0) : (BOOL v17 = 0), !v17))
      {
        LODWORD(v27[13]) = v12;
        HIDWORD(v27[14]) = v13;
        LODWORD(v27[15]) = 0;
        *(void *)((char *)&v27[15] + 4) = __PAIR64__(v16, LODWORD(v15));
        memset((char *)&v27[15] + 12, 0, 20);
      }
      v18 = self->_values[7];
      if (v18 && ![(NSString *)v18 isEqualToString:&stru_35910])
      {
        [(NSString *)self->_values[7] cStringUsingEncoding:1];
        __strlcpy_chk();
        LODWORD(v27[13]) |= 1u;
      }
      DWORD1(v27[13]) = [(NSString *)self->_values[8] intValue];
      if (DWORD1(v27[13])) {
        LODWORD(v27[13]) |= 1u;
      }
      DWORD2(v27[13]) = [(NSString *)self->_values[9] intValue];
      if (v27[13])
      {
        *(long long *)((char *)&v27[9] + 12) = v27[16];
        *(long long *)((char *)&v27[10] + 12) = v28;
        *(long long *)((char *)&v27[11] + 12) = v29;
        HIDWORD(v27[12]) = v30;
        *(long long *)((char *)&v27[6] + 12) = v27[13];
        *(long long *)((char *)&v27[7] + 12) = v27[14];
        *(long long *)((char *)&v27[8] + 12) = v27[15];
      }
      if ([(NSString *)self->_values[6] intValue] >= 1)
      {
        int v30 = 0;
        long long v28 = 0u;
        long long v29 = 0u;
        memset(&v27[13], 0, 64);
        unsigned int v19 = [(NSString *)self->_values[6] intValue];
        memset((char *)&v27[13] + 4, 0, 36);
        *(void *)((char *)&v27[15] + 12) = 0;
        *(void *)((char *)&v27[16] + 4) = 0x3500000011;
        HIDWORD(v27[16]) = 0;
        DWORD2(v27[15]) = v19;
        LODWORD(v27[13]) = 6;
        DWORD2(v27[13]) = [(NSString *)self->_values[9] intValue];
        *(long long *)((char *)&v27[3] + 8) = v27[16];
        memset((char *)&v27[4] + 8, 0, 36);
        *(long long *)((char *)&v27[1] + 8) = v27[14];
        *(long long *)((char *)&v27[2] + 8) = v27[15];
        *(long long *)((char *)v27 + 8) = v27[13];
      }
      if (_nlc_connect(&v26) == 1)
      {
        if (_nlc_start_simulation((uint64_t)&v26, v27) != 1) {
          sub_18768(self, @"_nlc_start_simulation failed");
        }
        if (_nlc_disconnect((uint64_t)&v26) == 1)
        {
          CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanTrue, @"com.apple.network.prefPaneSimulate");
          v20 = +[NSDate date];
          [v20 timeIntervalSince1970];
          v22 = +[NSNumber numberWithLong:(uint64_t)v21];

          CFPreferencesSetAppValue(@"TimeAtLastRun", v22, @"com.apple.network.prefPaneSimulate");
          CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
          self->_nlcRunning = 1;
          [(id)qword_412F0 setSimulatorRunning:1];
          if (dword_412E8) {
            NSLog(@"NLC Running");
          }

          goto LABEL_43;
        }
LABEL_47:
        unsigned __int8 v25 = @"_nlc_disconnect failed";
        goto LABEL_48;
      }
    }
    else if (_nlc_connect(&v26) == 1)
    {
      if (_nlc_stop_simulation((uint64_t)&v26, v27) != 1) {
        sub_18768(self, @"_nlc_stop_simulation failed");
      }
      if (_nlc_disconnect((uint64_t)&v26) == 1)
      {
        CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanFalse, @"com.apple.network.prefPaneSimulate");
        CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
        self->_nlcRunning = 0;
        [(id)qword_412F0 setSimulatorRunning:0];
        if (!dword_412E8)
        {
LABEL_45:
          v24 = +[NSNotificationCenter defaultCenter];
          [v24 postNotificationName:@"com.apple.Preferences.nlcChanges" object:0];

          return;
        }
        NSLog(@"NLC Disabled");
LABEL_43:
        if (dword_412E8)
        {
          unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0);
          NSLog(@"%s done, kSimulatorIsRunning: %u", "-[NLCSettings enableNLC:]", AppBooleanValue);
        }
        goto LABEL_45;
      }
      goto LABEL_47;
    }
    unsigned __int8 v25 = @"_nlc_connect failed";
LABEL_48:
    sub_18768(self, v25);
  }
}

- (void)setNLCRunning:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];

  [(NLCSettings *)self enableNLC:v5];
}

- (id)isNLCRunning:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
  if (dword_412E8)
  {
    unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0);
    NSLog(@"%s kSimulatorIsRunning: %u", "-[NLCSettings isNLCRunning:]", AppBooleanValue);
  }
  int v5 = CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0);
  self->_BOOL nlcRunning = v5 != 0;
  if (v5)
  {
    uint64_t v6 = (void *)CFPreferencesCopyAppValue(@"TimeAtLastRun", @"com.apple.network.prefPaneSimulate");
    double v7 = (double)(uint64_t)[v6 longValue];

    float v8 = +[NSProcessInfo processInfo];
    [v8 systemUptime];
    double v10 = v9;

    BOOL v11 = +[NSDate date];
    [v11 timeIntervalSince1970];
    unsigned int v13 = +[NSNumber numberWithLong:(uint64_t)v12];

    if (dword_412E8) {
      NSLog(@"%s: timeSince1970 %ld lastRunTime %f systemUpTime %f", "-[NLCSettings isNLCRunning:]", [v13 longValue], *(void *)&v7, *(void *)&v10);
    }
    float v14 = +[NSDate date];
    [v14 timeIntervalSince1970];
    double v16 = v15 - v7;

    if (v16 > v10)
    {
      if (dword_412E8) {
        NSLog(@"%s: time was reset, NLC is off", "-[NLCSettings isNLCRunning:]");
      }
      self->_BOOL nlcRunning = 0;
      [(id)qword_412F0 setSimulatorRunning:0];
    }

    BOOL nlcRunning = self->_nlcRunning;
  }
  else
  {
    BOOL nlcRunning = 0;
  }
  if (dword_412E8)
  {
    if (nlcRunning) {
      v18 = "YES";
    }
    else {
      v18 = "NO";
    }
    NSLog(@"%s %s", "-[NLCSettings isNLCRunning:]", v18);
    BOOL nlcRunning = self->_nlcRunning;
  }

  return +[NSNumber numberWithBool:nlcRunning];
}

- (void)loadFromSelectedProfile
{
  BOOL v3 = (void *)qword_412F0;
  id v4 = [(id)qword_412F0 selectedProfileName];
  id v54 = [v3 profileDictionaryWithName:v4];

  if (dword_412E8)
  {
    int v5 = [(id)qword_412F0 selectedProfileName];
    NSLog(@"%s selectedProfileName: %@", "-[NLCSettings loadFromSelectedProfile]", v5);
  }
  uint64_t v6 = [v54 objectForKey:@"DownlinkBandwidth"];
  unsigned int v7 = [v6 intValue];

  float v8 = [v54 objectForKey:@"DownlinkBandwidthUnit"];
  unsigned int v9 = [v8 intValue];

  LODWORD(v10) = 1000 * v7;
  if (v9) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = v7;
  }
  BOOL v11 = +[NSString stringWithFormat:@"%u", v10];
  values = self->_values;
  unsigned int v13 = self->_values[0];
  self->_values[0] = v11;

  float v14 = [v54 objectForKey:@"DownlinkPacketLossRatio"];
  [v14 floatValue];
  float v16 = v15;

  uint64_t v17 = +[NSString stringWithFormat:@"%f", v16];
  v18 = values[1];
  values[1] = (NSString *)v17;

  unsigned int v19 = [v54 objectForKey:@"DownlinkDelay"];
  id v20 = [v19 intValue];

  uint64_t v21 = +[NSString stringWithFormat:@"%u", v20];
  v22 = values[2];
  values[2] = (NSString *)v21;

  v23 = [v54 objectForKey:@"UplinkBandwidth"];
  unsigned int v24 = [v23 intValue];

  unsigned __int8 v25 = [v54 objectForKey:@"UplinkBandwidthUnit"];
  unsigned int v26 = [v25 intValue];

  LODWORD(v27) = 1000 * v24;
  if (v26) {
    uint64_t v27 = v27;
  }
  else {
    uint64_t v27 = v24;
  }
  uint64_t v28 = +[NSString stringWithFormat:@"%u", v27];
  long long v29 = values[3];
  values[3] = (NSString *)v28;

  int v30 = [v54 objectForKey:@"UplinkPacketLossRatio"];
  [v30 floatValue];
  float v32 = v31;

  uint64_t v33 = +[NSString stringWithFormat:@"%f", v32];
  uint64_t v34 = values[4];
  values[4] = (NSString *)v33;

  v35 = [v54 objectForKey:@"UplinkDelay"];
  id v36 = [v35 intValue];

  uint64_t v37 = +[NSString stringWithFormat:@"%u", v36];
  v38 = values[5];
  values[5] = (NSString *)v37;

  v39 = [v54 objectForKey:@"DNSDelayValue"];
  id v40 = [v39 intValue];

  uint64_t v41 = +[NSString stringWithFormat:@"%u", v40];
  v42 = values[6];
  values[6] = (NSString *)v41;

  v43 = [v54 objectForKey:@"ProtocolFamily"];
  id v44 = [v43 intValue];

  uint64_t v45 = +[NSString stringWithFormat:@"%u", v44];
  uint64_t v46 = values[8];
  values[8] = (NSString *)v45;

  uint64_t v47 = [v54 objectForKey:@"RunOnInterface"];
  long long v48 = values[7];
  values[7] = (NSString *)v47;

  long long v49 = [v54 objectForKey:@"ExcludeLoopback"];
  long long v50 = v49;
  if (v49) {
    id v51 = [v49 intValue];
  }
  else {
    id v51 = &dword_0 + 1;
  }
  uint64_t v52 = +[NSString stringWithFormat:@"%u", v51];
  v53 = values[9];
  values[9] = (NSString *)v52;
}

- (void)updateFromSelectedProfile
{
  if (dword_412E8)
  {
    BOOL v3 = [(id)qword_412F0 selectedProfileName];
    NSLog(@"%s updateFromSelectedProfile: %@", "-[NLCSettings updateFromSelectedProfile]", v3);
  }
  [(NLCSettings *)self loadFromSelectedProfile];

  [(NLCSettings *)self reloadSpecifiers];
}

- (id)selectedProfile:(id)a3
{
  uint64_t v4 = objc_msgSend((id)qword_412F0, "selectedProfileName", a3);
  int v5 = (void *)v4;
  if (dword_412E8) {
    NSLog(@"NLCSettings %s: %@", "-[NLCSettings selectedProfile:]", v4);
  }
  [(NLCSettings *)self updateFromSelectedProfile];

  return v5;
}

- (void)updateNLCProfilesList
{
  if (dword_412E8) {
    NSLog(@"NLCSettings %s", a2, "-[NLCSettings updateNLCProfilesList]");
  }
  [(NLCSettings *)self reloadSpecifiers];
  BOOL v3 = +[NLCSettings sharedInstance];
  [v3 performSelector:"updateFromSelectedProfile" withObject:0];

  if (self->_nlcRunning)
  {
    [(NLCSettings *)self enableNLC:1];
  }
}

- (id)currentProfile
{
  if (dword_412E8) {
    NSLog(@"NLCSettings %s: %@", a2, "-[NLCSettings currentProfile]", self->_currentProfile);
  }
  currentProfile = self->_currentProfile;

  return currentProfile;
}

- (void)setCurrentProfile:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  int v5 = v4;
  if (dword_412E8) {
    NSLog(@"NLCSettings %s: %@", "-[NLCSettings setCurrentProfile:]", v4);
  }
  currentProfile = self->_currentProfile;
  self->_currentProfile = v5;
  unsigned int v7 = v5;

  id v8 = +[NSNotificationCenter defaultCenter];

  [v8 postNotificationName:@"com.apple.Preferences.nlcChanges" object:0];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(NLCSettings *)self indexForIndexPath:v5];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v6;
    id v8 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v6];
    unsigned int v9 = [v8 userInfo];
    if (dword_412E8)
    {
      uint64_t v10 = [v8 name];
      NSLog(@"NLCSettings: willSelectRowAtIndexPath, row: %ld, name: %@ userInfo: %p", v7, v10, v9);
    }
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NLCSettings *)self indexForIndexPath:v7];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = v8;
    uint64_t v10 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
    BOOL v11 = v10;
    if (dword_412E8)
    {
      uint64_t v12 = [(PSSpecifier *)v10 name];
      unsigned int v13 = (void *)v12;
      if (self->_nlcRunning) {
        float v14 = "YES";
      }
      else {
        float v14 = "NO";
      }
      NSLog(@"%s: didSelectRowAtIndexPath, row: %ld, name: %@ _nlcRunning: %s", "-[NLCSettings tableView:didSelectRowAtIndexPath:]", v9, v12, v14);
    }
    float v15 = [(PSSpecifier *)v11 userInfo];
    float v16 = [v15 objectForKey:@"user-created"];

    if (v16)
    {
      uint64_t v17 = (void *)qword_412F0;
      v18 = [(PSSpecifier *)v11 name];
      [v17 setSelectedProfileName:v18];

      if (self->_nlcRunning)
      {
        [(NLCSettings *)self loadFromSelectedProfile];
        [(id)qword_412F0 setSimulatorRunning:1];
        [(NLCSettings *)self enableNLC:1];
      }
      [(id)qword_412F0 applySimulationStatusChanges];
      unsigned int v19 = +[NLCSettings sharedInstance];
      [v19 performSelector:"updateFromSelectedProfile" withObject:0];

      [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] selectRowAtIndexPath:0 animated:0 scrollPosition:0];
    }
    else
    {
      if (v11 == self->_addProfileSpecifier)
      {
        id v20 = +[NLCSettings sharedInstance];
        [v20 setCurrentProfile:&stru_35910];
      }
      v21.receiver = self;
      v21.super_class = (Class)NLCSettings;
      [(NLCSettings *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)NLCSettings;
  id v6 = a4;
  id v7 = [(NLCSettings *)&v21 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = [(NLCSettings *)self indexForIndexPath:v6];

  id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  uint64_t v10 = [v9 name];
  BOOL v11 = (void *)v10;
  if (dword_412E8) {
    NSLog(@"NLCSettings: cellForRowAtIndexPath, row: %ld, name: %@", v8, v10, v21.receiver, v21.super_class);
  }
  uint64_t v12 = [v9 userInfo];
  unsigned int v13 = [v12 objectForKey:@"user-created"];
  if (v13)
  {
    [v7 setAccessoryType:2];
    float v14 = [(id)qword_412F0 selectedProfileName];
    objc_msgSend(v7, "setChecked:", objc_msgSend(v11, "isEqualToString:", v14));

    if (objc_opt_respondsToSelector())
    {
      unsigned int v15 = [v13 BOOLValue];
      float v16 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v17 = v16;
      if (v15) {
        CFStringRef v18 = @"CUSTOM";
      }
      else {
        CFStringRef v18 = @"PRESET";
      }
      unsigned int v19 = [v16 localizedStringForKey:v18 value:&stru_35910 table:@"NLCSettings"];
      [v7 setSubtitle:v19];
    }
  }
  else
  {
    [v7 setChecked:0];
  }

  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = [(NLCSettings *)self indexForIndexPath:a4];
  id v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v5];
  unsigned int v15 = v6;
  if (dword_412E8)
  {
    id v7 = [v6 name];
    NSLog(@"NLCSettings: cellForRowAtIndexPath, row: %ld, name: %@", v5, v7);

    id v6 = v15;
  }
  id v8 = [v6 userInfo];
  id v9 = [v8 objectForKey:@"user-created"];

  uint64_t v10 = +[NLCSettings sharedInstance];
  BOOL v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v15 name];
    [v11 setCurrentProfile:v12];
  }
  else
  {
    [v10 setCurrentProfile:&stru_35910];
  }

  id v13 = objc_alloc_init(*(Class *)&v15[OBJC_IVAR___PSSpecifier_detailControllerClass]);
  if (!v13) {
    id v13 = objc_alloc_init((Class)PSDetailController);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__rootController]);
  [v13 setRootController:WeakRetained];

  [v13 setParentController:self];
  [v13 setSpecifier:v15];
  [(NLCSettings *)self showController:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addProfileSpecifier, 0);
  for (uint64_t i = 10; i != -1; --i)
    objc_storeStrong((id *)&self->_values[i], 0);

  objc_storeStrong((id *)&self->_currentProfile, 0);
}

@end