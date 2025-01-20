@interface WFWeatherData
+ (BOOL)supportsSecureCoding;
+ (id)precipitationAmountUnit;
+ (id)pressureUnit;
+ (id)userTemperatureUnitString:(id)a3;
+ (id)visibilityUnit;
+ (id)windSpeedUnit;
- (CLLocation)location;
- (NSArray)pollutants;
- (NSDate)date;
- (NSDate)sunriseTime;
- (NSDate)sunsetTime;
- (NSMeasurement)dewpoint;
- (NSMeasurement)feelsLikeTemperature;
- (NSMeasurement)highTemperature;
- (NSMeasurement)lowTemperature;
- (NSMeasurement)precipitationAmount;
- (NSMeasurement)pressure;
- (NSMeasurement)temperature;
- (NSMeasurement)visibility;
- (NSMeasurement)windSpeed;
- (NSNumber)humidity;
- (NSNumber)localizedAirQualityIndex;
- (NSNumber)precipitationChance;
- (NSNumber)uvIndex;
- (NSNumber)windDirection;
- (NSString)localizedAirQualityCategory;
- (NSString)localizedConditionString;
- (NSString)wfName;
- (WFWeatherData)initWithCoder:(id)a3;
- (WFWeatherData)initWithDate:(id)a3 location:(id)a4 userTemperatureUnitString:(id)a5 temperature:(id)a6 highTemperature:(id)a7 lowTemperature:(id)a8 feelsLikeTemperature:(id)a9 localizedConditionString:(id)a10 visibility:(id)a11 dewpoint:(id)a12 humidity:(id)a13 pressure:(id)a14 precipitationAmount:(id)a15 precipitationChance:(id)a16 windSpeed:(id)a17 windDirection:(id)a18 uvIndex:(id)a19 sunriseTime:(id)a20 sunsetTime:(id)a21 localizedAirQualityIndex:(id)a22 localizedAirQualityCategory:(id)a23 pollutants:(id)a24;
- (id)temperatureString;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWeatherData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollutants, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityCategory, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityIndex, 0);
  objc_storeStrong((id *)&self->_sunsetTime, 0);
  objc_storeStrong((id *)&self->_sunriseTime, 0);
  objc_storeStrong((id *)&self->_uvIndex, 0);
  objc_storeStrong((id *)&self->_windDirection, 0);
  objc_storeStrong((id *)&self->_windSpeed, 0);
  objc_storeStrong((id *)&self->_precipitationChance, 0);
  objc_storeStrong((id *)&self->_precipitationAmount, 0);
  objc_storeStrong((id *)&self->_pressure, 0);
  objc_storeStrong((id *)&self->_humidity, 0);
  objc_storeStrong((id *)&self->_dewpoint, 0);
  objc_storeStrong((id *)&self->_visibility, 0);
  objc_storeStrong((id *)&self->_localizedConditionString, 0);
  objc_storeStrong((id *)&self->_feelsLikeTemperature, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSArray)pollutants
{
  return self->_pollutants;
}

- (NSString)localizedAirQualityCategory
{
  return self->_localizedAirQualityCategory;
}

- (NSNumber)localizedAirQualityIndex
{
  return self->_localizedAirQualityIndex;
}

- (NSDate)sunsetTime
{
  return self->_sunsetTime;
}

- (NSDate)sunriseTime
{
  return self->_sunriseTime;
}

- (NSNumber)uvIndex
{
  return self->_uvIndex;
}

- (NSNumber)windDirection
{
  return self->_windDirection;
}

- (NSMeasurement)windSpeed
{
  return self->_windSpeed;
}

- (NSNumber)precipitationChance
{
  return self->_precipitationChance;
}

- (NSMeasurement)precipitationAmount
{
  return self->_precipitationAmount;
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSNumber)humidity
{
  return self->_humidity;
}

- (NSMeasurement)dewpoint
{
  return self->_dewpoint;
}

