@interface NTKGlobetrotterCityManager
+ (CLLocationCoordinate2D)idealizedCityCoordinate;
+ (id)_idealizedCity;
+ (id)idealizedTimeZone;
+ (id)sharedInstance;
- (BOOL)_skipLocalization;
- (CLLocationCoordinate2D)cityCoordinateForHourOffset:(int64_t)a3;
- (NTKGlobetrotterCityManager)init;
- (id)_cityAtIndex:(unint64_t)a3;
- (id)displayNameForCityAtIndex:(unint64_t)a3;
- (id)timeZoneForCityAtIndex:(unint64_t)a3 hourOffset:(int64_t)a4;
@end

@implementation NTKGlobetrotterCityManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_35CC;
  block[3] = &unk_10460;
  block[4] = a1;
  if (qword_16170 != -1) {
    dispatch_once(&qword_16170, block);
  }
  v2 = (void *)qword_16178;

  return v2;
}

- (NTKGlobetrotterCityManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)NTKGlobetrotterCityManager;
  v2 = [(NTKGlobetrotterCityManager *)&v15 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [&off_11120 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(&off_11120);
          }
          id v8 = objc_msgSend(objc_alloc((Class)WorldClockCity), "initWithALCityIdentifier:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v7), "intValue"));
          if (v8) {
            [(NSArray *)v3 addObject:v8];
          }

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [&off_11120 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v5);
    }
    cities = v2->_cities;
    v2->_cities = v3;
  }
  return v2;
}

- (id)displayNameForCityAtIndex:(unint64_t)a3
{
  id v4 = [(NTKGlobetrotterCityManager *)self _cityAtIndex:a3];
  id v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_38;
  }
  uint64_t v6 = [v4 alCityId];
  int v7 = [v6 intValue];

  if (v7 <= 151)
  {
    if (v7 <= 59)
    {
      switch(v7)
      {
        case 12:
          CFStringRef v8 = @"CITY_NAME_ALASKA_TIME_ZONE";
          goto LABEL_37;
        case 26:
          CFStringRef v8 = @"CITY_NAME_INDOCHINA_TIME_ZONE";
          goto LABEL_37;
        case 31:
          CFStringRef v8 = @"CITY_NAME_CHINA_STANDARD_TIME_ZONE";
          goto LABEL_37;
      }
    }
    else if (v7 > 118)
    {
      if (v7 == 119)
      {
        CFStringRef v8 = @"CITY_NAME_HAWAII_STANDARD_TIME_ZONE";
        goto LABEL_37;
      }
      if (v7 == 149)
      {
        CFStringRef v8 = @"CITY_NAME_WESTERN_EUROPEAN_TIME_ZONE";
        goto LABEL_37;
      }
    }
    else
    {
      if (v7 == 60)
      {
        CFStringRef v8 = @"CITY_NAME_VENEZUELAN_STANDARD_TIME_ZONE";
        goto LABEL_37;
      }
      if (v7 == 105)
      {
        CFStringRef v8 = @"CITY_NAME_SOUTH_GEORGIA_TIME_ZONE";
LABEL_37:
        v9 = +[NTKGlobetrotterFaceBundle localizedStringForKey:v8 comment:@"city override name"];
        goto LABEL_38;
      }
    }
    goto LABEL_41;
  }
  if (v7 <= 231)
  {
    switch(v7)
    {
      case 152:
        CFStringRef v8 = @"CITY_NAME_PACIFIC_TIME_ZONE";
        goto LABEL_37;
      case 173:
        CFStringRef v8 = @"CITY_NAME_CENTRAL_TIME_ZONE";
        goto LABEL_37;
      case 199:
        CFStringRef v8 = @"CITY_NAME_EASTERN_TIME_ZONE";
        goto LABEL_37;
    }
    goto LABEL_41;
  }
  if (v7 <= 367)
  {
    if (v7 == 232)
    {
      CFStringRef v8 = @"CITY_NAME_AZORES_TIME_ZONE";
      goto LABEL_37;
    }
    if (v7 == 246)
    {
      CFStringRef v8 = @"CITY_NAME_BRASILIA_TIME_ZONE";
      goto LABEL_37;
    }
    goto LABEL_41;
  }
  if (v7 == 509)
  {
    CFStringRef v8 = @"CITY_NAME_PAKISTAN_STANDARD_TIME_ZONE";
    goto LABEL_37;
  }
  if (v7 != 368)
  {
LABEL_41:
    if ([(NTKGlobetrotterCityManager *)self _skipLocalization])
    {
      v10 = [v5 unlocalizedCityName];
      goto LABEL_43;
    }
    long long v14 = [v5 name];
LABEL_46:
    long long v12 = v14;
    uint64_t v13 = [v14 localizedUppercaseString];
    goto LABEL_47;
  }
  if (![(NTKGlobetrotterCityManager *)self _skipLocalization])
  {
    long long v14 = [v5 countryName];
    goto LABEL_46;
  }
  v10 = [v5 unlocalizedCountryName];
