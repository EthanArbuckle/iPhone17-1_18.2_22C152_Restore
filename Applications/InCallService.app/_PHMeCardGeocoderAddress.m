@interface _PHMeCardGeocoderAddress
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelingGeocode;
- (BOOL)checkGeocodeAfterDateForSanity;
- (BOOL)expired;
- (CLGeocoder)geocoder;
- (CNLabeledValue)labeledValue;
- (CNPostalAddress)postalAddress;
- (NSDate)geocodeAfter;
- (NSDate)lastGeocodeAttempt;
- (NSDictionary)locationDictionary;
- (NSString)entityID;
- (_PHMeCardGeocoderAddress)initWithCoder:(id)a3;
- (_PHMeCardGeocoderAddress)initWithLabeledValue:(id)a3 entityID:(id)a4;
- (id)createGeocodeAfterDate;
- (id)debugDescription;
- (id)nextGeocodeAttempt;
- (int)state;
- (int)tries;
- (void)attemptGeocodeWithCompletionBlock:(id)a3;
- (void)cancelGeocode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)recalculateGeocodeAfterDate;
@end

@implementation _PHMeCardGeocoderAddress

- (_PHMeCardGeocoderAddress)initWithLabeledValue:(id)a3 entityID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PHMeCardGeocoderAddress;
  v9 = [(_PHMeCardGeocoderAddress *)&v15 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    entityID = v9->_entityID;
    v9->_entityID = v10;

    objc_storeStrong((id *)&v9->_labeledValue, a3);
    v12 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
    geocoder = v9->_geocoder;
    v9->_geocoder = v12;

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(CLGeocoder *)self->_geocoder cancelGeocode];
  v3.receiver = self;
  v3.super_class = (Class)_PHMeCardGeocoderAddress;
  [(_PHMeCardGeocoderAddress *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return a1 != 0;
}

- (_PHMeCardGeocoderAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_PHMeCardGeocoderAddress;
  v5 = [(_PHMeCardGeocoderAddress *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = NSStringFromSelector("labeledValue");
    v9 = [v4 decodeObjectOfClasses:v7 forKey:v8];

    if (!v9)
    {
      uint64_t v10 = objc_opt_class();
      v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
      v12 = [v4 decodeObjectOfClasses:v11 forKey:@"AddressDictionary"];

      if (v12)
      {
        v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
        v14 = +[CNPostalAddress postalAddressWithAddressBookDictionaryRepresentation:v12];
        if (v14) {
          v9 = (CNLabeledValue *)[objc_alloc((Class)CNLabeledValue) initWithLabel:v13 value:v14];
        }
        else {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
    }
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EntityID"];
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v15;

    labeledValue = v5->_labeledValue;
    v5->_labeledValue = v9;
    v18 = v9;

    v5->_state = [v4 decodeIntForKey:@"State"];
    v5->_tries = [v4 decodeIntForKey:@"Tries"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastGeocodeAttempt"];
    lastGeocodeAttempt = v5->_lastGeocodeAttempt;
    v5->_lastGeocodeAttempt = (NSDate *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  entityID = self->_entityID;
  id v7 = a3;
  [v7 encodeObject:entityID forKey:@"EntityID"];
  labeledValue = self->_labeledValue;
  uint64_t v6 = NSStringFromSelector("labeledValue");
  [v7 encodeObject:labeledValue forKey:v6];

  [v7 encodeInt:self->_state forKey:@"State"];
  [v7 encodeInt:self->_tries forKey:@"Tries"];
  [v7 encodeObject:self->_lastGeocodeAttempt forKey:@"LastGeocodeAttempt"];
  [v7 encodeObject:self->_locationDictionary forKey:@"LocationDictionary"];
  [v7 encodeObject:self->_geocodeAfter forKey:@"GeocodeAfter"];
}

- (id)createGeocodeAfterDate
{
  v2 = +[NSDate date];
  objc_super v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Our date is between start and end dates for geocoder, so we're throttling", (uint8_t *)&v17, 2u);
  }

  unsigned int v4 = time(0);
  srandom(v4);
  uint64_t v5 = random();
  uint64_t v6 = +[_PHMeCardGeocoderPreferences sharedPreferences];
  unsigned int v7 = [v6 isActivelyUsing];

  id v8 = sub_1000D5130();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User has been actively using feature, so using active period length", (uint8_t *)&v17, 2u);
    }

    double v10 = (double)v5 / 2147483650.0;
    v11 = +[_PHMeCardGeocoderPreferences sharedPreferences];
    [v11 activeUsagePeriodLength];
  }
  else
  {
    if (v9)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User has not yet used the feature, so using normal period length", (uint8_t *)&v17, 2u);
    }

    double v10 = (double)v5 / 2147483650.0;
    v11 = +[_PHMeCardGeocoderPreferences sharedPreferences];
    [v11 periodLength];
  }
  double v13 = v10 * v12;

  v14 = +[NSDate dateWithTimeInterval:v2 sinceDate:v13];
  uint64_t v15 = sub_1000D5130();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created geocode-after date of: %@", (uint8_t *)&v17, 0xCu);
  }

  return v14;
}

- (BOOL)checkGeocodeAfterDateForSanity
{
  objc_super v3 = +[_PHMeCardGeocoderPreferences sharedPreferences];
  unsigned int v4 = [v3 isActivelyUsing];

  geocodeAfter = self->_geocodeAfter;
  uint64_t v6 = +[NSDate date];
  [(NSDate *)geocodeAfter timeIntervalSinceDate:v6];
  double v8 = v7;
  BOOL v9 = +[_PHMeCardGeocoderPreferences sharedPreferences];
  double v10 = v9;
  if (v4)
  {
    [v9 activeUsagePeriodLength];
    double v12 = v11;

    if (v8 > v12)
    {
      double v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_geocodeAfter;
        int v20 = 138412290;
        v21 = v14;
        uint64_t v15 = "Geocode-after date had insane value for active use: %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    [v9 periodLength];
    double v17 = v16;

    if (v8 > v17)
    {
      double v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_geocodeAfter;
        int v20 = 138412290;
        v21 = v18;
        uint64_t v15 = "Geocode-after date had insane value: %@";
        goto LABEL_8;
      }
LABEL_9:

      [(_PHMeCardGeocoderAddress *)self recalculateGeocodeAfterDate];
      return 1;
    }
  }
  return 0;
}

- (void)recalculateGeocodeAfterDate
{
  objc_super v3 = [(_PHMeCardGeocoderAddress *)self createGeocodeAfterDate];
  geocodeAfter = self->_geocodeAfter;
  self->_geocodeAfter = v3;
}

- (void)attemptGeocodeWithCompletionBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, void, _PHMeCardGeocoderAddress *))a3;
  if ([(CLGeocoder *)self->_geocoder isGeocoding])
  {
    v4[2](v4, 0, self);
  }
  else if (self->_state == 2)
  {
    v4[2](v4, 1, self);
  }
  else
  {
    uint64_t v5 = +[NSDate date];
    lastGeocodeAttempt = self->_lastGeocodeAttempt;
    self->_lastGeocodeAttempt = v5;

    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    double v12 = sub_100095AE4;
    double v13 = &unk_1002CF960;
    v14 = self;
    uint64_t v15 = v4;
    double v7 = objc_retainBlock(&v10);
    double v8 = [(_PHMeCardGeocoderAddress *)self geocoder];
    BOOL v9 = [(_PHMeCardGeocoderAddress *)self postalAddress];
    [v8 geocodePostalAddress:v9 completionHandler:v7];
  }
}