- (NSMeasurement)visibility
{
  return self->_visibility;
}

- (NSString)localizedConditionString
{
  return self->_localizedConditionString;
}

- (NSMeasurement)feelsLikeTemperature
{
  return self->_feelsLikeTemperature;
}

- (NSMeasurement)lowTemperature
{
  return self->_lowTemperature;
}

- (NSMeasurement)highTemperature
{
  return self->_highTemperature;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)date
{
  return self->_date;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_temperature forKey:@"temperature"];
  [v5 encodeObject:self->_highTemperature forKey:@"highTemperature"];
  [v5 encodeObject:self->_lowTemperature forKey:@"lowTemperature"];
  [v5 encodeObject:self->_feelsLikeTemperature forKey:@"feelsLikeTemperature"];
  [v5 encodeObject:self->_localizedConditionString forKey:@"localizedConditionString"];
  [v5 encodeObject:self->_visibility forKey:@"visibility"];
  [v5 encodeObject:self->_dewpoint forKey:@"dewpoint"];
  [v5 encodeObject:self->_humidity forKey:@"humidity"];
  [v5 encodeObject:self->_pressure forKey:@"pressure"];
  [v5 encodeObject:self->_precipitationAmount forKey:@"precipitationAmount"];
  [v5 encodeObject:self->_precipitationChance forKey:@"precipitationChance"];
  [v5 encodeObject:self->_windSpeed forKey:@"windSpeed"];
  [v5 encodeObject:self->_windDirection forKey:@"windDirection"];
  [v5 encodeObject:self->_uvIndex forKey:@"uvIndex"];
  [v5 encodeObject:self->_sunriseTime forKey:@"sunriseTime"];
  [v5 encodeObject:self->_sunsetTime forKey:@"sunsetTime"];
  [v5 encodeObject:self->_localizedAirQualityIndex forKey:@"localizedAirQualityIndex"];
  [v5 encodeObject:self->_localizedAirQualityCategory forKey:@"localizedAirQualityCategory"];
  [v5 encodeObject:self->_pollutants forKey:@"pollutants"];
}

