@interface _PHMeCardGeocoderPreferences
+ (id)sharedPreferences;
- (BOOL)hasValidNetworkPreferences;
- (BOOL)isActivelyUsing;
- (_PHMeCardGeocoderPreferences)init;
- (double)_bestTimeIntervalForKey:(id)a3;
- (double)activeUsagePeriodLength;
- (double)periodLength;
- (id)_constructCurrentValues;
- (void)dealloc;
- (void)setActivelyUsing:(BOOL)a3;
@end

@implementation _PHMeCardGeocoderPreferences

+ (id)sharedPreferences
{
  if (qword_1003261D8 != -1) {
    dispatch_once(&qword_1003261D8, &stru_1002CF9F8);
  }
  v2 = (void *)qword_1003261E0;

  return v2;
}

- (_PHMeCardGeocoderPreferences)init
{
  v13.receiver = self;
  v13.super_class = (Class)_PHMeCardGeocoderPreferences;
  v2 = [(_PHMeCardGeocoderPreferences *)&v13 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"PHMeCardGeocoderPreferenceDefaults" ofType:@"plist"];

    if (v4)
    {
      v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading default PHMeCardGeocoder preferences from file: %@", buf, 0xCu);
      }

      v6 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:v4];
      defaultValues = v2->_defaultValues;
      v2->_defaultValues = v6;

      v8 = sub_1000D5130();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v2->_defaultValues;
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Default values = %@", buf, 0xCu);
      }
    }
    uint64_t v10 = [(_PHMeCardGeocoderPreferences *)v2 _constructCurrentValues];
    currentValues = v2->_currentValues;
    v2->_currentValues = (NSDictionary *)v10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_PHMeCardGeocoderPreferences;
  [(_PHMeCardGeocoderPreferences *)&v4 dealloc];
}

- (id)_constructCurrentValues
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = sub_10000FA3C(@"PeriodLength", @"com.apple.mobilephone.PHMeCardGeocoder");
  if (v3) {
    [v2 setValue:v3 forKey:@"PeriodLength"];
  }
  objc_super v4 = sub_10000FA3C(@"ActiveUsagePeriodLength", @"com.apple.mobilephone.PHMeCardGeocoder");
  if (v4) {
    [v2 setValue:v4 forKey:@"ActiveUsagePeriodLength"];
  }
  v5 = +[NSDictionary dictionaryWithDictionary:v2];

  return v5;
}

- (double)_bestTimeIntervalForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_currentValues valueForKey:v4];
  if (v5
    || ([(NSDictionary *)self->_defaultValues valueForKey:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v6 = (double)(int)[v5 intValue];
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)periodLength
{
  [(_PHMeCardGeocoderPreferences *)self _bestTimeIntervalForKey:@"PeriodLength"];
  return result;
}

- (double)activeUsagePeriodLength
{
  [(_PHMeCardGeocoderPreferences *)self _bestTimeIntervalForKey:@"ActiveUsagePeriodLength"];
  return result;
}

- (BOOL)hasValidNetworkPreferences
{
  return [(NSDictionary *)self->_currentValues count] > 1;
}

- (BOOL)isActivelyUsing
{
  v2 = sub_10000FA3C(@"PHMeCardGeocoder.IsActivelyUsing", TUBundleIdentifierMobilePhoneApplication);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)setActivelyUsing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_PHMeCardGeocoderPreferences *)self isActivelyUsing] != a3)
  {
    id v4 = (void *)TUBundleIdentifierMobilePhoneApplication;
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting geocoder actively used value to %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = +[NSNumber numberWithBool:v3];
    sub_10000FB08(@"PHMeCardGeocoder.IsActivelyUsing", v7, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValues, 0);

  objc_storeStrong((id *)&self->_defaultValues, 0);
}

@end