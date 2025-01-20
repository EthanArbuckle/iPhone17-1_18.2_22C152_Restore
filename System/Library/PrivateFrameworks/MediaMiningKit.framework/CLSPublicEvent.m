@interface CLSPublicEvent
+ (BOOL)supportsSecureCoding;
+ (NSSet)supportedCategories;
- (BOOL)hasExpectedAttendance;
- (BOOL)isEnriched;
- (CLLocationCoordinate2D)businessItemCoordinates;
- (CLSPublicEvent)init;
- (CLSPublicEvent)initWithCoder:(id)a3;
- (NSArray)categories;
- (NSArray)performers;
- (NSDateInterval)localDateInterval;
- (NSDateInterval)universalDateIntervalIncludingTime;
- (NSString)name;
- (NSTimeZone)timeZone;
- (double)localEndTime;
- (double)localStartTime;
- (id)_calculateUniversalDateFromLocalDate:(id)a3 includingTimeZone:(id)a4 localStartTime:(double)a5;
- (id)debugDescription;
- (id)description;
- (int64_t)expectedAttendance;
- (unint64_t)businessItemMuid;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessItemCoordinates:(CLLocationCoordinate2D)a3;
- (void)setBusinessItemMuid:(unint64_t)a3;
- (void)setCategories:(id)a3;
- (void)setExpectedAttendance:(int64_t)a3;
- (void)setLocalDateInterval:(id)a3;
- (void)setLocalEndTime:(double)a3;
- (void)setLocalStartTime:(double)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPerformers:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation CLSPublicEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDateInterval, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setExpectedAttendance:(int64_t)a3
{
  self->_expectedAttendance = a3;
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (void)setBusinessItemCoordinates:(CLLocationCoordinate2D)a3
{
  self->_businessItemCoordinates = a3;
}

- (CLLocationCoordinate2D)businessItemCoordinates
{
  double latitude = self->_businessItemCoordinates.latitude;
  double longitude = self->_businessItemCoordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setBusinessItemMuid:(unint64_t)a3
{
  self->_businessItemMuid = a3;
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setPerformers:(id)a3
{
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setLocalEndTime:(double)a3
{
  self->_localEndTime = a3;
}

- (double)localEndTime
{
  return self->_localEndTime;
}

- (void)setLocalStartTime:(double)a3
{
  self->_localStartTime = a3;
}

- (double)localStartTime
{
  return self->_localStartTime;
}

- (void)setLocalDateInterval:(id)a3
{
}

- (NSDateInterval)localDateInterval
{
  return self->_localDateInterval;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t muid = self->_muid;
  id v5 = a3;
  [v5 encodeInteger:muid forKey:@"muid"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_localDateInterval forKey:@"universalDateInterval"];
  [v5 encodeDouble:@"localStartTime" forKey:self->_localStartTime];
  [v5 encodeDouble:@"localEndTime" forKey:self->_localEndTime];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v5 encodeObject:self->_performers forKey:@"performers"];
  [v5 encodeObject:self->_categories forKey:@"categories"];
  [v5 encodeInteger:self->_businessItemMuid forKey:@"businessItemMuid"];
  [v5 encodeDouble:@"businessItemCoordinatesLatitude" forKey:self->_businessItemCoordinates.latitude];
  [v5 encodeDouble:@"businessItemCoordinatesLongitude" forKey:self->_businessItemCoordinates.longitude];
  [v5 encodeInteger:self->_expectedAttendance forKey:@"epxectedAttendance"];
}

- (CLSPublicEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLSPublicEvent;
  id v5 = [(CLSPublicEvent *)&v28 init];
  if (v5)
  {
    v5->_unint64_t muid = [v4 decodeIntegerForKey:@"muid"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"universalDateInterval"];
    localDateInterval = v5->_localDateInterval;
    v5->_localDateInterval = (NSDateInterval *)v8;

    [v4 decodeDoubleForKey:@"localStartTime"];
    v5->_localStartTime = v10;
    [v4 decodeDoubleForKey:@"localEndTime"];
    v5->_localEndTime = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"performers"];
    performers = v5->_performers;
    v5->_performers = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v22;

    v5->_businessItemMuid = [v4 decodeIntegerForKey:@"businessItemMuid"];
    [v4 decodeDoubleForKey:@"businessItemCoordinatesLatitude"];
    CLLocationDegrees v25 = v24;
    [v4 decodeDoubleForKey:@"businessItemCoordinatesLongitude"];
    v5->_businessItemCoordinates = CLLocationCoordinate2DMake(v25, v26);
    v5->_expectedAttendance = [v4 decodeIntegerForKey:@"epxectedAttendance"];
  }

  return v5;
}

- (BOOL)hasExpectedAttendance
{
  return self->_expectedAttendance != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_calculateUniversalDateFromLocalDate:(id)a3 includingTimeZone:(id)a4 localStartTime:(double)a5
{
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "dateByAddingTimeInterval:", a5 - (double)objc_msgSend(a4, "secondsFromGMTForDate:", v7));

  return v8;
}

- (NSDateInterval)universalDateIntervalIncludingTime
{
  v3 = [(NSDateInterval *)self->_localDateInterval startDate];
  id v4 = [(NSDateInterval *)self->_localDateInterval endDate];
  double localStartTime = self->_localStartTime;
  double localEndTime = self->_localEndTime;
  if (localEndTime < localStartTime && [v3 compare:v4] != -1)
  {
    uint64_t v7 = +[CLSCalendar dateByAddingDays:1 toDate:v3];

    id v4 = (void *)v7;
  }
  uint64_t v8 = [(CLSPublicEvent *)self _calculateUniversalDateFromLocalDate:v3 includingTimeZone:self->_timeZone localStartTime:localStartTime];
  v9 = [(CLSPublicEvent *)self _calculateUniversalDateFromLocalDate:v4 includingTimeZone:self->_timeZone localStartTime:localEndTime];
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];

  return (NSDateInterval *)v10;
}

- (id)debugDescription
{
  v3 = [(NSArray *)self->_performers componentsJoinedByString:@", "];
  id v4 = [(NSArray *)self->_categories componentsJoinedByString:@", "];
  id v5 = NSString;
  uint64_t v6 = [(CLSPublicEvent *)self description];
  uint64_t v7 = [v5 stringWithFormat:@"%@\n\tbusinessItemMuid: %lu, businessItemCoordinates: {%f, %f}, expectedAttendance %ld,\n\tcategories: %@,\n\tperformers: %@", v6, self->_businessItemMuid, *(void *)&self->_businessItemCoordinates.latitude, *(void *)&self->_businessItemCoordinates.longitude, self->_expectedAttendance, v4, v3];

  return v7;
}

- (id)description
{
  double localEndTime = self->_localEndTime;
  double v4 = self->_localStartTime / 3600.0;
  id v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CLSPublicEvent;
  double v6 = localEndTime / 3600.0;
  uint64_t v7 = [(CLSPublicEvent *)&v13 description];
  long long v12 = *(_OWORD *)&self->_muid;
  localDateInterval = self->_localDateInterval;
  [(CLSPublicEvent *)self isEnriched];
  v9 = NSStringFromBOOL();
  double v10 = [v5 stringWithFormat:@"%@ muid: %lu, name: %@, dateInterval: %@, startTime: %.2f, endTime: %.2f, isEnriched: %@", v7, v12, localDateInterval, *(void *)&v4, *(void *)&v6, v9];

  return v10;
}

- (BOOL)isEnriched
{
  return self->_businessItemMuid != -1;
}

- (CLSPublicEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSPublicEvent;
  CLLocationCoordinate2D result = [(CLSPublicEvent *)&v3 init];
  if (result)
  {
    result->_businessItemCoordinates = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
    *(_OWORD *)&result->_businessItemMuid = xmmword_1D21C5220;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSSet)supportedCategories
{
  if (supportedCategories_onceToken != -1) {
    dispatch_once(&supportedCategories_onceToken, &__block_literal_global_7770);
  }
  v2 = (void *)supportedCategories_allowedCategories;
  return (NSSet *)v2;
}

void __37__CLSPublicEvent_supportedCategories__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = +[CLSPublicEventCategory musicConcerts];
  v1 = +[CLSPublicEventCategory theater];
  v2 = +[CLSPublicEventCategory sports];
  objc_super v3 = +[CLSPublicEventCategory nightLife];
  double v4 = +[CLSPublicEventCategory festivalsAndFairs];
  id v5 = +[CLSPublicEventCategory dance];
  double v6 = +[CLSPublicEventCategory artsAndMuseums];
  uint64_t v7 = +[CLSPublicEventCategory appleEvents];
  uint64_t v8 = objc_msgSend(v0, "setWithObjects:", v10, v1, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)supportedCategories_allowedCategories;
  supportedCategories_allowedCategories = v8;
}

@end