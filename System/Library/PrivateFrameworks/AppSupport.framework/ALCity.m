@interface ALCity
- (ALCity)init;
- (ALCity)initWithProperties:(id)a3;
- (ALCity)initWithSQLRow:(char *)a3;
- (BOOL)displayNameIncludingCountryShowsOnlyCountry;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)properties;
- (NSString)classicIdentifier;
- (NSString)countryName;
- (NSString)countryOverride;
- (NSString)localeCode;
- (NSString)name;
- (NSString)timeZone;
- (NSString)unlocalizedCountryName;
- (NSString)unlocalizedCountryOverride;
- (NSString)unlocalizedName;
- (NSString)yahooCode;
- (float)latitude;
- (float)longitude;
- (id)description;
- (id)displayNameIncludingCountry:(BOOL)a3;
- (id)displayNameIncludingCountry:(BOOL)a3 withFormat:(id)a4;
- (int)identifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)ensureLocalized;
- (void)setCountryName:(id)a3;
- (void)setCountryOverride:(id)a3;
- (void)setDisplayNameIncludingCountryShowsOnlyCountry:(BOOL)a3;
- (void)setIdentifier:(int)a3;
- (void)setLatitude:(float)a3;
- (void)setLocaleCode:(id)a3;
- (void)setLongitude:(float)a3;
- (void)setName:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUnlocalizedCountryName:(id)a3;
- (void)setUnlocalizedCountryOverride:(id)a3;
- (void)setUnlocalizedName:(id)a3;
- (void)setYahooCode:(id)a3;
@end

@implementation ALCity

- (ALCity)init
{
  return [(ALCity *)self initWithProperties:0];
}

- (ALCity)initWithProperties:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ALCity;
  v4 = [(ALCity *)&v14 init];
  v5 = v4;
  if (!a3 || !v4) {
    return v5;
  }
  v4->_identifier = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"identifier"), "intValue");
  v5->_localeCode = (NSString *)(id)[a3 objectForKey:@"localeCode"];
  v5->_timeZone = (NSString *)(id)[a3 objectForKey:@"timeZone"];
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"longitude"), "floatValue");
  v5->_longitude = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"latitude"), "floatValue");
  v5->_latitude = v7;
  v5->_unlocalizedName = (NSString *)(id)[a3 objectForKey:@"unlocalizedName"];
  v5->_unlocalizedCountryName = (NSString *)(id)[a3 objectForKey:@"unlocalizedCountryName"];
  v5->_yahooCode = (NSString *)(id)[a3 objectForKey:@"yahooCode"];
  v5->_name = (NSString *)(id)[a3 objectForKey:@"name"];
  v5->_countryName = (NSString *)(id)[a3 objectForKey:@"countryName"];
  v5->_countryOverride = (NSString *)(id)[a3 objectForKey:@"countryOverride"];
  v5->_unlocalizedCountryOverride = (NSString *)(id)[a3 objectForKey:@"unlocalizedCountryOverride"];
  v5->_displayNameIncludingCountryShowsOnlyCountry = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"displayNameIncludingCountryUsesOnlyCountry"), "BOOLValue");
  if (!v5->_unlocalizedName)
  {
    name = v5->_name;
    v5->_name = 0;
    v5->_unlocalizedName = name;
  }
  unlocalizedCountryName = v5->_unlocalizedCountryName;
  if (!unlocalizedCountryName)
  {
    unlocalizedCountryName = v5->_countryName;
    v5->_countryName = 0;
    v5->_unlocalizedCountryName = unlocalizedCountryName;
  }
  if (!v5->_unlocalizedCountryOverride)
  {
    countryOverride = v5->_countryOverride;
    v5->_countryOverride = 0;
    v5->_unlocalizedCountryOverride = countryOverride;
    if (unlocalizedCountryName) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!unlocalizedCountryName) {
LABEL_9:
  }
    v5->_unlocalizedCountryName = (NSString *)&stru_1EDF24210;
