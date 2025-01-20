@interface MapsSuggestionsTrip
- (BOOL)isInternational;
- (CLPlacemark)placemark;
- (MapsSuggestionsTrip)initWithPlacemark:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
@end

@implementation MapsSuggestionsTrip

- (MapsSuggestionsTrip)initWithPlacemark:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsTrip;
  v12 = [(MapsSuggestionsTrip *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_placemark, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (BOOL)isInternational
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [(id)v3 objectForKey:*MEMORY[0x1E4F1C400]];

  v5 = [(CLPlacemark *)self->_placemark ISOcountryCode];
  LOBYTE(v3) = [v4 isEqualToString:v5];

  return v3 ^ 1;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

@end