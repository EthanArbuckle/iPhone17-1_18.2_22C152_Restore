@interface AFPersonalUserSettings
+ (BOOL)supportsSecureCoding;
- (AFPersonalUserSettings)initWithCoder:(id)a3;
- (BOOL)twentyFourHourTimeDisplay;
- (NSString)countryCode;
- (NSString)preferredLanguage;
- (NSString)region;
- (NSString)temperatureUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setTwentyFourHourTimeDisplay:(BOOL)a3;
@end

@implementation AFPersonalUserSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
}

- (void)setPreferredLanguage:(id)a3
{
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setRegion:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setTwentyFourHourTimeDisplay:(BOOL)a3
{
  self->_twentyFourHourTimeDisplay = a3;
}

- (BOOL)twentyFourHourTimeDisplay
{
  return self->_twentyFourHourTimeDisplay;
}

- (void)setTemperatureUnit:(id)a3
{
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (AFPersonalUserSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFPersonalUserSettings;
  v5 = [(AFPersonalUserSettings *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_temperatureUnit"];
    temperatureUnit = v5->_temperatureUnit;
    v5->_temperatureUnit = (NSString *)v6;

    v5->_twentyFourHourTimeDisplay = [v4 decodeBoolForKey:@"_twentyFourHourTimeDisplay"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_region"];
    region = v5->_region;
    v5->_region = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredLanguage"];
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  temperatureUnit = self->_temperatureUnit;
  id v5 = a3;
  [v5 encodeObject:temperatureUnit forKey:@"_temperatureUnit"];
  [v5 encodeBool:self->_twentyFourHourTimeDisplay forKey:@"_twentyFourHourTimeDisplay"];
  [v5 encodeObject:self->_region forKey:@"_region"];
  [v5 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [v5 encodeObject:self->_preferredLanguage forKey:@"_preferredLanguage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end