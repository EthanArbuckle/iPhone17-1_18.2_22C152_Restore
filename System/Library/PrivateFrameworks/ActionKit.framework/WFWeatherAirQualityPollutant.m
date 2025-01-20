@interface WFWeatherAirQualityPollutant
+ (BOOL)supportsSecureCoding;
- (NSMeasurement)concentration;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (WFWeatherAirQualityPollutant)initWithCoder:(id)a3;
- (WFWeatherAirQualityPollutant)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 concentration:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWeatherAirQualityPollutant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concentration, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (NSMeasurement)concentration
{
  return self->_concentration;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  id v5 = a3;
  [v5 encodeObject:localizedName forKey:@"localizedName"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v5 encodeObject:self->_concentration forKey:@"concentration"];
}

- (WFWeatherAirQualityPollutant)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWeatherAirQualityPollutant *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"concentration"];
    concentration = v5->_concentration;
    v5->_concentration = (NSMeasurement *)v10;

    v12 = v5;
  }

  return v5;
}

- (WFWeatherAirQualityPollutant)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 concentration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WFWeatherAirQualityPollutant;
  v11 = [(WFWeatherAirQualityPollutant *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_concentration, a5);
    uint64_t v13 = [v8 copy];
    localizedName = v12->_localizedName;
    v12->_localizedName = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    localizedDescription = v12->_localizedDescription;
    v12->_localizedDescription = (NSString *)v15;

    v17 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end