- (WFWeatherData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWeatherData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2050000000;
    v8 = (void *)getCLLocationClass_softClass;
    uint64_t v59 = getCLLocationClass_softClass;
    if (!getCLLocationClass_softClass)
    {
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __getCLLocationClass_block_invoke;
      v55[3] = &unk_264E5EC88;
      v55[4] = &v56;
      __getCLLocationClass_block_invoke((uint64_t)v55);
      v8 = (void *)v57[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v56, 8);
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"temperature"];
    temperature = v5->_temperature;
    v5->_temperature = (NSMeasurement *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highTemperature"];
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSMeasurement *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lowTemperature"];
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSMeasurement *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feelsLikeTemperature"];
    feelsLikeTemperature = v5->_feelsLikeTemperature;
    v5->_feelsLikeTemperature = (NSMeasurement *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedConditionString"];
    localizedConditionString = v5->_localizedConditionString;
    v5->_localizedConditionString = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visibility"];
    visibility = v5->_visibility;
    v5->_visibility = (NSMeasurement *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dewpoint"];
    dewpoint = v5->_dewpoint;
    v5->_dewpoint = (NSMeasurement *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"humidity"];
    humidity = v5->_humidity;
    v5->_humidity = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pressure"];
    pressure = v5->_pressure;
    v5->_pressure = (NSMeasurement *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"precipitationAmount"];
    precipitationAmount = v5->_precipitationAmount;
    v5->_precipitationAmount = (NSMeasurement *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"precipitationChance"];
    precipitationChance = v5->_precipitationChance;
    v5->_precipitationChance = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windSpeed"];
    windSpeed = v5->_windSpeed;
    v5->_windSpeed = (NSMeasurement *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windDirection"];
    windDirection = v5->_windDirection;
    v5->_windDirection = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uvIndex"];
    uvIndex = v5->_uvIndex;
    v5->_uvIndex = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sunriseTime"];
    sunriseTime = v5->_sunriseTime;
    v5->_sunriseTime = (NSDate *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sunsetTime"];
    sunsetTime = v5->_sunsetTime;
    v5->_sunsetTime = (NSDate *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAirQualityIndex"];
    localizedAirQualityIndex = v5->_localizedAirQualityIndex;
    v5->_localizedAirQualityIndex = (NSNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAirQualityCategory"];
    localizedAirQualityCategory = v5->_localizedAirQualityCategory;
    v5->_localizedAirQualityCategory = (NSString *)v46;

    v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"pollutants"];
    pollutants = v5->_pollutants;
    v5->_pollutants = (NSArray *)v51;

    v53 = v5;
  }

  return v5;
}

- (NSString)wfName
{
  v3 = [(WFWeatherData *)self temperatureString];
  id v4 = [(WFWeatherData *)self localizedConditionString];
  id v5 = v4;
  if (v3 && v4)
  {
    uint64_t v6 = NSString;
    v7 = WFLocalizedString(@"%1$@ and %2$@");
    v8 = objc_msgSend(v6, "stringWithFormat:", v7, v3, v5);

    goto LABEL_9;
  }
  if (v3)
  {
    id v9 = v3;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  if (v4)
  {
    id v9 = v4;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return (NSString *)v8;
}

- (id)temperatureString
{
  v2 = [(WFWeatherData *)self temperature];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08988]);
    [v3 setUnitOptions:1];
    id v4 = [v3 numberFormatter];
    [v4 setRoundingMode:5];

    id v5 = [v3 numberFormatter];
    [v5 setMaximumFractionDigits:0];

    uint64_t v6 = [v3 stringFromMeasurement:v2];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (WFWeatherData)initWithDate:(id)a3 location:(id)a4 userTemperatureUnitString:(id)a5 temperature:(id)a6 highTemperature:(id)a7 lowTemperature:(id)a8 feelsLikeTemperature:(id)a9 localizedConditionString:(id)a10 visibility:(id)a11 dewpoint:(id)a12 humidity:(id)a13 pressure:(id)a14 precipitationAmount:(id)a15 precipitationChance:(id)a16 windSpeed:(id)a17 windDirection:(id)a18 uvIndex:(id)a19 sunriseTime:(id)a20 sunsetTime:(id)a21 localizedAirQualityIndex:(id)a22 localizedAirQualityCategory:(id)a23 pollutants:(id)a24
{
  id v79 = a3;
  id v88 = a4;
  id v82 = a5;
  id v92 = a6;
  id v91 = a7;
  id v90 = a8;
  id v89 = a9;
  id v29 = a10;
  id v87 = a11;
  id v86 = a12;
  id v85 = a13;
  id v84 = a14;
  id v83 = a15;
  id v81 = a16;
  id v80 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  v93.receiver = self;
  v93.super_class = (Class)WFWeatherData;
  v37 = [(WFWeatherData *)&v93 init];
  if (v37)
  {
    +[WFWeatherData userTemperatureUnitString:v82];
    uint64_t v38 = v78 = v33;
    objc_storeStrong((id *)&v37->_date, a3);
    uint64_t v39 = [v88 copy];
    location = v37->_location;
    v37->_location = (CLLocation *)v39;

    uint64_t v41 = [v92 measurementByConvertingToUnit:v38];
    temperature = v37->_temperature;
    v37->_temperature = (NSMeasurement *)v41;

    uint64_t v43 = [v91 measurementByConvertingToUnit:v38];
    highTemperature = v37->_highTemperature;
    v37->_highTemperature = (NSMeasurement *)v43;

    uint64_t v45 = [v90 measurementByConvertingToUnit:v38];
    lowTemperature = v37->_lowTemperature;
    v37->_lowTemperature = (NSMeasurement *)v45;

    uint64_t v47 = [v89 measurementByConvertingToUnit:v38];
    feelsLikeTemperature = v37->_feelsLikeTemperature;
    v37->_feelsLikeTemperature = (NSMeasurement *)v47;

    objc_storeStrong((id *)&v37->_localizedConditionString, a10);
    +[WFWeatherData visibilityUnit];
    id v49 = v36;
    id v50 = v35;
    v52 = id v51 = v32;
    uint64_t v53 = [v87 measurementByConvertingToUnit:v52];
    visibility = v37->_visibility;
    v37->_visibility = (NSMeasurement *)v53;

    uint64_t v55 = [v86 measurementByConvertingToUnit:v38];
    dewpoint = v37->_dewpoint;
    v37->_dewpoint = (NSMeasurement *)v55;

    uint64_t v57 = [v85 copy];
    humidity = v37->_humidity;
    v37->_humidity = (NSNumber *)v57;

    uint64_t v59 = +[WFWeatherData pressureUnit];
    uint64_t v60 = [v84 measurementByConvertingToUnit:v59];
    pressure = v37->_pressure;
    v37->_pressure = (NSMeasurement *)v60;

    v62 = +[WFWeatherData precipitationAmountUnit];
    uint64_t v63 = [v83 measurementByConvertingToUnit:v62];
    precipitationAmount = v37->_precipitationAmount;
    v37->_precipitationAmount = (NSMeasurement *)v63;

    uint64_t v65 = [v81 copy];
    precipitationChance = v37->_precipitationChance;
    v37->_precipitationChance = (NSNumber *)v65;

    v67 = +[WFWeatherData windSpeedUnit];
    uint64_t v68 = [v80 measurementByConvertingToUnit:v67];
    windSpeed = v37->_windSpeed;
    v37->_windSpeed = (NSMeasurement *)v68;

    id v32 = v51;
    id v35 = v50;
    id v36 = v49;
    uint64_t v70 = [v30 copy];
    windDirection = v37->_windDirection;
    v37->_windDirection = (NSNumber *)v70;

    uint64_t v72 = [v31 copy];
    uvIndex = v37->_uvIndex;
    v37->_uvIndex = (NSNumber *)v72;

    objc_storeStrong((id *)&v37->_sunriseTime, a20);
    objc_storeStrong((id *)&v37->_sunsetTime, a21);
    objc_storeStrong((id *)&v37->_localizedAirQualityIndex, a22);
    objc_storeStrong((id *)&v37->_localizedAirQualityCategory, a23);
    objc_storeStrong((id *)&v37->_pollutants, a24);
    v74 = v37;

    id v33 = v78;
  }

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)windSpeedUnit
{
  return (id)[MEMORY[0x263F85370] defaultUnitForUnitType:*MEMORY[0x263F857E8]];
}

+ (id)precipitationAmountUnit
{
  return (id)[MEMORY[0x263F85370] defaultUnitForUnitType:*MEMORY[0x263F857C8]];
}

+ (id)pressureUnit
{
  return (id)[MEMORY[0x263F85370] defaultUnitForUnitType:*MEMORY[0x263F857E0]];
}

+ (id)visibilityUnit
{
  return (id)[MEMORY[0x263F85370] defaultUnitForUnitType:*MEMORY[0x263F857C8]];
}

+ (id)userTemperatureUnitString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
    id v5 = [v6 objectForKey:*MEMORY[0x263EFF548]];
  }
  if ([v5 isEqualToString:*MEMORY[0x263EFF550]])
  {
    uint64_t v7 = [MEMORY[0x263F08D20] celsius];
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x263EFF558]]) {
      [MEMORY[0x263F08D20] fahrenheit];
    }
    else {
    uint64_t v7 = [MEMORY[0x263F85370] defaultUnitForUnitType:*MEMORY[0x263F857F0]];
    }
  }
  v8 = (void *)v7;

  return v8;
}

@end