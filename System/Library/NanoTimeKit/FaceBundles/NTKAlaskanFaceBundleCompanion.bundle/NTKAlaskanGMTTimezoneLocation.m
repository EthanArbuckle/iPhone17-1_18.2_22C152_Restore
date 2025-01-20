@interface NTKAlaskanGMTTimezoneLocation
- (BOOL)isEqual:(id)a3;
- (NSNumber)cityIdentifier;
- (NSString)cityName;
- (NSString)locationName;
- (NSString)timezone;
- (double)sunriseHourOfDay;
- (double)sunsetHourOfDay;
- (float)hourOffset;
- (void)setCityIdentifier:(id)a3;
- (void)setCityName:(id)a3;
- (void)setHourOffset:(float)a3;
- (void)setLocationName:(id)a3;
- (void)setSunriseHourOfDay:(double)a3;
- (void)setSunsetHourOfDay:(double)a3;
- (void)setTimezone:(id)a3;
@end

@implementation NTKAlaskanGMTTimezoneLocation

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  v9 = [(NTKAlaskanGMTTimezoneLocation *)self locationName];
  v10 = [v8 locationName];
  if (v9 != v10)
  {
    v3 = [(NTKAlaskanGMTTimezoneLocation *)self locationName];
    v4 = [v8 locationName];
    if (![v3 isEqualToString:v4])
    {
      char v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  [(NTKAlaskanGMTTimezoneLocation *)self hourOffset];
  float v13 = v12;
  [v8 hourOffset];
  if (v13 != v14)
  {
    char v11 = 0;
    goto LABEL_15;
  }
  v15 = [(NTKAlaskanGMTTimezoneLocation *)self timezone];
  v16 = [v8 timezone];
  if (v15 == v16
    || ([(NTKAlaskanGMTTimezoneLocation *)self timezone],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v8 timezone],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v5 isEqualToString:v6]))
  {
    [(NTKAlaskanGMTTimezoneLocation *)self sunriseHourOfDay];
    [v8 sunriseHourOfDay];
    if (CLKFloatEqualsFloat())
    {
      [(NTKAlaskanGMTTimezoneLocation *)self sunsetHourOfDay];
      [v8 sunsetHourOfDay];
      char v11 = CLKFloatEqualsFloat();
    }
    else
    {
      char v11 = 0;
    }
    if (v15 == v16) {
      goto LABEL_14;
    }
  }
  else
  {
    char v11 = 0;
  }

LABEL_14:
LABEL_15:
  if (v9 != v10) {
    goto LABEL_16;
  }
LABEL_17:

  return v11;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
}

- (float)hourOffset
{
  return self->_hourOffset;
}

- (void)setHourOffset:(float)a3
{
  self->_hourOffset = a3;
}

- (NSString)timezone
{
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
}

- (NSNumber)cityIdentifier
{
  return self->_cityIdentifier;
}

- (void)setCityIdentifier:(id)a3
{
}

- (NSString)cityName
{
  return self->_cityName;
}

- (void)setCityName:(id)a3
{
}

- (double)sunriseHourOfDay
{
  return self->_sunriseHourOfDay;
}

- (void)setSunriseHourOfDay:(double)a3
{
  self->_sunriseHourOfDay = a3;
}

- (double)sunsetHourOfDay
{
  return self->_sunsetHourOfDay;
}

- (void)setSunsetHourOfDay:(double)a3
{
  self->_sunsetHourOfDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityName, 0);
  objc_storeStrong((id *)&self->_cityIdentifier, 0);
  objc_storeStrong((id *)&self->_timezone, 0);

  objc_storeStrong((id *)&self->_locationName, 0);
}

@end