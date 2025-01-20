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
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BuddySetupAnalytics;
  v6 = [(BuddySetupAnalytics *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferences, a3);
  }

  return v7;
}

+ (id)loadFromDiskWithPreferences:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"setupAnalytics" includeCache:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[BuddySetupAnalytics alloc] initWithPreferences:v3];
    v6 = [v4 objectForKeyedSubscript:@"hasCompletedInitialSetup"];
    -[BuddySetupAnalytics setHasCompletedInitialSetup:](v5, "setHasCompletedInitialSetup:", [v6 BOOLValue]);

    v7 = [v4 objectForKeyedSubscript:@"usedProximitySetup"];
    -[BuddySetupAnalytics setUsedProximitySetup:](v5, "setUsedProximitySetup:", [v7 BOOLValue]);

    v8 = [v4 objectForKeyedSubscript:@"dataTransferMethod"];
    -[BuddySetupAnalytics setDataTransferMethod:](v5, "setDataTransferMethod:", [v8 unsignedIntegerValue]);

    objc_super v9 = [v4 objectForKeyedSubscript:@"inAppleStore"];
    -[BuddySetupAnalytics setInAppleStore:](v5, "setInAppleStore:", [v9 BOOLValue]);

    v10 = [v4 objectForKeyedSubscript:@"softwareUpdatePerformed"];
    -[BuddySetupAnalytics setSoftwareUpdatePerformed:](v5, "setSoftwareUpdatePerformed:", [v10 BOOLValue]);

    v11 = [v4 objectForKeyedSubscript:@"numberOfPanesPresented"];
    -[BuddySetupAnalytics setNumberOfPanesPresented:](v5, "setNumberOfPanesPresented:", [v11 unsignedIntegerValue]);

    v12 = [v4 objectForKeyedSubscript:@"activeDuration"];
    [v12 doubleValue];
    -[BuddySetupAnalytics setActiveDuration:](v5, "setActiveDuration:");

    v13 = [v4 objectForKeyedSubscript:@"backgroundDuration"];
    [v13 doubleValue];
    -[BuddySetupAnalytics setBackgroundDuration:](v5, "setBackgroundDuration:");

    v14 = [v4 objectForKeyedSubscript:@"otherDuration"];
    [v14 doubleValue];
    -[BuddySetupAnalytics setOtherDuration:](v5, "setOtherDuration:");

    v15 = [v4 objectForKeyedSubscript:@"isSignedIntoAppleID"];
    -[BuddySetupAnalytics setIsSignedIntoAppleID:](v5, "setIsSignedIntoAppleID:", [v15 BOOLValue]);

    v16 = [v4 objectForKeyedSubscript:@"followUpItemsCount"];
    [v16 doubleValue];
    [(BuddySetupAnalytics *)v5 setFollowUpItemsCount:(unint64_t)v17];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)persist
{
  id v4 = [(BuddySetupAnalytics *)self preferences];
  id v3 = [(BuddySetupAnalytics *)self _dictionaryRepresentation];
  [v4 setObject:v3 forKey:@"setupAnalytics" persistImmediately:1];
}

+ (void)removeFromDiskWithPreferences:(id)a3
{
}

- (void)addEventUsingAnalyticsManager:(id)a3
{
  id v4 = a3;
  id v5 = [(BuddySetupAnalytics *)self _dictionaryRepresentation];
  [v4 addEvent:@"com.apple.setupassistant.ios.setup" withPayload:v5 persist:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BuddySetupAnalytics *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BuddySetupAnalytics *)self isEqualToAnalytics:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAnalytics:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BuddySetupAnalytics *)self hasCompletedInitialSetup];
  unsigned int v6 = v5 ^ [v4 hasCompletedInitialSetup];
  unsigned int v7 = [(BuddySetupAnalytics *)self usedProximitySetup];
  unsigned int v8 = v6 | v7 ^ [v4 usedProximitySetup];
  unint64_t v9 = [(BuddySetupAnalytics *)self dataTransferMethod];
  BOOL v10 = v9 == (void)[v4 dataTransferMethod];
  LODWORD(v9) = [(BuddySetupAnalytics *)self inAppleStore];
  int v11 = v9 ^ [v4 inAppleStore];
  LODWORD(v9) = [(BuddySetupAnalytics *)self softwareUpdatePerformed];
  int v12 = v10 & ~(v8 | v11 | v9 ^ [v4 softwareUpdatePerformed]);
  id v13 = [(BuddySetupAnalytics *)self numberOfPanesPresented];
  if (v13 == [v4 numberOfPanesPresented]) {
    int v14 = v12;
  }
  else {
    int v14 = 0;
  }
  [(BuddySetupAnalytics *)self activeDuration];
  double v16 = v15;
  [v4 activeDuration];
  if (v16 != v17) {
    int v14 = 0;
  }
  [(BuddySetupAnalytics *)self backgroundDuration];
  double v19 = v18;
  [v4 backgroundDuration];
  if (v19 != v20) {
    int v14 = 0;
  }
  [(BuddySetupAnalytics *)self otherDuration];
  double v22 = v21;
  [v4 otherDuration];
  if (v22 == v23) {
    int v24 = v14;
  }
  else {
    int v24 = 0;
  }
  unsigned int v25 = [(BuddySetupAnalytics *)self isSignedIntoAppleID];
  unsigned int v26 = v24 & ~(v25 ^ [v4 isSignedIntoAppleID]);
  unint64_t v27 = [(BuddySetupAnalytics *)self followUpItemsCount];
  id v28 = [v4 followUpItemsCount];

  if ((id)v27 == v28) {
    return v26;
  }
  else {
    return 0;
  }
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)self hasCompletedInitialSetup]];
  [v3 setObject:v4 forKeyedSubscript:@"hasCompletedInitialSetup"];

  unsigned int v5 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)self usedProximitySetup]];
  [v3 setObject:v5 forKeyedSubscript:@"usedProximitySetup"];

  unsigned int v6 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)self dataTransferMethod]];
  [v3 setObject:v6 forKeyedSubscript:@"dataTransferMethod"];

  unsigned int v7 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)self inAppleStore]];
  [v3 setObject:v7 forKeyedSubscript:@"inAppleStore"];

  unsigned int v8 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)self softwareUpdatePerformed]];
  [v3 setObject:v8 forKeyedSubscript:@"softwareUpdatePerformed"];

  unint64_t v9 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)self numberOfPanesPresented]];
  [v3 setObject:v9 forKeyedSubscript:@"numberOfPanesPresented"];

  [(BuddySetupAnalytics *)self activeDuration];
  BOOL v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"activeDuration"];

  [(BuddySetupAnalytics *)self backgroundDuration];
  int v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"backgroundDuration"];

  [(BuddySetupAnalytics *)self otherDuration];
  int v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v12 forKeyedSubscript:@"otherDuration"];

  id v13 = +[NSNumber numberWithBool:[(BuddySetupAnalytics *)self isSignedIntoAppleID]];
  [v3 setObject:v13 forKeyedSubscript:@"isSignedIntoAppleID"];

  int v14 = +[NSNumber numberWithUnsignedInteger:[(BuddySetupAnalytics *)self followUpItemsCount]];
  [v3 setObject:v14 forKeyedSubscript:@"followUpItemsCount"];

  return v3;
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