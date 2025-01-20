@interface CalFoundationPreferences
+ (id)shared;
- (BOOL)stopTimeDemoModeActive;
- (CalFoundationPreferences)init;
- (CalFoundationPreferences)initWithPreferencesForUnitTesting:(id)a3;
- (NSDateComponents)stopTimeDemoModeComponents;
- (NSString)stopTimeDemoMode;
- (double)defaultEventDuration;
- (double)simulatedDateForNowOffset;
- (void)setDefaultEventDuration:(double)a3;
- (void)setSimulatedDateForNowOffset:(double)a3;
- (void)setStopTimeDemoMode:(id)a3;
@end

@implementation CalFoundationPreferences

+ (id)shared
{
  if (shared_onceToken_1 != -1) {
    dispatch_once(&shared_onceToken_1, &__block_literal_global_36);
  }
  v2 = (void *)shared_sharedPreferences;

  return v2;
}

uint64_t __34__CalFoundationPreferences_shared__block_invoke()
{
  shared_sharedPreferences = objc_alloc_init(CalFoundationPreferences);

  return MEMORY[0x1F41817F8]();
}

- (CalFoundationPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalFoundationPreferences;
  v2 = [(CalFoundationPreferences *)&v6 init];
  if (v2)
  {
    v3 = [[CalPreferences alloc] initWithDomain:@"com.apple.mobilecal"];
    preferences = v2->_preferences;
    v2->_preferences = v3;
  }
  return v2;
}

- (CalFoundationPreferences)initWithPreferencesForUnitTesting:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalFoundationPreferences;
  objc_super v6 = [(CalFoundationPreferences *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferences, a3);
  }

  return v7;
}

- (double)simulatedDateForNowOffset
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"simulatedDateForNowOffset" expectedClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setSimulatedDateForNowOffset:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(CalPreferences *)self->_preferences setValueForPreference:@"simulatedDateForNowOffset" value:v4 notificationName:0];
}

- (NSString)stopTimeDemoMode
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"stopTimeDemoMode" expectedClass:v3];
}

- (void)setStopTimeDemoMode:(id)a3
{
}

- (BOOL)stopTimeDemoModeActive
{
  v2 = [(CalFoundationPreferences *)self stopTimeDemoMode];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSDateComponents)stopTimeDemoModeComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  BOOL v4 = [(CalFoundationPreferences *)self stopTimeDemoMode];
  if ([(CalFoundationPreferences *)self stopTimeDemoModeActive])
  {
    double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    objc_super v6 = [MEMORY[0x1E4F1C9C8] now];
    v7 = [v5 components:124 fromDate:v6];

    v8 = [v4 componentsSeparatedByString:@":"];
    if ([v8 count])
    {
      objc_super v9 = [v8 objectAtIndexedSubscript:0];
      objc_msgSend(v7, "setYear:", (int)objc_msgSend(v9, "intValue"));
    }
    if ((unint64_t)[v8 count] >= 2)
    {
      v10 = [v8 objectAtIndexedSubscript:1];
      objc_msgSend(v7, "setMonth:", (int)objc_msgSend(v10, "intValue"));
    }
    if ((unint64_t)[v8 count] >= 3)
    {
      v11 = [v8 objectAtIndexedSubscript:2];
      objc_msgSend(v7, "setDay:", (int)objc_msgSend(v11, "intValue"));
    }
    if ((unint64_t)[v8 count] >= 4)
    {
      v12 = [v8 objectAtIndexedSubscript:3];
      objc_msgSend(v7, "setHour:", (int)objc_msgSend(v12, "intValue"));
    }
    if ((unint64_t)[v8 count] >= 5)
    {
      v13 = [v8 objectAtIndexedSubscript:4];
      objc_msgSend(v7, "setMinute:", (int)objc_msgSend(v13, "intValue"));
    }
    v14 = [v5 dateFromComponents:v7];
    id v3 = [v5 components:638 fromDate:v14];
  }

  return (NSDateComponents *)v3;
}

- (double)defaultEventDuration
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultEventDuration" expectedClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    if (v4 >= 21600.0 || v4 <= 240.0) {
      double v6 = 3600.0;
    }
    else {
      double v6 = v4;
    }
  }
  else
  {
    double v6 = 3600.0;
  }

  return v6;
}

- (void)setDefaultEventDuration:(double)a3
{
  if (a3 > 240.0 && a3 < 21600.0)
  {
    preferences = self->_preferences;
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CalPreferences *)preferences setValueForPreference:@"defaultEventDuration" value:v4 notificationName:@"com.apple.mobilecal.preference.notification.defaultEventDuration"];
  }
}

- (void).cxx_destruct
{
}

@end