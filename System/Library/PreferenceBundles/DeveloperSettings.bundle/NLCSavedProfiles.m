@interface NLCSavedProfiles
- (BOOL)createPresetProfiles;
- (BOOL)secondarySimulatorRunning;
- (BOOL)simulatorRunning;
- (NSArray)allProfilesArray;
- (NSArray)customProfilesArray;
- (NSArray)suppliedProfilesArray;
- (NSMutableDictionary)profileDictionary;
- (NSString)selectedProfileName;
- (NSString)simulatedProfileName;
- (id)addNewProfile:(id)a3;
- (id)profileDictionaryWithName:(id)a3;
- (id)restoreRowToSelect;
- (id)selectedProfileDictionary;
- (void)applyChanges;
- (void)applySimulationStatusChanges;
- (void)loadPreferences;
- (void)refreshArrays;
- (void)removeProfileWithName:(id)a3;
- (void)setAllProfilesArray:(id)a3;
- (void)setCustomProfilesArray:(id)a3;
- (void)setProfileDictionary:(id)a3;
- (void)setSecondarySimulatorRunning:(BOOL)a3;
- (void)setSelectedProfileName:(id)a3;
- (void)setSimulatedProfileName:(id)a3;
- (void)setSimulatorRunning:(BOOL)a3;
- (void)setSuppliedProfilesArray:(id)a3;
@end

@implementation NLCSavedProfiles

- (id)selectedProfileDictionary
{
  return [(NSMutableDictionary *)self->profileDictionary objectForKey:self->selectedProfileName];
}

- (void)refreshArrays
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(NSMutableDictionary *)self->profileDictionary allKeys];
  [v5 addObjectsFromArray:v6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(NSMutableDictionary *)self->profileDictionary allKeys];
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->profileDictionary objectForKey:v11];
        v13 = [v12 objectForKey:@"Preset"];

        if ([v13 BOOLValue]) {
          v14 = v4;
        }
        else {
          v14 = v3;
        }
        [v14 addObject:v11];
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v15 = [v4 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
  [(NLCSavedProfiles *)self setSuppliedProfilesArray:v15];

  v16 = [v3 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
  [(NLCSavedProfiles *)self setCustomProfilesArray:v16];

  v17 = [v5 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
  [(NLCSavedProfiles *)self setAllProfilesArray:v17];
}

- (void)removeProfileWithName:(id)a3
{
  profileDictionary = self->profileDictionary;
  id v5 = a3;
  [(NSMutableDictionary *)profileDictionary removeObjectForKey:v5];
  [(NLCSavedProfiles *)self refreshArrays];
  LODWORD(profileDictionary) = [v5 isEqualToString:self->selectedProfileName];

  if (profileDictionary)
  {
    v6 = [(NLCSavedProfiles *)self allProfilesArray];
    id v7 = [v6 count];

    if (v7)
    {
      id v9 = [(NLCSavedProfiles *)self allProfilesArray];
      id v8 = [v9 objectAtIndex:0];
      [(NLCSavedProfiles *)self setSelectedProfileName:v8];
    }
    else
    {
      [(NLCSavedProfiles *)self setSelectedProfileName:0];
    }
  }
}

- (id)restoreRowToSelect
{
  uint64_t v3 = [(NLCSavedProfiles *)self simulatedProfileName];
  if (v3
    && (id v4 = (void *)v3, v5 = [(NLCSavedProfiles *)self simulatorRunning], v4, v5))
  {
    v6 = self->simulatedProfileName;
  }
  else
  {
    v6 = (NSString *)CFPreferencesCopyAppValue(@"SelectedProfile", @"com.apple.network.prefPaneSimulate");
  }
  selectedProfileName = self->selectedProfileName;
  self->selectedProfileName = v6;

  id v8 = self->selectedProfileName;

  return v8;
}

- (id)profileDictionaryWithName:(id)a3
{
  return [(NSMutableDictionary *)self->profileDictionary objectForKey:a3];
}

- (void)loadPreferences
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"Profiles", @"com.apple.network.prefPaneSimulate");
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
    [(NLCSavedProfiles *)self createPresetProfiles];
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"Profiles", @"com.apple.network.prefPaneSimulate");

    id v4 = (void *)v5;
  }
  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  profileDictionary = self->profileDictionary;
  self->profileDictionary = v6;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v14 = self->profileDictionary;
        v15 = objc_msgSend(v8, "valueForKey:", v13, (void)v33);
        id v16 = [v15 mutableCopy];
        [(NSMutableDictionary *)v14 setObject:v16 forKey:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  v17 = (NSString *)CFPreferencesCopyAppValue(@"SimulatedProfile", @"com.apple.network.prefPaneSimulate");
  simulatedProfileName = self->simulatedProfileName;
  self->simulatedProfileName = v17;

  long long v19 = (NSString *)CFPreferencesCopyAppValue(@"SelectedProfile", @"com.apple.network.prefPaneSimulate");
  selectedProfileName = self->selectedProfileName;
  self->selectedProfileName = v19;

  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0);
  *(_WORD *)&self->simulatorRunning = AppBooleanValue != 0;
  if (AppBooleanValue && self->simulatedProfileName)
  {
    long long v22 = -[NSMutableDictionary objectForKey:](self->profileDictionary, "objectForKey:");
    v23 = [v22 valueForKey:@"DNSDelayValue"];
    self->secondarySimulatorRunning = [v23 BOOLValue];
  }
  v24 = (void *)CFPreferencesCopyAppValue(@"TimeAtLastRun", @"com.apple.network.prefPaneSimulate");
  double v25 = (double)(uint64_t)[v24 longValue];

  v26 = +[NSProcessInfo processInfo];
  [v26 systemUptime];
  double v28 = v27;

  v29 = +[NSDate date];
  [v29 timeIntervalSince1970];
  double v31 = v30 - v25;

  if (v31 > v28)
  {
    *(_WORD *)&self->simulatorRunning = 0;
    v32 = self->simulatedProfileName;
    self->simulatedProfileName = 0;
  }
  [(NLCSavedProfiles *)self refreshArrays];
}