LABEL_43:
  long long v12 = v10;
  uint64_t v13 = [v10 uppercaseString];
LABEL_47:
  v9 = (void *)v13;

LABEL_38:

  return v9;
}

- (CLLocationCoordinate2D)cityCoordinateForHourOffset:(int64_t)a3
{
  int64_t v4 = 12 - a3;
  if (a3 >= 13) {
    v4 += [(NSArray *)self->_cities count];
  }
  id v5 = [(NTKGlobetrotterCityManager *)self _cityAtIndex:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 alCity];
    [v7 latitude];
    CLLocationDegrees v9 = v8;
    [v7 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
    CLLocationDegrees latitude = v11.latitude;
    CLLocationDegrees longitude = v11.longitude;
  }
  else
  {
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(0.0, 0.0);
    CLLocationDegrees latitude = v14.latitude;
    CLLocationDegrees longitude = v14.longitude;
  }

  double v15 = latitude;
  double v16 = longitude;
  result.CLLocationDegrees longitude = v16;
  result.CLLocationDegrees latitude = v15;
  return result;
}

- (id)timeZoneForCityAtIndex:(unint64_t)a3 hourOffset:(int64_t)a4
{
  int64_t v5 = a4 + a3;
  NSUInteger v6 = [(NSArray *)self->_cities count];
  if (v5 < 0) {
    NSUInteger v7 = v6 + v5;
  }
  else {
    NSUInteger v7 = v5 % v6;
  }
  float v8 = [(NTKGlobetrotterCityManager *)self _cityAtIndex:v7];
  CLLocationDegrees v9 = v8;
  if (v8)
  {
    float v10 = [v8 timeZone];
    CLLocationCoordinate2D v11 = +[NSTimeZone timeZoneWithName:v10];
  }
  else
  {
    CLLocationCoordinate2D v11 = 0;
  }

  return v11;
}

+ (id)idealizedTimeZone
{
  v2 = [a1 _idealizedCity];
  v3 = [v2 timeZone];
  int64_t v4 = +[NSTimeZone timeZoneWithName:v3];

  return v4;
}

+ (CLLocationCoordinate2D)idealizedCityCoordinate
{
  v2 = [a1 _idealizedCity];
  v3 = [v2 alCity];

  [v3 latitude];
  CLLocationDegrees v5 = v4;
  [v3 longitude];
  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v5, v6);

  double latitude = v7.latitude;
  double longitude = v7.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)_cityAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_cities count] <= a3)
  {
    CLLocationDegrees v5 = 0;
  }
  else
  {
    CLLocationDegrees v5 = [(NSArray *)self->_cities objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (BOOL)_skipLocalization
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 objectForKey:NSLocaleLanguageCode];

  LOBYTE(v2) = [v3 isEqualToString:@"ja"];
  return (char)v2;
}

+ (id)_idealizedCity
{
  if (qword_16180 != -1) {
    dispatch_once(&qword_16180, &stru_104A0);
  }
  v2 = (void *)qword_16188;

  return v2;
}

- (void).cxx_destruct
{
}

@end