LABEL_10:
  v10 = v5->_name;
  v5->_localizationAttempted = v10 != 0;
  if (!v10)
  {
    countryName = v5->_countryName;
    if (countryName || v5->_countryOverride)
    {

      v5->_countryName = 0;
      v5->_countryOverride = 0;
    }
  }
  return v5;
}

- (ALCity)initWithSQLRow:(char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ALCity;
  v4 = [(ALCity *)&v9 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_identifier = atoi(a3[7]);
    if (a3[8]) {
      v5->_localeCode = (NSString *)[[NSString alloc] initWithUTF8String:a3[8]];
    }
    v5->_timeZone = (NSString *)[[NSString alloc] initWithUTF8String:a3[5]];
    v5->_longitude = strtof(a3[3], 0);
    v5->_latitude = strtof(a3[4], 0);
    if (a3[6]) {
      v5->_yahooCode = (NSString *)[[NSString alloc] initWithUTF8String:a3[6]];
    }
    v5->_unlocalizedName = (NSString *)[[NSString alloc] initWithUTF8String:*a3];
    if (a3[1]) {
      float v6 = (__CFString *)[[NSString alloc] initWithUTF8String:a3[1]];
    }
    else {
      float v6 = &stru_1EDF24210;
    }
    v5->_unlocalizedCountryName = (NSString *)v6;
    if (a3[2]) {
      v5->_unlocalizedCountryOverride = (NSString *)[[NSString alloc] initWithUTF8String:a3[2]];
    }
    if (v5->_identifier == 118) {
      char v7 = 1;
    }
    else {
      char v7 = [(NSString *)v5->_localeCode isEqualToString:@"MO"];
    }
    v5->_displayNameIncludingCountryShowsOnlyCountry = v7;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ALCity;
  [(ALCity *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = [a3 identifier] == self->_identifier;
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (void)ensureLocalized
{
  if (!self->_localizationAttempted)
  {
    id v3 = +[ALCityManager sharedManager];
    objc_msgSend(v3, "localizeCities:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", self));
    self->_localizationAttempted = 1;
  }
}

- (id)displayNameIncludingCountry:(BOOL)a3 withFormat:(id)a4
{
  BOOL v5 = a3;
  char v7 = [(ALCity *)self name];
  if (!v5) {
    return v7;
  }
  v8 = [(ALCity *)self countryOverride];
  if (!v8) {
    v8 = [(ALCity *)self countryName];
  }
  if (![(NSString *)v8 length]) {
    return v7;
  }
  objc_super v9 = NSString;
  if (!self->_displayNameIncludingCountryShowsOnlyCountry) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", a4, v7, v8);
  }
  return (id)[v9 stringWithString:v8];
}

- (id)displayNameIncludingCountry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(id)objc_msgSend(MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppSupport", "localizedStringForKey:value:table:", @"CITY %@, COUNTRY %@", &stru_1EDF24210, @"Localizable"];
  return [(ALCity *)self displayNameIncludingCountry:v3 withFormat:v5];
}

- (NSString)classicIdentifier
{
  result = self->_identifierForCPCity;
  if (!result)
  {
    result = (NSString *)[[NSString alloc] initWithFormat:@"%@, %@", -[ALCity unlocalizedName](self, "unlocalizedName"), -[ALCity unlocalizedCountryName](self, "unlocalizedCountryName")];
    self->_identifierForCPCity = result;
  }
  return result;
}

- (NSDictionary)properties
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_identifier), @"identifier");
  localeCode = self->_localeCode;
  if (localeCode) {
    [v3 setObject:localeCode forKey:@"localeCode"];
  }
  [v3 setObject:self->_timeZone forKey:@"timeZone"];
  *(float *)&double v5 = self->_longitude;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"longitude");
  *(float *)&double v6 = self->_latitude;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"latitude");
  yahooCode = self->_yahooCode;
  if (yahooCode) {
    [v3 setObject:yahooCode forKey:@"yahooCode"];
  }
  [v3 setObject:self->_unlocalizedName forKey:@"unlocalizedName"];
  [v3 setObject:self->_unlocalizedCountryName forKey:@"unlocalizedCountryName"];
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  countryName = self->_countryName;
  if (countryName) {
    [v3 setObject:countryName forKey:@"countryName"];
  }
  countryOverride = self->_countryOverride;
  if (countryOverride) {
    [v3 setObject:countryOverride forKey:@"countryOverride"];
  }
  unlocalizedCountryOverride = self->_unlocalizedCountryOverride;
  if (unlocalizedCountryOverride) {
    [v3 setObject:unlocalizedCountryOverride forKey:@"unlocalizedCountryOverride"];
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_displayNameIncludingCountryShowsOnlyCountry), @"displayNameIncludingCountryUsesOnlyCountry");
  return (NSDictionary *)v3;
}

