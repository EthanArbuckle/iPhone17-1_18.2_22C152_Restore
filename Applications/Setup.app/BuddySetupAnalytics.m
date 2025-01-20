@interface BuddySetupAnalytics
+ (id)loadFromDiskWithPreferences:(id)a3;
+ (void)removeFromDiskWithPreferences:(id)a3;
- (BOOL)hasCompletedInitialSetup;
- (BOOL)inAppleStore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAnalytics:(id)a3;
- (BOOL)isSignedIntoAppleID;
- (BOOL)softwareUpdatePerformed;
- (BOOL)usedProximitySetup;
- (BYPreferencesController)preferences;
- (BuddySetupAnalytics)initWithPreferences:(id)a3;
- (double)activeDuration;
- (double)backgroundDuration;
- (double)otherDuration;
- (id)_dictionaryRepresentation;
- (unint64_t)dataTransferMethod;
- (unint64_t)followUpItemsCount;
- (unint64_t)numberOfPanesPresented;
- (void)addEventUsingAnalyticsManager:(id)a3;
- (void)persist;
- (void)setActiveDuration:(double)a3;
- (void)setBackgroundDuration:(double)a3;
- (void)setDataTransferMethod:(unint64_t)a3;
- (void)setFollowUpItemsCount:(unint64_t)a3;
- (void)setHasCompletedInitialSetup:(BOOL)a3;
- (void)setInAppleStore:(BOOL)a3;
- (void)setIsSignedIntoAppleID:(BOOL)a3;
- (void)setNumberOfPanesPresented:(unint64_t)a3;
- (void)setOtherDuration:(double)a3;
- (void)setPreferences:(id)a3;
- (void)setSoftwareUpdatePerformed:(BOOL)a3;
- (void)setUsedProximitySetup:(BOOL)a3;
@end

@implementation BuddySetupAnalytics

- (BuddySetupAnalytics)initWithPreferences:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddySetupAnalytics;
  id v8 = [(BuddySetupAnalytics *)&v6 init];
  objc_storeStrong(&v8, v8);
  if (v8) {
    objc_storeStrong((id *)v8 + 8, location[0]);
  }
  v4 = (BuddySetupAnalytics *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

+ (id)loadFromDiskWithPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = [location[0] objectForKey:@"setupAnalytics" includeCache:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [BuddySetupAnalytics alloc];
    id v18 = [(BuddySetupAnalytics *)v3 initWithPreferences:location[0]];
    id v4 = [v20 objectForKeyedSubscript:@"hasCompletedInitialSetup"];
    [v18 setHasCompletedInitialSetup:((unint64_t)[v4 BOOLValue]) & 1];

    id v5 = [v20 objectForKeyedSubscript:@"usedProximitySetup"];
    [v18 setUsedProximitySetup:((unint64_t)[v5 BOOLValue] & 1)];

    id v6 = [v20 objectForKeyedSubscript:@"dataTransferMethod"];
    [v18 setDataTransferMethod:[v6 unsignedIntegerValue]];

    id v7 = [v20 objectForKeyedSubscript:@"inAppleStore"];
    [v18 setInAppleStore:[v7 BOOLValue] & 1];

    id v8 = [v20 objectForKeyedSubscript:@"softwareUpdatePerformed"];
    [v18 setSoftwareUpdatePerformed:[v8 BOOLValue] & 1];

    id v9 = [v20 objectForKeyedSubscript:@"numberOfPanesPresented"];
    [v18 setNumberOfPanesPresented:[v9 unsignedIntegerValue]];

    id v10 = [v20 objectForKeyedSubscript:@"activeDuration"];
    [v10 doubleValue];
    [v18 setActiveDuration:];

    id v11 = [v20 objectForKeyedSubscript:@"backgroundDuration"];
    [v11 doubleValue];
    [v18 setBackgroundDuration:];

    id v12 = [v20 objectForKeyedSubscript:@"otherDuration"];
    [v12 doubleValue];
    [v18 setOtherDuration:];

    id v13 = [v20 objectForKeyedSubscript:@"isSignedIntoAppleID"];
    [v18 setIsSignedIntoAppleID:((unint64_t)[v13 BOOLValue]) & 1];

    id v14 = [v20 objectForKeyedSubscript:@"followUpItemsCount"];
    [v14 doubleValue];
    [v18 setFollowUpItemsCount:(unint64_t)v15];

    id v22 = v18;
    int v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v22 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  v16 = v22;

  return v16;
}

- (void)persist
{
  v2 = [(BuddySetupAnalytics *)self preferences];
  id v3 = [(BuddySetupAnalytics *)self _dictionaryRepresentation];
  [(BYPreferencesController *)v2 setObject:v3 forKey:@"setupAnalytics" persistImmediately:1];
}

+ (void)removeFromDiskWithPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] removeObjectForKey:@"setupAnalytics" onlyFromMemory:0];
  objc_storeStrong(location, 0);
}

