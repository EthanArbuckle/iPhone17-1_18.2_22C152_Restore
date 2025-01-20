@interface SADistance
+ (id)localizedStringForDistanceInMeters:(double)a3 forCity:(BOOL)a4;
- (BOOL)isImperialUnit;
- (BOOL)isMetricUnit;
- (BOOL)isWithinMaxDistanceToShow;
- (NSString)localizedDistanceString;
- (double)distanceInMeters;
- (double)distanceInMiles;
- (id)_unitLength;
- (id)localizedDistanceStringForCity:(BOOL)a3 forceUnit:(BOOL)a4;
@end

@implementation SADistance

+ (id)localizedStringForDistanceInMeters:(double)a3 forCity:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[NSLocale _ma_locale];
  unsigned int v7 = objc_msgSend(v6, "_navigation_distanceUsesMetricSystemIgnoringUserPreference:", 1);

  id v8 = objc_alloc_init((Class)SADistance);
  double v9 = a3 * 0.000621371192;
  if (v7)
  {
    double v9 = a3;
    v10 = &SADistanceUnitMetersValue;
  }
  else
  {
    v10 = &SADistanceUnitMilesValue;
  }
  v11 = +[NSNumber numberWithDouble:v9];
  [v8 setValue:v11];

  [v8 setUnit:*v10];
  v12 = [v8 localizedDistanceStringForCity:v4 forceUnit:0];

  return v12;
}

- (NSString)localizedDistanceString
{
  return (NSString *)[(SADistance *)self localizedDistanceStringForCity:0 forceUnit:1];
}

- (id)localizedDistanceStringForCity:(BOOL)a3 forceUnit:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(SADistance *)self value];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 > 0.0 && (a3 || [(SADistance *)self isWithinMaxDistanceToShow]))
  {
    unsigned int v10 = [(SADistance *)self isMetricUnit];
    if (v4)
    {
      v11 = [(SADistance *)self _unitLength];
      if (v10) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 3;
      }
      uint64_t v13 = +[NSMeasurementFormatter _ma_distanceStringWithValue:v11 unit:v12 style:v9];
    }
    else
    {
      [(SADistance *)self distanceInMeters];
      double v16 = v15;
      v11 = +[NSLocale _ma_locale];
      if (v10) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
      uint64_t v13 = +[NSString _navigation_localizedStringForDistance:2 detail:v10 unitFormat:v11 locale:v17 useMetric:1 useYards:v16];
    }
    v14 = (void *)v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isWithinMaxDistanceToShow
{
  if ([(SADistance *)self isImperialUnit])
  {
    [(SADistance *)self distanceInMiles];
    double v4 = 100.0;
  }
  else
  {
    [(SADistance *)self distanceInMeters];
    double v4 = 100000.0;
  }
  return v3 < v4;
}

- (double)distanceInMiles
{
  double v3 = [(SADistance *)self value];
  [v3 doubleValue];
  double v5 = v4;

  v6 = [(SADistance *)self unit];
  unsigned int v7 = [v6 isEqualToString:SADistanceUnitFeetValue];

  if (v7) {
    return v5 / 5280.0;
  }
  double v9 = [(SADistance *)self unit];
  int v10 = [v9 isEqualToString:SADistanceUnitMilesValue];

  double result = v5;
  if ((v10 & 1) == 0)
  {
    v11 = [(SADistance *)self unit];
    unsigned int v12 = [v11 isEqualToString:SADistanceUnitMetersValue];

    if (v12) {
      return v5 * 0.000621371192;
    }
    uint64_t v13 = [(SADistance *)self unit];
    unsigned int v14 = [v13 isEqualToString:SADistanceUnitKilometersValue];

    if (v14)
    {
      double v15 = v5 * 1000.0;
    }
    else
    {
      double v16 = [(SADistance *)self unit];
      unsigned int v17 = [v16 isEqualToString:SADistanceUnitCentimetersValue];

      double result = 0.0;
      if (!v17) {
        return result;
      }
      double v15 = v5 / 100.0;
    }
    return v15 * 0.000621371192;
  }
  return result;
}

- (double)distanceInMeters
{
  double v3 = [(SADistance *)self value];
  [v3 doubleValue];
  double v5 = v4;

  v6 = [(SADistance *)self unit];
  unsigned int v7 = [v6 isEqualToString:SADistanceUnitFeetValue];

  if (v7)
  {
    double v8 = 0.3048;
    return v5 * v8;
  }
  double v9 = [(SADistance *)self unit];
  unsigned int v10 = [v9 isEqualToString:SADistanceUnitMilesValue];

  if (v10)
  {
    double v8 = 1609.344;
    return v5 * v8;
  }
  v11 = [(SADistance *)self unit];
  int v12 = [v11 isEqualToString:SADistanceUnitMetersValue];

  double result = v5;
  if (v12) {
    return result;
  }
  unsigned int v14 = [(SADistance *)self unit];
  unsigned int v15 = [v14 isEqualToString:SADistanceUnitKilometersValue];

  if (v15)
  {
    double v8 = 1000.0;
    return v5 * v8;
  }
  double v16 = [(SADistance *)self unit];
  unsigned int v17 = [v16 isEqualToString:SADistanceUnitCentimetersValue];

  double result = 0.0;
  if (v17) {
    return v5 / 100.0;
  }
  return result;
}

- (BOOL)isImperialUnit
{
  double v3 = [(SADistance *)self unit];
  if ([v3 isEqualToString:SADistanceUnitFeetValue])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    double v5 = [(SADistance *)self unit];
    unsigned __int8 v4 = [v5 isEqualToString:SADistanceUnitMilesValue];
  }
  return v4;
}

- (BOOL)isMetricUnit
{
  return ![(SADistance *)self isImperialUnit];
}

- (id)_unitLength
{
  double v3 = [(SADistance *)self unit];
  unsigned int v4 = [v3 isEqualToString:SADistanceUnitFeetValue];

  if (v4)
  {
    double v5 = +[NSUnitLength feet];
  }
  else
  {
    v6 = [(SADistance *)self unit];
    unsigned int v7 = [v6 isEqualToString:SADistanceUnitMilesValue];

    if (v7)
    {
      double v5 = +[NSUnitLength miles];
    }
    else
    {
      double v8 = [(SADistance *)self unit];
      unsigned int v9 = [v8 isEqualToString:SADistanceUnitMetersValue];

      if (v9)
      {
        double v5 = +[NSUnitLength meters];
      }
      else
      {
        unsigned int v10 = [(SADistance *)self unit];
        unsigned int v11 = [v10 isEqualToString:SADistanceUnitKilometersValue];

        if (v11)
        {
          double v5 = +[NSUnitLength kilometers];
        }
        else
        {
          int v12 = [(SADistance *)self unit];
          unsigned int v13 = [v12 isEqualToString:SADistanceUnitCentimetersValue];

          if (v13)
          {
            double v5 = +[NSUnitLength centimeters];
          }
          else
          {
            double v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

@end