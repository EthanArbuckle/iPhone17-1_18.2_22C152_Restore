@interface CLKUIAlmanacTransitInfo
+ (BOOL)supportsSecureCoding;
+ (id)transitInfoForDate:(id)a3;
+ (id)transitInfoForDate:(id)a3 city:(id)a4;
+ (id)transitInfoForDate:(id)a3 city:(id)a4 sunAltitude:(double)a5;
+ (id)transitInfoForDate:(id)a3 location:(id)a4;
+ (id)transitInfoForDate:(id)a3 location:(id)a4 sunAltitude:(double)a5;
- ($F24F406B2B787EFB06265DBA3D28CBD5)location;
- (BOOL)isDateWithinTransitInfo:(id)a3;
- (CLKUIAlmanacTransitInfo)initWithCoder:(id)a3;
- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3;
- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4;
- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4 sunAltitude:(double)a5;
- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4;
- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4 sunAltitude:(double)a5;
- (NSDate)day;
- (NSDate)rise;
- (NSDate)set;
- (NSDate)solarMidnight;
- (NSDate)solarNoon;
- (NSDate)tomorrow;
- (id)_dateOrNil:(double)a3;
- (id)description;
- (int64_t)constantSun;
- (void)encodeWithCoder:(id)a3;
- (void)setConstantSun:(int64_t)a3;
- (void)setDay:(id)a3;
- (void)setLocation:(id)a3;
- (void)setRise:(id)a3;
- (void)setSet:(id)a3;
- (void)setSolarMidnight:(id)a3;
- (void)setSolarNoon:(id)a3;
- (void)setTomorrow:(id)a3;
@end

@implementation CLKUIAlmanacTransitInfo

- (CLKUIAlmanacTransitInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLKUIAlmanacTransitInfo;
  v5 = [(CLKUIAlmanacTransitInfo *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"day"];
    day = v5->_day;
    v5->_day = (NSDate *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lat"];
    [v8 doubleValue];
    v5->_location.latitude = v9;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lon"];
    [v10 doubleValue];
    v5->_location.longitude = v11;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"constantSun"];
    v5->_constantSun = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rise"];
    rise = v5->_rise;
    v5->_rise = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"solarNoon"];
    solarNoon = v5->_solarNoon;
    v5->_solarNoon = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"set"];
    set = v5->_set;
    v5->_set = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"solarMidnight"];
    solarMidnight = v5->_solarMidnight;
    v5->_solarMidnight = (NSDate *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  day = self->_day;
  id v8 = a3;
  [v8 encodeObject:day forKey:@"day"];
  v5 = [NSNumber numberWithDouble:self->_location.latitude];
  [v8 encodeObject:v5 forKey:@"lat"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_location.longitude];
  [v8 encodeObject:v6 forKey:@"lon"];

  v7 = [NSNumber numberWithInteger:self->_constantSun];
  [v8 encodeObject:v7 forKey:@"constantSun"];

  [v8 encodeObject:self->_rise forKey:@"rise"];
  [v8 encodeObject:self->_solarNoon forKey:@"solarNoon"];
  [v8 encodeObject:self->_set forKey:@"set"];
  [v8 encodeObject:self->_solarMidnight forKey:@"solarMidnight"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)transitInfoForDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDate:v4];

  return v5;
}

+ (id)transitInfoForDate:(id)a3 location:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)a1), "initWithDate:location:", v7, var0, var1);

  return v8;
}

+ (id)transitInfoForDate:(id)a3 city:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 city:v6];

  return v8;
}

+ (id)transitInfoForDate:(id)a3 location:(id)a4 sunAltitude:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithDate:location:sunAltitude:", v9, var0, var1, a5);

  return v10;
}