- (void)cancelGeocode
{
  self->_cancelingGeocode = 1;
  [(CLGeocoder *)self->_geocoder cancelGeocode];
}

- (id)nextGeocodeAttempt
{
  if (self->_state == 2 || [(CLGeocoder *)self->_geocoder isGeocoding])
  {
    objc_super v3 = 0;
  }
  else
  {
    lastGeocodeAttempt = self->_lastGeocodeAttempt;
    if (lastGeocodeAttempt)
    {
      int tries = self->_tries;
      if (tries < 7)
      {
        if (tries) {
          double v7 = (double)(60 * dword_100284EE8[tries - 1]);
        }
        else {
          double v7 = 60.0;
        }
      }
      else
      {
        double v7 = 21600.0;
      }
      objc_super v3 = [(NSDate *)lastGeocodeAttempt dateByAddingTimeInterval:v7];
    }
    else
    {
      if (!self->_geocodeAfter)
      {
        double v8 = [(_PHMeCardGeocoderAddress *)self createGeocodeAfterDate];
        geocodeAfter = self->_geocodeAfter;
        self->_geocodeAfter = v8;

        if (!self->_geocodeAfter) {
          goto LABEL_13;
        }
      }
      double v10 = +[NSDate date];
      uint64_t v11 = [v10 laterDate:self->_geocodeAfter];
      double v12 = self->_geocodeAfter;

      if (v11 == v12)
      {
        objc_super v3 = self->_geocodeAfter;
      }
      else
      {
LABEL_13:
        objc_super v3 = +[NSDate date];
      }
    }
  }

  return v3;
}