- (BOOL)createPresetProfiles
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"com.apple.network.prefPaneSimulate" ofType:@"plist"];

  CFDictionaryRef v4 = (const __CFDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v3];
  CFPreferencesSetMultiple(v4, 0, @"com.apple.network.prefPaneSimulate", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  BOOL v5 = CFPreferencesSynchronize(@"com.apple.network.prefPaneSimulate", kCFPreferencesCurrentUser, kCFPreferencesAnyHost) != 0;

  return v5;
}

- (void)applyChanges
{
  CFPreferencesSetAppValue(@"Profiles", self->profileDictionary, @"com.apple.network.prefPaneSimulate");

  [(NLCSavedProfiles *)self applySimulationStatusChanges];
}

- (void)applySimulationStatusChanges
{
  if ([(NLCSavedProfiles *)self simulatorRunning])
  {
    CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanTrue, @"com.apple.network.prefPaneSimulate");
    uint64_t v3 = +[NSDate date];
    [v3 timeIntervalSince1970];
    BOOL v5 = +[NSNumber numberWithLong:(uint64_t)v4];

    CFPreferencesSetAppValue(@"TimeAtLastRun", v5, @"com.apple.network.prefPaneSimulate");
  }
  else
  {
    CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanFalse, @"com.apple.network.prefPaneSimulate");
  }
  CFPreferencesSetAppValue(@"SelectedProfile", self->selectedProfileName, @"com.apple.network.prefPaneSimulate");
  CFPreferencesSetAppValue(@"SimulatedProfile", self->simulatedProfileName, @"com.apple.network.prefPaneSimulate");

  CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
}

- (id)addNewProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NLCSavedProfiles *)self profileDictionaryWithName:v4];
  if (v5)
  {
    id v6 = (id)v5;
    id v7 = 0;
  }
  else
  {
    long long v21 = +[NSArray arrayWithObjects:@"UplinkBandwidth", @"UplinkDelay", @"UplinkPacketLossRatio", @"UplinkBandwidthUnit", @"DownlinkBandwidth", @"DownlinkDelay", @"DownlinkPacketLossRatio", @"DownlinkBandwidthUnit", @"RunOnInterface", @"DNSDelayValue", @"ProtocolFamily", @"ExcludeLoopback", 0];
    long long v19 = +[NSNumber numberWithFloat:0.0];
    long long v22 = +[NSNumber numberWithFloat:0.0];
    id v16 = +[NSNumber numberWithFloat:0.0];
    v18 = +[NSNumber numberWithInt:0];
    v17 = +[NSNumber numberWithFloat:0.0];
    id v8 = +[NSNumber numberWithFloat:0.0];
    id v9 = +[NSNumber numberWithFloat:0.0];
    id v10 = +[NSNumber numberWithInt:0];
    uint64_t v11 = +[NSNumber numberWithInt:0];
    v12 = +[NSNumber numberWithInt:0];
    uint64_t v13 = +[NSNumber numberWithInt:1];
    long long v20 = +[NSArray arrayWithObjects:v19, v22, v16, v18, v17, v8, v9, v10, @"All", v11, v12, v13, 0];

    id v14 = [objc_alloc((Class)NSMutableDictionary) initWithObjects:v20 forKeys:v21];
    [(NSMutableDictionary *)self->profileDictionary setObject:v14 forKey:v4];
    [(NLCSavedProfiles *)self refreshArrays];
    id v6 = v14;

    id v7 = v6;
  }

  return v7;
}

- (NSArray)suppliedProfilesArray
{
  return self->suppliedProfilesArray;
}

- (void)setSuppliedProfilesArray:(id)a3
{
}

- (NSArray)customProfilesArray
{
  return self->customProfilesArray;
}

- (void)setCustomProfilesArray:(id)a3
{
}

- (NSArray)allProfilesArray
{
  return self->allProfilesArray;
}

- (void)setAllProfilesArray:(id)a3
{
}

- (NSMutableDictionary)profileDictionary
{
  return self->profileDictionary;
}

- (void)setProfileDictionary:(id)a3
{
}

- (NSString)selectedProfileName
{
  return self->selectedProfileName;
}

- (void)setSelectedProfileName:(id)a3
{
}

- (NSString)simulatedProfileName
{
  return self->simulatedProfileName;
}

- (void)setSimulatedProfileName:(id)a3
{
}

- (BOOL)simulatorRunning
{
  return self->simulatorRunning;
}

- (void)setSimulatorRunning:(BOOL)a3
{
  self->simulatorRunning = a3;
}

- (BOOL)secondarySimulatorRunning
{
  return self->secondarySimulatorRunning;
}

- (void)setSecondarySimulatorRunning:(BOOL)a3
{
  self->secondarySimulatorRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->simulatedProfileName, 0);
  objc_storeStrong((id *)&self->selectedProfileName, 0);
  objc_storeStrong((id *)&self->profileDictionary, 0);
  objc_storeStrong((id *)&self->allProfilesArray, 0);
  objc_storeStrong((id *)&self->customProfilesArray, 0);

  objc_storeStrong((id *)&self->suppliedProfilesArray, 0);
}

@end