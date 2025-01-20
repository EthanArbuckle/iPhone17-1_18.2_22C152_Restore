@interface DAEHolidayCalendarFetchResult
+ (BOOL)supportsSecureCoding;
- (DAEHolidayCalendarFetchResult)initWithCoder:(id)a3;
- (NSString)URLString;
- (NSString)calendarDescription;
- (NSString)language;
- (NSString)region;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendarDescription:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRegion:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation DAEHolidayCalendarFetchResult

- (id)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)DAEHolidayCalendarFetchResult;
  v4 = [(DAEHolidayCalendarFetchResult *)&v11 description];
  v5 = [(DAEHolidayCalendarFetchResult *)self region];
  v6 = [(DAEHolidayCalendarFetchResult *)self language];
  v7 = [(DAEHolidayCalendarFetchResult *)self URLString];
  v8 = [(DAEHolidayCalendarFetchResult *)self calendarDescription];
  v9 = (void *)[v3 initWithFormat:@"[%@] region: %@  language: %@  URL: %@  description: %@", v4, v5, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEHolidayCalendarFetchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAEHolidayCalendarFetchResult;
  v5 = [(DAEHolidayCalendarFetchResult *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    [(DAEHolidayCalendarFetchResult *)v5 setRegion:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    [(DAEHolidayCalendarFetchResult *)v5 setLanguage:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLString"];
    [(DAEHolidayCalendarFetchResult *)v5 setURLString:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarDescription"];
    [(DAEHolidayCalendarFetchResult *)v5 setCalendarDescription:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAEHolidayCalendarFetchResult *)self region];
  [v4 encodeObject:v5 forKey:@"region"];

  v6 = [(DAEHolidayCalendarFetchResult *)self language];
  [v4 encodeObject:v6 forKey:@"language"];

  v7 = [(DAEHolidayCalendarFetchResult *)self URLString];
  [v4 encodeObject:v7 forKey:@"URLString"];

  id v8 = [(DAEHolidayCalendarFetchResult *)self calendarDescription];
  [v4 encodeObject:v8 forKey:@"calendarDescription"];
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)calendarDescription
{
  return self->_calendarDescription;
}

- (void)setCalendarDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDescription, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end