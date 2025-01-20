@interface SPWeatherComplicationData
+ (BOOL)supportsSecureCoding;
- (NSString)currentConditionsText;
- (NSString)highLowText;
- (NSString)locationText;
- (NSString)temperatureText;
- (SPWeatherComplicationData)initWithCoder:(id)a3;
- (int64_t)currentConditionsEnum;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentConditionsEnum:(int64_t)a3;
- (void)setCurrentConditionsText:(id)a3;
- (void)setHighLowText:(id)a3;
- (void)setLocationText:(id)a3;
- (void)setTemperatureText:(id)a3;
@end

@implementation SPWeatherComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPWeatherComplicationData;
  id v4 = a3;
  [(SPComplicationData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_temperatureText, @"_TemperatureTextKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_locationText forKey:@"_LocationTextKey"];
  [v4 encodeObject:self->_currentConditionsText forKey:@"_CurrentConditionsTextKey"];
  [v4 encodeInteger:self->_currentConditionsEnum forKey:@"_CurrentConditionsEnumKey"];
  [v4 encodeObject:self->_highLowText forKey:@"_HighLowTextKey"];
}

- (SPWeatherComplicationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SPWeatherComplicationData;
  objc_super v5 = [(SPComplicationData *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_TemperatureTextKey"];
    temperatureText = v5->_temperatureText;
    v5->_temperatureText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_LocationTextKey"];
    locationText = v5->_locationText;
    v5->_locationText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_CurrentConditionsTextKey"];
    currentConditionsText = v5->_currentConditionsText;
    v5->_currentConditionsText = (NSString *)v10;

    v5->_currentConditionsEnum = [v4 decodeIntegerForKey:@"_CurrentConditionsEnumKey"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_HighLowTextKey"];
    highLowText = v5->_highLowText;
    v5->_highLowText = (NSString *)v12;
  }
  return v5;
}

- (NSString)temperatureText
{
  return self->_temperatureText;
}

- (void)setTemperatureText:(id)a3
{
}

- (NSString)locationText
{
  return self->_locationText;
}

- (void)setLocationText:(id)a3
{
}

- (NSString)currentConditionsText
{
  return self->_currentConditionsText;
}

- (void)setCurrentConditionsText:(id)a3
{
}

- (int64_t)currentConditionsEnum
{
  return self->_currentConditionsEnum;
}

- (void)setCurrentConditionsEnum:(int64_t)a3
{
  self->_currentConditionsEnum = a3;
}

- (NSString)highLowText
{
  return self->_highLowText;
}

- (void)setHighLowText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highLowText, 0);
  objc_storeStrong((id *)&self->_currentConditionsText, 0);
  objc_storeStrong((id *)&self->_locationText, 0);

  objc_storeStrong((id *)&self->_temperatureText, 0);
}

@end