- (void)addEventUsingAnalyticsManager:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [(BuddySetupAnalytics *)v6 _dictionaryRepresentation];
  [v3 addEvent:@"com.apple.setupassistant.ios.setup" withPayload:v4 persist:0];

  objc_storeStrong(location, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = [(BuddySetupAnalytics *)v5 isEqualToAnalytics:location[0]];
    }
    else {
      char v6 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToAnalytics:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v3 = [(BuddySetupAnalytics *)v29 hasCompletedInitialSetup];
  BOOL v18 = v3 == ([location[0] hasCompletedInitialSetup] & 1);
  int v4 = [(BuddySetupAnalytics *)v29 usedProximitySetup];
  BOOL v19 = (v18 & (v4 == ([location[0] usedProximitySetup] & 1))) != 0;
  id v5 = [(BuddySetupAnalytics *)v29 dataTransferMethod];
  BOOL v20 = (v19 & (v5 == [location[0] dataTransferMethod])) != 0;
  LODWORD(v5) = [(BuddySetupAnalytics *)v29 inAppleStore];
  BOOL v21 = (v20 & (v5 == ([location[0] inAppleStore] & 1))) != 0;
  LODWORD(v5) = [(BuddySetupAnalytics *)v29 softwareUpdatePerformed];
  BOOL v22 = (v21 & (v5 == ([location[0] softwareUpdatePerformed] & 1))) != 0;
  id v6 = [(BuddySetupAnalytics *)v29 numberOfPanesPresented];
  BOOL v23 = (v22 & (v6 == [location[0] numberOfPanesPresented])) != 0;
  [(BuddySetupAnalytics *)v29 activeDuration];
  double v8 = v7;
  [location[0] activeDuration];
  BOOL v24 = v23 && v8 == v9;
  [(BuddySetupAnalytics *)v29 backgroundDuration];
  double v11 = v10;
  [location[0] backgroundDuration];
  BOOL v25 = v24 && v11 == v12;
  [(BuddySetupAnalytics *)v29 otherDuration];
  double v14 = v13;
  [location[0] otherDuration];
  BOOL v26 = v25 && v14 == v15;
  LODWORD(v6) = [(BuddySetupAnalytics *)v29 isSignedIntoAppleID];
  BOOL v27 = (v26 & (v6 == ([location[0] isSignedIntoAppleID] & 1))) != 0;
  id v16 = [(BuddySetupAnalytics *)v29 followUpItemsCount];
  LOBYTE(v16) = (v27 & (v16 == [location[0] followUpItemsCount])) != 0;
  objc_storeStrong(location, 0);
  return v16 & 1;
}

- (id)_dictionaryRepresentation
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableDictionary);
  v2 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)v16 hasCompletedInitialSetup]];
  [location[0] setObject:v2 forKeyedSubscript:@"hasCompletedInitialSetup"];

  int v3 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)v16 usedProximitySetup]];
  [location[0] setObject:v3 forKeyedSubscript:@"usedProximitySetup"];

  int v4 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)v16 dataTransferMethod]];
  [location[0] setObject:v4 forKeyedSubscript:@"dataTransferMethod"];

  id v5 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)v16 inAppleStore]];
  [location[0] setObject:v5 forKeyedSubscript:@"inAppleStore"];

  id v6 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)v16 softwareUpdatePerformed]];
  [location[0] setObject:v6 forKeyedSubscript:@"softwareUpdatePerformed"];

  double v7 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)v16 numberOfPanesPresented]];
  [location[0] setObject:v7 forKeyedSubscript:@"numberOfPanesPresented"];

  [(BuddySetupAnalytics *)v16 activeDuration];
  double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [location[0] setObject:v8 forKeyedSubscript:@"activeDuration"];

  [(BuddySetupAnalytics *)v16 backgroundDuration];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [location[0] setObject:v9 forKeyedSubscript:@"backgroundDuration"];

  [(BuddySetupAnalytics *)v16 otherDuration];
  double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [location[0] setObject:v10 forKeyedSubscript:@"otherDuration"];

  double v11 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)v16 isSignedIntoAppleID]];
  [location[0] setObject:v11 forKeyedSubscript:@"isSignedIntoAppleID"];

  double v12 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)v16 followUpItemsCount]];
  [location[0] setObject:v12 forKeyedSubscript:@"followUpItemsCount"];

  id v13 = location[0];
  objc_storeStrong(location, 0);
  return v13;
}

- (BOOL)hasCompletedInitialSetup
{
  return self->_hasCompletedInitialSetup;
}

- (void)setHasCompletedInitialSetup:(BOOL)a3
{
  self->_hasCompletedInitialSetup = a3;
}

- (BOOL)usedProximitySetup
{
  return self->_usedProximitySetup;
}

- (void)setUsedProximitySetup:(BOOL)a3
{
  self->_usedProximitySetup = a3;
}

- (BOOL)isSignedIntoAppleID
{
  return self->_isSignedIntoAppleID;
}

- (void)setIsSignedIntoAppleID:(BOOL)a3
{
  self->_isSignedIntoAppleID = a3;
}

- (unint64_t)dataTransferMethod
{
  return self->_dataTransferMethod;
}

- (void)setDataTransferMethod:(unint64_t)a3
{
  self->_dataTransferMethod = a3;
}

- (BOOL)inAppleStore
{
  return self->_inAppleStore;
}

- (void)setInAppleStore:(BOOL)a3
{
  self->_inAppleStore = a3;
}

- (BOOL)softwareUpdatePerformed
{
  return self->_softwareUpdatePerformed;
}

- (void)setSoftwareUpdatePerformed:(BOOL)a3
{
  self->_softwareUpdatePerformed = a3;
}

- (unint64_t)numberOfPanesPresented
{
  return self->_numberOfPanesPresented;
}

- (void)setNumberOfPanesPresented:(unint64_t)a3
{
  self->_numberOfPanesPresented = a3;
}

- (unint64_t)followUpItemsCount
{
  return self->_followUpItemsCount;
}

- (void)setFollowUpItemsCount:(unint64_t)a3
{
  self->_followUpItemsCount = a3;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (void)setActiveDuration:(double)a3
{
  self->_activeDuration = a3;
}

- (double)backgroundDuration
{
  return self->_backgroundDuration;
}

- (void)setBackgroundDuration:(double)a3
{
  self->_backgroundDuration = a3;
}

- (double)otherDuration
{
  return self->_otherDuration;
}

- (void)setOtherDuration:(double)a3
{
  self->_otherDuration = a3;
}

- (BYPreferencesController)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end