+ (id)transitInfoForDate:(id)a3 city:(id)a4 sunAltitude:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithDate:v9 city:v8 sunAltitude:a5];

  return v10;
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3
{
  return -[CLKUIAlmanacTransitInfo initWithDate:location:](self, "initWithDate:location:", a3, -180.0, -180.0);
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4
{
  return -[CLKUIAlmanacTransitInfo initWithDate:location:sunAltitude:](self, "initWithDate:location:sunAltitude:", a3, a4.var0, a4.var1, *MEMORY[0x1E4F63E78]);
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4
{
  return [(CLKUIAlmanacTransitInfo *)self initWithDate:a3 city:a4 sunAltitude:*MEMORY[0x1E4F63E78]];
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4 sunAltitude:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v10 = objc_opt_new();
  *(float *)&double v11 = var0;
  [v10 setLatitude:v11];
  *(float *)&double v12 = var1;
  [v10 setLongitude:v12];
  uint64_t v13 = [(CLKUIAlmanacTransitInfo *)self initWithDate:v9 city:v10 sunAltitude:a5];

  return v13;
}

- (id)_dateOrNil:(double)a3
{
  if (a3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v3];
  }
  return v5;
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4 sunAltitude:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  [v9 latitude];
  if (v10 == -180.0)
  {
    [v9 longitude];
    if (*(float *)&v11 == -180.0)
    {
      LODWORD(v11) = 1108698724;
      [v9 setLatitude:v11];
      LODWORD(v12) = -1024203161;
      [v9 setLongitude:v12];
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)CLKUIAlmanacTransitInfo;
  uint64_t v13 = [(CLKUIAlmanacTransitInfo *)&v37 init];
  if (v13)
  {
    [v9 latitude];
    double v15 = v14;
    *(double *)&v36[1] = v14;
    [v9 longitude];
    double v17 = v16;
    *(double *)&v36[2] = v16;
    v18 = [v9 timeZone];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E4F1CAF0];
      v21 = [v9 timeZone];
      [v20 timeZoneWithName:v21];
    }
    else
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v15 longitude:v17];
      [MEMORY[0x1E4F1E5C8] _timeZoneAtLocation:v21];
    objc_super v22 = };

    id v35 = 0;
    v36[0] = 0;
    startAndEndOfDayForDateInTimeZone(v36, &v35, v8, v22);
    id v23 = v36[0];
    id v24 = v35;
    [(CLKUIAlmanacTransitInfo *)v13 setDay:v23];
    [(CLKUIAlmanacTransitInfo *)v13 setTomorrow:v24];
    -[CLKUIAlmanacTransitInfo setLocation:](v13, "setLocation:", v15, v17);
    id v25 = objc_alloc(MEMORY[0x1E4F64A50]);
    [v23 timeIntervalSinceReferenceDate];
    double v27 = v26;

    v28 = objc_msgSend(v25, "initWithLocation:time:altitudeInDegrees:accuracy:", v15, v17, v27, a5, 60.0);
    [v28 nextEventOfType:16];
    v29 = -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    [(CLKUIAlmanacTransitInfo *)v13 setSolarNoon:v29];

    [v28 nextEventOfType:512];
    v30 = -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    [(CLKUIAlmanacTransitInfo *)v13 setSolarMidnight:v30];

    [v28 nextEventOfType:8];
    uint64_t v31 = -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    [v28 nextEventOfType:32];
    uint64_t v32 = -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    if (v31 | v32)
    {
      [(CLKUIAlmanacTransitInfo *)v13 setRise:v31];
      [(CLKUIAlmanacTransitInfo *)v13 setSet:v32];
    }
    else
    {
      [v8 timeIntervalSinceReferenceDate];
      if (geo_isDayLightForLocation()) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 1;
      }
      [(CLKUIAlmanacTransitInfo *)v13 setConstantSun:v33];
    }
  }
  return v13;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(CLKUIAlmanacTransitInfo *)self rise];
  id v7 = [(CLKUIAlmanacTransitInfo *)self solarNoon];
  id v8 = [(CLKUIAlmanacTransitInfo *)self set];
  id v9 = [v3 stringWithFormat:@"<%@ %p rise: %@ solarNoon: %@ set: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isDateWithinTransitInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CLKUIAlmanacTransitInfo *)self day];
  id v6 = [(CLKUIAlmanacTransitInfo *)self tomorrow];
  BOOL v7 = isDateBetweenDates(v4, v5, v6);

  return v7;
}

- (NSDate)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
}

- (NSDate)tomorrow
{
  return self->_tomorrow;
}

- (void)setTomorrow:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)location
{
  double latitude = self->_location.latitude;
  double longitude = self->_location.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
  self->_location = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)constantSun
{
  return self->_constantSun;
}

- (void)setConstantSun:(int64_t)a3
{
  self->_constantSun = a3;
}

- (NSDate)rise
{
  return self->_rise;
}

- (void)setRise:(id)a3
{
}

- (NSDate)solarNoon
{
  return self->_solarNoon;
}

- (void)setSolarNoon:(id)a3
{
}

- (NSDate)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (NSDate)solarMidnight
{
  return self->_solarMidnight;
}

- (void)setSolarMidnight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarMidnight, 0);
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_solarNoon, 0);
  objc_storeStrong((id *)&self->_rise, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_day, 0);
}

@end