- (NSString)name
{
  [(ALCity *)self ensureLocalized];
  result = self->_name;
  if (!result)
  {
    return [(ALCity *)self unlocalizedName];
  }
  return result;
}

- (void)setName:(id)a3
{
  name = self->_name;
  if (name != a3)
  {
    self->_localizationAttempted = 1;

    self->_name = (NSString *)a3;
  }
}

- (NSString)countryName
{
  [(ALCity *)self ensureLocalized];
  result = self->_countryName;
  if (!result)
  {
    return [(ALCity *)self unlocalizedCountryName];
  }
  return result;
}

- (void)setCountryName:(id)a3
{
  countryName = self->_countryName;
  if (countryName != a3)
  {
    self->_localizationAttempted = 1;

    self->_countryName = (NSString *)a3;
  }
}

- (NSString)countryOverride
{
  [(ALCity *)self ensureLocalized];
  result = self->_countryOverride;
  if (!result)
  {
    return [(ALCity *)self unlocalizedCountryOverride];
  }
  return result;
}

- (void)setCountryOverride:(id)a3
{
  countryOverride = self->_countryOverride;
  if (countryOverride != a3)
  {
    self->_localizationAttempted = 1;

    self->_countryOverride = (NSString *)a3;
  }
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (void)setUnlocalizedName:(id)a3
{
  unlocalizedName = self->_unlocalizedName;
  if (unlocalizedName != a3)
  {

    self->_unlocalizedName = (NSString *)a3;
    self->_identifierForCPCity = 0;
  }
}

- (NSString)unlocalizedCountryName
{
  return self->_unlocalizedCountryName;
}

- (void)setUnlocalizedCountryName:(id)a3
{
  unlocalizedCountryName = self->_unlocalizedCountryName;
  if (unlocalizedCountryName != a3)
  {

    self->_unlocalizedCountryName = (NSString *)a3;
    self->_identifierForCPCity = 0;
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCity;
  return (id)[NSString stringWithFormat:@"%@ %@ [id %d], %@ [%@] || %@, %@, %@, || %f %f", -[ALCity description](&v3, sel_description), -[ALCity name](self, "name"), self->_identifier, -[ALCity countryName](self, "countryName"), -[ALCity countryOverride](self, "countryOverride"), self->_timeZone, self->_localeCode, self->_yahooCode, self->_latitude, self->_longitude];
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (void)setLocaleCode:(id)a3
{
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (float)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (float)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (NSString)yahooCode
{
  return self->_yahooCode;
}

- (void)setYahooCode:(id)a3
{
}

- (NSString)unlocalizedCountryOverride
{
  return self->_unlocalizedCountryOverride;
}

- (void)setUnlocalizedCountryOverride:(id)a3
{
}

- (BOOL)displayNameIncludingCountryShowsOnlyCountry
{
  return self->_displayNameIncludingCountryShowsOnlyCountry;
}

- (void)setDisplayNameIncludingCountryShowsOnlyCountry:(BOOL)a3
{
  self->_displayNameIncludingCountryShowsOnlyCountry = a3;
}

@end