- (BOOL)expired
{
  objc_super v3 = [(_PHMeCardGeocoderAddress *)self lastGeocodeAttempt];
  if (v3)
  {
    unsigned int v4 = +[NSDate date];
    uint64_t v5 = [(_PHMeCardGeocoderAddress *)self lastGeocodeAttempt];
    [v4 timeIntervalSinceDate:v5];
    BOOL v7 = v6 > 2592000.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  unsigned int v3 = [(_PHMeCardGeocoderAddress *)self state];
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1002CFA18 + (int)v3);
  }
  id v5 = objc_alloc_init((Class)NSMutableString);
  [v5 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  double v6 = NSStringFromSelector("labeledValue");
  BOOL v7 = [(_PHMeCardGeocoderAddress *)self labeledValue];
  [v5 appendFormat:@"%@=%@", v6, v7];

  [v5 appendFormat:@", "];
  double v8 = NSStringFromSelector("state");
  [v5 appendFormat:@"%@=%@", v8, v4];

  [v5 appendFormat:@", "];
  BOOL v9 = NSStringFromSelector("tries");
  [v5 appendFormat:@"%@=%d", v9, -[_PHMeCardGeocoderAddress tries](self, "tries")];

  [v5 appendFormat:@", "];
  double v10 = NSStringFromSelector("lastGeocodeAttempt");
  uint64_t v11 = [(_PHMeCardGeocoderAddress *)self lastGeocodeAttempt];
  [v5 appendFormat:@"%@=%@", v10, v11];

  [v5 appendFormat:@", "];
  double v12 = NSStringFromSelector("geocodeAfter");
  double v13 = [(_PHMeCardGeocoderAddress *)self geocodeAfter];
  [v5 appendFormat:@"%@=%@", v12, v13];

  [v5 appendFormat:@", "];
  v14 = NSStringFromSelector("expired");
  unsigned int v15 = [(_PHMeCardGeocoderAddress *)self expired];
  CFStringRef v16 = @"NO";
  if (v15) {
    CFStringRef v16 = @"YES";
  }
  [v5 appendFormat:@"%@=%@", v14, v16];

  [v5 appendFormat:@", "];
  double v17 = NSStringFromSelector("locationDictionary");
  v18 = [(_PHMeCardGeocoderAddress *)self locationDictionary];
  [v5 appendFormat:@"%@=%@", v17, v18];

  [v5 appendFormat:@">"];
  id v19 = [v5 copy];

  return v19;
}

- (CNLabeledValue)labeledValue
{
  return (CNLabeledValue *)objc_getProperty(self, a2, 24, 1);
}

- (CNPostalAddress)postalAddress
{
  return (CNPostalAddress *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)entityID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CLGeocoder)geocoder
{
  return (CLGeocoder *)objc_getProperty(self, a2, 48, 1);
}

- (int)tries
{
  return self->_tries;
}

- (NSDictionary)locationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastGeocodeAttempt
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (int)state
{
  return self->_state;
}

- (BOOL)cancelingGeocode
{
  return self->_cancelingGeocode;
}

- (NSDate)geocodeAfter
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocodeAfter, 0);
  objc_storeStrong((id *)&self->_lastGeocodeAttempt, 0);
  objc_storeStrong((id *)&self->_locationDictionary, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);

  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end